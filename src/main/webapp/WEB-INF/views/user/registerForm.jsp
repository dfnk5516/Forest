<%@ include file="../include/topcontent.jsp"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style type="text/css">	
	.register{padding:100px 0; text-align: center; background: #fff;}
	/* .register input{width: 200px} */
	img{vertical-align: middle;}
	h2{margin-bottom: 30p;}
	h5{margin-left:5px; display:inline-block; vertical-align: middle;}
	table{margin:0 auto;}
	table td{padding:10px!important; padding-left:30px; text-align:left; vertical-align: middle;}
	/* table:first-child{margin-left: 20px;} */
	#signupbtn {
		color: white; text-align: center; background-color:#79c0d2; width:auto; min-width: 120px; height: 80px; line-height: 50px; 
		margin: 20px 100px; font-size: 15px; font-weight: 700; border-radius: 5px; border:none; cursor:pointer; float: left;}
	#text {font-weight: 200; text-align: center; width: 350px; height: 30px; margin: 5px 30px; }
	#icon{width: 2%; height: 2%; display: inline-block; }
	
	
</style>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var checkResultId="";		
	$("#regForm").submit(function() {			
		if($("#regForm :input[name=userId]").val().trim()=="") {
			alert("아이디를 입력하세요");				
			return false;
		}
		if($("#regForm :input[name=userPwd]").val().trim()==""){
			alert("패스워드를 입력하세요");				
			return false;
		}
		if($("#regForm :input[name=userName]").val().trim()==""){
			alert("이름을 입력하세요");				
			return false;
		}
		if($("#regForm :input[name=userEmail]").val().trim()==""){
			alert("이메일 주소를 입력하세요");				
			return false;
		}
		if($("#regForm :input[name=userTel]").val().trim()==""){
			alert("연락처를 입력하세요");				
			return false;
		}
		if($("#regForm :input[name=userAddr]").val().trim()==""){
			alert("주소를 입력하세요");				
			return false;
		}	
		if(checkResultId==""){
			alert("아이디 중복확인을 하세요");
			return false;
		}		
	});//submit
	
	
	//아이디 체크
	$("#regForm input[name=userId]").keyup(function() {
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
	});//keyup
	
});//ready
</script>
</head>
<body>
	<div class="register">
	<h2>회원가입</h2>
	<img src="/controller/resources/images/icons/smile.png" id="icon">  
	<h5>회원 가입하시고 다양한 서비스를 이용해 보세요.</h5> 

	<hr>
	<p>
		<form method="post" action="${pageContext.request.contextPath}/registerUser" id="regForm">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	 
			<table style="width:700px">
				<tr>
					<td width="70px" >ID</td>
					<td><input type="text" name="userId" class="text"><span id="idCheckView"></span></td>
				</tr>
				<tr>
					<td>PASSWORD</td>
					<td><input type="password" name="userPwd" class="text"></td>
				</tr>
				<tr>
					<td>NAME</td>
					<td><input type="text" name="userName" class="text"></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="text" name="userEmail" class="text"></td>
				</tr>
				<tr>
					<td>Telephone</td>
					<td><input type="text" name="userTel" class="text"></td>
				</tr>
				<tr>
					<td>ADDRESS</td>
					<td> <input type="text" name="userAddr" class="text"></td>
				</tr>
				<tr>
					<td>USER TYPE</td>
					<td>
						<input type="radio" value="0" name="userGrade" checked = "checked">ROLE_MEMBER
						<input type="radio" value="1" name="userGrade">ROLE_ADMIN
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="회원 가입" id="signupbtn"></td>
				</tr>
			</table>
		</form>
	<div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>












