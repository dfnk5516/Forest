<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
	<head>
		<c:set var="path" value="${pageContext.request.contextPath}" scope="application"/>
		<meta charset="UTF-8">
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<script src="${path}/resources/js/jquery.min.js"></script>
		<script src="${path}/resources/js/jquery.dropotron.min.js"></script>
		<link rel="stylesheet" href="${path}/resources/css/style.css">
		<link rel="stylesheet" href="${path}/resources/css/style-wide.css">
		<link rel="stylesheet" href="${path}/resources/css/style-normal.css">
		<script src="${path}/resources/js/skel.min.js"></script>
		<script src="${path}/resources/js/skel-layers.min.js"></script>
		<script src="${path}/resources/js/init.js"></script>
		<link rel="stylesheet" href="${path}/resources/css/skel.css" />
		<link rel="stylesheet" href="${path}/resources/css/style.css" />
		<title>For Rest : 휴양림 예약 사이트</title>
	</head>
	<body class="homepage">
		<!-- Header Wrapper -->
		<div class="wrapper style1">
			<!-- Header -->
			<div id="header">
				<div class="container">
					<!-- Logo -->
					<h1><a href="#" id="logo">FORREST</a></h1>
					<!-- Nav -->
					<nav id="nav">
						<ul>
							<li class="active"><a href="hometest">Home</a></li>
							<li><a href="${path}/forest/list">통합 예약</a>
								<ul>
									<li><a href="${path}/forest/list">통합 예약</a></li>
								</ul>
							</li>
							<li><a href="${path}/travelInformation">여행 정보</a>
								<ul>
									<li><a href="${path}/travelInformation">여행 정보</a></li>
								</ul>
							</li>
							<li><a href="">공지/문의</a>
								<ul>
									<li><a href="#">공지 사항</a></li>
									<li><a href="${path}/faq">자주 묻는 질문</a></li>
									<li><a href="#">1 대 1 문의</a></li>								
								</ul>
							</li>
							<!-- security 로그인, 회원가입부분 -->
							<!-- 인증됐으면 -->
							<sec:authorize access="isAuthenticated()">
								<!-- 관리자인 경우 -->
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<li><a>관리 페이지</a>
										<ul>
											<li><a href="${pageContext.request.contextPath}/user/addressList">회원 검색하기</a></li>
											<li><a href="${pageContext.request.contextPath}/user/updateForm">정보수정</a></li>				
										</ul> 
									</li>
								</sec:authorize>
								
								<!--  일반 회원일 때-->
								<sec:authorize access="!hasAnyRole('ROLE_ADMIN')">
									<li><a>마이페이지</a>
										<ul>
											<li><a href="${pageContext.request.contextPath}/user/findUser?userId=${udto.userName}">나의 정보 페이지</a></li>
											<li><a href="${pageContext.request.contextPath}/user/updateForm">정보 수정 폼</a></li>
											<li><a href="#">나의 예약현황 보기</a></li>
										</ul> 
									</li>
								</sec:authorize>
							</sec:authorize>
							<li>
								<sec:authorize access="!isAuthenticated()">
									<sec:authentication var="udto" property="principal" />
									<a href="${path}/registerForm">회원가입</a>
								</sec:authorize>
							</li>
							
							<li>
							<form id="logoutFrm" action="${pageContext.request.contextPath}/user/logout" method="post"style:"display:none">
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
							</form>
								<sec:authorize access="isAuthenticated()">
									<sec:authentication var="udto" property="principal" />
									<a href="javascript:logout();" id="logoutbtn">로그아웃</a>	
								</sec:authorize>
							</li>
							<li>
								<!-- 로그인 했을 때 버튼 및 기능 변경 -->
								<sec:authorize access="isAnonymous()">
									<a href="${path}/loginForm">로그인</a>
								</sec:authorize>
								<sec:authorize access="isAuthenticated()">
									<sec:authentication var="udto" property="principal" />
									<b>${udto.userName}님 환영합니다.</b>
									<p>
								</sec:authorize>
							</li>
						</ul>
					</nav>	
				</div>
			</div>
			
		</div>
	</body>
</html>