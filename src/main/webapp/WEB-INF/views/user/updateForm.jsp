<%@ include file="../include/topcontent.jsp"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#myinfo{padding:50px 580px; background: #fff; }
	#updatebtn {
		color: white; text-align: center; background-color:#79c0d2; width:auto; min-width: 140px; height: 50px; line-height: 50px; 
		margin: 30px 120px; font-size: 15px; font-weight: 700; border-radius: 5px; border:none; cursor:pointer; float: left;}
	#update {font-weight: 200; text-align: center; width: 320px; height: 30px; margin: 5px 30px; }
	table tr:first-child td {width: 100px;}

</style>
</head>
<body>

<sec:authorize access="isAuthenticated()">
	<div id="myinfo" >
	<h2 style="text-align: center; margin-bottom: 30px" >회원정보수정</h2>
	<hr>
	<form method="post" action="${pageContext.request.contextPath}/updateUserAction">
		<input type="hidden" name="command" value="update">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<table style = "width:450px" >
			<tr>
				<td> 아이디 </td>
				<td><input type="text" name="userId" id="update" value="<sec:authentication property="principal.userId"/>" readonly></td>
			</tr>
			<tr>
				<td> 비밀번호 </td>
				<td><input type="text" name="userPwd" id="update" placeholder="변경할 비밀번호를 입력해주세요."></td>
			</tr>
			<tr>
				<td> 이름 </td>
				<td><input type="text" name="userName" id="update" value="<sec:authentication property="principal.userName"/>"></td>
			</tr>
			<tr>
				<td> 주소 </td>
				<td><input type="text" name="userAddr" id="update" value="<sec:authentication property="principal.userAddr"/>"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="회원정보수정" id="updatebtn"></td>
			</tr>
		</table>
	</form>
	</div>
</sec:authorize>
</body>
</html>
<%@ include file="../include/footer.jsp"%>