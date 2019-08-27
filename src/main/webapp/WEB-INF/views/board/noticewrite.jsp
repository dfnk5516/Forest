<%@ include file="../include/topcontent.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<HTML>
<head>
<!-- <link rel="stylesheet" href="css/style.css"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>


<form name="writeForm" method="post" action="${pageContext.request.contextPath}/noticeinsert?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
	<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
	
	
	<table align="center" cellpadding="5" cellspacing="2" width="1000" border="1">
	    <tr>
	        <td width="1220" height="20" colspan="2" bgcolor="#COCOCO">
	            <p align="center"><font color="white" size="3"><b> 공지사항 </b></font></p>
	        </td>
	    </tr>
	    <tr>
	        <td width="150" height="20" >
	            <p align="right"><b><span style="font-size:9pt;">제목</span></b></p>
	        </td>
	        <td width="450" height="20"><b><span style="font-size:9pt;">
			<input type=text name="noticeTitle" size="96" value="${noticeDTO.noticeTitle}"></span></b></td>
	    </tr>
	    <tr>
	        <td width="150" height="20">
	            <p align="right"><b><span style="font-size:9pt;">내용</span></b></p>
	        </td>
	        <td width="450" height="20"><b><span style="font-size:9pt;">
			<textarea name="noticeContent" cols="100" rows="18">${noticeDTO.noticeContent}</textarea></span></b></td>
	    </tr>
	    
	     <tr>
	        <td width="150" height="20">
	            <p align="right"><b><span style="font-size:9pt;">*파일첨부</span></b></p>
	        </td>
	        <td width="450" height="20">
	        	<b><span style="font-size:9pt;">
	        		 <input type="file" name="file" maxlength="60" size="40">
	        	   </span></b>
	        </td>
	    </tr>
	    <tr>
	        <td width="450" height="20" colspan="2" align="center">
	        	<b>
	        <span style="font-size:9pt;">
	        			<button type="submit" id="noticeWrite">확인</button> 
	        			<button type="button" id="cancle">취소</button>
	        			<button type=reset>지우기</button>
	        			<button type="button" id="cancle">삭제</button>
	        		</span>
        		</b>
	        </td>
	    </tr>
	</table>
</form>
</body>
<script type="text/javascript">
function checkValid() {
	var validCheck = true,
		$form = $("form[name='Form']");
	
	// 제목
	if($form.find("input[name='noticeTitle']").val() === "") {
		alert("제목을 입력해주세요.");
		validCheck = false;
		$form.find("input[name='noticeTitle']").focus();
		return false;
	}
	
	// 내용
	if($form.find("input[name='noticeContent']").val() === "") {
		alert("내용을 입력해주세요.");
		validCheck = false;
		$form.find("input[name='noticeContent']").focus();
		return false;
	}
	
    return true;
}

/*
$(document).ready().on('click', '#noticeWrite', function () {
	if(checkValid()) $("form[name='writeForm']").submit();
}).on('click', '#cancle', function() {
	location.href = "${pageContext.request.contextPath}/noticelist";
});*/
$(document).ready().on('click', '#cancle', function() {
	location.href = "${pageContext.request.contextPath}/noticelist";
});
</script>
</html>
<%@ include file="../include/footer.jsp"%>