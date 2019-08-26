<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"/>
<SCRIPT type="text/javascript">
$(function(){
	$("#test").click(function(){
		alert( $("#userId").val() );
	})
})
	function checkValid() {
		var change = window.document.updateForm;
		if (change.userName.value == "") {
			alert("수정할 회원이름을 입력해 주세요.");
			change.userName.focus();
			return false;
		}
		if (change.userGrade.value == "") {
	        alert("수정할 등급을 입력해 주세요");
	        change.userGrade.focus();
	        return false;
	    }
	    return true;
	}
</script>
</head>
<body>
	<form name="updateForm" method="post" action="${pageContext.request.contextPath}/admin/update" 
 	 style="margin-top: 100px;">
	    <!-- action="${pageContext.request.contextPath}/admin/update?${_csrf.parameterName}=${_csrf.token}" -->
	    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- post 방식, name과 token 넘겨줘야 된다. -->
		<input type = hidden name = "userId" value = "${userDTO.userId}" id="userId">
		
		<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
	    <tr>
	        <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
	            <p align="center"><font color="white" size="3"><b>회원정보 수정하기</b></font></p>
	        </td>
	    </tr>
	    <tr>
	        <td width="150" height="20">
	            <p align="right"><b><span style="font-size:9pt;">회원이름 </span></b></p>
	        </td>
	        <td width="450" height="20"><b><span style="font-size:9pt;">
			<input type=text name="userName" size="30" value="${userDTO.userName}"></span></b></td>
	    </tr>
	    <tr>
	        <td width="150" height="20">
	            <p align="right"><b><span style="font-size:9pt;">등급 및 권한</span></b></p>
	        </td>
	        <td width="450" height="20"><b><span style="font-size:9pt;">
				<input type="radio" value="0" name="userGrade" checked = "checked">ROLE_MEMBER
				<input type="radio" value="1" name="userGrade">ROLE_ADMIN </span></b>
			</td>
	    </tr>
	    <tr>
	        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;">
	        	<input type="button" value="test" id="test">
				<input type="submit" value="수정하기">
				<input type="reset" value="다시쓰기"></span></b>
			</td>
	    </tr>
		</table>
	</form>
<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/admin/list">리스트로 돌아가기</a>&gt;</span></div>
<span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/hometest">홈페이지로 가기</a>&gt;</span>
</body>
</html>