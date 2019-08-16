<%@ include file="topcontent.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=45666bcb826210a72dbea20e833f5168&libraries=services,clusterer,drawing"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${path}/resources/css/travelInformation.css"/>
<script type="text/javascript">
	var mapLevel = 12;
	var xMaxSize = 70;
	var yMaxSize = 85;
	var mapCenter = new kakao.maps.LatLng(37.539753 , 128.112484); // 지도의 중심좌표
	
	var xSize = xMaxSize - (1 + (3 * (mapLevel - 1)));
	var ySize = yMaxSize - (1 + (3 * (mapLevel - 1)));
	var forestMarkers = [];
	var sightsMarkers = [];
	var festivalMarkers = [];
	
	var forestMarkerImageSrc = "${pageContext.request.contextPath}/resources/images/travelInformation/greenHouse.png";	
	var sightsMarkerImageSrc = "${pageContext.request.contextPath}/resources/images/travelInformation/blueMarker.png";	
	var festivalMarkerImageSrc = "${pageContext.request.contextPath}/resources/images/travelInformation/redMarker.png";
	
	var mapContainer;
	var mapOption =
	{
		center : mapCenter, // 지도의 중심좌표
		level : mapLevel // 지도의 확대 레벨
	};

	var map;

	var forestArray = JSON.parse('${forestArray}');
	var positions = new Array();
	var zoomControl;
	
	var currentTypeId; // 지도에 추가된 지도타입정보를 가지고 있을 변수
   
	$(document).ready(function()
	{ 	
		$("[name=searchType]").click(function()      
		{			
			if($('input:radio[name=searchType]:checked').val() == "searchByCity")
			{
				$("#textBox").hide();
				$("#search-box-button2").hide();
				$("#search-box-wrapper").hide();
				$("#forestSelect").show();
				$("#citySelect").show();
				$("#search-box-button1").show();
				
			}	
			else
			{
				$("#forestSelect").hide();
				$("#citySelect").hide();
				$("#search-box-button1").hide();
				$("#textBox").show();
				$("#search-box-button2").show();
				$("#search-box-wrapper").show();
			}
		});
		
		$("#textBox").hide();
		$("#search-box-button2").hide();
		$("#search-box-wrapper").hide();
	})
   /////////////////////	$(document).ready(function() end
   
	function searchByName(text)
	{
		$(document).ready(function()
		{	
			$.ajax({
				url: "travelInformationAjax/suggest", //서버주소
				type :"post" , //전송방식(get, post, put, delete)
				data :"${_csrf.parameterName}=${_csrf.token}&&text=" + text.value , //서버에게 전송할 parameter정보
				dataType : "json", //서버가 보내오는 데이터타입(text,html,xml,json)
				success :function(result)
				{
					$(text).autocomplete(
					{
						source: result
					});  
				} ,
				error : function(err)
				{
					alert("오류발생cc : " + err);
				}
			})
		})
	}
   
	function citySelectChange(city) // select1 change event
	{
		var str = "<option>산림휴양시설 선택</option>";
		for(var i = 0; i < forestArray.length; ++i)
		{
			if(forestArray[i].city == city)
			{
				str += "<option value = '" + forestArray[i].forestName + "'>" + forestArray[i].forestName + "</option>";			
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
			positions[i] =
			{
				title: forestArray[i].forestName, 
				latlng: new kakao.maps.LatLng(forestArray[i].forestLatitude, forestArray[i].forestLongitude)
			}
		}
			
		for(var i = 0; i < positions.length; ++i)
		{
			var imageSize = new kakao.maps.Size(xSize, ySize);
			// 마커 이미지를 생성합니다    
			var markerImage = new kakao.maps.MarkerImage(forestMarkerImageSrc, imageSize);
			// 마커를 생성합니다
			forestMarkers[i] = new kakao.maps.Marker(
			{
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage
				// 마커 이미지 
			});
		}

		//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		//지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'zoom_changed', function()
		{
			// 지도의 현재 레벨을 얻어옵니다
			mapLevel = map.getLevel();
			xSize = xMaxSize - (1 + (3 * (mapLevel - 1)));
			ySize = yMaxSize - (1 + (3 * (mapLevel - 1)));
			var imageSize = new kakao.maps.Size(xSize, ySize);
			var markerImage = new kakao.maps.MarkerImage(forestMarkerImageSrc, imageSize);
			setMarkersSize(markerImage);
		})
		
		roadViewInit();
	}
	/////////////	function mapInit() end
	function setMarkersSize(Image)
	{
		for (var i = 0; i < forestMarkers.length; i++)
		{
			forestMarkers[i].setImage(Image);
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
			showMarkers(markerArr);
		}
		else
		{
			hideMarkers(markerArr);
		}
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

	
	//////////////////////////////////////////////////
</script>

<title>For Rest : 휴양림 예약 사이트</title>
</head>
<body onload = "mapInit()">
	<!-- Main -->
	<div id="main" class="wrapper style2">
	
		<!-- Content -->
		<div id="content" class="container">
			<section class = "travelInformation">
				<header class="major">
					<h2>여행 정보 검색</h2>
					<span class="byline">휴양림 주변 관광지, 행사 정보 검색</span>
				</header>				
				<form name="searchForm" id = "searchForm" style = "width : 100%">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<div id = "radio-group">
						<input type="radio" name="searchType" id="searchType1" value="searchByCity" checked="checked"><label for = "searchType1">지역으로 찾기</label><input type="radio" name="searchType" id="searchType2" value="searchByName"><label for = "searchType2">이름으로 찾기</label>
					</div>
					<select id = "citySelect" onchange="citySelectChange(this.value)" style = "width : 40%;">
						<option>시/도 선택</option>
						<c:forEach items="${cityList}" var="city">
							<option>${city}</option>
						</c:forEach>
					</select>
					<select id="forestSelect" style = "width : 54%">
						<option>산림휴양시설 선택</option>
					</select>
					<button id = "search-box-button1">&#128269;</button>
					<div id = "search-box-wrapper" style = "width : 100%">
						<input type = "text" id = "textBox" class = "search-box-input" onkeyup="searchByName(this)" placeholder = "휴양림 이름 입력"/>
						<button id = "search-box-button2">&#128269;</button>
					</div>
				</form>
				
				<br>
				<div>
					<table style = "width : 100%">
						<tr>
							<td style = "text-align : left; vertical-align: middle;">
								<input type="checkbox" onchange="markerOnOff(this, markerClassify('forest'))" id = "forest" checked = "checked"/>휴양림 보기
								<input type="checkbox" id = "sights"/>관광지 보기
								<input type="checkbox" id = "festival"/>행사 보기
							</td>
							<td style = "text-align : right; vertical-align: middle">
								<input type = "checkbox" class = "mapOption" onclick="setOverlayMapTypeId(this)" id = "traffic" />교통정보 보기
								<input type = "checkbox" class = "mapOption" onclick="setRoadviewRoad('checkBox')" id = "roadView" />로드뷰 보기
								<input type = "checkbox" class = "mapOption" onclick="setOverlayMapTypeId(this)" id = "bicycle" />자전거도로 보기
							</td>
						</tr>
					</table>				
				</div>

	
				<!-- /div-->
				
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
			</section>
		</div>
	</div>
</body>
</html>
<%@ include file="footer.jsp"%>