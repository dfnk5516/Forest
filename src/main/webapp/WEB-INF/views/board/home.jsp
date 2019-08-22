<%@ include file="../include/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
	<head>
		<title>For Rest : 휴양림 예약 사이트</title>
	<script type="text/javascript">
			function logout() {
				document.getElementById("logoutFrm").submit();
			}
	</script>
	</head>
	<body class="homepage">
		<!-- Header Wrapper -->
		<div class="wrapper style1">
			<!-- Banner -->
			<div id="banner">
				<section class="container">
					<h2>ForRest</h2>
					<span style="text-shadow: 2px 2px #6C6517;">휴가 계획을 세우고 계신가요?</span>
					<p style="text-shadow: 2px 2px #6C6517;">최적의 휴식처를 찾아 드립니다.</p>
				</section>
			</div>
		</div>
	
		<!-- Section One -->
		<div class="wrapper style2">
			<section class="container">
				<div class="row double">
					<div class="6u">
						<header class="major">
							<h2>멤버십 혜택</h2>
							<span class="byline" style="float:left;">
									<img src="/controller/resources/images/benefit1.PNG" alt="benefit1" width="180px" height="230px" style="border-radius: 10px;">
									<img src="/controller/resources/images/benefit2.PNG" alt="benefit2" width="180px" height="230px" style="border-radius: 10px;">
									<img src="/controller/resources/images/benefit3.PNG" alt="benefit3" width="180px" height="230px" style="border-radius: 10px;">
							</span>
						</header>
					</div>
					<div class="6u">
						<h3>전국의 자연 휴양림을 한 곳에서!</h3>
						<p>자연과 함께하는 힐링 타임! 자연 휴양림 속에서 휴식과 즐거움을 누려보아요. </p>
					</div>
				</div>
			</section>
		</div>
	
		<!-- Section Two -->
		<div class="wrapper style5">
			<section id="team" class="container">
				<header class="major">
					<h2>추천 휴양림 Top 4</h2>
					<span class="byline">ForRest 회원님들의 인기 휴양림 Top 4! 지금 바로 예약하세요!</span>
				</header>
				<div class="row">
					<div class="3u">
						<a href="#" class="image"><img style="width: 200px; height: 200px;" src="/controller/resources/images/forestImg/휴양림3.jpg" alt=""></a>
						<h3>박달재 자연 휴양림</h3>
						<p>충청북도 제천시 백운면 금봉로 228</p>
					</div>
					<div class="3u">
						<a href="#" class="image"><img style="width: 200px; height: 200px;" src="/controller/resources/images/forestImg/휴양림4.jpg" alt=""></a>
						<h3>칼봉산 자연 휴양림</h3>
						<p>경기도 가평군 가평읍 경반안로 454</p>
					</div>
					<div class="3u">
						<a href="#" class="image"><img style="width: 200px; height: 200px;" src="/controller/resources/images/forestImg/휴양림5.jpg" alt=""></a>
						<h3>장태산 자연 휴양림</h3>
						<p>대전광역시 서구 장안로 461길</p>
					</div>
					<div class="3u">
						<a href="#" class="image"><img style="width: 200px; height: 200px;" src="/controller/resources/images/forestImg/휴양림6.jpg" alt=""></a>
						<h3>서운산 자연 휴양림</h3>
						<p>경기도 안성시 금광면 배티로 185-39</p>
					</div>
				</div>
			</section>
		</div>
	
		<!-- Section Three -->
		<div class="wrapper style4">
			<section class="container">
				<header class="major">
					<h2>FORREST의 특별한 서비스들</h2>
					<span class="byline">pulvinar mollis. Vestibulum sem magna, elementum vestibulum arcu.</span>
				</header>
				<div class="row flush">
					<div class="4u">
						<ul class="special-icons">
							<li>
								<span class="fa fa-leaf"></span>
								<h3>빠른 여행지 검색</h3>
								<p>스마트한 검색으로 빠르고 간편한 여행하기. 다가오는 황금연휴에 대비하세요!</p>
							</li>
						</ul>
					</div>
					<div class="4u">
						<ul class="special-icons">
							<li>
								<span class="fa fa-leaf"></span>
								<h3>다양한 검색 조건</h3>
								<p>당신의 취향에 맞는 휴양림, 관광지 선택! 다양하게 검색해 보세요!</p>
							</li>
						</ul>
					</div>
					<div class="4u">
						<ul class="special-icons">
							<li>
								<span class="fa fa-leaf"></span>
								<h3>온라인 숙박 예약</h3>
								<p>ForRest를 통해 쉽고 편리하게 숙소를 예약하세요! 제휴처 할인 서비스도 꼭 챙기세요!</p>
							</li>
						</ul>
					</div>
				</div>
			</section>
		</div>
	
		<!-- Section Four -->
		<div class="wrapper style3">
			<section class="container">
				<header class="major">
					<h2>추천 이벤트</h2>
					<span class="byline">FORREST 숙박 예약 내역을 제시하시면 제휴 혜택을 누리실 수 있습니다!</span>
				</header>
				<div class="row">
					<div class="3u">
						<img src="/controller/resources/images/event1.PNG" alt="event1" width="250px" height="280px" style="border-radius: 10px;">
					</div>
					<div class="3u">
						<img src="/controller/resources/images/event2.PNG" alt="event2" width="250px" height="280px" style="border-radius: 10px;">
					</div>
					<div class="3u">
						<img src="/controller/resources/images/event3.PNG" alt="event3" width="250px" height="280px" style="border-radius: 10px;">
					</div>
					<div class="3u">
						<img src="/controller/resources/images/event4.PNG" alt="event4" width="250px" height="280px" style="border-radius: 10px;">
					</div>
				</div>
			</section>
		</div>
	</body>
</html>
<%@ include file="../include/footer.jsp"%>