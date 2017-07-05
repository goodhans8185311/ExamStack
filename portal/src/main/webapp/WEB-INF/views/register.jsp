<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!--
		<link rel="stylesheet" type="text/css" href="styles.css">
		-->
<title>注册账号</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="keywords" content="">
<link rel="shortcut icon"
	href="<%=basePath%>resources/images/favicon.ico" />
<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
<link href="resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<!-- Javascript files -->
<style type="text/css">
.form-group {
	margin-bottom: 5px;
	height: 59px;
}
</style>
</head>

<body>

    <%@include file="common/header.jsp"%>
	<div class="content" style="margin-bottom: 100px;">

		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<div class="lrform">
						<h5>注册账号</h5>
						<span class="form-message"></span>
						<div class="form">
							<!-- Register form (not working)-->
							<form class="form-horizontal" id="form-create-account"
								action="user-reg">
								<div class="form-line form-username" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>用户名：</span>
									<input type="text" class="df-input-narrow" id="name-add"
										maxlength="20"> <span class="form-message"></span> <br>
								</div>
								<div class="form-line form-password" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>密码：</span>
									<input type="password" class="df-input-narrow" id="password-add"
										maxlength="20"> <span class="form-message"></span> <br>
								</div>
								<div class="form-line form-password-confirm" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>重复密码：</span>
									<input type="password" class="df-input-narrow" id="password-add"
										maxlength="20"> <span class="form-message"></span> <br>
								</div>
								<div class="form-line form-truename" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>真实姓名：</span>
									<input type="text" class="df-input-narrow" id="truename-add"
										maxlength="20"> <span class="form-message"></span> <br>
								</div>
								<div class="form-line form-national-id" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>身份证号：</span>
									<input type="text" class="df-input-narrow" id="national-id-add"
										maxlength="18"> <span class="form-message"></span> <br>
								</div>
								<div class="form-line form-phone" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>手机：</span>
									<input type="text" class="df-input-narrow" id="phone-add"
										maxlength="18"> <span class="form-message"></span> <br>
								</div>
								<div class="form-line form-email" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>邮箱：</span>
									<input type="text" class="df-input-narrow" id="email-add"
										maxlength="60"> <span class="form-message"></span> <br>
								</div>
								<div class="form-line form-company" style="display: none;">
									<span class="form-label"><span class="warning-label"></span>单位：</span>
									<input type="text" class="df-input-narrow" id="company-add"
										maxlength="60"> <span class="form-message"></span> <br>
								</div>
								<div class="form-line form-department" style="display: block;">
									<span class="form-label"><span class="warning-label"></span>部门单位：</span>
									<select id="department-input-select" class="df-input-narrow">
										<option value="-1">--请选择--</option>
										<c:forEach items="${depList }" var="item">
											<option value="${item.depId }">${item.depName }</option>
										</c:forEach>
									</select>
									<span class="form-message"></span>
									<br>
								</div>

								<!-- Checkbox -->
								<div class="form-group form-confirm">
									<div class="col-md-9 col-md-offset-3">
										<label class="checkbox-inline"> <input type="checkbox"
											id="inlineCheckbox1" value="agree"> <a>
												同意  XXXXXX 条款</a>
										</label> <span class="form-message"></span>
									</div>

								</div>

								<!-- Buttons -->
								<div class="form-group">
									<!-- Buttons -->
									<div class="col-md-9 col-md-offset-3">
										<button type="submit" class="btn" id="btn-reg">注册账号</button>
										<button type="reset" class="btn">重置</button>
									</div>
								</div>
							</form>
							已有账号? <a href="user-login-page">直接登录</a>
						</div>
					</div>

				</div>
			</div>

		</div>

	</div>
	<%@include file="common/footer.jsp"%>

	<!-- Slider Ends -->
	<!-- jQuery -->
	<script type="text/javascript"
		src="resources/js/jquery/jquery-1.9.0.min.js"></script>
	<!-- Bootstrap JS -->
	<script type="text/javascript"
		src="resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/all.js"></script>
	<script type="text/javascript" src="resources/js/register.js"></script>

</body>
</html>
