<%-- <%@ include file="../include/topcontent.jsp"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
<link rel="stylesheet" href="css/style.css">
<script language = javascript>
	function sendUpdate() {
		/* 이건 form 에서 get방식으로 보낼 때 사용 
		document.requestForm.action ="${pageContext.request.contextPath}/admin/updateForm?userId="+document.getElementById("userId").value; */
		document.requestForm.action ="${pageContext.request.contextPath}/admin/updateForm";
		document.requestForm.submit();
	}
	
	function sendDelete() {
		var userPwd = prompt("삭제할 회원의 비밀번호를 입력하세요"); //
		if(userPwd){
			document.requestForm.action="${pageContext.request.contextPath}/admin/delete";
			document.requestForm.userPwd.value = userPwd;
			document.requestForm.submit();
		}
		else{
			return false;
		}
	}
</script>

</head>

<table align="center" cellpadding="5" cellspacing="2" width="600" border='1' style="margin-top: 150px; margin-bottom: 200px">
	<tr>
		<td width="1220" height="40" colspan="4" bgcolor="#98b189">
			<p align="center">
				<font color="white" size="3"><b> 회원정보 자세히보기 </b></font>
			</p>
		</td>
	</tr>
	<tr>
		<td width="120" height="40">
			<p align="center">
				<b><span style="font-size: 9pt;">회원 아이디</span></b>
			</p>
		</td>
		<td width="450" height="3" colspan="3">
			<span style="font-size: 9pt;"><b>${user.userId}</b></span>
		</td>
	</tr>
	<tr>
		<td width="120" height="40">
			<p align="center">
				<b><span style="font-size: 9pt;">가입일</span></b>
			</p>
		</td>
		<td width="300" height="40"><span style="font-size: 9pt;"><b>${requestScope.user.userEnroll}</b></span>
		</td>
	</tr>
	<tr>
		<td width="120" height="40">
			<p align="center">
				<b><span style="font-size: 9pt;">회원 이름</span></b>
			</p>
		</td>
		<td width="450" height="40" colspan="3"><span
			style="font-size: 9pt;"><b>${requestScope.user.userName}</b></span>
		</td>
	</tr>
	<tr>
		<td width="120" height="40" valign="top">
			<p align="center">
				<b><span style="font-size: 9pt;"> 회원 등급 </span></b>
			</p>
		</td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
		<td width="450" height="40" valign="top" colspan="3">
		<span style="font-size: 9pt;"><b><pre>${requestScope.user.userGrade}</pre></b></span></td>
	</tr>

	<tr>
		<td height="20" colspan="4" align="center" valign="middle">
			<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
			<form name = "requestForm" method = post>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- post 방식, name과 token 넘겨줘야 된다. -->
				<input type = hidden name = "userId" value = "${user.userId}" id="userId">
				<input type = hidden name = "userPwd" value = "${user.userPwd}">
				<input type = button value = "수정하기" onClick = "sendUpdate()"> 
				<input type = button value = "삭제하기" onClick = "sendDelete()">
			</form>
		</td>
	</tr>
</table>
<hr>
<div align=right><span style="font-size:13pt;">&lt;<a href="${pageContext.request.contextPath}/admin/list">리스트로 돌아가기</a>&gt;</span></div>
<span style="font-size:13pt;">&lt;<a href="${pageContext.request.contextPath}/hometest">홈페이지로 가기</a>&gt;</span>
<%-- <%@ include file="../include/footer.jsp"%> --%>







