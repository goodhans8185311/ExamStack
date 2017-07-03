<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path + "/";
%>

<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>ExamStack 注册成功</title>
		
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="resources/css/style.css" rel="stylesheet">
		
	</head>
	<body>
	    
	    <%@include file="common/header.jsp"%>
		<!-- Navigation bar ends -->

		<!-- Slider starts -->

		<div>
			<!-- Slider (Flex Slider) -->

			<div class="container" style="height:500px;margin-top: 50px;">
				<h2>欢迎注册ExamStack</h2>
				<p class="big grey">
					您的账号为<span>${username}</span>
				</p>
				<a href="user-login-page" class="btn btn-success"><i class="fa fa-sign-in"></i> 登陆系统</a>
				<hr>
				<div class="link-list">
					<h5>您可以选择访问其他页面</h5>
					<a href="#">主页</a><a href="#">试题练习</a><a href="#">练习历史</a><a href="#">联系我们</a><a href="#">FAQ</a>
				</div>
				<div class="row">

				</div>
			</div>
		</div>

		<%@include file="common/footer.jsp"%>

		<!-- Slider Ends -->

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>

	</body>
</html>
