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
	//console.log(sightsNameArray);
	var sightsArray;
	var festivalArray;
	var videoArray;
	var selectedIndex;
	
	function sightsListInit()
	{
		$("[name=writeType]").click();
	}
	
	function sightsSelect()
	{
		$.ajax({
			url: "${path}/sightsSelect", //서버주소
			type :"post" , //전송방식(get, post, put, delete)
			data : "${_csrf.parameterName}=${_csrf.token}",
			dataType : "json", //서버가 보내오는 데이터타입(text,html,xml,json)
			success :function(result)
			{
				sightsArray = result;
				addList("sights");
			} ,
			error : function(err)
			{
				alert("오류발생cc : " + err);
			}
		})
	}
	
	function festivalSelect(){
		$.ajax({
			url: "${path}/festivalSelect", //서버주소
			type :"post" , //전송방식(get, post, put, delete)
			data : "${_csrf.parameterName}=${_csrf.token}",
			dataType : "json", //서버가 보내오는 데이터타입(text,html,xml,json)
			success :function(result)
			{
				festivalArray = result;
				addList("festival");
			},
			error : function(err)
			{
				alert("오류발생 : " + err);
			}
		})
	}
	
	function videoSelect()
	{
		$.ajax(
		{
			url: "${path}/videoSelect", //서버주소
			type :"post" , //전송방식(get, post, put, delete)
			data : "${_csrf.parameterName}=${_csrf.token}",
			dataType : "json", //서버가 보내오는 데이터타입(text,html,xml,json)
			success :function(result)
			{
				videoArray = result;
				addList("video");
			},
			error : function(err)
			{
				alert("오류발생 : " + err);
			}
		})
	}
	
	function addList(data)
	{
		var str = "<li id = 'ColumnL' style = 'width : 100%;' class = 'clearfix listLi'>";


		if(data == "sights")
		{
			str += "<div style = 'width : 30%; height : 67.46px; overflow : hidden;' class = 'floatDiv'>순번</div>";
			str += "<div style = 'width : 70%; height : 67.46px; overflow : hidden;' class = 'floatDiv'>관광지명</div></li>";
				
			for(var i = 0; i < sightsArray.length; ++i)
			{
				str += "<li onclick = 'listItemSelect(" + i + ")' style = 'width : 100%;' class = 'clearfix listLi'>";
				str += "<div style = 'width : 30%; height : 33.73px; overflow : hidden;' class = 'floatDiv'>" + (i + 1) + "</div>";
				str += "<div style = 'width : 70%; height : 33.73px; overflow : hidden;' class = 'floatDiv'>" + sightsArray[i].sightsName + "</div></li>";
			}
			document.getElementById("listUl").innerHTML = str;
		}
		else if (data == "festival")
		{
			str += "<div style = 'width : 30%; height : 72px; overflow : hidden;' class = 'floatDiv'>순번</div>";
			str += "<div style = 'width : 70%; overflow : hidden;' class = 'floatDiv'>행사명</div></li>";
				
			for(var i = 0; i < festivalArray.length; ++i)
			{
				str += "<li onclick = 'listItemSelect(" + i + ")' style = 'width : 100%;' class = 'clearfix listLi'>";
				str += "<div style = 'width : 30%; height : 36px; overflow : hidden;' class = 'floatDiv'>" + (i + 1) + "</div>";
				str += "<div style = 'width : 70%; overflow : hidden;' class = 'floatDiv'>" + festivalArray[i].festivalName + "</div></li>";
			}
			document.getElementById("listUl").innerHTML = str;
		}
		else if (data == "video")
		{
			str += "<div style = 'width : 30%; height : 72px; overflow : hidden;' class = 'floatDiv'>순번</div>";
			str += "<div style = 'width : 70%; overflow : hidden;' class = 'floatDiv'>영상명</div></li>";
				
			for(var i = 0; i < videoArray.length; ++i)
			{
				str += "<li onclick = 'listItemSelect(" + i + ")' style = 'width : 100%;' class = 'clearfix listLi'>";
				str += "<div style = 'width : 30%; height : 36px; overflow : hidden;' class = 'floatDiv'>" + (i + 1) + "</div>";
				str += "<div style = 'width : 70%; overflow : hidden;' class = 'floatDiv'>" + videoArray[i].videoName + "</div></li>";
			}
			document.getElementById("listUl").innerHTML = str;
		}
		
		$('input[name="writeType"]').each(function()
		{
			$(this).prop('disabled', false);
		});
	}
	
	function listItemSelect(index)
	{
		
		
		if($('input:radio[name=writeType]:checked').val() == "sightsRadio")
		{
			$("#sightsName").val(replaceStr(sightsArray[index].sightsName));
			$("#sightsCity").val(sightsArray[index].city);
			$("#sightsRegion").val(replaceStr(sightsArray[index].sightsRegion));
			$("#sightsDescription").val(replaceStr(sightsArray[index].sightsDescription));
			$("#sightsLocation").val(replaceStr(sightsArray[index].sightsLocation));
			$("#sightsHomepage").val(replaceStr(sightsArray[index].sightsHomepage));
			$("#sightsLatitude").val(replaceStr(sightsArray[index].sightsLatitude));
			$("#sightsLongitude").val(replaceStr(sightsArray[index].sightsLongitude));
		}
		else if($('input:radio[name=writeType]:checked').val() == "festivalRadio")
		{
			$("#festivalName").val(replaceStr(festivalArray[index].festivalName));
			$("#festivalCity").val(festivalArray[index].city);
			$("#festivalLocation").val(replaceStr(festivalArray[index].festivalLocation));
			$("#festivalAddress").val(replaceStr(festivalArray[index].festivalAddress));
			$("#festivalDescription").val(replaceStr(festivalArray[index].festivalDescription));
			$("#festivalStart").val(replaceStr(festivalArray[index].festivalStart));
			$("#festivalEnd").val(replaceStr(festivalArray[index].festivalEnd));
			$("#festivalAgency").val(replaceStr(festivalArray[index].festivalAgency));
			$("#festivalPhone").val(replaceStr(festivalArray[index].festivalPhone));
			$("#festivalHomepage").val(replaceStr(festivalArray[index].festivalHomepage));
			$("#festivalLatitude").val(replaceStr(festivalArray[index].festivalLatitude));
			$("#festivalLongitude").val(replaceStr(festivalArray[index].festivalLongitude));
		}
		else if($('input:radio[name=writeType]:checked').val() == "videoRadio")
		{
			$("#videoName").val(replaceStr(videoArray[index].videoName));
			$("#videoSrc").val(replaceStr(videoArray[index].videoSrc));
			$("#videoLength").val(replaceStr(videoArray[index].videoLength));
			document.getElementById("videoFrame").src = "https://www.youtube.com/embed/" + replaceStr(videoArray[index].videoSrc) + "?autoplay=1&loop=1&rel=0&controls=1";
			//$("#videoFrame").src(replaceStr(videoArray[index].videoSrc));
		}
	}
	
	$(function()
	{
		$("#festivalForm").hide();
		$("#videoForm").hide();
		
		$("[name=writeType]").click(function()    
		{
			$('input[name="writeType"]').each(function()
			{
			    $(this).prop('disabled', true);
			});
			
			if($('input:radio[name=writeType]:checked').val() == "sightsRadio")
			{
				$("#festivalForm").hide();
				$("#videoForm").hide();
				$("#sightsForm").show();
				
				document.getElementById("listUl").innerHTML = "로드중..";
				sightsSelect();
			}
			else if($('input:radio[name=writeType]:checked').val() == "festivalRadio")
			{
				$("#sightsForm").hide();
				$("#videoForm").hide();
				$("#festivalForm").show();
				
				document.getElementById("listUl").innerHTML = "로드중..";
				festivalSelect();
			}
			else if($('input:radio[name=writeType]:checked').val() == "videoRadio")
			{
				$("#sightsForm").hide();
				$("#festivalForm").hide();
				$("#videoForm").show();
				
				document.getElementById("listUl").innerHTML = "로드중..";
				videoSelect();
			}
		})
	});
	
	function insert()
	{
		if($('input:radio[name=writeType]:checked').val()=="sightsRadio")
		{
			var datas = "${_csrf.parameterName}=${_csrf.token}";
			datas += "&&sightsName=" + encodeURIComponent($("#sightsName").val());
			datas += "&&city=" + encodeURIComponent($("#sightsCity option:selected").val());
			datas += "&&sightsRegion=" + encodeURIComponent($("#sightsRegion").val());
			datas += "&&sightsDescription=" + encodeURIComponent($("#sightsDescription").val());
			datas += "&&sightsLocation=" + encodeURIComponent($("#sightsLocation").val());
			datas += "&&sightsHomepage=" + encodeURIComponent($("#sightsHomepage").val());
			datas += "&&sightsLatitude=" + encodeURIComponent($("#sightsLatitude").val());
			datas += "&&sightsLongitude=" + encodeURIComponent($("#sightsLongitude").val());
			
			$.ajax(
			{
				url: "${path}/sightsInsert", //서버주소
				type :"post" , //전송방식(get, post, put, delete)
				data : datas,
				dataType : "json", //서버가 보내오는 데이터타입(text,html,xml,json)
				success :function(result)
				{
					console.log(result);
					$("[name=writeType]").click();
				} ,
				error : function(err)
				{
					alert("오류발생cc : " + err);
				}
			})
		}
	}
	
	function replaceStr(string)
	{
		if(string != null)
		{
			var replacedStr;
			replacedStr = string.replace(/&amp;/gi, '&');
			replacedStr = replacedStr.replace(/&lt;/gi, '<');
			replacedStr = replacedStr.replace(/&gt;/gi, '>');
			replacedStr = replacedStr.replace(/$1&quot;/gi, '((?<!\\\\)(\\\\\\\\)*)(\\\\\\\")');
			replacedStr = replacedStr.replace(/&#x27;/gi, '`');
			replacedStr = replacedStr.replace(/&#x2F;/gi, '/');
			return replacedStr;
		}
		return null;
	}
	
</script>
</head>
<body id = "ContentBody" onload = "sightsListInit()">
	<!-- Main -->
	<div id="main" class="wrapper style2 clearfix">

			<div class = "floatDiv"></div>
			
			<div class = "floatDiv" style = "width : 100%;  height : 900px"><!-- main 바로 밑 div 중 가장 큰 영역의 세로높이가 곧 main의 세로길이 + padding 길이가 됨 -->
				<div id = "headerDiv" class = "clearfix" style = "width : 100%; height : 10%">
					<div id = "checkBoxDiv" class = "floatDiv" style = "width : 50%; height : 100%">
						<input type="radio" name="writeType" id="write1" value="sightsRadio" checked="checked" >관광지
						<input type="radio" name="writeType" id="write2" value="festivalRadio" >행사
						<input type="radio" name="writeType" id="write3" value="videoRadio" >영상
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
						<form id = "sightsForm" method = "post" action = "${path}/sightsInsert" style = "height : 100%">
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
							<ul id = "sightsTableUl" style = "width : 100%; height : 100%">
								<li class = "clearfix" style = "width : 100%; height : 8.33%;">
									<div id = "sightsNameDiv" class = "floatDiv" style = "width : 20%; height : 100%">관광지명</div>
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
						
						<form id = "festivalForm" method = "post" action = "" style = "height : 100%">
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
										<select id="festivalCity" class = "textBox" style = "width : 100%; height : 100%;">
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
						
						<form id = "videoForm" method = "post" action = "" style = "height : 100%">
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
							<ul id = "videoTableUl" style = "width : 100%; height : 100%">
								<li class = "clearfix" style = "width : 100%; height : 15%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">이름</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<input type = "text" id="videoName" class = "textBox" style = "width : 100%; height : 100%;">
									</div>
								</li>
								<li class = "clearfix" style = "width : 100%; height : 15%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">경로</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<input type = "text" id="videoSrc" class = "textBox" style = "width : 100%; height : 100%;">
									</div>
								</li>
								<li class = "clearfix" style = "width : 100%; height : 15%;">
									<div class = "floatDiv" style = "width : 20%; height : 100%">길이</div>
									<div class = "floatDiv" style = "width : 80%; height : 100%">
										<input type = "text" id="videoLength" class = "textBox" style = "width : 100%; height : 100%;">
									</div>
								</li>
								<li style = "width : 100%; height : 55%;">
									<div class = "floatDiv" style = "width : 100%; height : 100%">
									<iframe id = "videoFrame" style = "width : 100%; height : 100%" src="" ></iframe>
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