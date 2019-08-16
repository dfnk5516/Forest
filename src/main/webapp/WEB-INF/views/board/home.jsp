<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		
		<meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
		
		<style type="text/css">@-ms-viewport{width: device-width}</style>
		<style type="text/css">html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,b,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,embed,figure,figcaption,footer,header,hgroup,menu,nav,output,ruby,section,summary,time,mark,audio,video{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline}article,aside,details,figcaption,figure,footer,header,hgroup,menu,nav,section{display:block}body{line-height:1}ol,ul{list-style:none}blockquote,q{quotes:none}blockquote:before,blockquote:after,q:before,q:after{content:'';content:none}table{border-collapse:collapse;border-spacing:0}body{-webkit-text-size-adjust:none}</style>
		<style type="text/css">*,*:before,*:after{-moz-box-sizing:border-box;-webkit-box-sizing:border-box;box-sizing:border-box}</style>
		
		<title>For Rest : 휴양림 예약 사이트</title>
		
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		
		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
		<script src="/controller/resources/js/jquery.min.js"></script>
		<script src="/controller/resources/js/jquery.dropotron.min.js"></script>
		
		<style type="text/css">.\31 2u{width:100%}.\31 1u{width:91.6666666667%}.\31 0u{width:83.3333333333%}.\39 u{width:75%}.\38 u{width:66.6666666667%}.\37 u{width:58.3333333333%}.\36 u{width:50%}.\35 u{width:41.6666666667%}.\34 u{width:33.3333333333%}.\33 u{width:25%}.\32 u{width:16.6666666667%}.\31 u{width:8.3333333333%}.\-11u{margin-left:91.6666666667%}.\-10u{margin-left:83.3333333333%}.\-9u{margin-left:75%}.\-8u{margin-left:66.6666666667%}.\-7u{margin-left:58.3333333333%}.\-6u{margin-left:50%}.\-5u{margin-left:41.6666666667%}.\-4u{margin-left:33.3333333333%}.\-3u{margin-left:25%}.\-2u{margin-left:16.6666666667%}.\-1u{margin-left:8.3333333333%}</style>
		<style type="text/css">.row>*{float:left}.row:after{content:'';display:block;clear:both;height:0}.row:first-child>*{padding-top:0!important}</style>
		
		<link rel="stylesheet" type="text/css" href="/controller/resources/css/style.css">
		<link rel="stylesheet" type="text/css" href="/controller/resources/css/style-wide.css">
		<link rel="stylesheet" type="text/css" href="/controller/resources/css/style-normal.css">
		
		<style type="text/css">body{min-width:95%}.container{margin-left:auto;margin-right:auto;width:95%}.container.small{width:71.25%}.container.big{width:100%;max-width:118.75%;min-width:95%}</style>
		<style type="text/css">.row>*{padding-left:25px}.row+.row>*{padding:25px 0 0 25px}.row{margin-left:-25px}.row.flush>*{padding-left:0}.row+.row.flush>*{padding:0}.row.flush{margin-left:0}.row.half>*{padding-left:12.5px}.row+.row.half>*{padding:12.5px 0 0 12.5px}.row.half{margin-left:-12.5px}.row.quarter>*{padding-left:6.25px}.row+.row.quarter>*{padding:6.25px 0 0 6.25px}.row.quarter{margin-left:-6.25px}.row.oneandhalf>*{padding-left:37.5px}.row+.row.oneandhalf>*{padding:37.5px 0 0 37.5px}.row.oneandhalf{margin-left:-37.5px}.row.double>*{padding-left:50px}.row+.row.double>*{padding:50px 0 0 50px}.row.double{margin-left:-50px}</style>
		<style type="text/css">.not-global,.not-wide,.not-normal,.not-narrow{display:none!important}.only-narrower,.only-mobile{display:none!important}</style>
		
		<script src="/controller/resources/js/skel.min.js"></script>
		<script src="/controller/resources/js/skel-layers.min.js"></script>
		<script src="/controller/resources/js/init.js"></script>
		
		<noscript>
			<link rel="stylesheet" href="/controller/resources/css/skel.css" />
			<link rel="stylesheet" href="/controller/resources/css/style.css" />
		</noscript>
	</head>
	<body class="homepage">
		<%@ include file="top.jsp"%>
		<!-- Header Wrapper -->
			<div class="wrapper style1">
			<!-- Banner -->
				<div id="banner">
					<section class="container">
						<h2>ForRest</h2>
						<span style="text-shadow : 2px 2px #6C6517;">휴가 계획을 세우고 계신가요?</span>
						<p style="text-shadow : 2px 2px #6C6517;">최적의 휴식처를 찾아 드립니다.</p>
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
								<span class="byline">
									<h6> 제휴처 입장권, 상품 할인 | VIP 고객 숙박료 10% 할인 | 휴양림 예약 시 여행 책자 발송 </h6>
								</span>
							</header>
						</div>
						<div class="6u">
							<h3>전국의 자연 휴양림을 한 곳에서!</h3>
							<p>자연과 함께하는 힐링 타임! 자연 휴양림 속에서 휴식과 즐거움을 누려보아요. </p>
							<a href="loginForm" class="button">로그인</a>
							<a href="loginForm" class="button">회원가입</a>
						</div>
					</div>
				</section>
			</div>
			
		<!-- Section Two -->
			<div class="wrapper style3">
				<section class="container">
					<header class="major">
						<h2>추천 이벤트</h2>
					</header>
					<p>Pellentesque pede. Donec pulvinar ullamcorper metus. In eu odio at lectus pulvinar mollis. Vestibulum sem magna, elementum vestibulum arcu.</p>
					<a href="#" class="button alt">제휴 할인 혜택</a>
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
									<p>Maecenas pede nisl, elementum eu, ornare ac, malesuada at, erat. Proin gravida orci porttitor.</p>
								</li>
							</ul>
						</div>
						<div class="4u">
							<ul class="special-icons">
								<li>
									<span class="fa fa-leaf"></span>
									<h3>다양한 검색 조건</h3>
									<p>Maecenas pede nisl, elementum eu, ornare ac, malesuada at, erat. Proin gravida orci porttitor.</p>
								</li>
							</ul>
						</div>
						<div class="4u">
							<ul class="special-icons">
								<li>
									<span class="fa fa-leaf"></span>
									<h3>온라인 숙박 예약</h3>
									<p>Maecenas pede nisl, elementum eu, ornare ac, malesuada at, erat. Proin gravida orci porttitor.</p>
								</li>
							</ul>
						</div>
					</div>
				</section>
			</div>
		
		<!-- Team -->
			<div class="wrapper style5">
				<section id="team" class="container">
					<header class="major">
						<h2>추천 휴양림 Top 4</h2>
						<span class="byline">pulvinar mollis. Vestibulum sem magna, elementum vestibulum arcu</span>
					</header>
					<div class="row">
						<div class="3u">
							<a href="#" class="image"><img src="images/placeholder.png" alt=""></a>
							<h3>Molly Millions</h3>
							<p>In posuere eleifend odio quisque semper augue wisi ligula.</p>
						</div>
						<div class="3u">
							<a href="#" class="image"><img src="images/placeholder.png" alt=""></a>
							<h3>Henry Dorsett Case</h3>
							<p>In posuere eleifend odio quisque semper augue wisi ligula.</p>
						</div>
						<div class="3u">
							<a href="#" class="image"><img src="images/placeholder.png" alt=""></a>
							<h3>Willis Corto</h3>
							<p>In posuere eleifend odio quisque semper augue wisi ligula.</p>
						</div>
						<div class="3u">
							<a href="#" class="image"><img src="images/placeholder.png" alt=""></a>
							<h3>Linda Lee</h3>
							<p>In posuere eleifend odio quisque semper augue wisi ligula.</p>
						</div>
					</div>
				</section>
			</div>
		<%@ include file="footer.jsp"%>
	</body>
</html>