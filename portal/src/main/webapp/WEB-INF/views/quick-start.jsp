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
		<title>快速入口</title>
		
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="resources/css/style.css" rel="stylesheet">
		<style type="text/css">
			.form-group {
				margin-bottom: 5px;
				height: 59px;
			}

		</style>
	</head>
	<body>
	
	    <%@include file="common/header.jsp"%>
		<!-- Navigation bar ends -->

		<div class="content" style="margin-bottom: 100px;">

			<div class="container">
				<div class="row">

					<div class="col-md-12">
						<div class="lrform">
							<h5>快速考试入口</h5>
							<div class="form">
								<!-- Login form (not working)-->
								<form class="form-horizontal" action="j_spring_security_check" method="post">
									<!-- Username -->
									<div class="form-group">
										<label class="control-label col-md-3" for="username">准考证号</label>
										<div class="col-md-9">
											<input type="text" class="form-control" name="j_seri_no">
											<input type="hidden" value="1" name="j_flag">
										</div>
									</div>
									
									<!-- Buttons -->
									<div class="form-group">
										<!-- Buttons -->
										<div class="col-md-9 col-md-offset-3">
											<button type="submit" class="btn btn-default">
												开始
											</button>
											<span class="form-message">${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}</span>
										</div>
									</div>
								</form>
								没有账号? <a href="user-register">注册</a>
							</div>
						</div>

					</div>
				</div>

			</div>

		</div>
	    <%@include file="common/footer.jsp"%>

		<!-- Slider Ends -->

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript"
		src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<!-- Bootstrap JS -->
		<script type="text/javascript"
		src="resources/bootstrap/js/bootstrap.min.js"></script>

	</body>
</html>