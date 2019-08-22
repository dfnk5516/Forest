<%@ include file="../include/topcontent.jsp"%> 
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공 화면</title>
</head>
<body>
	<h2>${requestScope.userDTO.userName}님 가입을 축하드립니다.</h2> <!-- 회원가입을 한 다음에 보이는 화면, 바로 메인화면으로 가게 변경하기 -->
	<table style="width: 600px; border-bottom-width: 1px;" >
		<tr>
			<td width="100">ID</td>
			<td>${requestScope.userDTO.userId }</td> <!-- scope에 member가 있어야 된다는 얘긴데, 내가 member 객체 안 들고 가도 된다. parameter로 객체를 받으면 View 쪽으로 정보를 갖다준다.
			Model ===> model.으로 값 불러 올 수 있다. (MemberServiceImpl에서) -->
		</tr>
		<tr>
			<td>이름</td>
			<td>${requestScope.userDTO.userName}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${requestScope.userDTO.userEmail}</td>
		</tr>
		<tr>
			<td>연락처</td>
			<td>${requestScope.userDTO.userTel}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${requestScope.userDTO.userAddr}</td>
		</tr>
	</table>
	
	<a href="${pageContext.request.contextPath}/">메인으로</a>
</body>
<%@ include file="../include/footer.jsp"%>