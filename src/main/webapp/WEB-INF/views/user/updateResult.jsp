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
	#memopd {
		color: white; text-align: center; background-color:#b4d5dc; height: 100px; line-height: 50px; 
		margin: 130px 420px; font-size: 15px; font-weight: 700; border-radius: 5px; border:none; cursor:pointer; 
		}
	#update {font-weight: 200; text-align: center; width: 320px; height: 30px; margin: 5px 30px; }
	img{vertical-align: middle; margin-top:200px; margin-left: 750px; size: 30%}
	#icon{width: 5%; height: 5%;}
	<%-- updatebtn에서 뺀 것 
	width:auto;
	
	
	--%>

</style>
</head>
<body>
	<%-- spring security custom tag를 사용하기 위한 선언 --%>
	
	<img src="/controller/resources/images/icons/myinfoupdate.png" id="icon">  
	<div id="memopd">
		<sec:authentication property="principal.userName" />님 회원정보 수정되었습니다.<br>
		<a href="${pageContext.request.contextPath}/hometest"> 메인 화면으로 이동하기 </a>
	</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>