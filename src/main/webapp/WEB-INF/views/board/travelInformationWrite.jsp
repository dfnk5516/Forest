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
	var radioCheck = false;
	
	
	function sightsListInit()
	{
		var str = "<li style = 'width : 100%;' class = 'clearfix listLi'>";
		str += "<div style = 'width : 30%; height : 72px; overflow : hidden;' class = 'floatDiv'>순번</div>";
		str += "<div style = 'width : 70%; overflow : hidden;' class = 'floatDiv'>관광지명</div></li>";
		
		for(var i = 0; i < sightsNameArray.length; ++i)
		{
			str += "<li style = 'width : 100%;' class = 'clearfix listLi'>";
			str += "<div id = 'sightsIndex"+ i +"' style = 'width : 30%; height : 36px; overflow : hidden;' class = 'floatDiv'>" + (i + 1) + "</div>";
			str += "<div style = 'width : 70%; overflow : hidden;' class = 'floatDiv'>" + sightsNameArray[i] + "</div></li>";
			//str += "<div id = 'sightsIndex" + i  + "' class = 'floatDiv' style = 'width : 30%; height : auto>" + (i + 1) + "</div>";
			//str += "<div id = 'sightsIndex" + i  + "' style = 'width : 70%; height : auto' class = 'floatDiv'>" + sightsArray[i].sightsName + "</div></li>";
		}
		document.getElementById("listUl").innerHTML = str;
		//document.getElementById("tableUl").innerHTML = str;
	}
	
	$(function()
	{
		$("[name=writeType]").click(function()    
		{
			if(radioCheck)
			{
				$("#sightsForm").show();
				$("#festivalForm").hide();
				radioCheck = false;
			}
			else
			{
				$("#sightsForm").hide();
				$("#festivalForm").show();
				radioCheck = true;
			}
		})
		alert($("#sightsCity option:selected").val());
		$("#festivalForm").hide();
	});
	
	function textCheck(text)
	{
		var changedText =  text.replace(/&quot;/gi, '&quot;');
		changedText = changedText.replace(/&lt;/gi, '&lt;');
		changedText = changedText.replace(/&gt;/gi, '&gt;');
		changedText = changedText.replace(/&amp;/gi, '&amp;');
		
		return changedText;
	}
	
	function insert()
	{
		if($('input:radio[name=writeType]:checked').val()=="sightsRadio")
		{
			var datas = "${_csrf.parameterName}=${_csrf.token}";
			datas += "&&sightsName=" + $("#sightsName").val();
			datas += "&&city=" + $("#sightsCity option:selected").val();
			datas += "&&sightsRegion=" + $("#sightsRegion").val();
			datas += "&&sightsDescription=" + $("#sightsDescription").val();
			datas += "&&sightsLocation=" + $("#sightsLocation").val();
			datas += "&&sightsHomepage=" + $("#sightsHomepage").val();
			datas += "&&sightsLatitude=" + $("#sightsLatitude").val();
			datas += "&&sightsLongitude=" + $("#sightsLongitude").val();
			alert($("#sightsCity option:selected").val())
			
			$.ajax({
				url: "${path}/sightsInsert", //서버주소
				type :"post" , //전송방식(get, post, put, delete)
				data : datas,
				dataType : "json", //서버가 보내오는 데이터타입(text,html,xml,json)
				success :function(result)
				{
					console.log(result);
					//${_csrf.parameterName}=${_csrf.token}&&
				} ,
				error : function(err)
				{
					alert("오류발생cc : " + err);
				}
			})
		}
	}
	
