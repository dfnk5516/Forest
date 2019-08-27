<%-- <%@ include file="../include/topcontent.jsp"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<hmtl>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var checkResultId="";		
		$("#writeForm").submit(function() {			
			if($("#writeForm :input[name=userId]").val().trim()=="") {
				alert("아이디를 입력하세요");				
				return false;
			}
			if($("#writeForm :input[name=userPwd]").val().trim()==""){
				alert("비밀번호를 입력하세요");				
				return false;
			}
			if($("#writeForm :input[name=userName]").val().trim()==""){
				alert("사용자 이름을 입력하세요");				
				return false;
			}
			if($("#writeForm :input[name=userEmail]").val().trim()==""){
				alert("이메일 주소를 입력하세요");				
				return false;
			}
			if($("#writeForm :input[name=userTel]").val().trim()==""){
				alert("연락처를 입력하세요");				
				return false;
			}
			if($("#writeForm :input[name=userAddr]").val().trim()==""){
				alert("주소를 입력하세요");				
				return false;
			}	
			if(checkResultId==""){
				alert("아이디 중복확인을 하세요");
				return false;
			}
		});//submit
			
			//아이디 체크
			$("#writeForm input[name=userId]").keyup(function() {
				var id=$(this).val().trim();
				if(id.length < 4 || id.length > 15){
					$("#idCheckView").html(" id는 4자 ~ 15자까지 등록가능합니다. ^^ ").css("background","pink");
					checkResultId="";
					return;
				}
				
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/idcheckAjax",
					data:"${_csrf.parameterName}=${_csrf.token}&id="+id,
					success:function(count){		
						console.log()
						if(count=="ok") {
						$("#idCheckView").html("  " + id + " ID 는 사용하실 수 있습니다. ").css("background","skyblue");
							checkResultId = id;
						}else{						
							$("#idCheckView").html("  " + id + " ID 는 사용하실 수 없습니다. ").css("background","yellow");		
							checkResultId = "";
						}					
					}//callback			
				});//ajax
			}); //keyup

</script>

</head>
<BODY>
<sec:authorize access="isAuthenticated()">
<div style=" vertical-align: middle;">
<form style="margin-top: 50px; margin-bottom: 30px" id="writeForm" name="writeForm" method="post" action="${pageContext.request.contextPath}/admin/insert">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<table align="center" cellpadding="5" cellspacing="2" width="600" border="1" >
	    <tr>
	        <td width="1220" height="20" colspan="2" bgcolor="#98b189">
	            <p align="center"><font color="white" size="3"><b> 사용자 정보 등록 </b></font></p>
	        </td>
	    </tr>
	    <tr>
	        <td width="150" height="20" >
	            <p align="right"><b><span style="font-size:9pt;">사용자 아이디</span></b></p>
	        </td>
	        <td width="450" height="20"><b><span id="idCheckView" style="font-size:9pt;">
			<input type=text name="userId" size="30"></span></b></td>
	    </tr>
	    <tr>
	        <td width="150" height="20">
	            <p align="right"><b><span style="font-size:9pt;">비밀번호</span></b></p>
	        </td>
	        <td width="450" height="20"><b><span style="font-size:9pt;">
			<input type=text name="userPwd" size="30">(글 수정, 삭제시 필요합니다.)</span></b></td>
	    </tr>
	    <tr>
	        <td width="150" height="20">
	            <p align="right"><b><span style="font-size:9pt;">사용자 이름</span></b></p>
	        </td>
	        <td width="450" height="20" ><b><span style="font-size:9pt;">
			<input type=text name="userName" size="50"></span></b></td>
	    </tr>
	    <tr>
	        <td width="150" height="20">
	            <p align="right"><b><span style="font-size:9pt;">이메일</span></b></p>
	        </td>
	        <td width="450" height="20"><b><span style="font-size:9pt;">
			<input name="userEmail" cols="50" rows="10"></span></b></td>
	    </tr>
	    <tr>
	        <td width="150" height="20">
	            <p align="right"><b><span style="font-size:9pt;">연락처</span></b></p>
	        </td>
	        <td width="450" height="20"><b><span style="font-size:9pt;">
			<input name="userTel" cols="50" rows="10"></span></b></td>
	    </tr>
	    <tr>
	        <td width="150" height="20">
	            <p align="right"><b><span style="font-size:9pt;">주소</span></b></p>
	        </td>
	        <td width="450" height="20"><b><span style="font-size:9pt;">
			<input name="userTel" cols="50" rows="10"></span></b></td>
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
	        <input type=submit value=글쓰기>
	        <input type=reset value=다시쓰기></span></b></td>
	    </tr>	    
	</table>
</form>
</div>
<hr>
<div align=right><span style="font-size:13pt;">&lt;<a href="${pageContext.request.contextPath}/admin/list">리스트로 돌아가기</a>&gt;</span></div>
<span style="font-size:13pt;">&lt;<a href="${pageContext.request.contextPath}/hometest">홈페이지로 가기</a>&gt;</span>
</sec:authorize>
</BODY>
</HTML>
