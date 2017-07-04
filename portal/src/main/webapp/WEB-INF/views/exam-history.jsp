<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%-- <%@taglib uri="spring.tld" prefix="spring"%> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    	<base href="<%=basePath%>">
    
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>练习历史</title>
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="resources/css/style.css" rel="stylesheet">
		
		<link href="resources/css/exam.css" rel="stylesheet">
		<link href="resources/chart/morris.css" rel="stylesheet">
		<style>
			a.btn{
				    margin-top: 0px; 
			}
		</style>
	</head>
	<body>
		 <%@include file="common/header.jsp"%>
		<!-- Navigation bar ends -->

		<!-- Slider starts -->

		<div>
			<!-- Slider (Flex Slider) -->

			<div class="container" style="min-height:500px;">

				<div class="row">
					<div class="col-xs-2">
						<ul class="nav default-sidenav">
							<li>
								<a href="student/usercenter"> <i class="fa fa-dashboard"></i> 用户中心 </a>
							</li>
							<li>
								<a href="student/analysis"> <i class="fa fa-bar-chart-o"></i> 统计分析 </a>
							</li>
							<li class="active">
								<a> <i class="fa fa-history"></i> 考试历史 </a>
							</li>
							<li>
								<a href="student/training-history"> <i class="fa fa-book"></i> 培训历史 </a>
							</li>
						</ul>
					</div>
					<div class="col-xs-10">
						<div class="page-header">
							<h1><i class="fa fa-history"></i> 考试历史</h1>
						</div>
						<div class="page-content row">
							<div id="question-list">
								<table class="table-striped table">
									<thead>
										<tr>
											<td>试卷名称</td><td>状态</td><td>类型</td><td>交卷时间</td><td>及格分</td><td>得分</td><td>操作</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${hisList }" var="item">
											<tr>
											
												<td>
													${item.examName }
												</td>
												<td>
													<c:choose>
														<c:when test="${item.approved == 0 }"><span class="label-warning label-sm label">未审核</span></c:when>
														<c:when test="${item.approved == 1 }"><span class="label-default label-sm label">已审核</span></c:when>
														<c:when test="${item.approved == 2 }"><span class="label-info label-sm label">已交卷</span></c:when>
														<c:when test="${item.approved == 3 }"><span class="label-success label-sm label">已阅卷</span></c:when>
													</c:choose>
												</td>
												<td>
													<c:choose>
														<c:when test="${item.examType == 1 }">私有考试</c:when>
														<c:when test="${item.examType == 2 }">公有考试</c:when>
														<c:when test="${item.examType == 3 }">模拟考试</c:when>
													</c:choose>
												</td>
												<td>
													<fmt:formatDate value="${item.submitTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
												</td>
												<td>
													${item.passPoint }
												</td>
												<td>
													<c:choose>
														<c:when test="${item.pointGet lt item.passPoint }">
															<font color="red">${item.pointGet }</font>
														</c:when>
														<c:otherwise>
															<font color="green">${item.pointGet }</font>
														</c:otherwise>
													</c:choose>
												</td>
												<td>
													<c:choose>
														<c:when test="${item.approved == 3 or (item.examType == 3 and item.approved != 1)}">
															<a class="btn btn-success btn-sm" href="student/student-answer-sheet/${item.examId }" target="_blank" title="预览">详细解答</a>
														</c:when>
													</c:choose>
																										
												</td>
											</tr>
										</c:forEach>
											
									</tbody><tfoot></tfoot>
								</table>
							</div>
							<div id="page-link-content">
								<ul class="pagination pagination-sm">${pageStr}</ul>
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
		<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="resources/chart/raphael-min.js"></script>
		<script type="text/javascript" src="resources/chart/morris.js"></script>
		<script type="text/javascript" src="resources/js/exam-finished.js"></script>
	</body>
</html>