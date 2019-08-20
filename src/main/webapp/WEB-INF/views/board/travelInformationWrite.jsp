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
<script type="text/javascript">
	var sightsNameArray = JSON.parse('${sightsNameArray}');
	console.log(sightsNameArray);
	function sightsListInit()
	{
		var str = "<li style = 'width : 100%;' class = 'clearfix listLi'>";
		str += "<div style = 'width : 30%; overflow : hidden;' class = 'floatDiv'>순번</div>";
		str += "<div style = 'width : 70%; overflow : hidden;' class = 'floatDiv'>관광지명</div></li>";
		
		for(var i = 0; i < sightsNameArray.length; ++i)
		{
			str += "<li style = 'width : 100%;' class = 'clearfix listLi'>";
			str += "<div id = 'sightsIndex"+ i +"' style = 'width : 30%; overflow : hidden;' class = 'floatDiv'>" + (i + 1) + "</div>";
			str += "<div style = 'width : 70%; overflow : hidden;' class = 'floatDiv'>" + sightsNameArray[i] + "</div></li>";
			//str += "<div id = 'sightsIndex" + i  + "' class = 'floatDiv' style = 'width : 30%; height : auto>" + (i + 1) + "</div>";
			//str += "<div id = 'sightsIndex" + i  + "' style = 'width : 70%; height : auto' class = 'floatDiv'>" + sightsArray[i].sightsName + "</div></li>";
		}
		document.getElementById("listUl").innerHTML = str;
	}
	
</script>
</head>
<body id = "ContentBody" onload = "sightsListInit()">
	<!-- Main -->
	<div id="main" class="wrapper style2 clearfix">

			<div class = "floatDiv" style = "width : 10%;">
				최상위 div인 main 바로 밑의 여백div - 내용물 생기면 자동으로 높이 생김 <p>> main div도 자동으로 main이 가진 padding + 이거의 높이 됨
			</div>
			
			<div class = "floatDiv" style = "width : 80%;  height : auto"><!-- main 바로 밑 div 중 가장 큰 영역의 세로높이가 곧 main의 세로길이 + padding 길이가 됨 -->
				<div id = "headerDiv" class = "clearfix" style = "width : 100%">
					<div id = "checkBoxDiv" class = "floatDiv" style = "width : 50%; height : 100%">
						<input type="radio" name="writeType" id="write1" checked="checked" >관광지
						<input type="radio" name="writeType" id="write2" >행사
					</div>
					<div id = "formHeaderTitleDiv" class = "floatDiv" style = "width : 40%; height : 100%;">광광머시기</div>
					<div id = "formHeaderButtonsDiv" class = "floatDiv" style = "width : 10%; height : 100%;">
						<input type = "button" value = "등록" class = "formButton" style = "width : 100%; height : 33%">
						<input type = "button" value = "수정" class = "formButton" style = "width : 100%; height : 33%">
						<input type = "button" value = "삭제" class = "formButton" style = "width : 100%; height : 33%">
					</div>
				</div>
				<div id = "contentDiv" class = "clearfix">
					<div id = "listDiv" class = "floatDiv" style = "width : 50%; height : 100%">
							<ul id = "listUl" style = "width : 100%; height : 100%"></ul>
					</div>
					<div id = "formContainerDiv" class = "floatDiv" style = "width : 50%; height : 100%">
						<div id = "formDiv" style = "height : 100%">
							<form method = "get" action = "">
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
								<ul id = "tableUl" style = "width : 100%; height : 100%">
									<li style = "width : 100%;" class="clearfix">
										<div id="sightsNum" class="floatDiv"></div>
										<div class="floatDiv"><input type="text"></div>
									</li>
									<li style = "width : 100%;" class="clearfix">
										<div id="sightsName" class="floatDiv"></div>
										<div class="floatDiv"><input type="text"></div>
									</li>
									<li style = "width : 100%;" class="clearfix">
										<div id="sightsCity" class="floatDiv"></div>
										<div class="floatDiv"><input type="text"></div>
									</li>
									<li style = "width : 100%;" class="clearfix">
										<div id="sightsRegion" class="floatDiv"></div>
										<div class="floatDiv"><input type="text"></div>
									</li>
									<li style = "width : 100%;" class="clearfix">
										<div id="sightsDescription" class="floatDiv"></div>
										<div class="floatDiv"><textarea></textarea></div>
									</li>
									<li style = "width : 100%;" class="clearfix">
										<div id="sightsLocation" class="floatDiv"></div>
										<div class="floatDiv"><input type="text"></div>
									</li>
									<li style = "width : 100%;" class="clearfix">
										<div id="sightsHomepage" class="floatDiv"></div>
										<div class="floatDiv"><input type="text"></div>
									</li>
									<li style = "width : 100%; height : 11%" class="clearfix">
										<div id="sightsLatitude" class="floatDiv"></div>
										<div class="floatDiv"><input type="text"></div>
									</li>
									<li style = "width : 100%; height : 11%" class="clearfix">
										<div id="sightsLongitude" class="floatDiv"></div>
										<div class="floatDiv"><input type="text"></div>
									</li>
								</ul>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			<div class = "floatDiv" style = "width : 10%;  height : 100%">
				최상위 div인 main 바로 밑의 여백div - 내용물 생기면 자동으로 높이 생김 <p>> main div도 자동으로 main이 가진 padding + 이거의 높이 됨
			</div>
	</div>
	
	
</body>
</html>
<%@ include file="../include/footer.jsp"%>