<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#findbtn {
		color: white; text-align: center; background-color:#79c0d2; width:auto; min-width: 100px; height: 50px; line-height: 50px; 
		margin: 10px 100px; font-size: 15px; font-weight: 700; border-radius: 5px; border:none; cursor:pointer; float: left; position: absolute;}
	#findinput {font-weight: 200; text-align: center; width: 220px; height: 30px; margin: 5px 30px;}
</style>
</head>
<body>
	<h2> User SEARCH USING ID </h2>
	<form action="${pageContext.request.contextPath}/user/findUser">
	<tr id="findinput">
		<td>ID</td>
		<td><input type="text" name="userId" id=""></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="search" id="findbtn"></td>
	</tr>
	</form>
</body>
</html>