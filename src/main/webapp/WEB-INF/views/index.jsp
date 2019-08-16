<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>For Rest</title>
	<link href="https://fonts.googleapis.com/css?family=Archivo+Black" rel="stylesheet">
	<style>
	.entry{
		width:100%;
		height:80%;
		background-image: url('${pageContext.request.contextPath}/resources/images/background.jpg');
		background-repeat: no-repeat;
		}
	h1.title{
		font-size: 50px;
		text-shadow: 1px 1px 2px #D7E4EF; 
		color : white; 
		padding-top:200px;
		padding-left:50px; 
		text-align : left;
		font-family: 'Archivo Black', sans-serif;
		}
	a{
		font-size: 50px;
		text-shadow: 1px 1px 2px #D7E4EF; 
		color : #E7EFD7; 
		padding-top:200px;
		padding-left:50px; 
		text-align : left;
		font-family: 'Archivo Black', sans-serif;
		text-decoration: none;
	}	
	</style>
</head>
<body>
	<div class="entry">
		<h1 class="title"> For your best rest place </h1>
		<a href="${pageContext.request.contextPath}/hometest"> For Rest </a>
	</div>
</body>
</html>
