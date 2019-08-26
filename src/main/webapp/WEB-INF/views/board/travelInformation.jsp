<%@ include file="../include/topcontent.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=45666bcb826210a72dbea20e833f5168&libraries=services,clusterer,drawing"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${path}/resources/css/travelInformation.css"/>
<script type="text/javascript">
	var currentScroll;
	var maxScroll;
	
	var suggestArray;
	
	var forestArray = JSON.parse('${forestArray}');
	var sightsArray;
	var festivalArray;
	var videoArray = JSON.parse('${videoArray}');
	var videoMax = videoArray.length;
	var currentVideo;
	var playIcon = "♪"
	var nonPlayIcon = "　"
	var videoListOnOffCheck = false;
	
	var delta = 300;
	var timer1 = null;
	var sigma = 50;
	var timer2 = null;
	var alpha = 5000;
	var timer3 = null;
	
	var currentImageIndex = null;
	
	var map;
	var mapContainer;
	var mapLevel = 12;
	var mapCenter = new kakao.maps.LatLng(36.6393307 , 127.9329846); // 지도의 중심좌표
	var mapOption =
	{
		center : mapCenter, // 지도의 중심좌표
		level : mapLevel // 지도의 확대 레벨
	};
	var selectedMarker = null;
	var selectedMarkerImg = null;
	
	var xMaxSizeOfForestMarker = 70;
	var yMaxSizeOfForestMarker = 85;
	var xMaxSizeOfSightsMarker = 80;
	var yMaxSizeOfSightsMarker = 80;
	var xMaxSizeOfFestivalMarker = 75;
	var yMaxSizeOfFestivalMarker = 75;
	
	/*var xSizeOfForestMarker = xMaxSizeOfForestMarker - (1 + (3 * (mapLevel - 1)));
	var ySizeOfForestMarker = yMaxSizeOfForestMarker - (1 + (3 * (mapLevel - 1)));
	var xSizeOfSightsMarker = xMaxSizeOfSightsMarker - (1 + (3 * (mapLevel - 1)));
	var ySizeOfSightsMarker = yMaxSizeOfSightsMarker - (1 + (3 * (mapLevel - 1)));
	var xSizeOfFestivalMarker = xMaxSizeOfFestivalMarker - (1 + (3 * (mapLevel - 1)));
	var ySizeOfFestivalMarker = yMaxSizeOfFestivalMarker - (1 + (3 * (mapLevel - 1)));*/
	
	var forestMarkerImageSrc = "${pageContext.request.contextPath}/resources/images/travelInformation/greenHouse.png";	
	var sightsMarkerImageSrc = "${pageContext.request.contextPath}/resources/images/travelInformation/blueMarker.png";	
	var festivalMarkerImageSrc = "${pageContext.request.contextPath}/resources/images/travelInformation/redMarker.png";
	
	var currentForestMarkerImg = new kakao.maps.MarkerImage(forestMarkerImageSrc, new kakao.maps.Size(xMaxSizeOfForestMarker - (1 + (3 * (mapLevel - 1))), yMaxSizeOfForestMarker - (1 + (3 * (mapLevel - 1)))));
	var currentSightsMarkerImg = new kakao.maps.MarkerImage(sightsMarkerImageSrc, new kakao.maps.Size(xMaxSizeOfSightsMarker - (1 + (3 * (mapLevel - 1))), yMaxSizeOfSightsMarker - (1 + (3 * (mapLevel - 1)))));
	var currentFestivalMarkerImg = new kakao.maps.MarkerImage(festivalMarkerImageSrc, new kakao.maps.Size(xMaxSizeOfFestivalMarker - (1 + (3 * (mapLevel - 1))), yMaxSizeOfFestivalMarker - (1 + (3 * (mapLevel - 1)))));
	
	
	var forestOverMarkerImage = new kakao.maps.MarkerImage(forestMarkerImageSrc, new kakao.maps.Size((xMaxSizeOfForestMarker + 15) - (1 + (3 * (mapLevel - 1))), (yMaxSizeOfForestMarker + 15) - (1 + (3 * (mapLevel - 1)))));
	var sightsOverMarkerImage = new kakao.maps.MarkerImage(sightsMarkerImageSrc, new kakao.maps.Size((xMaxSizeOfSightsMarker + 15) - (1 + (3 * (mapLevel - 1))), (yMaxSizeOfSightsMarker + 15) - (1 + (3 * (mapLevel - 1)))));
	var festivalOverMarkerImage = new kakao.maps.MarkerImage(festivalMarkerImageSrc, new kakao.maps.Size((xMaxSizeOfFestivalMarker + 15) - (1 + (3 * (mapLevel - 1))), (yMaxSizeOfFestivalMarker + 15) - (1 + (3 * (mapLevel - 1)))));
	
	var forestMarkers = [];
	var sightsMarkers = [];
	var festivalMarkers = [];
	
	
	var forestPositions = new Array();
	var sightsPositions = new Array();
	var festivalPositions = new Array();
	var zoomControl;
	
	var currentTypeId; // 지도에 추가된 지도타입정보를 가지고 있을 변수
	var searchImageArray;
		//"https://www.youtube.com/embed/oSmUI3m2kLk?autoplay=1",
		//"https://www.youtube.com/embed/knV-5VciTTQ?autoplay=1",
		//"https://www.youtube.com/embed/oSmUI3m2kLk?autoplay=1"		
        //"https://www.youtube.com/embed/videoseries?list=PLoH9j-nRRScnyf2EtZmLFfuc1CVTvUdDA&autoplay=1&loop=1&rel=0",
        //"https://www.youtube.com/embed/videoseries?list=PLoH9j-nRRScm1bh7y8oTi0E9xiVOliZ4C&autoplay=1&loop=1&rel=0",
        //"https://www.youtube.com/embed/videoseries?list=PLoH9j-nRRScmjbhykFpKWfITwCU3qq8NV&autoplay=1&loop=1&rel=0"
   
	var overlay = null;
        		
	function test()
	{
		alert(3);
	}
	
	function scrollDone()
	{
		currentScroll = document.documentElement.scrollTop;
		
		var currentScrollPercent = (maxScroll - currentScroll) / maxScroll;
		
		$("#ScrollMarginDiv").height(($("#main").height() - $("#videoControllerDiv").height()) * (1 - currentScrollPercent));
	}
	
	function resizeDone()
	{
		$("#videoContainerDiv").height($("#travelInformation").height());
		maxScroll = $(document).height() - $(window).height();
		$("#videoControllerDiv").height($("#videoContainer").height());
		
		maxScroll = $(document).height() - $(window).height();
	}
	
	$(document).ready(function()
	{ 	
		$("[name=searchType]").click(function()      
		{			
			if($('input:radio[name=searchType]:checked').val() == "searchByCity")
			{
				$("#textBox").hide();
				$("#search-box-button").hide();
				$("#search-box-wrapper").hide();
				$("#forestSelect").show();
				$("#citySelect").show();
				
			}	
			else
			{
				$("#forestSelect").hide();
				$("#citySelect").hide();
				$("#textBox").show();
				$("#search-box-button").show();
				$("#search-box-wrapper").show();
			}
		});
		
		$("#textBox").hide();
		$("#search-box-button").hide();
		$("#search-box-wrapper").hide();
		
		$(window).on('mousewheel',function(e)
		{ 
			clearTimeout( timer2 );
			timer2 = setTimeout( scrollDone, sigma);
		});
		
		
		$(window).resize(function ()
		{
			clearTimeout( timer1 );
			timer1 = setTimeout( resizeDone, delta);
		})
		
		$("#videoListDiv").slideUp(0, function(){});
	})
	/////////////////////	$(document).ready(function() end
	function travelInformationInit()
	{
		mapInit();
		roadViewInit();
		formInit();
	}
	
	function getCurrentScrollPercentage()
	{
		return (window.scrollY + window.innerHeight) / document.body.clientHeight * 100;
	}
   
	function searchByName(text)
	{
		suggestArray = new Array();
		
		for(var i = 0; i < forestArray.length; ++i)
		{
			if(forestArray[i].forestName.match(text.value))
			{
				suggestArray.push(forestArray[i].forestName);
			}
		}
		
		$(text).autocomplete(
		{
			source: suggestArray
		});  
	}
   
	function citySelectChange(city) // select1 change event
	{
		var str = "<option value = 'default'>산림휴양시설 선택</option>";
		for(var i = 0; i < forestArray.length; ++i)
		{
			if(forestArray[i].city == city)
			{
				str += "<option value = '" + forestArray[i].forestName +"'>" + forestArray[i].forestName + "</option>";			
			}
		}
		document.getElementById("forestSelect").innerHTML = str;
	}
	
	
	
	
	////////////////////////////////////////////////// Map
	function mapInit()
	{		
		mapContainer = document.getElementById('map'); // 지도를 표시할 div
		map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
		for(var i = 0; i < forestArray.length; ++i)
		{
			forestPositions[i] =
			{
				title: forestArray[i].forestName, 
				latlng: new kakao.maps.LatLng(forestArray[i].forestLatitude, forestArray[i].forestLongitude)
			}
		}
			
		for(var i = 0; i < forestPositions.length; ++i)
		{			
			// 마커를 생성합니다
			/*forestMarkers[i] = new kakao.maps.Marker(
			{
				map : map, // 마커를 표시할 지도
				position : forestPositions[i].latlng, // 마커를 표시할 위치
				title : forestPositions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage
				// 마커 이미지 
			});*/
			
			forestMarkers.push(addMarker(forestPositions[i], currentForestMarkerImg, "forest"));
		}

		//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		//지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'zoom_changed', function()
		{
			// 지도의 현재 레벨을 얻어옵니다
			mapLevel = map.getLevel();
			
			currentForestMarkerImg = new kakao.maps.MarkerImage(forestMarkerImageSrc, new kakao.maps.Size(xMaxSizeOfForestMarker - (1 + (3 * (mapLevel - 1))), yMaxSizeOfForestMarker - (1 + (3 * (mapLevel - 1)))));
			forestOverMarkerImage = new kakao.maps.MarkerImage(forestMarkerImageSrc, new kakao.maps.Size((xMaxSizeOfForestMarker + 15) - (1 + (3 * (mapLevel - 1))), (yMaxSizeOfForestMarker + 15) - (1 + (3 * (mapLevel - 1)))));
			
			if(sightsMarkers.length != 0)
			{
				currentSightsMarkerImg = new kakao.maps.MarkerImage(sightsMarkerImageSrc, new kakao.maps.Size(xMaxSizeOfSightsMarker - (1 + (3 * (mapLevel - 1))), yMaxSizeOfSightsMarker - (1 + (3 * (mapLevel - 1)))));
				sightsOverMarkerImage = new kakao.maps.MarkerImage(sightsMarkerImageSrc, new kakao.maps.Size((xMaxSizeOfSightsMarker + 15) - (1 + (3 * (mapLevel - 1))), (yMaxSizeOfSightsMarker + 15) - (1 + (3 * (mapLevel - 1)))));
			}
			if(festivalMarkers.length != 0)
			{
				currentFestivalMarkerImg = new kakao.maps.MarkerImage(festivalMarkerImageSrc, new kakao.maps.Size(xMaxSizeOfFestivalMarker - (1 + (3 * (mapLevel - 1))), yMaxSizeOfFestivalMarker - (1 + (3 * (mapLevel - 1)))));
				festivalOverMarkerImage = new kakao.maps.MarkerImage(festivalMarkerImageSrc, new kakao.maps.Size((xMaxSizeOfFestivalMarker + 15) - (1 + (3 * (mapLevel - 1))), (yMaxSizeOfFestivalMarker + 15) - (1 + (3 * (mapLevel - 1)))));
			}
			
			setMarkersSize();
		})
	}
	/////////////	function mapInit() end
	function addMarker(Position, markerImage, option)
	{
		// 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
		var marker = new kakao.maps.Marker(
		{
	        map: map,
	        position: Position.latlng,
	        title : Position.title,
	        image: markerImage
	    });			
		
		kakao.maps.event.addListener(marker, 'mouseover', function()
		{
	        // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
	        // 마커의 이미지를 오버 이미지로 변경합니다
	        if (!selectedMarker || selectedMarker !== marker)
	        {
	        	if(option  == "forest")
	        	{						
		            marker.setImage(forestOverMarkerImage);
	        	}
	        	else if(option == "sights")
	        	{
	        		marker.setImage(sightsOverMarkerImage);
	        	}
	        	else if(option == "festival")
	        	{
	        		marker.setImage(festivalOverMarkerImage);
	        	}
	        }
	    });
		
		 // 마커에 mouseout 이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'mouseout', function()
	    {
	        // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
	        // 마커의 이미지를 기본 이미지로 변경합니다
	        if (!selectedMarker || selectedMarker !== marker)
	        {
	        	if(option  == "forest")
	            {
	        		marker.setImage(currentForestMarkerImg);
	            }
	        	else if(option == "sights")
	        	{
	        		marker.setImage(currentSightsMarkerImg);
	        	}
	        	else if(option == "festival")
	        	{
	        		marker.setImage(currentFestivalMarkerImg);
	        	}
	        }
	    });

	    // 마커에 click 이벤트를 등록합니다
   		kakao.maps.event.addListener(marker, 'click', function()
   		{
   			closeOverlay();
   			
   			
   			
			//$("#overlayImg").css("background", "url('" + searchImageArray[0] + "') no-repeat;");
			//console.log(searchImageArray[0]);
   			
   			
   			
   			panTo(marker.getPosition().getLat(), marker.getPosition().getLng())
   			
       		// 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
       		// 마커의 이미지를 클릭 이미지로 변경합니다
       		if (!selectedMarker || selectedMarker !== marker)
       		{
       			clearInterval(timer3);
       			timer3 = null;
       			searchImage(Position.title, marker, option);
       			
       			if(option  == "forest")
       			{
       				changeBackSelectedMarkerImg(); // 클릭된 마커 객체가 null이 아니면 클릭된 마커의 이미지를 기본 이미지로 변경하고
            		marker.setImage(forestOverMarkerImage); // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
            		selectedMarkerImg = "forest";
       			}
       			else if(option == "sights")
	        	{
       				changeBackSelectedMarkerImg();
            		marker.setImage(sightsOverMarkerImage);
            		selectedMarkerImg = "sights";
	        	}
       			else if(option == "festival")
       			{
       				changeBackSelectedMarkerImg();
            		marker.setImage(festivalOverMarkerImage);
            		selectedMarkerImg = "festival";
       			}
				
       			// 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
       	    	selectedMarker = marker;
       	    	
       		}
       		else if(selectedMarker == marker)
       		{
       			marker.setImage(currentForestMarkerImg);
       			selectedMarker = null;
       			overlay.setMap(null);
       			clearInterval(timer3);
       			timer3 = null;
       		}
   		});
	    
		return marker;
	}
	
	function changeBackSelectedMarkerImg()
	{
		if(selectedMarker != null)
		{
			if(selectedMarkerImg == "forest")
			{
				selectedMarker.setImage(currentForestMarkerImg);
			}
			else if(selectedMarkerImg == "sights")
			{
				selectedMarker.setImage(currentSightsMarkerImg);
			}
			else if(selectedMarkerImg == "festival")
			{
				selectedMarker.setImage(currentFestivalMarkerImg);
			}
		}
	}
	
	
	
	function setMarkersSize(forestMarkerImage, sightsMarkerImage, festivalMarkerImage)
	{
		for(var i = 0; i < forestMarkers.length; ++i)
		{
			if(forestMarkers[i] != selectedMarker)
			{
				forestMarkers[i].setImage(currentForestMarkerImg);
			}
			else
			{
				forestMarkers[i].setImage(forestOverMarkerImage);
			}
		}
		for(var i = 0; i < sightsMarkers.length; ++i)
		{
			if(sightsMarkers[i] != selectedMarker)
			{
				sightsMarkers[i].setImage(currentSightsMarkerImg);
			}
			else
			{
				sightsMarkers[i].setImage(sightsOverMarkerImage);
			}
		}
		for(var i = 0; i < festivalMarkers.length; ++i)
		{
			if(festivalMarkers[i] != selectedMarker)
			{
				festivalMarkers[i].setImage(currentFestivalMarkerImg);
			}
			else
			{
				festivalMarkers[i].setImage(festivalOverMarkerImage);
			}
		}
	}

	function markerClassify(string)
	{
		switch(string)
		{
			case "forest":
			{
				return forestMarkers;				
			}
			case "sights":
			{
				return sightsMarkers;
			}
			case "festival":
			{
				return festivalMarkers;	
			}
		}
	}
	
	function markerOnOff(checkBox, markerArr)
	{
		if(checkBox.checked == true)
		{
			if(markerArr == forestMarkers)
			{
				showMarkers(markerArr);
			}
			else if(markerArr == sightsMarkers)
			{
				$(checkBox).prop('disabled', true);
				
				$.ajax(
				{
					url: "${path}/sightsSelect", //서버주소
					type :"post" , //전송방식(get, post, put, delete)
					data : "${_csrf.parameterName}=${_csrf.token}",
					dataType : "json", //서버가 보내오는 데이터타입(text,html,xml,json)
					success :function(result)
					{
						sightsArray = result;
						createMarkers(sightsArray);
						showMarkers(markerArr);
						
						$('input[name="searchType"]').each(function()
						{
							$(checkBox).prop('disabled', false);
						});
					} ,
					error : function(err)
					{
						alert("오류발생cc : " + err);
						$('input[name="searchType"]').each(function()
						{
							$(checkBox).prop('disabled', false);
						});
					}
				})
			}
			else if(markerArr == festivalMarkers)
			{
				$(checkBox).prop('disabled', true);
				
				$.ajax(
				{
					url: "${path}/festivalSelect", //서버주소
					type :"post" , //전송방식(get, post, put, delete)
					data : "${_csrf.parameterName}=${_csrf.token}",
					dataType : "json", //서버가 보내오는 데이터타입(text,html,xml,json)
					success :function(result)
					{
						festivalArray = result;
						createMarkers(festivalArray);
						showMarkers(markerArr);
						$('input[name="searchType"]').each(function()
						{
							$(checkBox).prop('disabled', false);
						});
					} ,
					error : function(err)
					{
						alert("오류발생cc : " + err);
						$('input[name="searchType"]').each(function()
						{
							$(checkBox).prop('disabled', false);
						});
					}
				})
			}
		}
		else
		{
			hideMarkers(markerArr);
		}
	}
	
	function createMarkers(Array)
	{
		var MarkerImageSrc;
		var Positions;
		var xSize;
		var ySize;
		
		
		if(Array == sightsArray)
		{
			for(var i = 0; i < Array.length; ++i)
			{
				MarkerImageSrc = sightsMarkerImageSrc;
				Positions = sightsPositions;
				
				sightsPositions[i] =
				{
					title: sightsArray[i].sightsName, 
					latlng: new kakao.maps.LatLng(sightsArray[i].sightsLatitude, sightsArray[i].sightsLongitude)
				}
				sightsMarkers.push(addMarker(sightsPositions[i], currentSightsMarkerImg, "sights"));
			}
		}
		else if(Array == festivalArray)
		{
			for(var i = 0; i < Array.length; ++i)
			{
				MarkerImageSrc = festivalMarkerImageSrc;
				Positions = festivalPositions;
				
				festivalPositions[i] =
				{
					title: festivalArray[i].festivalName, 
					latlng: new kakao.maps.LatLng(festivalArray[i].festivalLatitude, festivalArray[i].festivalLongitude)
				}
				festivalMarkers.push(addMarker(festivalPositions[i], currentFestivalMarkerImg, "festival"));
			}
		}
			
		/*for(var i = 0; i < Positions.length; ++i)
		{
			var imageSize = new kakao.maps.Size(xSize, ySize);
			// 마커 이미지를 생성합니다    
			var markerImage = new kakao.maps.MarkerImage(MarkerImageSrc, imageSize);
			// 마커를 생성합니다
			
			if(Array == sightsArray)
			{
				sightsMarkers[i] = new kakao.maps.Marker(
				{
					map : map, // 마커를 표시할 지도
					position : sightsPositions[i].latlng, // 마커를 표시할 위치
					title : sightsPositions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					image : markerImage // 마커 이미지 
				});
			}
			else if(Array == festivalArray)
			{
				festivalMarkers[i] = new kakao.maps.Marker(
				{
					map : map, // 마커를 표시할 지도
					position : festivalPositions[i].latlng, // 마커를 표시할 위치
					title : festivalPositions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					image : markerImage // 마커 이미지 
				});
			}
		}*/
	}
	
	function forestSearch()
	{
		for(var i = 0; i < forestArray.length; ++i)
		{
			if($("#textBox").val() == forestArray[i].forestName)
			{
				panTo(forestArray[i].forestLatitude, forestArray[i].forestLongitude);
				kakao.maps.event.trigger(forestMarkers[i], 'click', ''); // 사용자 이벤트가 발생했습니다.
				break;
			}
		}
		return false; 
	}

	//"마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
	function showMarkers(markerArr)
	{
		for (var i = 0; i < markerArr.length; i++)
		{
			markerArr[i].setMap(map);
		}
	}

	// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
	function hideMarkers(markerArr)
	{
		for (var i = 0; i < markerArr.length; i++)
		{
			markerArr[i].setMap(null);
		}
	}

	var changeMaptype;
	// 교통정보 띄우기
	function maptypeClassify(String)
	{
		switch(String)
		{
			case "traffic":
			{		
				return kakao.maps.MapTypeId.TRAFFIC;
			}
			break;
			case "roadView":
			{
				return kakao.maps.MapTypeId.ROADVIEW;
			}
			break;
			case "bicycle":
			{
				return kakao.maps.MapTypeId.BICYCLE;
			}
			break;
		}
	}
	
	function setOverlayMapTypeId(checkBox)
	{
		var control = document.getElementById('roadviewControl');
		
		if(checkBox.checked == true)
		{
			var arr = document.getElementsByClassName("mapOption");
			
			for(var i = 0; i < arr.length; ++i)
			{
				if(arr[i].id != checkBox.id)
				{
					arr[i].checked = false;
				    map.removeOverlayMapTypeId(maptypeClassify(arr[i].id));
				}
			}
			map.addOverlayMapTypeId(maptypeClassify(checkBox.id));
			control.className = '';
			toggleOverlay(false);
		}
		else
		{
			map.removeOverlayMapTypeId(maptypeClassify(checkBox.id));
		}
	}

	////////////////////////////////////////////////// RoadView
	var overlayOn = false; // 지도 위에 로드뷰 오버레이가 추가된 상태를 가지고 있을 변수
    var container;
    var mapWrapper;
    var mapContainer;
    var rvContainer;
    var rv;
    var rvClient;
	
 	// 마커 이미지를 생성합니다
    var markImage = new kakao.maps.MarkerImage('https://t1.daumcdn.net/localimg/localimages/07/2018/pc/roadview_minimap_wk_2018.png',
    	new kakao.maps.Size(26, 46),
    	{
            // 스프라이트 이미지를 사용합니다.
            // 스프라이트 이미지 전체의 크기를 지정하고
            spriteSize: new kakao.maps.Size(1666, 168),
            // 사용하고 싶은 영역의 좌상단 좌표를 입력합니다.
            // background-position으로 지정하는 값이며 부호는 반대입니다.
            spriteOrigin: new kakao.maps.Point(705, 114),
            offset: new kakao.maps.Point(13, 46)
        }
    );
    
	// 드래그가 가능한 마커를 생성합니다
    var marker = new kakao.maps.Marker(
    {
		image : markImage,
        position: mapCenter,
        draggable: true
    });

 
    function roadViewInit()
    {
        container = document.getElementById('container'); // 지도와 로드뷰를 감싸고 있는 div 입니다
        mapWrapper = document.getElementById('mapWrapper'); // 지도를 감싸고 있는 div 입니다
        mapContainer = document.getElementById('map'); // 지도를 표시할 div 입니다 
        rvContainer = document.getElementById('roadview'); //로드뷰를 표시할 div 입니다
        rv = new kakao.maps.Roadview(rvContainer); // 로드뷰 객체를 생성합니다 
        rvClient = new kakao.maps.RoadviewClient(); // 좌표로부터 로드뷰 파노라마 ID를 가져올 로드뷰 클라이언트 객체를 생성합니다 
    	
		// 로드뷰에 좌표가 바뀌었을 때 발생하는 이벤트를 등록합니다 
		kakao.maps.event.addListener(rv, 'position_changed', function()
		{
			var rvPosition = rv.getPosition(); // 현재 로드뷰의 위치 좌표를 얻어옵니다 
			
			map.setCenter(rvPosition); // 지도의 중심을 현재 로드뷰의 위치로 설정합니다

			if(overlayOn)// 지도 위에 로드뷰 도로 오버레이가 추가된 상태이면
			{
				marker.setPosition(rvPosition); // 마커의 위치를 현재 로드뷰의 위치로 설정합니다
			}
		});
        
		// 마커에 dragend 이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'dragend', function(mouseEvent)
		{
	        var position = marker.getPosition(); // 현재 마커가 놓인 자리의 좌표입니다 
	        toggleRoadview(position); // 마커가 놓인 위치를 기준으로 로드뷰를 설정합니다
	    });
		
		//지도에 클릭 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent)
		{
		    // 지도 위에 로드뷰 도로 오버레이가 추가된 상태가 아니면 클릭이벤트를 무시합니다 
		    if(!overlayOn)
		    {
		        return;
		    }

		    // 클릭한 위치의 좌표입니다 
		    var position = mouseEvent.latLng;

		    // 마커를 클릭한 위치로 옮깁니다
		    marker.setPosition(position);

		    // 클락한 위치를 기준으로 로드뷰를 설정합니다
		    toggleRoadview(position);
		});
    }////////////// function roadViewInit() end
    
 	// 전달받은 좌표(position)에 가까운 로드뷰의 파노라마 ID를 추출하여
	// 로드뷰를 설정하는 함수입니다
	function toggleRoadview(position)
    {
		rvClient.getNearestPanoId(position, 50, function(panoId)
		{
			// 파노라마 ID가 null 이면 로드뷰를 숨깁니다
			if (panoId === null)
			{
				toggleMapWrapper(true, position);
			}
			else
			{
				toggleMapWrapper(false, position);
				// panoId로 로드뷰를 설정합니다
				rv.setPanoId(panoId, position);
			}
		});
 	}
    
 	// 지도를 감싸고 있는 div의 크기를 조정하는 함수입니다
 	function toggleMapWrapper(active, position)
 	{
		if (active)
		{
			// 지도를 감싸고 있는 div의 너비가 100%가 되도록 class를 변경합니다 
			container.className = '';

			// 지도의 크기가 변경되었기 때문에 relayout 함수를 호출합니다
			map.relayout();

			// 지도의 너비가 변경될 때 지도중심을 입력받은 위치(position)로 설정합니다
			map.setCenter(position);
		}
		else
		{
			// 지도만 보여지고 있는 상태이면 지도의 너비가 50%가 되도록 class를 변경하여
			// 로드뷰가 함께 표시되게 합니다
			if (container.className.indexOf('view_roadview') === -1)
			{
				container.className = 'view_roadview';
				// 지도의 크기가 변경되었기 때문에 relayout 함수를 호출합니다
				map.relayout();

				// 지도의 너비가 변경될 때 지도중심을 입력받은 위치(position)로 설정합니다
				map.setCenter(position);
			}
		}
	}

	// 지도 위의 로드뷰 도로 오버레이를 추가,제거하는 함수입니다
	function toggleOverlay(active)
	{
		if (active)
		{
			overlayOn = true;
			// 지도 위에 로드뷰 도로 오버레이를 추가합니다
			map.addOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);

			// 지도 위에 마커를 표시합니다
			marker.setMap(map);

			// 마커의 위치를 지도 중심으로 설정합니다 
			marker.setPosition(map.getCenter());

			// 로드뷰의 위치를 지도 중심으로 설정합니다
			toggleRoadview(map.getCenter());
		}
		else
		{
			overlayOn = false;

			// 지도 위의 로드뷰 도로 오버레이를 제거합니다
			map.removeOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);

			// 지도 위의 마커를 제거합니다
			marker.setMap(null);
		}
	}

	// 지도 위의 로드뷰 버튼을 눌렀을 때 호출되는 함수입니다
	function setRoadviewRoad(type)
	{
		var control = document.getElementById('roadviewControl');
		var checkBox = document.getElementById("roadView");
		
		if(type == "button")
		{
			// 버튼이 눌린 상태가 아니면
			if (control.className.indexOf('active') === -1)
			{
				checkBox.checked = true;
				var arr = document.getElementsByClassName("mapOption");	
				for(var i = 0; i < arr.length; ++i)
				{
					if(arr[i].id != checkBox.id)
					{
						arr[i].checked = false;
				    	map.removeOverlayMapTypeId(maptypeClassify(arr[i].id));
					}
				}
				//map.addOverlayMapTypeId(maptypeClassify(checkBox.id));
				
				control.className = 'active';

				// 로드뷰 도로 오버레이가 보이게 합니다
				toggleOverlay(true);
			}
			else
			{
				checkBox.checked = false;
				map.removeOverlayMapTypeId(maptypeClassify(checkBox.id));
				
				control.className = '';
				// 로드뷰 도로 오버레이를 제거합니다
				toggleOverlay(false);
			}
		}
		else if(type == "checkBox")
		{
			if(checkBox.checked == true)
			{
				var arr = document.getElementsByClassName("mapOption");	
				for(var i = 0; i < arr.length; ++i)
				{
					if(arr[i].id != checkBox.id)
					{
						arr[i].checked = false;
				    	map.removeOverlayMapTypeId(maptypeClassify(arr[i].id));
					}
				}
				//map.addOverlayMapTypeId(maptypeClassify(checkBox.id));
				
				control.className = 'active';
				// 로드뷰 도로 오버레이가 보이게 합니다
				toggleOverlay(true);
			}
			else
			{
				//map.removeOverlayMapTypeId(maptypeClassify(checkBox.id));
				
				control.className = '';
				// 로드뷰 도로 오버레이를 제거합니다
				toggleOverlay(false);
			}
			
		}
	}

 	// 로드뷰에서 X버튼을 눌렀을 때 로드뷰를 지도 뒤로 숨기는 함수입니다
 	function closeRoadview()
 	{
		var position = marker.getPosition();
		toggleMapWrapper(true, position);
	}
 	//////////////////////////////////////////////////////////////////////////////////RoadView End
 	
 	function formInit()
	{
		$("#videoContainerDiv").height($("#travelInformation").height());
		maxScroll = $(document).height() - $(window).height();
		$("#videoControllerDiv").height($("#videoContainer").height());
		videoControllerInit();
	}
 	
 	function videoControllerInit()
	{
		if(videoMax == 0)
		{
			$("#videoController").hide();
		}
		else
		{
			currentVideo = Math.floor(Math.random() * videoMax);
			
			var str = "";
			for(var i = 0; i < videoMax; ++i)
			{
				str += "<li class = 'clearfix' onclick = 'videoPlay(" + i + ")'><div class = 'floatDiv'>" + (i + 1) + "</div>";
				str += "<div class = 'floatDiv' style = 'overflow : hidden'>" + videoArray[i].videoName + "</div>";
				
				if(currentVideo == i)
				{
					str += "<div class = 'floatDiv' name = 'playListIndex" + i + "'>♪</div></li>";
				}
				else
				{
					str += "<div class = 'floatDiv' name = 'playListIndex" + i + "'></div></li>";
				}
				
				if(i == videoMax - 1)
				{
					break;
				}
				str += "<li><div class = 'paddingDiv'></div></li>";
			}
			document.getElementById("videoListUl").innerHTML = str;
			document.getElementById("videoFrame").src = "http://www.youtube.com/embed/" + videoArray[currentVideo].videoSrc + "?autoplay=1&version=3&loop=1&playlist=" + videoArray[currentVideo].videoSrc;
		}		
	}

 	function videoPlay(index)
 	{
 		document.getElementsByName("playListIndex" + currentVideo)[0].innerText = "";
 		document.getElementsByName("playListIndex" + index)[0].innerText = playIcon;
 		document.getElementById("videoFrame").src = "http://www.youtube.com/embed/" + videoArray[index].videoSrc + "?autoplay=1&version=3&loop=1&playlist=" + videoArray[index].videoSrc;
 		currentVideo = index;
 	}

 	function randomVideoPlay()
 	{
        var randomVideo = Math.floor(Math.random() * videoMax);
        
        for(;;)
        {
        	if(randomVideo != currentVideo)
        	{
        		break;
        	}
        	randomVideo = Math.floor(Math.random() * videoMax);
        }
        
        videoPlay(randomVideo);
    }
 	
 	function nextVideoPlay()
 	{
 		if(currentVideo == videoArray.length - 1)
 		{
 			videoPlay(0);
 		}
 		else
 		{
 			videoPlay(currentVideo + 1);
 		}
 	}
 	
 	function videoListOnOff(button)
 	{
 		$("#videoListDiv").slideToggle(500, function()
 		{
 			if($("#videoControllerDiv").height() + $("#ScrollMarginDiv").height() > $("#videoContainerDiv").height())
 	 		{
 	 			currentScroll = document.documentElement.scrollTop;
 	 			var currentScrollPercent = (maxScroll - currentScroll) / maxScroll;
 	 			
 	 			var gap = $("#ScrollMarginDiv").height() - ($("#travelInformation").height() - $("#videoControllerDiv").height()) * (1 - currentScrollPercent);
 	 			if($("#videoControllerDiv").height() < $("#main").height())
 	 			{
	 	 			$("#ScrollMarginDiv").animate({height: "-=" + gap}, 1000);
 	 			}
 	 		}
 		});
 		
 		if(!videoListOnOffCheck)
 		{
 			button.value = "◆";
 			videoListOnOffCheck = true;
 		}
 		else
 		{
 			button.value = "■";
 			videoListOnOffCheck = false;
 		}
 	}
 	
 	function forestSelectChange()
	{
		var target= document.getElementById("forestSelect");
		var index = target.options[target.selectedIndex].value;
		var latitude = forestArray[index].forestLatitude;
		var longitude = forestArray[index].forestLongitude;
		
		panTo(latitude, longitude);
	}
 	
 	function forestSelectChange()
	{
		var target= document.getElementById("forestSelect");
		var index = target.options[target.selectedIndex].value;
		if(index == "default")
		{
			return;
		}
		
		for(var i = 0; i < forestArray.length; ++i)
		{
			if(index == forestArray[i].forestName)
			{
				panTo(forestArray[i].forestLatitude, forestArray[i].forestLongitude);
				kakao.maps.event.trigger(forestMarkers[i], 'click', ''); // 사용자 이벤트가 발생했습니다.
				break;
			}
		}
	}
 	
 	function panTo(latitude, longitude)
 	{
 	    // 이동할 위도 경도 위치를 생성합니다 
 	    var moveLatLon = new kakao.maps.LatLng(latitude + 0.4, longitude);
 	    
 	    // 지도 중심을 부드럽게 이동시킵니다
 	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
 	    map.panTo(moveLatLon);            
 	}         
 	
 	function imageLoof()
 	{
 		if(currentImageIndex == null)
 		{
 			currentImageIndex = 0;
 		}
 		else if(currentImageIndex == 9)
 		{
 			currentImageIndex = 0;
 		}
 		else
 		{
 			++currentImageIndex;
 		}
 		//$("#searchImageDiv").css("background","url('" + searchImageArray[currentImageIndex] + "') no-repeat")
 		document.getElementById("searchImg").src = searchImageArray[currentImageIndex];
 	}
	
 	function searchImage(keyword, marker, option)
 	{
 		
 		
 		$.ajax(
 		{
			url: "${path}/searchImage", //서버주소
			type :"post" , //전송방식(get, post, put, delete)
			data :"${_csrf.parameterName}=${_csrf.token}&&keyword=" + keyword, //서버에게 전송할 parameter정보
			dataType : "json", //서버가 보내오는 데이터타입(text,html,xml,json)
			success :function(result)
			{
				//clearTimeout(timer3);
				timer3 = setInterval(imageLoof, alpha);
				
				searchImageArray = new Array();
				for(var i = 0; i <result.items.length; ++i)
				{
					searchImageArray.push(result.items[i].link);
				}
				console.log(searchImageArray);
				
				var str;
				var addr;
				
				if(option == "forest")
				{
					str = "휴양림 정보";
					for(var i = 0; i < forestArray.length; ++i)
					{
						if(forestArray[i].forestName == keyword)
						{
							if(forestArray[i].forestAddr == null)
							{
								addr = "";
							}
							else
							{
								addr = forestArray[i].forestAddr;
							}
							break;
						}
					}
				}
				else if(option == "sights")
				{
					str = "관광지 정보";
					for(var i = 0; i < sightsArray.length; ++i)
					{
						if(sightsArray[i].sightsName == keyword)
						{
							if(sightsArray[i].sightsLocation == null)
							{
								addr = "";
							}
							else
							{
								addr = sightsArray[i].sightsLocation;
							}
							break;
						}
					}
				}
				else if(option == "festival" )
				{
					str = "행사 정보";
					for(var i = 0; i < festivalArray.length; ++i)
					{
						if(festivalArray[i].festivalName == keyword)
						{
							if(festivalArray[i].festivalAddress == null)
							{
								addr = "";
							}
							else
							{
								addr = festivalArray[i].festivalAddress;
							}
							break;
						}
					}
				}
				
				var content = '<div class="overlaybox" style = "border-radius : 4px 4px 0 0">' +
	   		    '    <div class="boxtitle">' + str + '</div>' +
	   		 	'        <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	   		    '    <div id="searchImageDiv" class="first" style = "background: url(' + searchImageArray[0] + ') no-repeat;">' +
	   		    '	 <img id = "searchImg" style="width : 100%; height : 100%;">' +
	   		    '        <div class="movietitle text">' + keyword + '</div>' +
	   		    '    </div>'+
	   			'	 <ul>' +
	   		    '        <li class="up">' +
	   		    '            <div style = "overflow : hidden" class="number">' + addr + '</div>' +
	   		    '        </li>' +
	   		    '    </ul>' +
	   		    '</div>';
	   		
				overlay = new kakao.maps.CustomOverlay(
				{
					content: content,
					map: map,
					position: marker.getPosition(),
					position : new kakao.maps.LatLng(marker.getPosition().getLat(), marker.getPosition().getLng()),
					xAnchor: 0.2,
					yAnchor: 1.15
				});
				

				overlay.setMap(map);
				
				return overlay;
			} ,
			error : function(err)
			{
				alert("오류발생cc : " + err);
			}
		})
 	}
 	
	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
 	function closeOverlay()
 	{
		if(overlay != null)
		{
 	    	overlay.setMap(null);
		}
 	}