</script>
</head>
<body id = "ContentBody" onload = "sightsListInit()">
	<!-- Main -->
	<div id="main" class="wrapper style2 clearfix"">

			<div class = "floatDiv"></div>
			
			<div class = "floatDiv" style = "width : 100%;  height : 900px"><!-- main 바로 밑 div 중 가장 큰 영역의 세로높이가 곧 main의 세로길이 + padding 길이가 됨 -->
				<div id = "headerDiv" class = "clearfix" style = "width : 100%; height : 10%">
					<div id = "checkBoxDiv" class = "floatDiv" style = "width : 50%; height : 100%">
						<input type="radio" name="writeType" id="write1" value="sightsRadio" checked="checked" >관광지
						<input type="radio" name="writeType" id="write2" value="festivalRadio" >행사
					</div>
					<div id = "formHeaderTitleDiv" class = "floatDiv" style = "width : 40%; height : 100%;">광광머시기</div>
					<div id = "formHeaderButtonsDiv" class = "floatDiv" style = "width : 10%; height : 100%;">
						<input type = "button" value = "등록" class = "formButton" onclick="insert()" style = "width : 100%; height : 33.3%">
						<input type = "button" value = "수정" class = "formButton" style = "width : 100%; height : 33.3%">
						<input type = "button" value = "삭제" class = "formButton" style = "width : 100%; height : 33.3%">
					</div>
				</div>
				<div id = "contentDiv" class = "clearfix" style = "width : 100%; height : 90%; overflow : hidden;">
					<div id = "listDiv" class = "floatDiv" style = "width : 50%; height :100%; overflow : auto;">
							<ul id = "listUl" style = "width : 100%; height : auto;"></ul>
					</div>
					<div id = "formContainerDiv" class = "floatDiv" style = "width : 50%; height : 100%;">
						<form id = "sightsForm" method = "get" action = "${path}/sightsInsert" style = "height : 100%">
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
							<ul id = "sightsTableUl" style = "width : 100%; height : 100%">
								<li class = "clearfix" style = "width : 100%; height : 8.33%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">관광지명</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<input type = "text" id="sightsName" class = "textBox" style = "width : 100%; height : 100%;">
									</div>
								</li>
								<li class = "clearfix" style = "width : 100%; height : 8.33%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">시/도</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<select id="sightsCity" class = "textBox" style = "width : 100%; height : 100%;">
											<c:forEach items="${cityList}" var="city">
												<option value = "${city}">${city}</option>
											</c:forEach>
										</select>
									</div>
								</li>
								<li class = "clearfix" style = "width : 100%; height : 8.33%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">지역</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<input type = "text" id= "sightsRegion" class = "textBox" style = "width : 100%; height : 100%;">
									</div>
								</li>
								<li class = "clearfix" style = "width : 100%; height : 41.65%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">설명</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<textarea id="sightsDescription" class = "textBox" style = "width : 100%; height : 100%; resize : none;"></textarea>
									</div>
								</li>
								<li class = "clearfix" style = "width : 100%; height : 8.33%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">위치</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<input type = "text" id="sightsLocation" class = "textBox" style = "width : 100%; height : 100%;">
									</div>
								</li>
								<li class = "clearfix" style = "width : 100%; height : 8.33%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">홈페이지</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<input type = "text" id="sightsHomepage" class = "textBox" style = "width : 100%; height : 100%;">
									</div>
								</li>
								<li class = "clearfix" style = "width : 100%; height : 8.33%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">위도</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<input type = "text" id="sightsLatitude" class = "textBox" style = "width : 100%; height : 100%;">
									</div>
								</li>
								<li class = "clearfix" style = "width : 100%; height : 8.33%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">경도</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<input type = "text" id="sightsLongitude" class = "textBox" style = "width : 100%; height : 100%;">
									</div>
								</li>
							</ul>
						</form>
						
						<form id = "festivalForm" method = "get" action = "" style = "height : 100%">
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
							<ul id = "festivalTableUl" style = "width : 100%; height : 100%">
								<li class = "clearfix" style = "width : 100%; height : 6.25%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">이름</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<input type = "text" id="festivalName" class = "textBox" style = "width : 100%; height : 100%;">
									</div>
								</li>
								<li class = "clearfix" style = "width : 100%; height : 6.25%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">시/도</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<select id="city" class = "textBox" style = "width : 100%; height : 100%;">
											<c:forEach items="${cityList}" var="city">
												<option>${city}</option>
											</c:forEach>
										</select>
									</div>
								</li>
								<li class = "clearfix" style = "width : 100%; height : 6.25%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">지역</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<input type = "text" id="festivalLocation" class = "textBox" style = "width : 100%; height : 100%;">
									</div>
								</li>
								<li class = "clearfix" style = "width : 100%; height : 6.25%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">주소</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<input type = "text" id="festivalAddress" class = "textBox" style = "width : 100%; height : 100%;">
									</div>
								</li>
								<li class = "clearfix" style = "width : 100%; height : 31.25%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">설명</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<textarea id="festivalDescription" class = "textBox" style = "width : 100%; height : 100%; resize : none;"></textarea>
									</div>
								</li>
								<li class = "clearfix" style = "width : 100%; height : 6.25%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">시작일</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<input type = "text" id="festivalStart" class ="textBox" style = "width : 100%; height : 100%;">
									</div>
								</li>
								<li class = "clearfix" style = "width : 100%; height : 6.25%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">종료일</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<input type = "text" id="festivalEnd"class = "textBox" style = "width : 100%; height : 100%;">
									</div>
								</li>
								<li class = "clearfix" style = "width : 100%; height : 6.25%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">주최기관</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<input type = "text" id="festivalAgency" class = "textBox" style = "width : 100%; height : 100%;">
									</div>
								</li>
								<li class = "clearfix" style = "width : 100%; height : 6.25%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">전화번호</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<input type = "text" id="festivalPhone" class = "textBox" style = "width : 100%; height : 100%;">
									</div>
								</li>
								<li class = "clearfix" style = "width : 100%; height : 6.25%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">홈페이지</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<input type = "text" id="festivalHomepage" class = "textBox" style = "width : 100%; height : 100%;">
									</div>
								</li>
								<li class = "clearfix" style = "width : 100%; height : 6.25%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">위도</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<input type = "text" id="festivalLatitude" class = "textBox" style = "width : 100%; height : 100%;">
									</div>
								</li>
								<li class = "clearfix" style = "width : 100%; height : 6.25%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">경도</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<input type = "text" id="festivalLongitude" class = "textBox" style = "width : 100%; height : 100%;">
									</div>
								</li>
							</ul>
						</form>
					</div>
				</div>
			</div>
			
			<div class = "floatDiv"></div>
	</div>
	
	
</body>
</html>
<%@ include file="../include/footer.jsp"%>