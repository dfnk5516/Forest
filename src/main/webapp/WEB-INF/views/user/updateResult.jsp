<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- spring security custom tag를 사용하기 위한 선언 --%>
	<sec:authentication property="principal.userName" />님 회원정보 수정되었습니다.
	<a href="${pageContext.request.contextPath}/hometest"> 메인 화면으로 이동하기 </a>
</body>
</html>