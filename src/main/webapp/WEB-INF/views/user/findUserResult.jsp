<%@ include file="../include/topcontent.jsp"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	img{vertical-align: middle;}
	#icon{width: 5%; height: 5%; display: inline-block; padding: 50px 0px 70px 0px}
	#sub{padding:100px 0px; text-align: center; background: #fff; vertical-align: middle;}
</style>
</head>
<body>
	<div id="sub" >
		<h2> 나의 가입된 정보 보기 </h2><br>
		<table style="margin: 0 auto; text-align: left; font-size: 20px">
			<tr>
				<th>ID : </th>
				<td style="padding-left: 30px">${userDTO.userId}</td>
			</tr>
			<tr>
				<th>이름 : </th>
				<td style="padding-left: 30px">${userDTO.userName}</td>
			</tr>
			<tr>
				<th>이메일 : </th>
				<td style="padding-left: 30px">${userDTO.userEmail}</td>
			</tr>
			<tr>
				<th>연락처 : </th>
				<td style="padding-left: 30px">${userDTO.userTel}</td>
			</tr>

			<tr>
				<td>주소 : </td>
				<td style="padding-left: 30px">${userDTO.userAddr}</td>
			</tr>
			<img src="/controller/resources/images/icons/trip.png" id="icon">
		</table>
	</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>