///////////////////////////////////////////////////////////////////////////////////
</script>

<title>For Rest : 휴양림 예약 사이트</title>
</head>
<body id = "tavelInformationBody" style = "width : 100%;" onload = "travelInformationInit()" >
	<!-- Main -->
	<div id="main" class="wrapper style2 clearfix" style = "width : 100%; vertical-align: top;">
		<div id = "videoContainerDiv" class = "floatDiv" style = "width : 25%; height : 100%; vertical-align: top;" >
			<div id = "ScrollMarginDiv" style = "width : 100%; "></div>
			<div id = "videoControllerDiv" style = "width : 100%;  text-align : center;">
				<div id = "videoController" style = "padding-left: 7.5%;  padding-right:7.5%;">
					<div><iframe id = "videoFrame" style = "width : 100%; height : 200px" src="" allowfullscreen></iframe></div>
					<div class = "clearfix">
						<div class = "floatDiv" style = "width : 45%;vertical-align: middle; cursor : pointer" id = "leftVideoButtonDiv">
							<input type="button" class = "videoButton" onclick = "nextVideoPlay()" value = "다음 재생" style = "width : 100%; height : 30px; cursor : pointer;">
						</div>
						<div class = "floatDiv" style = " width : 45%; vertical-align: middle;" id = "middleVideoButtonDiv">
							<input type="button" class = "videoButton" onclick = "randomVideoPlay()" value = "무작위 재생" style = "width : 100%; height : 30px; cursor : pointer;">
						</div>
						<div class = "floatDiv" style = " width : 10%; vertical-align: middle;" id = "rightVideoButtonDiv">
							<input type="button" class = "videoButton" onclick = "videoListOnOff(this)" value = "■" style = "width : 100%; height : 30px; cursor : pointer;">
						</div>
					</div>
					<div id = "videoListDiv" style = "width : 100%; border: 1px solid #1E1E1E">
						<ul id = "videoListUl" style = "width : 100%; height : auto;"></ul>
					</div>
				</div>
			</div>
		</div>
		<div class = "floatDiv" style = "width : 70%; height : 1500px;" id = "travelInformation">
			<div id = "travelInformationHeader" style = "width : 100%; height : auto; margin : 5px 0px;">여행 정보 검색</div>				
			<div id = "travelInformationExplain" style = "width : 100%;  height : auto; margin : 5px 0px;">휴양림 주변 관광지, 행사 정보 검색</div>
			
			<div id = "radioGroup" style = "width : 100%; height : auto;">
				<label class = "radioLabel">
					<input type="radio" class="medium" name="searchType" id="searchType1" value="searchByCity" checked="checked">지역으로 찾기
				</label>
				<label class = "radioLabel">
					<input type="radio" class="medium" name="searchType" id="searchType2" value="searchByName">이름으로 찾기				
				</label>
			</div>
			<form name="searchForm" id = "searchForm" style = "width : 100%; height : auto;" action = "#" onSubmit = "return forestSearch()">
				<div id = "searchGroup" style = "width : 100%">
					<div id = "select-box-wrapper" style = "width : 100%">
						<select id = "citySelect" onchange="citySelectChange(this.value)" style = "width : 45%;">
							<option>시/도 선택</option>
							<c:forEach items="${cityList}" var="city">
								<option>${city}</option>
							</c:forEach>
						</select>
						<select id="forestSelect" style = "width : 54%" onchange="forestSelectChange()">
							<option value = "default">산림휴양시설 선택</option>
						</select>
					</div>
						
					<div id = "search-box-wrapper" style = "width : 100%">
						<input type = "text" id = "textBox" style = "width : 100%" class = "search-box-input" onkeyup="searchByName(this)" placeholder = "휴양림 이름 입력"/>
						<button id = "search-box-button">&#128269;</button>
					</div>
				</div>
			</form>
				
			<div id = "checkBoxTopDiv" style = "width : 100%;" >
				<div id = "checkBoxGroup1" style = "text-align : left; vertical-align: middle; width : 100%;">
					<label class = "checkBoxLabel">
						<input type="checkbox" onchange="markerOnOff(this, markerClassify('forest'))" id = "forest" checked = "checked"/>휴양림 보기
					</label>
					<label class = "checkBoxLabel">
						<input type="checkbox" onchange="markerOnOff(this, markerClassify('sights'))" id = "sights"/>관광지 보기
					</label>
					<label class = "checkBoxLabel">
						<input type="checkbox" onchange="markerOnOff(this, markerClassify('festival'))" id = "festival"/>행사 보기
					</label>
				</div>
						
			</div>
					<!-- 지도 -->	
			<div id="container" style = "width: 100%; height: 650px;">
				<div id="rvWrapper">
					<div id="roadview" style="width:100%;height:100%"></div> <!-- 로드뷰를 표시할 div 입니다 -->
					<div id="close" title="로드뷰닫기" onclick="closeRoadview()"><span class="img"></span></div>
				</div>
    			<div id="mapWrapper">
        			<div id="map" style="width:100%;height:100%;"></div> <!-- 지도를 표시할 div 입니다 -->
        			<div id="roadviewControl" onclick="setRoadviewRoad('button')"></div>
    			</div>
			</div>
			<div id = "checkBoxBottomDiv" style = "width : 100%;" class = "clearfix" >
				<div id = "checkBoxGroup2" style = "text-align : right; vertical-align: middle; width : 100%;">
					<label class = "checkBoxLabel">
						<input type = "checkbox" class = "mapOption" onclick="setOverlayMapTypeId(this)" id = "traffic" />교통정보 보기
					</label>
					<label class = "checkBoxLabel">
						<input type = "checkbox" class = "mapOption" onclick="setRoadviewRoad('checkBox')" id = "roadView" />로드뷰 보기
					</label>
					<label class = "checkBoxLabel">
						<input type = "checkbox" class = "mapOption" onclick="setOverlayMapTypeId(this)" id = "bicycle" />자전거도로 보기
					</label>
				</div>
			</div>
			<div id = "searchResultDiv" class = "clearfix" style = "width : 100%; height : 500px; border : 4px solid #1E1E1E; border-radius : 4px; background-color : #FFFFFF">
				<div id = "naverSearchResultDiv" class = "floatDiv" style = "width : 30%; height : 100%; overflow : auto" >
					<div style = "width : 100%; height : auto"><img id = "searchImg1" style = "width : 100%; height : auto" src = "http://image.aladin.co.kr/scm/editor/2015/0828/scm3855923816575.jpg"></div>
					<div style = "width : 100%; height : auto"><img id = "searchImg1" style = "width : 100%; height : auto" src = "http://www.chungnam.net/export/media/article_image/20130527/IM0000559186.jpg"></div>
					<div style = "width : 100%; height : auto"><img id = "searchImg1" style = "width : 100%; height : auto"></div>
					<div style = "width : 100%; height : 40%"><img id = "searchImg1" style = "width : 100%; height : 100%"></div>
					<div style = "width : 100%; height : 40%"><img id = "searchImg1" style = "width : 100%; height : 100%"></div>
					<div style = "width : 100%; height : 40%"><img id = "searchImg1" style = "width : 100%; height : 100%"></div>
					<div style = "width : 100%; height : 40%"><img id = "searchImg1" style = "width : 100%; height : 100%"></div>
					<div style = "width : 100%; height : 40%"><img id = "searchImg1" style = "width : 100%; height : 100%"></div>
					<div style = "width : 100%; height : 40%"><img id = "searchImg1" style = "width : 100%; height : 100%"></div>
					<div style = "width : 100%; height : 40%"><img id = "searchImg1" style = "width : 100%; height : 100%"></div>
				</div>
				<div id = "dBSearchResultDiv" class = "floatDiv" style = "width : 70%; height : 100%;">
					<input type ="button" onclick = "tTest()">
				</div>
			</div>
		</div>
		
		
		<div class = "floatDiv" style = "width : 5%; height : 100%;" id = "aa"></div>
	</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>