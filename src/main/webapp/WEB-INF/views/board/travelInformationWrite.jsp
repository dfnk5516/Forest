<%@ include file="../include/topcontent.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function formInit()
	{
		var containerHeight = $("#containerDiv2").height();
		var containerDivs = document.getElementsByName("#containerDiv2");
		$("#containerDiv1").height(containerHeight);
		$("#containerDiv3").height(containerHeight);
	}
</script>
<style type="text/css">
	div[id = "main"]
	{
		margin : 0;
		padding : 0;
		border:0;
		background : #F2F2F2;
		width : 100%;
		
	}
	section[id = "content"]{font-size : 0px; line-height : 0px5}
	
</style>
</head>
<body onload = "formInit()">

<!-- Main -->
	<div id="main" class="wrapper style2">
		<!-- Content -->
		<section id = "content">
			<div id = "containerDivs">
				<div id = "containerDiv1" style = "vertical-align : top; width : 15%; display : inline-block; " >
					<img src = "${pageContext.request.contextPath}/resources/images/redMarker.png" style = "width : 100%; height : 100%">
				</div>
				
				
				<div id = "containerDiv2" style = "vertical-align : top; width : 70%; display : inline-block; height : 500px">
					<%-- <img src = "${pageContext.request.contextPath}/resources/images/rest.jpg" style = "width : 100%; height : 500px"> --%>
					<div style="background-color: aqua; width : 100%; height: 10%; text-align : center; font-size : 20px;">
						<input type="radio" name="writeType" id="write1" >관광지
						<input type="radio" name="writeType" id="write2" >행사				
					</div>	
					
					<div style="background-color : #CCCCCC; height: 90%; vertical-align : top; ">
						<div style="display: inline-block;vertical-align : top; background-color: green; width: 50%; height: 100%">
							
						</div>
						
						<div style="display: inline-block;  background-color: lime;  width: 50%; height: 100%">
							<table cellpadding="0" cellspacing="0" border="1" width="100%" height="100%" bgcolor="red"> 
								<tr style="height: 20%; width: 100%; background-color: blue">
									<td style="font-size: 20px; line-height: 20px; height: 20%; width: 80%; vertical-align: middle;">
										광광머시기
									</td>
									<td style="font-size: 20px; line-height: 20px; height: 20%; width: 20%; vertical-align: middle;font-size: 0px;line-height: 0px; margin: 0; padding: 0">
										<input type="button" value="등록" style="width: 100%;height: 30%; font-size: 11px; line-height: 11px">
										<input type="button" value="수정" style="width: 100%;height: 30%;  font-size: 11px;line-height: 11px">
										<input type="button" value="삭제" style="width: 100%;height: 30%; font-size: 11px;line-height: 11px">
									</td>
								</tr>
								
								<tr style="height: 80%; width: 100%">
								</tr>
							</table>
						</div>
					</div>
					
					
				</div>
				
				
				<div id = "containerDiv3" style = "vertical-align : top; width : 15%; display : inline-block;">
					<img src = "${pageContext.request.contextPath}/resources/images/redMarker.png" style = "width : 100%; height : 100%">
				</div>
			</div>
		</section>
	</div>

</body>
</html>
<%@ include file="../include/footer.jsp"%>