<%@ include file="../include/topcontent.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
.data:hover {
	background: #f0f0f0;
	cursor: pointer;
}

ul li {
	width: 50%;
	float: left;
	list-style: none;
	padding: 10px;
}

ol li {
	color: black;
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
    width: 55%;
    display: inline-block;
}

.list_content {
    width: 44%;
    display: inline-block;
    vertical-align: middle;
    padding:0 10px;
}

div.data{
	padding:15px;	
}

div.data:after {
	content:'';
	display:block;
	clear:both;
}
</style>
<SCRIPT language=javascript>

</script>


</head>
<body>
 <h1 class="page-header" style="text-align:center;">공지사항</h1>
<div class="panel panel-default">
	<input type="hidden" id="noticeNo" value="${noticeDTO.noticeNo}" />
	<div class="panel-heading">
		<div style="text-align:center;"><div style=" font-size: 12pt;">${noticeDTO.noticeTitle}</div></div>
		<div style="text-align: right;"><div style=" font-size: 10pt;">등록일자 | ${noticeDTO.noticeDate}  조회수 | ${noticeDTO.noticeReadnum}</div></div>
	</div>
	<div class="panel-body">
		<span style="font-size:15pt;"><b>${noticeDTO.noticeContent}</b></span>
	</div>
</div>

<div align=right>
	<button type="button" id="noticeUpdate">수정하기</button>
	<button type="button" id="cancel">목록</button>
</div>
</body>
<script type="text/javascript">
$(document).ready().on('click', '#noticeUpdate', function () {
	location.href = "${pageContext.request.contextPath}/noticeupdateForm?noticeNo=" + $("#noticeNo").val();
}).on('click', '#cancel', function() {
	console.log("123");
	location.href = "${pageContext.request.contextPath}/noticelist";
});
</script>
</html>
<%@ include file="../include/footer.jsp"%>