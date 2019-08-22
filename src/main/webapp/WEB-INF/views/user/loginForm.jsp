<%@ include file="../include/topcontent.jsp"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.login{padding:100px 0;text-align: center;background: #fff;}
	img{vertical-align: middle;}
	h5{margin-left:5px; display:inline-block; vertical-align: middle;}
	table{margin:0 auto;}
	table td{padding:10px!important;text-align:left;vertical-align: middle;}
	#loginbtn {
		color: white; text-align: center; background-color:#79c0d2; width:auto; min-width: 140px; height: 50px; 
		font-size: 15px; font-weight: 700; border-radius: 5px; border:none; cursor:pointer; float: left;}
	#contbox {font-weight: 200; text-align: center; width: 220px; height: 30px; margin-left: 20px;}	
	#icon{width: 2%; height: 2%; }
</style>
</head>
<body>
	<div class="login">
		<h2>로그인</h2>
		<hr>
		<img src="/controller/resources/images/icons/login.png" id="icon"><h5>로그인 하시고 다양한 서비스를 이용해보세요.</h5>
		<c:if test="${not empty requestScope.errorMessage}">
			<span style="color:red">${requestScope.errorMessage}</span>
		</c:if>
		<!--j_spring_security_check의 기본값은 login  -->
		<form action="${pageContext.request.contextPath}/board/hometest" method="post" id="logstyle"> <!-- /j_spring_security_check ==> /login -->
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<table style="width:350px">
				<tr>
					<td width="70px" >ID</td>
					<td><input type="text" name="userId" size="30" placeholder="아이디를 입력해주세요." id="contbox"></td>
					<td rowspan="2"><input type="submit" value="로그인" id="loginbtn"></td>
				</tr>
				<tr>
					<td>PASSWORD</td>
					<td><input type="password" name="userPwd" size="30"  placeholder="비밀번호를 입력해주세요." id="contbox"></td>
				</tr>
			</table>
			<hr>
		</form>
	</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>