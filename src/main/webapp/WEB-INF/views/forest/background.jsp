<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

*{
	text-shadow: 1px 1px gray;
	
	font-weight: bold!important;
}

#back {
    position:relative;
    z-index:1;
}
#back:after {
    background-image:url(${pageContext.request.contextPath}/resources/images/forestImg/배경.jpg);
    top:0;
    left:0;
    position:absolute;
    background-size:100%;
    opacity:0.4!important;
    filter:alpha(opacity=50);
    z-index:-1;
    content:"";
    width:100%;
    height:100%;
}

</style>
</head>
<body>

</body>
</html>