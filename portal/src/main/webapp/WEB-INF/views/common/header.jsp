<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<header>
			<div class="container">
				<div class="row">
					<div class="col-xs-5">
						<div class="logo">
							<h1><a href="#"><img alt="" src="resources/images/logo.png"></a></h1>
						</div>
					</div>
					<div class="col-xs-7" id="login-info">
						<c:choose>
							<c:when test="${not empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
								<div id="login-info-user">
									
									<a href="user-detail/${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}" id="system-info-account" target="_blank">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}</a>
									<span>|</span>
									<a href="j_spring_security_logout"><i class="fa fa-sign-out"></i> 退出</a>
								</div>
							</c:when>
							<c:otherwise>
								<a class="btn btn-primary" href="user-register">用户注册</a>
								<a class="btn btn-success" href="user-login-page">登录</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</header>
		<!-- Navigation bar starts -->

		<div class="navbar bs-docs-nav" role="banner">
			<div class="container">
				<nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
					<ul class="nav navbar-nav">
				        <c:choose>
							<c:when test="${active == 'home'}">
							  <li class="active">
						     	<a href="home"><i class="fa fa-home"></i>主页</a>
						      </li>
							</c:when>
							<c:otherwise>
							  <li>
						     	<a href="home"><i class="fa fa-home"></i>主页</a>
						      </li>
							</c:otherwise>
					    </c:choose>
						<c:choose>
							<c:when test="${active == 'practice'}">
							  <li class="active">
							   <a href="student/practice-list"><i class="fa fa-edit"></i>试题练习</a>
						      </li>
			                </c:when>
							<c:otherwise>
							  <li>
							   <a href="student/practice-list"><i class="fa fa-edit"></i>试题练习</a>
						      </li>
							</c:otherwise>
					    </c:choose>
						<c:choose>
							<c:when test="${active == 'exam'}">
						   	  <li class="active">
							     <a href="exam-list"><i class="fa  fa-paper-plane-o"></i>在线考试</a>
						      </li>
							 </c:when>
							<c:otherwise>
							  <li>
							     <a href="exam-list"><i class="fa  fa-paper-plane-o"></i>在线考试</a>
						      </li>
						    </c:otherwise>
					    </c:choose>
						<c:choose>
							<c:when test="${active == 'training'}">
							   <li class="active">
						    	<a href="training-list"><i class="fa fa-book"></i>培训资料</a>
						       </li>
							</c:when>
							<c:otherwise>
							   <li>
						    	<a href="training-list"><i class="fa fa-book"></i>培训资料</a>
						       </li>
						    </c:otherwise>
					    </c:choose>
					    
					    <c:choose>                    
							<c:when test="${active == 'center'}">
							  <li class="active">
						    	<a href="student/usercenter"><i class="fa fa-dashboard"></i>会员中心</a>
						      </li>
							</c:when>
							<c:otherwise>
							   <li>
						    	<a href="student/usercenter"><i class="fa fa-dashboard"></i>会员中心</a>
						      </li>
							</c:otherwise>
					    </c:choose>
						
						<c:choose>
							<c:when test="${active == 'setting'}">
								<li class="active">
							      <a href="student/setting"><i class="fa fa-cogs"></i>个人设置</a>
					        	</li>
							</c:when>
							<c:otherwise>
							    <li>
							      <a href="student/setting"><i class="fa fa-cogs"></i>个人设置</a>
					        	</li>
							</c:otherwise>
					    </c:choose>
					
					</ul>
				</nav>
			</div>
		</div>