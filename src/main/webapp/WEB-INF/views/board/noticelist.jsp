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
<script>
/* 	//원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page){
		location.href="${pageContext.request.contextPath}/noticelist?curPage="+page+"&option=${map.option}"+"&keyWord=${map.keyWord}";
	} */
</script>
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
</head>
<body>
<h1 class="page-header" style="text-align:center;">공지사항</h1>
<div style="text-align:center">
<form method="post" action="${pageContext.request.contextPath}/noticelist">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<select name="option">
<option value="all" <c:out value="${map.option == 'all'?'selected':''}"/>>제목+내용</option>
<option value="title" <c:out value="${map.option == 'title'?'selected':''}"/>>제목</option>
<option value="content" <c:out value="${map.option == 'content'?'selected':''}"/>>내용</option>
</select>
<input type="text" size="50" placeholder="검색창(제목,내용)" value="${map.keyWord}" name="keyWord" style="display:inline; width:40%">
<input type="submit" value="검색">
</form>
</div>
         <%--  <div>총 ${map.count}개</div> --%>
<div class="panel panel-default">
	<div class="panel-heading">총게시글 </div>
	<div class="panel-body">
	<table class="table table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>첨부</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
	<c:choose>
	<c:when test="${empty map.list}">
		<tr>
			<td>
				<p align="center">
					<b><span style="font-size: 12pt;">등록된 글이 없습니다.</span></b>
				</p>
			</td>
		</tr>
	</c:when>
	<c:otherwise>
	<c:forEach items="${map.list}" var="noticeDTO">
		<tr class="notiecView" data-notice_no="${noticeDTO.noticeNo}" onmouseover="this.style.background='#eaeaea'" onmouseout="this.style.background='white'">
			<td bgcolor="">
			<p align="center"><span style="font-size:9pt;">${noticeDTO.noticeNo}</span></p>
			</td>
			<td bgcolor="">
			<p><span style="font-size:9pt;">${noticeDTO.noticeTitle}</span></p>
			</td>
			 <td bgcolor=""><img src="${pageContext.request.contextPath}/resources/images/bul_down.png">
			</td>
			 <td bgcolor="">
			<p><span style="font-size:9pt;">${noticeDTO.noticeDate}</span></p>
			</td>
			 <td bgcolor="">
			<p><span style="font-size:9pt;">${noticeDTO.noticeReadnum}</span></p>
			</td>
		</tr>
	</c:forEach>
	</c:otherwise>
	</c:choose>
	</tbody>
	</table>
	<button type="button" id="noticewrite"><span style="font-size:9pt;">등록</span></button>
	</div>
</div>
</body>
<script language=javascript>
$(document).ready().on('click', '.notiecView', function () {
	location.href = "${pageContext.request.contextPath}/noticeread?noticeNo=" + $(this).attr("data-notice_no");
	//document.requestForm.action ="${pageContext.request.contextPath}/notice/updateForm";
	//document.requestForm.submit();
}).on('click', '#noticewrite', function() {
	location.href = "${pageContext.request.contextPath}/noticewrite";
});
</script>
</html>
<%@ include file="../include/footer.jsp"%>
