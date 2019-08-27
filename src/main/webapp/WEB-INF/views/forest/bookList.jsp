<%@ include file="../include/topcontent.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
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

#forestList li {
	width: 50%;
	float: left;
	list-style: none;
	padding: 10px;
	height: 220px;
}

a {
	text-decoration: none !important;
}

#forestList:after {
	content: '';
	display:block;
	clear:both;
}

#forestList {
    width: 100%;
    height: auto;
    padding: 0;
}
.pagination {
	margin-left: 45%;
	font-size: large;
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
		var bookCode=$(this).find("[name=bookCode]").val();
		location="${pageContext.request.contextPath}/forest/bookDetail/"+bookCode;
		/* +"&page=${cri.page}" // 페이지 전달한다.
		+"&perPageNum=${cri.perPageNum}"
		; */ // 페이지 당 글수 전달
	});
	
	$("#listBtn").click(function(){
		location="${pageContext.request.contextPath}/forest/list";
	})
	
	$("#homeBtn").click(function(){
		location="${pageContext.request.contextPath}/hometest";
	})
})
</script>

	

</head>
<body>

<%@ include file="background.jsp" %>
<div id="back" style="padding: 100px 0;">


<c:set var="path" value="${pageContext.request.contextPath}" scope="application"/>
<span style="vertical-align: middle; font-size: 50px; padding-top: 25px;text-shadow:2px 2px gray; padding-left: 50px;color: black!important; font-family: cursive!important;">
<i class="fa fa-tree" style="font-size:50px; text-shadow:2px 2px gray; color: green"></i>&nbsp;휴양림 및 숙박 예약목록</span>
<ul id="forestList">
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

			<c:forEach items="${list}" var="bookingDTO">
				<li>
				<div class="data" style="width: 100%;border-radius: 50px; " align="center">
					
					<div class = "list_img">
					<input type="hidden" name="bookCode" value="${bookingDTO.bookCode}" id="no">
					<c:if test="${!empty bookingDTO.forestFilename }" >
              		<img class="image" style="width: 100%; height: 100%;border-radius: 50px;"
              			src="${path}/resources/images/forestImg/${bookingDTO.forestFilename}.jpg">
              		</c:if>
	          		<c:if test="${empty bookingDTO.forestFilename }" >
			          <img class="imagenone" src="https://upload.wikimedia.org/wikipedia/commons/6/6c/No_image_3x4.svg">
			        </c:if>
						
					</div>
					
					
					<div class = "list_content">
						<input type="hidden" name="bookCode" value="${bookingDTO.bookCode}">
						<%-- <img src="${path}/views/forest/save/${forestDTO.forestFileName}"> --%>
						<h1>${bookingDTO.forestName}</h1>
						<h3>${bookingDTO.forestType}</h3>
						<br>
						<div style="font-weight: bold; font-size: 15px;">${bookingDTO.forestAddr}</div>
						<br>
						<div style="font-weight: bold">${bookingDTO.forestTel}</div>
						<br>
						<div style="font-weight: bold; width: 100px;">
						  <a href="${bookingDTO.forestUrl}">
						    <i class='fas fa-home' style="color: red;"></i> 홈페이지로이동
						  </a>
						</div>
					
					</div>
				</div>
				
				</li>
			</c:forEach>
			
		</c:otherwise>
	</c:choose>
</ul>
<div style="text-align: right;">
<button type="button" class="btn btn-info" id="listBtn" style="font-size:large;">
	휴양림목록
</button>
            <button type="button" class="btn btn-warning" id="homeBtn" style="font-size:large;">
	홈으로
</button>
</div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>