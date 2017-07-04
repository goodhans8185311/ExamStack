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
		<title>培训历史</title>
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
			.section-navi-item {
			    display: inline-block;
			    height: 24px;
			    background: rgb(239,237,237);
			     padding:0 10px;
			    margin: 3px;
			    font-family: arial;
			    text-align: center;
			    line-height: 24px;
			    color: #428bca;
			    font-size: 12px;
			    cursor: pointer;
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
							<li>
								<a href="student/exam-history"> <i class="fa fa-history"></i> 考试历史 </a>
							</li>
							<li class="active">
								<a href="student/training-history"> <i class="fa fa-book"></i> 培训历史 </a>
							</li>
						</ul>
					</div>
					<div class="col-xs-10">
						<div class="page-header">
							<h1><i class="fa fa-history"></i> 培训历史</h1>
						</div>
						<div class="page-content row">
							<div id="question-list">
								<table class="table-striped table">
									<thead>
										<tr>
											<td>培训名称</td><td>学习进度</td><td>操作</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${trainingList }" var="item">
											<tr>
												<td>${item.trainingName }</td>
												<td>
													<div>
														<c:forEach items="${processMap[item.trainingId] }" var="processItem">
															<c:choose>
																<c:when test="${processItem.process == 1 }">
																	<a class="section-navi-item navi-item-success" href="student/training/${item.trainingId }?sectionId=${processItem.sectionId}">${processItem.sectionName }</a>
																</c:when>
																<c:otherwise>
																	<a class="section-navi-item" href="student/training/${item.trainingId }?sectionId=${processItem.sectionId}">${processItem.sectionName }</a>
																</c:otherwise>
															</c:choose>
															
														</c:forEach>
														
													</div>
												</td>	
												<td><a class="btn btn-success approved-btn" data-id="" href="student/training/${item.trainingId }">参加培训</a></td>
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
	</body>
</html>