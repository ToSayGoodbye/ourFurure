<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery.plupload.queue/css/jquery.plupload.queue.css">
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	
	<script src="${pageContext.request.contextPath}/js/jquery-2.0.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>  

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
    <style>
    	body{
    		background:black;
    	}
    </style>
</head>
	<%
	String name = (String)session.getAttribute("user");
	if(name==null)response.sendRedirect(request.getServletContext().getContextPath()+"/login.html");
	%>
<body style="background:honeydews">
   	<div id="content" style="padding:100px 100px 0px 350px">
   		<div style="display:inline"><img alt="" style="width: 200px; height: 200px" src="${pageContext.request.contextPath}/img/1.jpg" onclick="toJump(1)"></div>
   		<div style="display:inline"><img alt="" style="width: 200px; height: 200px" src="${pageContext.request.contextPath}/img/2.jpg" onclick="toJump(2)"></div>
   		<div style="display:inline"><img alt="" style="width: 200px; height: 200px" src="${pageContext.request.contextPath}/img/3.jpg" onclick="toJump(3)"></div>
   	</div>
   	<div id="content2" style="padding:0px 100px 100px 350px">
   		<div style="display:inline"><img alt="" style="width: 200px; height: 200px" src="${pageContext.request.contextPath}/img/4.jpg" onclick="toJump(4)"></div>
   		<div style="display:inline"><img alt="" style="width: 200px; height: 200px" src="${pageContext.request.contextPath}/img/5.jpg" onclick="toJump(5)"></div>
   		<div style="display:inline"><img alt="" style="width: 200px; height: 200px" src="${pageContext.request.contextPath}/img/6.jpg" onclick="toJump(6)"></div>
   	</div>
</body>
<script>
$(function(){  
    //点击打开文件选择器  
    $("#upload").on('click', function() {  
        $('#fileToUpload').click();  
    }); 
    
});   
	function toJump(str){
		var url = "./showUser.jsp?str="+str;
		window.location.href=url;
	}
</script>
</html>