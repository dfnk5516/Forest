<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class = "global wide normal narrow">
	<head>
		<c:set var="path" value="${pageContext.request.contextPath}" scope="application"/>
		<!-- <meta charset="UTF-8"> -->
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
		
		<!-- 필요없는 메타 태그 -->
		<!-- <meta name="description" content="" />
		<meta name="keywords" content="" /> -->
		
		<!-- 소메뉴 drop에 필요한 파일 -->
		<script src="${path}/resources/js/jquery.min.js"></script>
		<script src="${path}/resources/js/jquery.dropotron.min.js"></script>
		<script src="${path}/resources/js/skel.min.js"></script>
		<script src="${path}/resources/js/init.js"></script>
		
		<!-- topcontent 디자인에 필요한 파일 (style.css 수정, includeStyle로 파일이름 변경)-->
		<link rel="stylesheet" href="${path}/resources/css/includeStyle.css" />
		
		
		<%-- 없어도 topcontent에 이상 없는 파일 --%>
		<%-- <link rel="stylesheet" href="${path}/resources/css/style-wide.css"> --%>
		<%-- <link rel="stylesheet" href="${path}/resources/css/style-normal.css">	 --%>	
		<%-- <link rel="stylesheet" href="${path}/resources/css/style-narrow.css"> --%>
		<%-- <script src="${path}/resources/js/skel-layers.min.js"></script> --%>		
		<%-- <link rel="stylesheet" href="${path}/resources/css/skel.css" /> --%>
		
		<%-- 부트스트랩 폰트 미적용 --%> 			
		<%-- <link rel="stylesheet" href="${path}/resources/css/bootStrap.css"/> --%>
		
		<title>For Rest : 휴양림 예약 사이트</title>
	</head>
	<body>
	<!-- Header -->
		<div class="wrapper style1">
			<!-- Header -->
			<div id="header">
				<div class="container">
					<!-- Logo -->
					<h4><a href="hometest" id="logo">FORREST</a></h4>	
					<!-- Nav -->
					<nav id="nav">
						<ul>
							<li class="active"><a href="hometest">Home</a></li>
							<li><a href="#">통합 예약</a></li>
							<li><a href="#">여행 정보</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/travelInformation">여행 정보</a></li>
								</ul>
							</li>
							<li><a href="">공지/문의</a>
								<ul>
									<li><a href="#">공지 사항</a></li>
									<li><a href="${pageContext.request.contextPath}/faq">자주 묻는 질문</a></li>
									<li><a href="${pageContext.request.contextPath}/qnalist">1 대 1 문의</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</body>
</html>