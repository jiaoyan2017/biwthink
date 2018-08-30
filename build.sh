#! /bin/bash -x
#set -e

# The build image for build
BUILD_IMAGE="nexus.viperbj.net/pulsar-build:latest"

# Binary to generate
BIANARY_NAME="rio-pulsar-decoder"


# Name of the package we are building
#PKG_NAME="nexus.viperbj.net/rio-pulsar-decoder"

# SOURCE_CODE to build
SOURCE_CODE="main.go"

# Current Working Directory
DIR=$(basename "$(pwd)")

# 
NO_COMMIT=/tmp/no_commit_${BIANARY_NAME}
TAG_NEW=/tmp/tag_new_${BIANARY_NAME}

# Docker image to generate
if ([ $1="docker" ] || [ $1="deploy" ]) && [ -z $2 ]; then
   DOCKER_IMAGE="nexus.viperbj.net:9082/$BIANARY_NAME:latest"
else
   DOCKER_IMAGE="nexus.viperbj.net:9082/$BIANARY_NAME:$2"
fi

# Get GOPATH in user's environment if it's not /go.
USER_GOPATH=$(echo $GOPATH | grep -Eo '.*\:*(.*rio-workspace)' | awk -F ":" '{print $NF}')
if [ -z $USER_GOPATH ]; then
   USER_GOPATH=${GOPATH%%:*}
fi


# build_m is a normal build without automatical deps fetching.
function build_m() {
   echo "Start building ..."
   docker run \
        --privileged=true --rm \
        -v /tmp:/tmp \
        -v ~/.ssh:/root/.ssh \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v $USER_GOPATH/src:/go/src/github.comcast.com/viper-cog/$DIR/vendor \
        -v $(pwd):/go/src/github.comcast.com/viper-cog/$DIR \
        -w /go/src/github.comcast.com/viper-cog/$DIR \
        "$BUILD_IMAGE" "$@"
}


function runtest() {
   # UT cmd: uttest
   # IT cmd: integtest
   cmd=$1
   echo "Start $cmd ..."
   docker run \
        --privileged=true --rm \
        -e GO_COVERAGE=true \
        -e BUILD_INFO_FILE=BuildInfo \
        -e HOST_GOPATH=$USER_GOPATH \
        -v /tmp:/tmp \
        -v ~/.ssh:/root/.ssh \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v $USER_GOPATH/src:/go/src/github.comcast.com/viper-cog/$DIR/vendor \
        -v $(pwd):/go/src/github.comcast.com/viper-cog/$DIR  "$BUILD_IMAGE" /bin/sh \
        -c "cd /go/src/github.comcast.com/viper-cog/$DIR; $cmd" 
}


function deploy() {
      # Push Docker Image.
      echo "$DOCKER_IMAGE image pushing ..."
      docker push $DOCKER_IMAGE
      if [ $? -ne 0 ]; then
         echo "$DOCKER_IMAGE push failed."
         return 1
      else
         echo "Pushed $DOCKER_IMAGE successfully."
         return 0
      fi
}

function dockerize() {
   echo "begin to run the dock build"
   docker build -t $DOCKER_IMAGE .
   if [ $? -eq 0 ]; then
      # If docker build seccessful, push it.
      echo "$DOCKER_IMAGE image build successful."

   else
      echo "Build docker image $DOCKER_IMAGE failed."
      return 1
   fi
}

function merge() {
    rm -f $NO_COMMIT
    #branch="$(git rev-parse HEAD)"
    git checkout tip
    local ret=$?; if [[ $ret != 0 ]]; then return $ret; fi
    git pull origin tip
    local ret=$?; if [[ $ret != 0 ]]; then return $ret; fi
    git checkout master
    ret=$?; if [[ $ret != 0 ]]; then return $ret; fi
    NOMERGED="$(git branch --no-merged | grep -o tip)"
    if [ "$NOMERGED" = "tip" ]; then
      git pull origin master
      ret=$?; if [[ $ret != 0 ]]; then return $ret; fi
      git merge tip
      ret=$?; if [[ $ret != 0 ]]; then return $ret; fi
      git push origin master
      ret=$?
      if [ $ret != 0 ]; then
        echo ">>>Merge FAIL from tip to master.<<<"
        return $ret
      else
        echo ">>>Merge Complete successfully.<<<"
        return $ret
      fi
    else
      echo ">>>No commit to merge with tip. Exit ..."
      touch $NO_COMMIT
      ret=0
      return $ret
    fi
}

function tag() {
    tag="$@"
    if [ -z $tag ]; then
      echo "No new tag provided. Use previous tag."
      tag=$(git tag |  sort -n -r | sed -n '1,1p')
      if [ -z $tag ]; then
        echo "Can't get previous tag, please provide a tag."
        echo "Example:"
        echo "${BASH_SOURCE[0]} tag 1.0.0"
        return 1
      fi
    fi
    ver=$(echo $tag | awk -F'_' '{print $1}')
    seq=$(echo $tag | awk -F'_' '{print $2}')
    seq_new=$(echo $((10#${seq}+1)) | awk '{printf("%03d",$0)}')
    tag_new=${ver}_${seq_new}
    echo $tag_new > $TAG_NEW     
    git tag ${tag_new}
    ret=$?; if [[ $ret != 0 ]]; then return $ret; fi
    git push origin ${tag_new}
    ret=$?;if [[ $ret != 0 ]]; then return $ret; fi
}

case "$1" in
   "build")
     # get_common
     # get_fca
     build_m "$@" $BIANARY_NAME $SOURCE_CODE
     ;;
   "docker")
     #build_m
     dockerize
     ;;
   "deploy")
     #build_m
     #dockerize
     deploy
     ;;
   "merge")
     merge
     ;;
   "tag")
     shift
     tag "$@"
     ;;
   "test")
     runtest uttest
     ;;
   "it")
     runtest integtest
     ;;
   *)
     echo "Missing a parameter! Please specify the correct build model! "
     echo "Usage:"
     echo "${BASH_SOURCE[0]} build | docker | deploy | test | it | merge | tag"
     echo "${BASH_SOURCE[0]} merge [TAG]"
     echo "${BASH_SOURCE[0]} tag [TAG]"
     echo "${BASH_SOURCE[0]} docker | deploy [TAG]"
     echo ""
     echo "The first parameter is required. The second is optional."
     echo "\"build\" will build the binary. Please build binary BEFORE docker."
     echo "\"docker\" will build docker image with the specified name."
     echo "\"deploy\" will push the docker image to nexus.viperbj.net."
     echo "\"test\" will perform UT test."
     echo "\"it\" will perform Integration test."
     echo "\"merge\" is used to merge tip to master branch after build/UT/IT sucessfully. And tag master."
     echo "\"tag\" is used to tag master branch."
     echo "\"TAG\" is a master branch tag and a custom docker image tag."
esac
