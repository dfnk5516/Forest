<%@ include file="topcontent.jsp"%>
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
	}
	div[id = "content"]{line-height : 0; padding : 0; margin : 0; font-size : 0;}
	div[class = "containerDiv"]{ line-height : 0px; font-size : 0px}
	input[type="radio"]{margin : 0px; border : 0px; padding : 0px;}
</style>
</head>
<body onload = "formInit()">

<!-- Main -->
	<div id="main" class="wrapper style2">
		<!-- Content -->
		<div id="content" class="container">
			<section>
				<div id = "containerDiv1" style = "vertical-align : top; width : 15%; display : inline-block; " >
					<img src = "${pageContext.request.contextPath}/resources/images/redMarker.png" style = "width : 100%; height : 100%">
				</div>
				
				
				<div id = "containerDiv2" style = "vertical-align : top; width : 70%; display : inline-block; height : 500px">
					<%-- <img src = "${pageContext.request.contextPath}/resources/images/rest.jpg" style = "width : 100%; height : 500px"> --%>
					<div style="background-color: aqua; width : 100%; height: 10%; text-align : center">
						<input type="radio" name="writeType" id="write1" >관광지
						<input type="radio" name="writeType" id="write2" >행사				
					</div>	
					
					<div style="background-color : #CCCCCC; height: 90%">
						<div style="display: inline-block; background-color: green; width: 50%; height: 100%">
							<div style="width: 100%; height: 20%; background-color:maroon; ">
							</div>
							<div style="width: 100%; height: 80%; background-color: #555555;">
								<div style="width: 25%; height: 100%; display: inline-block; background-color: orange;">
								</div>
								
								<div style="width: 75%; height: 100%; display: inline-block; background-color: olive;">
								</div>
							</div>
						</div>
						
						<div style="display: inline-block; background-color: lime; width: 50%; height: 100%">
							<div style="width: 100%; height: 20%; background-color:maroon; ">
							</div>
							<div style="width: 100%; height: 80%; background-color: #555555;">
								<div style="width: 25%; height: 100%; display: inline-block; background-color: orange;">
								</div>
								
								<div style="width: 75%; height: 100%; display: inline-block; background-color: olive;">
								</div>
							</div>
						</div>
					</div>
					
					
				</div>
				
				
				<div id = "containerDiv3" style = "vertical-align : top; width : 15%; display : inline-block;">
					<img src = "${pageContext.request.contextPath}/resources/images/redMarker.png" style = "width : 100%; height : 100%">
				</div>
			</section>
		</div>
	</div>

</body>
</html>
<%@ include file="footer.jsp"%>