<%@ include file="../include/topcontent.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${path}/resources/css/travelInformationWrite.css"/>

<title>For Rest : 휴양림 예약 사이트</title>
<script type="text/javascript">
	var sightsArray;
	var festivalArray;
	var videoArray;
	var searchVideoArray;
	
	var selectedLi;
	var selectedLiIndex;
	
	var videoSelectedLi;
	var videoSelectedLiIndex;
	var videoMoveCheck = false;
	var apiKey = "AIzaSyCYGcvsL6xaJ56KYG04pxBQ00xlP5PRM_4";
	
	function sightsListInit()
	{
		$("[name=writeType]").click();
	}
	
	function sightsSelect()
	{
		$.ajax(
		{
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
				$('input[name="writeType"]').each(function()
				{
					$(this).prop('disabled', false);
					$("#searchVideoInputBtn").prop('disabled', false);
				});
			}
		})
	}
	
	function festivalSelect(){
		$.ajax(
		{
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
				$('input[name="writeType"]').each(function()
				{
					$(this).prop('disabled', false);
					$("#searchVideoInputBtn").prop('disabled', false);
				});
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
				
				if(videoMoveCheck)
				{
					if(videoSelectedLi != null)
					{
						$("#videoName").val($("#searchVideoName").val());
						$("#videoSrc").val($("#searchVideoSrc").val());
						document.getElementById("videoFrame").src = "http://www.youtube.com/embed/" + $("#searchVideoSrc").val() + "?autoplay=0&version=3&loop=1&playlist=" + $("#searchVideoSrc").val();
					}
					videoMoveCheck = false;
				}
			},
			error : function(err)
			{
				if(videoMoveCheck)
				{
					videoMoveCheck = false;
				}
				alert("오류발생 : " + err);
				$('input[name="writeType"]').each(function()
				{
					$(this).prop('disabled', false);
					$("#searchVideoInputBtn").prop('disabled', false);
				});
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
			$("#searchVideoInputBtn").prop('disabled', false);
		});
	}
	
	function listItemSelect(index, list)
	{
		if(selectedLi != null)
		{
			$(selectedLi).removeClass("selectedLi");
		}
		selectedLi = list;
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
				$("#searchVideoInputBtn").prop('disabled', true);
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
	
	function update(){
		if($('input:radio[name=writeType]:checked').val()=="sightsRadio"&&selectedLiIndex!=null)
		{
			var datas = "${_csrf.parameterName}=${_csrf.token}";
			datas += "&&selectedSightsName=" + encodeURIComponent(replaceStr(sightsArray[selectedLiIndex].sightsName));
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
				url: "${path}/sightsUpdate", //서버주소
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
		else if($('input:radio[name=writeType]:checked').val()=="festivalRadio"&&selectedLiIndex!=null)
		{
			var datas = "${_csrf.parameterName}=${_csrf.token}";
			datas += "&&selectedFestivalName=" + encodeURIComponent(replaceStr(festivalArray[selectedLiIndex].festivalName));
			datas += "&&festivalName=" + encodeURIComponent($("#festivalName").val());
			datas += "&&city=" + encodeURIComponent($("#festivalCity option:selected").val());
			datas += "&&festivalLocation=" + encodeURIComponent($("#festivalLocation").val());
			datas += "&&festivalAddress=" + encodeURIComponent($("#festivalAddress").val());
			datas += "&&festivalDescription=" + encodeURIComponent($("#festivalDescription").val());
			datas += "&&festivalStart=" + encodeURIComponent($("#festivalStart").val());
			datas += "&&festivalEnd=" + encodeURIComponent($("#festivalEnd").val());
			datas += "&&festivalPhone=" + encodeURIComponent($("#festivalPhone").val());
			datas += "&&festivalAgency=" + encodeURIComponent($("#festivalAgency").val());
			datas += "&&festivalHomepage=" + encodeURIComponent($("#festivalHomepage").val());
			datas += "&&festivalLatitude=" + encodeURIComponent($("#festivalLatitude").val());
			datas += "&&festivalLongitude=" + encodeURIComponent($("#festivalLongitude").val());
			
			$.ajax(
			{
				url: "${path}/festivalUpdate", //서버주소
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
					alert("오류발생cc : " + err);
				}
			})
		}
		else if($('input:radio[name=writeType]:checked').val()=="videoRadio"&&selectedLiIndex!=null)
		{
			var datas = "${_csrf.parameterName}=${_csrf.token}";
			datas += "&&selectedVideoName=" + encodeURIComponent(replaceStr(videoArray[selectedLiIndex].videoName));
			datas += "&&videoName=" + encodeURIComponent($("#videoName").val());
			datas += "&&videoSrc=" + encodeURIComponent($("#videoSrc").val());
	
			$.ajax(
			{
				url: "${path}/videoUpdate", //서버주소
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
					alert("오류발생cc : " + err);
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
			replacedStr = replacedStr.replace(/&#39;/gi, "'");
			//replacedStr = replacedStr.replace(/$1&quot;/gi, '((?<!\\\\)(\\\\\\\\)*)(\\\\\\\")');
			replacedStr = replacedStr.replace(/&#x27;/gi, "'");
			replacedStr = replacedStr.replace(/&#x2F;/gi, '/');
			return replacedStr;
		}
		return null;
	}

	function init()
	{
		//gapi.client.setApiKey('AIzaSyCMmyUg7rkL6cJrAvvXxpze8Vm0Vz1q8Js');
		gapi.client.setApiKey('AIzaSyCYGcvsL6xaJ56KYG04pxBQ00xlP5PRM_4');
		gapi.client.load('youtube', 'v3', function() {});
	}
	function search()
	{
		var q = $('#searchTextBox').val();
		var request = gapi.client.youtube.search.list(
		{
			part: 'snippet',
			type : 'video',
			q: q,
			maxResults : 50,
			order : 'viewCount'
		});

		request.execute(function(response)
		{
			document.getElementById("searchVideoUl").innerHTML = "검색중..";
			var results = response.result;
			var str = "";
			searchVideoArray = new Array();
			$.each(results.items, function(index, item)
			{				
				videoMap = new Map();
				videoMap.set('videoName', item.snippet.title);
				videoMap.set('videoSrc', item.id.videoId);
				searchVideoArray.push(videoMap);
				
				str += "<li onclick = 'videoListItemSelect(" + index + ", this)' style = 'width : 100%; height : auto;' class = 'clearfix listLi'>";
				str += "<div style = 'width : 30%; height : 100%; overflow : hidden;' class = 'floatDiv'>";
				str += "<img style = 'width : 100%; height : 100%;' src = '" + item.snippet.thumbnails.high.url +"'/></div>";
				str += "<div style = 'width : 70%; height : 100%' class = 'floatDiv'>";
				str += "<div style = 'width : 100%; height : 20%; overflow : hidden;'>" + item.snippet.title + "</div>";
				str += "<div style = 'width : 100%; height : 80%; overflow : hidden;'>" + item.snippet.description + "</div></div></li>";
			})
			document.getElementById("searchVideoUl").innerHTML = str;
		});
		alert("검색 완료");
		return false;
	}
	
	function videoListItemSelect(index, list)
	{
		if(videoSelectedLi != null)
		{
			$(videoSelectedLi).removeClass("selectedLi");
		}
		videoSelectedLi = list;
		videoSelectedLiIndex = index;
		$(videoSelectedLi).addClass("selectedLi");
		
		$("#searchVideoName").val(replaceStr(searchVideoArray[index].get('videoName')));
		$("#searchVideoSrc").val(searchVideoArray[index].get('videoSrc'));
		document.getElementById("searchVideoFrame").src = "http://www.youtube.com/embed/" + searchVideoArray[index].get('videoSrc') + "?autoplay=1&version=3&loop=1&playlist=" + searchVideoArray[index].get('videoSrc');
	}
	function moveVideoInformation()
	{		
		if($('input:radio[name=writeType]:checked').val()!="videoRadio" && videoMoveCheck == false)
		{
			videoMoveCheck = true;
			$("[name=writeType][value=videoRadio]").click();
		}
		else if($("#searchVideoName").val() != "" && $("#searchVideoSrc").val() != "")
		{
			$("#videoName").val($("#searchVideoName").val());
			$("#videoSrc").val($("#searchVideoSrc").val());
			document.getElementById("videoFrame").src = "http://www.youtube.com/embed/" + $("#searchVideoSrc").val() + "?autoplay=0&version=3&loop=1&playlist=" + $("#searchVideoSrc").val();
		}
	}

</script>
</head>
<body id = "ContentBody" onload = "sightsListInit()">
	<!-- Main -->
	<div id="main" class="wrapper style2 clearfix" style = "width : 100%">
		<div class = "floatDiv"></div>
			
		<div id = "tableDiv" class = "floatDiv" style = "width : 100%;  height : 1652px"><!-- main 바로 밑 div 중 가장 큰 영역의 세로높이가 곧 main의 세로길이 + padding 길이가 됨 -->
			<div id = "headerDiv" class = "clearfix" style = "width : 100%; height : 5%">
				<div id = "checkBoxDiv" class = "floatDiv" style = "width : 50%; height : 100%">
					<label class = "radioLable">
						<input type="radio" name="writeType" class = "medium" value="sightsRadio" checked="checked" >
						관광지<span class = "aa"></span>
					</label>
					<label class = "radioLable">
						<input type="radio" name="writeType" class = "medium" value="festivalRadio" >
						행사<span class = "aa"></span>
					</label>
					<label class = "radioLable">
						<input type="radio" name="writeType" class = "medium" value="videoRadio" >
						영상<span class = "aa"></span>
					</label>
				</div>
				<div id = "formHeaderTitleDiv" class = "floatDiv" style = "width : 40%; height : 100%;">광광머시기</div>
				<div id = "formHeaderButtonsDiv" class = "floatDiv" style = "width : 10%; height : 100%;">
					<input type = "button" value = "등록" class = "formButton" onclick="insert()" style = "width : 100%; height : 33.3%">
					<input type = "button" value = "수정" class = "formButton" onclick="update()" style = "width : 100%; height : 33.3%">
					<input type = "button" value = "삭제" class = "formButton" onclick ="deleteList()" style = "width : 100%; height : 33.3%; border-bottom : 3px solid #1E1E1E;">
				</div>
			</div>
			<div id = "contentDiv" class = "clearfix" style = "width : 100%; height : 42.5%; overflow : hidden;">
				<div id = "listDiv" class = "floatDiv" style = "width : 50%; height :100%; overflow : auto;">
					<ul id = "listUl" style = "width : 100%; height : auto;"></ul>
				</div>
				<div id = "formContainerDiv" class = "floatDiv" style = "width : 50%; height : 100%;">
					<form id = "sightsForm" method = "post" action = "${path}/sightsInsert" style = "height : 100%">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<ul id = "sightsTableUl" style = "width : 100%; height : 100%">
							<li class = "clearfix" style = "width : 100%; height : 8.33%;">
								<div id = "sightsNameDiv" class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">관광지명</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<input type = "text" id="sightsName" class = "textBox" style = "width : 100%; height : 100%;">
								</div>
							</li>
							<li class = "clearfix" style = "width : 100%; height : 8.33%;">
								<div class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">시/도</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<select id="sightsCity" class = "textBox" style = "width : 100%; height : 100%;">
										<c:forEach items="${cityList}" var="city">
											<option value = "${city}">${city}</option>
										</c:forEach>
									</select>
								</div>
							</li>
							<li class = "clearfix" style = "width : 100%; height : 8.33%;">
								<div class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">지역</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<input type = "text" id= "sightsRegion" class = "textBox" style = "width : 100%; height : 100%;">
								</div>
							</li>
							<li class = "clearfix" style = "width : 100%; height : 41.65%;">
								<div class = "floatDiv" style = "width : 20%; height : 100%;">설명</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<textarea id="sightsDescription" class = "textBox" style = "width : 100%; height : 100%; resize : none;"></textarea>
								</div>
							</li>
							<li class = "clearfix" style = "width : 100%; height : 8.33%;">
								<div class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">위치</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<input type = "text" id="sightsLocation" class = "textBox" style = "width : 100%; height : 100%;">
								</div>
							</li>
							<li class = "clearfix" style = "width : 100%; height : 8.33%;">
								<div class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">홈페이지</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<input type = "text" id="sightsHomepage" class = "textBox" style = "width : 100%; height : 100%;">
								</div>
							</li>
							<li class = "clearfix" style = "width : 100%; height : 8.33%;">
								<div class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">위도</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<input type = "text" id="sightsLatitude" class = "textBox" style = "width : 100%; height : 100%;">
								</div>
							</li>
							<li class = "clearfix" style = "width : 100%; height : 8.33%;">
								<div class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">경도</div>
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
								<div class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">이름</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<input type = "text" id="festivalName" class = "textBox" style = "width : 100%; height : 100%;">
								</div>
							</li>
							<li class = "clearfix" style = "width : 100%; height : 6.25%;">
								<div class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">시/도</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<select id="festivalCity" class = "textBox" style = "width : 100%; height : 100%;">
										<c:forEach items="${cityList}" var="city">
											<option>${city}</option>
										</c:forEach>
									</select>
									</div>
							</li>
							<li class = "clearfix" style = "width : 100%; height : 6.25%;">
								<div class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">지역</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<input type = "text" id="festivalLocation" class = "textBox" style = "width : 100%; height : 100%;">
								</div>
							</li>
							<li class = "clearfix" style = "width : 100%; height : 6.25%;">
								<div class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">주소</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<input type = "text" id="festivalAddress" class = "textBox" style = "width : 100%; height : 100%;">
								</div>
							</li>
							<li class = "clearfix" style = "width : 100%; height : 31.25%;">
								<div class = "floatDiv" style = "width : 20%; height : 100%;">설명</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<textarea id="festivalDescription" class = "textBox" style = "width : 100%; height : 100%; resize : none;"></textarea>
								</div>
							</li>
							<li class = "clearfix" style = "width : 100%; height : 6.25%;">
								<div class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">시작일</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<input type = "text" id="festivalStart" class ="textBox" style = "width : 100%; height : 100%;">
								</div>
							</li>
							<li class = "clearfix" style = "width : 100%; height : 6.25%;">
								<div class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">종료일</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<input type = "text" id="festivalEnd"class = "textBox" style = "width : 100%; height : 100%;">
								</div>
							</li>
							<li class = "clearfix" style = "width : 100%; height : 6.25%;">
								<div class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">주최기관</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<input type = "text" id="festivalAgency" class = "textBox" style = "width : 100%; height : 100%;">
								</div>
							</li>
							<li class = "clearfix" style = "width : 100%; height : 6.25%;">
								<div class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">전화번호</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<input type = "text" id="festivalPhone" class = "textBox" style = "width : 100%; height : 100%;">
								</div>
							</li>
							<li class = "clearfix" style = "width : 100%; height : 6.25%;">
								<div class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">홈페이지</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<input type = "text" id="festivalHomepage" class = "textBox" style = "width : 100%; height : 100%;">
								</div>
							</li>
							<li class = "clearfix" style = "width : 100%; height : 6.25%;">
								<div class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">위도</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<input type = "text" id="festivalLatitude" class = "textBox" style = "width : 100%; height : 100%;">
								</div>
							</li>
							<li class = "clearfix" style = "width : 100%; height : 6.25%;">
								<div class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">경도</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<input type = "text" id="festivalLongitude" class = "textBox" style = "width : 100%; height : 100%;">
								</div>
							</li>
						</ul>
					</form>
						
					<form id = "videoForm" method = "post" action = "" style = "height : 100%">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<ul id = "videoTableUl" style = "width : 100%; height : 100%">
							<li class = "clearfix" style = "width : 100%; height : 20%;">
								<div class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">이름</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<input type = "text" id="videoName" class = "textBox" style = "width : 100%; height : 100%;">
								</div>
							</li>
							<li class = "clearfix" style = "width : 100%; height : 20%;">
								<div class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">영상 경로</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<input type = "text" id="videoSrc" class = "textBox" style = "width : 100%; height : 100%;">
								</div>
							</li>
							<li style = "width : 100%; height : 60%;">
								<div class = "floatDiv" style = "width : 20%; height : 98%; padding : 2% 0;">영상</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<iframe id = "videoFrame" style = "width : 100%; height : 100%" src="" ></iframe>
								</div>
							</li>
						</ul>
					</form>
				</div>
			</div>
			<!-- div id="buttons">
      				<label> <input id="query" value='cats' type="text"/><button id="search-button" onclick="search()">Search</button></label>
    			</div>
   				<div id="search-container"></div-->
   			<div id = "" style = "width : 100%; height : 5%"></div>  			
   			<div id = "" class = "clearfix" style = "width : 100%; height : 5%">
				<div id = "" class = "floatDiv" style = "width : 50%; height : 100%">
					<div style = "width : 30%; height : 100%; margin-right : 2%" class = "floatDiv">
						<img style = "width :  100%; height : 100%;" src = "${path}/resources/images/travelInformation/youtubeLogo.png">
					</div>
					<div style = "width : 68%; height : 100%" class = "floatDiv">
						<form style = "width : 100%; height : 100%" action="#" onSubmit="return search()">
							<div id = "search-box-wrapper" style = "width : 100%; height : 100%">
								<input type = "text" id = "searchTextBox" style = "width : 100%; height : 100%" class = "search-box-input" placeholder = "영상 이름 입력"/>
								<button id = "search-box-button" style = "height : 100%">&#128269;</button>
							</div>
						</form>
					</div>
				</div>
				<div id = "" class = "floatDiv" style = "width : 40%; height : 100%;">영상 정보</div>
				<div id = "" class = "floatDiv" style = "width : 10%; height : 100%;">
					<input type = "button" id = "searchVideoInputBtn" value = "정보 입력" class = "formButton" onclick = "moveVideoInformation()" style = "width : 100%; height : 100%; border-bottom : 3px solid #1E1E1E;"/>
				</div>
			</div>
			<div id = "" class = "clearfix" style = "width : 100%; height : 42.5%; overflow : hidden;">
				<div id = "" class = "floatDiv" style = "width : 50%; height :100%; overflow : auto;">
					<ul id = "searchVideoUl" style = "width : 100%; height : auto;"></ul>
				</div>
				<div id = "" class = "floatDiv" style = "width : 50%; height : 100%;">
					<form id = "" method = "post" action = "" style = "height : 100%">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<ul id = "" style = "width : 100%; height : 100%">
							<li class = "clearfix" style = "width : 100%; height : 20%;">
								<div class = "floatDiv" style = "width : 20%; height : 100%">이름</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<input type = "text" id="searchVideoName" class = "textBox" style = "width : 100%; height : 100%;" readonly>
								</div>
							</li>
							<li class = "clearfix" style = "width : 100%; height : 20%;">
								<div class = "floatDiv" style = "width : 20%; height : 100%">경로</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<input type = "text" id="searchVideoSrc" class = "textBox" style = "width : 100%; height : 100%;" readonly>
								</div>
							</li>
							<li style = "width : 100%; height : 60%;">
								<div class = "floatDiv" style = "width : 20%; height : 100%">영상</div>
								<div class = "floatDiv" style = "width : 80%; height : 100%">
									<iframe id = "searchVideoFrame" style = "width : 100%; height : 100%" src="" ></iframe>
								</div>
							</li>
						</ul>
					</form>
				</div>
			</div>	
  
		</div>
		<div class = "floatDiv"></div>
	</div>
    <script type="text/javascript" src="https://apis.google.com/js/client.js?onload=init"></script>
</body>
</html>
<%@ include file="../include/footer.jsp"%>