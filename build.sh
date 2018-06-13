#! /bin/bash
#set -e

# The build image for build
BUILD_IMAGE="nexus.viperbj.net/pulsar-build:latest"

# Binary to generate
BIANARY_NAME="rio-pulsar-segpoller"


# Name of the package we are building
#PKG_NAME="nexus.viperbj.net/rio-pulsar-segpoller"

# SOURCE_CODE to build
# SOURCE_CODE="main.go"

# Current Working Directory
DIR=$(basename "$(pwd)")

# Docker image to generate
if [ $1="docker" ] && [ -z $2 ]; then
   DOCKER_IMAGE="nexus.viperbj.net:9082/segpoller:latest"
else
   DOCKER_IMAGE=$2
fi

# Build log
BUILD_LOG=/tmp/build.log

# Remove the old build.log
if [ -e $BUILD_LOG ]; then
   rm -f $BUILD_LOG
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
        -v $USER_GOPATH/src:/go/src/github.comcast.com/viper-cog/$DIR/vendor \
        -v $(pwd):/go/src/github.comcast.com/viper-cog/$DIR \
        -w /go/src/github.comcast.com/viper-cog/$DIR \
        "$BUILD_IMAGE" /bin/sh -c "go build $SOURCE_CODE -o $BIANARY_NAME 2>&1 | tee $BUILD_LOG"
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
        -v /tmp:/tmp \
        -v ~/.ssh:/root/.ssh \
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
    #pushd "$DIR"
    branch="$(git rev-parse HEAD)"
    local ret=$?; if [[ $ret != 0 ]]; then return $ret; fi
    git checkout master
    ret=$?; if [[ $ret != 0 ]]; then return $ret; fi
    git merge --ff-only "$branch"
    ret=$?; if [[ $ret != 0 ]]; then return $ret; fi
    git push origin master
    ret=$?
    #popd
    return $ret
}

function tag() {
    tag_new=$2
    git tag ${tag_new}
    ret=$?; if [[ $ret != 0 ]]; then return $ret; fi
    git push origin ${tag_new}
    ret=$?;if [[ $ret != 0 ]]; then return $ret; fi
    echo "Save version."
    echo ${tag_new} > version
    ret=$?;return $ret

}

case "$1" in
   "build")
     build_m
     ;;
   "ba")
     echo "Building..."
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
     tag
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
     echo "${BASH_SOURCE[0]} build | docker | deploy | test | it"
     echo "or"
     echo "${BASH_SOURCE[0]} docker [TARGET_DOCKERNAME]"
     echo ""
     echo "The first parameter is required. The second is optional."
     echo "\"build\" will build the binary. Please build binary BEFORE docker."
     echo "\"docker\" will build docker image with the specified name."
     echo "\"deploy\" will push the docker image to nexus.viperbj.net."
     echo "\"test\" will perform UT test."
     echo "\"it\" will perform Integration test."
     echo "\"TARGET_DOCKERNAME\" is a custom docker image name, if you need."
esac

