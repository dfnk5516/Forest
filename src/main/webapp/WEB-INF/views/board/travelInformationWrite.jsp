<%@ include file="../include/topcontent.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/auth.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${path}/resources/css/travelInformationWrite.css"/>

<title>For Rest : 휴양림 예약 사이트</title>
<script type="text/javascript">
	//console.log(sightsNameArray);
	var sightsArray;
	var festivalArray;
	var videoArray;
	var selectedLi;
	var selectedLiIndex;
	
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
				if(selectedLi != null)
				{
					$(selectedLi).removeClass("selectedLi");
					selectedLiIndex = null;
				}
				sightsArray = result;
				addList("sights");
				textBoxInit();
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
				if(selectedLi != null)
				{
					$(selectedLi).removeClass("selectedLi");
					selectedLiIndex = null;
				}
				festivalArray = result;
				addList("festival");
				textBoxInit();
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
				if(selectedLi != null)
				{
					$(selectedLi).removeClass("selectedLi");
					selectedLiIndex = null;
				}
				videoArray = result;
				addList("video");
				textBoxInit();
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
				str += "<li onclick = 'listItemSelect(" + i + ", this)' style = 'width : 100%;' class = 'clearfix listLi'>";
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
				str += "<li onclick = 'listItemSelect(" + i + ", this)' style = 'width : 100%;' class = 'clearfix listLi'>";
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
				str += "<li onclick = 'listItemSelect(" + i + ", this)' style = 'width : 100%;' class = 'clearfix listLi'>";
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
	
	function listItemSelect(index, selected)
	{
		if(selectedLi != null)
		{
			$(selectedLi).removeClass("selectedLi");
			selectedLiIndex = null;
		}
		selectedLi = selected;
		selectedLiIndex = index;
		$(selectedLi).addClass("selectedLi");
		
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
			document.getElementById("videoFrame").src = "http://www.youtube.com/embed/" + replaceStr(videoArray[index].videoSrc) + "?autoplay=1&version=3&loop=1&playlist=" + replaceStr(videoArray[index].videoSrc);
		}
	}
	
	function textBoxInit()
	{
		{
			$("#sightsName").val("");
			$("#sightsCity option:eq(0)").prop("selected", true);
			$("#sightsRegion").val("");
			$("#sightsDescription").val("");
			$("#sightsLocation").val("");
			$("#sightsHomepage").val("");
			$("#sightsLatitude").val("");
			$("#sightsLongitude").val("");
		}
		{
			$("#festivalName").val("");
			$("#festivalCity option:eq(0)").prop("selected", true);
			$("#festivalLocation").val("");
			$("#festivalAddress").val("");
			$("#festivalDescription").val("");
			$("#festivalStart").val("");
			$("#festivalEnd").val("");
			$("#festivalAgency").val("");
			$("#festivalPhone").val("");
			$("#festivalHomepage").val("");
			$("#festivalLatitude").val("");
			$("#festivalLongitude").val("");
		}
		{
			$("#videoName").val("");
			$("#videoSrc").val("");
			$("#videoLength").val("");
			document.getElementById("videoFrame").src = "";
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
					$("[name=writeType][value=sightsRadio]").click();
					textBoxInit();
				} ,
				error : function(err)
				{
					alert("오류발생cc : " + err);
				}
			})
		}
		else if($('input:radio[name=writeType]:checked').val()=="festivalRadio")
		{
			var datas = "${_csrf.parameterName}=${_csrf.token}";
			datas += "&&festivalName=" + encodeURIComponent($("#festivalName").val());
			datas += "&&city=" + encodeURIComponent($("#festivalCity option:selected").val());
			datas += "&&festivalLocation=" + encodeURIComponent($("#festivalLocation").val());
			datas += "&&festivalAddress=" + encodeURIComponent($("#festivalAddress").val());
			datas += "&&festivalDescription=" + encodeURIComponent($("#festivalDescription").val());
			datas += "&&festivalStart=" + encodeURIComponent($("#festivalStart").val());
			datas += "&&festivalEnd=" + encodeURIComponent($("#festivalEnd").val());
			datas += "&&festivalAgency=" + encodeURIComponent($("#festivalAgency").val());
			datas += "&&festivalPhone=" + encodeURIComponent($("#festivalPhone").val());
			datas += "&&festivalHomepage=" + encodeURIComponent($("#festivalHomepage").val());
			datas += "&&festivalLatitude=" + encodeURIComponent($("#festivalLatitude").val());
			datas += "&&festivalLongitude=" + encodeURIComponent($("#festivalLongitude").val());
			
			$.ajax(
			{
				url: "${path}/festivalInsert", //서버주소
				type :"post", //전송방식(get, post, put, delete)
				data : datas,
				dataType : "json", //서버가 보내오는 데이터타입(text,html,xml,json)
				success :function(result)
				{
					console.log(result);
					$("[name=writeType][value=festivalRadio]").click();
					textBoxInit();
				} ,
				error : function(err)
				{
					alert("오류발생 : " + err);
				}
			})
		}
		else if($('input:radio[name=writeType]:checked').val()=="videoRadio")
		{
			var datas = "${_csrf.parameterName}=${_csrf.token}";
			datas += "&&videoName=" + encodeURIComponent($("#videoName").val());
			datas += "&&videoSrc=" + encodeURIComponent($("#videoSrc").val());
			datas += "&&videoLength=" + encodeURIComponent($("#videoLength").val());
			
			$.ajax(
			{
				url: "${path}/videoInsert", //서버주소
				type :"post" , //전송방식(get, post, put, delete)
				data : datas,
				dataType : "json", //서버가 보내오는 데이터타입(text,html,xml,json)
				success :function(result)
				{
					console.log(result);
					$("[name=writeType][value=videoRadio]").click();
					textBoxInit();
				} ,
				error : function(err)
				{
					alert("오류발생 : " + err);
				}
			})
		}
	}
	
	function deleteList()
	{
		if($('input:radio[name=writeType]:checked').val()=="sightsRadio"&&selectedLiIndex!=null)
		{
			$.ajax(
			{
				url: "${path}/sightsDelete", //서버주소
				type :"post" , //전송방식(get, post, put, delete)
				data : "${_csrf.parameterName}=${_csrf.token}&&sightsName=" + encodeURIComponent(replaceStr(sightsArray[selectedLiIndex].sightsName)),
				dataType : "json", //서버가 보내오는 데이터타입(text,html,xml,json)
				success :function(result)
				{
					console.log(result);
					$("[name=writeType][value=sightsRadio]").click();
					textBoxInit();
				} ,
				error : function(err)
				{
					alert("오류발생cc : " + err);
				}
			})
		}
		else if($('input:radio[name=writeType]:checked').val()=="festivalRadio"&&selectedLiIndex!=null)
		{
			$.ajax(
			{
				url: "${path}/festivalDelete", //서버주소
				type :"post" , //전송방식(get, post, put, delete)
				data : "${_csrf.parameterName}=${_csrf.token}&&festivalName=" + encodeURIComponent(replaceStr(festivalArray[selectedLiIndex].festivalName)),
				dataType : "json", //서버가 보내오는 데이터타입(text,html,xml,json)
				success :function(result)
				{
					console.log(result);
					$("[name=writeType][value=festivalRadio]").click();
					textBoxInit();
				} ,
				error : function(err)
				{
					alert("오류발생cc : " + err);
				}
			})
		}
		else if($('input:radio[name=writeType]:checked').val()=="videoRadio"&&selectedLiIndex!=null)
		{
			$.ajax(
			{
				url: "${path}/videoDelete", //서버주소
				type :"post" , //전송방식(get, post, put, delete)
				data : "${_csrf.parameterName}=${_csrf.token}&&videoName=" + encodeURIComponent(replaceStr(videoArray[selectedLiIndex].videoName)),
				dataType : "json", //서버가 보내오는 데이터타입(text,html,xml,json)
				success :function(result)
				{
					console.log(result);
					$("[name=writeType][value=videoRadio]").click();
					textBoxInit();
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
			replacedStr = replacedStr.replace(/&#x27;/gi, '&quot;');
			replacedStr = replacedStr.replace(/&#x2F;/gi, '/');
			return replacedStr;
		}
		return null;
	}
	
	function makeRequest(q) {
        var request = gapi.client.youtube.search.list({
          q: q,
          part: 'snippet',
          maxResults: 3
        });

        request.execute(function(response) {
          $('#results').empty();
          var resultItems = response.result.items;
          $.each(resultItems, function(index, item) {
            vidTitle = item.snippet.title;
            vidThumburl =  item.snippet.thumbnails.default.url;
            vidThumbimg = '<pre><img id="thumb" src="'+vidThumburl+'" alt="No  Image Available." style="width:204px;height:128px"></pre>';
            $('#results').append('<pre>' + vidTitle + vidThumbimg +  '</pre>');
          });
        });
      }

      function init() {
        gapi.client.setApiKey('AIzaSyCMmyUg7rkL6cJrAvvXxpze8Vm0Vz1q8Js');
        gapi.client.load('youtube', 'v3', function() {
          data = jQuery.parseJSON( '{ "data": [{"name":"orsons"}] }' );
          $.each(data["data"], function(index, value) {
            makeRequest(value["name"]);
          });
        });
      }
//{"kind":"youtube#searchListResponse","etag":"\"8jEFfXBrqiSrcF6Ee7MQuz8XuAM/l8TeZ8660h0ZbJLCgcSUMv28FK4\"","nextPageToken":"CAUQAA","regionCode":"KR","pageInfo":{"totalResults":11580,"resultsPerPage":5},"items":[{"kind":"youtube#searchResult","etag":"\"8jEFfXBrqiSrcF6Ee7MQuz8XuAM/nKPCc2DS28ORkG_Cvga4w2ZAh1c\"","id":{"kind":"youtube#video","videoId":"JEJDcGmCbyE"},"snippet":{"publishedAt":"2015-02-26T04:16:30.000Z","channelId":"UCWJBLAsdmc044JYd8S4uc2g","title":"Davichi - Turtle (다비치-거북이) 가사/듣기/3699fa","description":"거북아 그 속도론 멀리 못 도망가 게다가 그길은 더 멀고 험하잖아 상처가 아물고 다 나으면 떠나가 진심이야 그럼 그 때 보내 줄 테니까 숨지마...","thumbnails":{"default":{"url":"https://i.ytimg.com/vi/JEJDcGmCbyE/default.jpg","width":120,"height":90},"medium":{"url":"https://i.ytimg.com/vi/JEJDcGmCbyE/mqdefault.jpg","width":320,"height":180},"high":{"url":"https://i.ytimg.com/vi/JEJDcGmCbyE/hqdefault.jpg","width":480,"height":360}},"channelTitle":"MINSANG","liveBroadcastContent":"none"}},{"kind":"youtube#searchResult","etag":"\"8jEFfXBrqiSrcF6Ee7MQuz8XuAM/oQh-lMKPEoE3X-888F5ExbqMN_I\"","id":{"kind":"youtube#video","videoId":"KuPY3DBtveg"},"snippet":{"publishedAt":"2013-05-01T16:23:47.000Z","channelId":"UCkYiXfJHw9m-SV2w719kPXA","title":"[HD] Davichi (다비치) - Turtle (거북이) @ KPop Collection in Seoul","description":"https://www.facebook.com/pages/The-CCM-World/424562547615124 https://twitter.com/TheCCMWorld.","thumbnails":{"default":{"url":"https://i.ytimg.com/vi/KuPY3DBtveg/default.jpg","width":120,"height":90},"medium":{"url":"https://i.ytimg.com/vi/KuPY3DBtveg/mqdefault.jpg","width":320,"height":180},"high":{"url":"https://i.ytimg.com/vi/KuPY3DBtveg/hqdefault.jpg","width":480,"height":360}},"channelTitle":"T-ara Fansub France","liveBroadcastContent":"none"}},{"kind":"youtube#searchResult","etag":"\"8jEFfXBrqiSrcF6Ee7MQuz8XuAM/L-bvE2O8Lx7yT6_6B0pJ6Cjrhqo\"","id":{"kind":"youtube#video","videoId":"mG59-VflY8M"},"snippet":{"publishedAt":"2013-03-29T02:19:10.000Z","channelId":"UCe52oeb7Xv_KaJsEzcKXJJg","title":"Davichi - Turtle, 다비치 - 거북이, Show champion 20130327","description":"Did you enjoy this video? Plz click \"like\"! ☞ For more awesome videos, subscribe our channels!! Daily update available! ☞ Click here for listening to other K-pop ...","thumbnails":{"default":{"url":"https://i.ytimg.com/vi/mG59-VflY8M/default.jpg","width":120,"height":90},"medium":{"url":"https://i.ytimg.com/vi/mG59-VflY8M/mqdefault.jpg","width":320,"height":180},"high":{"url":"https://i.ytimg.com/vi/mG59-VflY8M/hqdefault.jpg","width":480,"height":360}},"channelTitle":"MBCkpop","liveBroadcastContent":"none"}},{"kind":"youtube#searchResult","etag":"\"8jEFfXBrqiSrcF6Ee7MQuz8XuAM/rEeE0tQqRYJ6c1WH5l6fPrDh3ro\"","id":{"kind":"youtube#video","videoId":"ykAoxJCZG8w"},"snippet":{"publishedAt":"2013-03-04T03:02:01.000Z","channelId":"UCweOkPb1wVVH0Q0Tlj4a5Pw","title":"[MV] Davichi(다비치)_Turtle(거북이)","description":"[MV] Davichi(다비치)_Turtle(거북이) *English subtitles are now available. :D (Please click on 'CC' button or activate 'Interactive Transcript' function) ** :: iTunes ...","thumbnails":{"default":{"url":"https://i.ytimg.com/vi/ykAoxJCZG8w/default.jpg","width":120,"height":90},"medium":{"url":"https://i.ytimg.com/vi/ykAoxJCZG8w/mqdefault.jpg","width":320,"height":180},"high":{"url":"https://i.ytimg.com/vi/ykAoxJCZG8w/hqdefault.jpg","width":480,"height":360}},"channelTitle":"1theK (원더케이)","liveBroadcastContent":"none"}},{"kind":"youtube#searchResult","etag":"\"8jEFfXBrqiSrcF6Ee7MQuz8XuAM/-RFfAjSNJDg0YC4858B0VHEoJc8\"","id":{"kind":"youtube#video","videoId":"9yuCGsnsXqQ"},"snippet":{"publishedAt":"2018-05-14T09:03:58.000Z","channelId":"UCACsUruxumQoyZq08UB9RVw","title":"거북이","description":"Provided to YouTube by Interpark Corp 거북이 · 다비치 MYSTIC BALLAD Part.1 ℗ 2018 Interpark Released on: 2013-03-04 Auto-generated by YouTube.","thumbnails":{"default":{"url":"https://i.ytimg.com/vi/9yuCGsnsXqQ/default.jpg","width":120,"height":90},"medium":{"url":"https://i.ytimg.com/vi/9yuCGsnsXqQ/mqdefault.jpg","width":320,"height":180},"high":{"url":"https://i.ytimg.com/vi/9yuCGsnsXqQ/hqdefault.jpg","width":480,"height":360}},"channelTitle":"Davichi - Topic","liveBroadcastContent":"none"}}]}
//"videoId":"
//JEJDcGmCbyE
//KuPY3DBtveg
//mG59-VflY8M
//ykAoxJCZG8w
//9yuCGsnsXqQ
</script>
</head>
<body id = "ContentBody" onload = "sightsListInit()">
	<!-- Main -->
	<div id="main" class="wrapper style2 clearfix">
		<div class = "floatDiv"></div>
			
		<div class = "floatDiv" style = "width : 100%;  height : 900px"><!-- main 바로 밑 div 중 가장 큰 영역의 세로높이가 곧 main의 세로길이 + padding 길이가 됨 -->
			<div id = "headerDiv" class = "clearfix" style = "width : 100%; height : 10%">
				<div id = "checkBoxDiv" class = "floatDiv" style = "width : 50%; height : 100%">
					<label class = "radioLable">
						<input type="radio" name="writeType" value="sightsRadio" checked="checked" >
						관광지<span class = "aa"></span>
					</label>
					<label class = "radioLable">
						<input type="radio" name="writeType" value="festivalRadio" >
						행사<span class = "aa"></span>
					</label>
					<label class = "radioLable">
						<input type="radio" name="writeType" value="videoRadio" >
						영상<span class = "aa"></span>
					</label>
				</div>
				<div id = "formHeaderTitleDiv" class = "floatDiv" style = "width : 40%; height : 100%;">광광머시기</div>
				<div id = "formHeaderButtonsDiv" class = "floatDiv" style = "width : 10%; height : 100%;">
					<input type = "button" value = "등록" class = "formButton" onclick="insert()" style = "width : 100%; height : 33.3%">
					<input type = "button" value = "수정" class = "formButton" style = "width : 100%; height : 33.3%">
					<input type = "button" value = "삭제" class = "formButton" onclick ="deleteList()" style = "width : 100%; height : 33.3%">
				</div>
			</div>
			<div id = "contentDiv" class = "clearfix" style = "width : 100%; height : 60%; overflow : hidden;">
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
								<div class = "floatDiv" style = "width : 20%; height : 100%">영상</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<iframe id = "videoFrame" style = "width : 100%; height : 100%" src="" ></iframe>
								</div>
							</li>
						</ul>
					</form>
				</div>
			</div>
			<div id = "videoSearchDiv" style = "width : 100%; height : 30%;">
				<div id="buttons">
      				<label> <input id="query" value='cats' type="text"/><button id="search-button" onclick="search()">Search</button></label>
    			</div>
   				<div id="search-container"></div>
   				
   			
			</div>
		</div>
		<div class = "floatDiv"></div>
	</div>
	
    <script src="${path}/resources/js/search.js"></script>
    <script type="text/javascript" src="https://apis.google.com/js/client.js?onload=init"></script>
</body>
</html>
<%@ include file="../include/footer.jsp"%>