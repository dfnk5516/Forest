<%@ include file="../include/topcontent.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=45666bcb826210a72dbea20e833f5168&libraries=services,clusterer,drawing"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${path}/resources/css/travelInformationWrite.css"/>

<title>For Rest : 휴양림 예약 사이트</title>
</head>
<body id = "ContentBody">
	<!-- Main -->
	<div id="main" class="wrapper style2 clearfix">

			<div class = "floatDiv" style = "width : 30%;">
				최상위 div인 main 바로 밑의 여백div - 내용물 생기면 자동으로 높이 생김 <p>> main div도 자동으로 main이 가진 padding + 이거의 높이 됨
			</div>
			
			<div class = "floatDiv" style = "width : 40%;  height : 500px"><!-- main 바로 밑 div 중 가장 큰 영역의 세로높이가 곧 main의 세로길이 + padding 길이가 됨 -->
				<div id = "checkBoxDiv" style = "height : 20%">
					<input type="radio" name="writeType" id="write1" checked="checked" >관광지
					<input type="radio" name="writeType" id="write2" >행사
				</div>
				<div id = "listAndFormDiv" class = "clearfix" style = "height : 80%">
					<div id = "listDiv" class = "floatDiv" style = "width : 50%; height : 100%">왼쪽에 리스트 뿌릴 곳</div>
					<div id = "formContainerDiv" class = "floatDiv" style = "width : 50%; height : 100%">
						<div id = "formHeaderDiv" class = "clearfix" style = "height : 20%">
							<div id = "formHeaderTitleDiv" class = "floatDiv" style = "width : 80%; height : 100%;">광광머시기</div>
							<div id = "formHeaderButtonsDiv" class = "floatDiv" style = "width : 20%; height : 100%;">
								<input type = "button" value = "등록" class = "formButton" style = "width : 100%; height : 33%">
								<input type = "button" value = "수정" class = "formButton" style = "width : 100%; height : 33%">
								<input type = "button" value = "삭제" class = "formButton" style = "width : 100%; height : 33%">
							</div>
						</div>
						<div id = "formDiv" style = "height : 80%">
							<form method = "get" action = "">
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
								<ul id = "tableUl"></ul>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			<div class = "floatDiv" style = "width : 30%;  height : 100%">
				최상위 div인 main 바로 밑의 여백div - 내용물 생기면 자동으로 높이 생김 <p>> main div도 자동으로 main이 가진 padding + 이거의 높이 됨
			</div>
	</div>
	
	
</body>
</html>
<%@ include file="../include/footer.jsp"%>