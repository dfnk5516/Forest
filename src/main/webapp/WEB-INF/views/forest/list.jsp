<%@ include file="../include/topcontent.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="description" content="Creative Button Styles  - Modern and subtle styles &amp; effects for buttons" />
<meta name="keywords" content="button styles, css3, modern, flat button, subtle, effects, hover, web design" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico"> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/default.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/component.css" />
	<script src="${pageContext.request.contextPath}/resources/js/modernizr.custom.js"></script> 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<style type="text/css">

/* body>*
{
	margin : 0px;
	padding : 0px;
	border : 0px solid #000000;
} */
.data:hover {
	background: #f0f0f0;
	cursor: pointer;
}

ul li {
	width: 50%;
	float: left;
	list-style: none;
	padding: 10px;
	height: 220px;
}

a {
	text-decoration: none !important;
}

ul:after {
	content: '';
	display:block;
	clear:both;
}

ul {
    width: 100%;
    height: auto;
    padding: 0;
}

.list_img {
    width: 45%;
    display: inline-block;
}

.list_content {
    width: 34%;
    display: inline-block;
    vertical-align: middle;
    padding:0 10px;
}
.list_Btn{
	width: 20%;
    display: inline-block;
}


div.data{
	padding:15px;	
}

div.data:after {
	content:'';
	display:block;
	clear:both;
}


#keyWord{
	height: 32px; width:100px; display: inline-block; vertical-align: middle; border-color: black;
}

#tables{
	margin-top: 100px;
}
</style>
<script type="text/javascript">
$(function(){
	$(".list_img, .list_content").click(function(){
		var forestNo=$(this).find("[name=forestNo]").val();
		location="${pageContext.request.contextPath}/forest/read/"+forestNo;
	});
	
	$("#searchBtn").click(function(){
		location="${pageContext.request.contextPath}/forest/selectBySearch/"+
					$("#keyField").val()+"/"+$("#keyWord").val();
	});
	
	$("#insert").click(function(){
		location="${pageContext.request.contextPath}/forest/write";
	});
	
	$(".icon-heart").click(function(){
		var colors=$(this).css("color");
		if(colors=="rgb(33, 37, 41)"){
			$(this).css("color","red");
		} else {
			$(this).css("color","rgb(33, 37, 41)");
		}
		
	})
	
	/* $("input[name='daterange']").daterangepicker({
	    opens: 'left'
	  }, function(start, end, label) {
	    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
	}); */
})
</script>

<script src="${pageContext.request.contextPath}/resources/js/classie.js"></script>
	<script>
		var buttons7Click = Array.prototype.slice.call( document.querySelectorAll( '#btn-click button' ) ),
		totalButtons7Click = buttons7Click.length;
		buttons7Click.forEach( function( el, i ) { el.addEventListener( 'click', activate, false ); } );
		
		function activate() {
			var self = this, activatedClass = 'btn-activated';
			if( !classie.has( this, activatedClass ) ) {
				classie.add( this, activatedClass );
				setTimeout( function() { classie.remove( self, activatedClass ) }, 1000 );
			}
		}
	</script>	

</head>
<body>

<c:set var="path" value="${pageContext.request.contextPath}" scope="application"/>

<div style="margin-bottom: 10px">
	<div align="center">
		<button type="button" class="btn btn-info" id="insert" style="font-size:large;">
			휴양림정보 등록
		</button>
	</div>

	<div align="center" style="padding: 10px 0px;">
		<select name="keyField" id="keyField"
			style="height: 32px; display: inline-block; vertical-align: middle;">
			<option value="0">--선택--</option>
			<option value="forest_name">휴양림 이름</option>
			<option value="forest_addr">지역</option>
		</select> 
		<input type="text" name="keyWord" id="keyWord">
		<!-- <input type="text" name="daterange" value="날짜선택"/> -->
			
		<button type="button" class="btn btn-default" id="searchBtn">
			<i class="glyphicon glyphicon-search"></i>
		</button>
	</div>
</div>

<ul>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td>
					<p align="center">
						<b><span style="font-size: 12pt;">등록된 글이 없습니다.</span></b>
					</p>
				</td>
			</tr>
		</c:when>
		<c:otherwise>

			<c:forEach items="${list}" var="forestDTO">
				<li>
				<div class="data" style="width: 100%;border-radius: 50px;" align="center">
					
					<div class = "list_img">
					<input type="hidden" name="forestNo" value="${forestDTO.forestNo}" id="no">
					<c:if test="${!empty forestDTO.forestFilename }" >
              		<img class="image" style="width: 100%; height: 100%;border-radius: 50px;"
              			src="${path}/resources/images/forestImg/${forestDTO.forestFilename}.jpg">
              		</c:if>
	          		<c:if test="${empty forestDTO.forestFilename }" >
			          <img class="imagenone" src="https://upload.wikimedia.org/wikipedia/commons/6/6c/No_image_3x4.svg">
			        </c:if>
						
					</div>
					
					
					<div class = "list_content">
						<input type="hidden" name="forestNo" value="${forestDTO.forestNo}" id="no">
						<%-- <img src="${path}/views/forest/save/${forestDTO.forestFileName}"> --%>
						<h1>${forestDTO.forestName}</h1>
						<h3>${forestDTO.forestType}</h3>
						<br>
						<div style="font-weight: bold">${forestDTO.forestAddr}</div>
						<br>
						<div style="font-weight: bold">${forestDTO.forestTel}</div>
						<br>
						<div style="font-weight: bold; width: 100px;">
						  <a href="${forestDTO.forestUrl}">
						    <i class='fas fa-home' style="color: red;"></i> 홈페이지로이동
						  </a>
						</div>
					
					</div>
					<div class="list_Btn">
					<button class="btn btn-2 btn-2i icon-heart" style="font-size: 70px;">♥</button>
					</div>
				</div>
					
				</li>
			</c:forEach>
			
		</c:otherwise>
	</c:choose>
</ul>

</body>
</html>