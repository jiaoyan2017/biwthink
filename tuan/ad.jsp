<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.yi.Action.AdInfoAction"%>
<%@page import="com.yi.vo.AdInfoVo"%>
<%@page import="java.util.List"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<link href="css/index_2012_5.css" rel="stylesheet" type="text/css">
<link href="css/dialog.css" rel="stylesheet" type="text/css" />
<link href="css/common_2012.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/Root.Image.js"></script>
<script type="text/javascript"  src="js/hotHit.js"></script>
<script type="text/javascript"  src="js/jquery-1.3.2.min.js"></script>

<script type="text/javascript"  src="js/swfobject.js"></script>

<script type="text/javascript"  src="js/ShopCommon.js"></script>
<script type="text/javascript" src="js/slideNew.js"></script>
    
<div class="slide" id="jiatxshop_23">
            <div class="m" id="slide" style="position: relative;">
            <ul style="position: absolute; left: 0pt;">
            
         		<%
		 AdInfoAction ad = new AdInfoAction();
    List adList =  ad.getAdInfoListByTypeAction("2",0,4);
		 for(int i=0;i<adList.size();i++){
			AdInfoVo ao =(AdInfoVo)adList.get(i); 
		%> 
            
            <li>
            <a href="<%=ao.getUrl() %>" target="_blank"><img width="693" height="481" src="../upload/<%= ao.getPic()%>" alt="<%=ao.getName() %>" title="<%=ao.getName() %>"></a>
            </li>  
            <%} %>
           
                  
                  
                       
            </ul>
            <div class="slidenum">
              <span class="">
              <%
              
              for(int i=0;i<adList.size();i++){
			AdInfoVo ao1 =(AdInfoVo)adList.get(i); 
               %>
            <a target="_blank" href="<%=ao1.getUrl() %>"><%=i+1 %></a></span> 
            <%if((i+1)!=adList.size()) {%>
            <span class="">
            <%} %>
           <%} %>
            
            
            </div>         
            </div>
    </div>
