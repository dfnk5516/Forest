<%@ include file="../include/topcontent.jsp"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#myinfo{padding:100px 0; text-align: center; background: #fff; vertical-align: middle; }
	#sub{padding:100px 0; text-align: center; background: #fff; vertical-align: middle;}
	
</style>
</head>
<body>
	<div id="sub" >
		<h2> 나의 가입된 정보 보기 </h2><br>
		<table style="margin: 0 auto;">
			<tr>
				<th>ID : </th>
				<td>${userDTO.userId}</td>
			</tr>
			<tr>
				<th>이름 : </th>
				<td>${userDTO.userName}</td>
			</tr>
			<tr>
				<th>이메일 : </th>
				<td>${userDTO.userEmail}</td>
			</tr>
			<tr>
				<th>연락처 : </th>
				<td>${userDTO.userTel}</td>
			</tr>
			<tr>
				<td>주소 : </td>
				<td>${userDTO.userAddr}</td>
			</tr>
		</table>
	</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>