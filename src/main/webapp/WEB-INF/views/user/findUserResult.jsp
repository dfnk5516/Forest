<%@ include file="../include/topcontent.jsp"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<b> User Information <br>
	<td>
		<tr>ID</tr>
		<tr>${userDTO.userId}</tr><br>
	</td>
	<td>
		<tr>NAME</tr>
		<tr>${userDTO.userName}</tr><br>
	</td>
	<td>
		<tr>ADDRESS</tr>
		<tr>${userDTO.userAddr}</tr><br>
	</td>
</body>
</html>
<%@ include file="../include/footer.jsp"%>