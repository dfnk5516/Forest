<%@ include file="../include/topcontent.jsp"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.info{padding:100px 0; text-align: center; background: #fff;}
</style>
<meta http-equiv=" Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {	
			$("#address").change(function() {				
				$("#userListView").empty();
				/* if($("#address").val()=="") {
					return;
				} */
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/findUserListByAddress",
					data:"${_csrf.parameterName}=${_csrf.token}&&address=" + $('#address').val(),
					dataType:"json",
					success:function(result) {
						
						 var data="<table border='1' cellpadding='5'>";
						 $.each(result, function(index, item) {
							data += "<tr>";
							data += "<td>" + item.userId + "</td>";
							data += "<td>" + item.userName + "</td>";
							data += "<td>" + item.userEmail + "</td>";
							data += "<td>" + item.userTel + "</td>";
							
							data += "</tr>";
						 }) 
						data += "</table>";
						
						$("#userListView").html(data);	
										
					}//function
				});//ajax
			});//click
		});//jquery
	</script>
</head>
<body>
<div id="info">
	<select id = "address">
		<option value="">=== 주소 ===</option>
		<c:forEach items="${list}" var="addr">
		<option value="${addr}">${addr}</option>
		</c:forEach>
	</select>  
	<br><br><br><br>
	<div id="userListView"></div>
</div>
	<%-- 주소를 선택하면 ajax 방식으로  div 영역에 테이블형식으로 아이디 이름을 보여준다 --%>
</body>
</html>
<%@ include file="../include/footer.jsp"%>