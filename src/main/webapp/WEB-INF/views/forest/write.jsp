
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	$("#cancleBtn").click(function(){
		history.back();
	})
}) 	
</SCRIPT>
<style type="text/css">
#writeTable th{
	background-color: black;
	color: white;
}
#writeTable td{
	background-color: white;
}

</style>

</HEAD>
<BODY>
<%@ include file="background.jsp" %>
<div id="back">
<div style="margin:20px 20px;margin-top: 40px; text-align:center;">
<span style="vertical-align: middle;  font-size: 60px; text-shadow:3px 3px gray; color: black!important; font-family: cursive!important;">
		휴양림 정보 등록</span></div>
<form name="writeForm" method="post" action="${pageContext.request.contextPath}/forest/insert?${_csrf.parameterName}=${_csrf.token}" 
 enctype="multipart/form-data" >

<table align="center" cellpadding="5" cellspacing="2" width="600" border="1" id="writeTable" >
  	<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
    
    <tr>
        <th width="150" height="20" >
            <p align="right"><b><span style="font-size:12pt;">휴양림이름</span></b></p>
        </th>
        <td width="450" height="20"><b><span style="font-size:12pt;">
		<input type=text name="forestName" size="30"></span></b></td>
    </tr>
    <tr>
        <th width="150" height="20" >
            <p align="right"><b><span style="font-size:12pt;">휴양림유형</span></b></p>
        </th>
        <td width="450" height="20"><b><span style="font-size:12pt;">
		<input type=text name="forestType" size="30"></span></b></td>
    </tr>
    <tr>
        <th width="150" height="20">
            <p align="right"><b><span style="font-size:12pt;">주요 시설</span></b></p>
        </th>
        <td width="450" height="20"><b><span style="font-size:12pt;">
		<textarea rows="4" name="forestFacil" size="30"></textarea></span></b></td>
    </tr>

    <tr>
        <th width="150" height="20">
            <p align="right"><b><span style="font-size:12pt;">휴양림 주소</span></b></p>
        </th>
        <td width="450" height="20"><b><span style="font-size:12pt;">
		<input type=text name="forestAddr" size="30"></span></b></td>
    </tr>
    <tr>
        <th width="150" height="20">
            <p align="right"><b><span style="font-size:12pt;">휴양림전화번호</span></b></p>
        </th>
        <td width="450" height="20" ><b><span style="font-size:12pt;">
		<input type=text name="forestTel" size="30"></span></b></td>
    </tr>
    
    <tr>
        <th width="150" height="20">
            <p align="right"><b><span style="font-size:12pt;">지역</span></b></p>
        </th>
        <td width="450" height="20" ><b><span style="font-size:12pt;">
		<input type=text name="city" size="30"></span></b></td>
    </tr>
    
    <tr>
        <th width="150" height="20">
            <p align="right"><b><span style="font-size:12pt;">휴양림이미지 파일</span></b></p>
        </th>
        <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        		 <input type="file" name="forestFile" maxlength="60" size="40">
        	   </span></b>
        </td>
    </tr>
    
    <tr>
        <th width="150" height="20">
            <p align="right"><b><span style="font-size:12pt;">작성자</span></b></p>
        </th>
        <td width="450" height="20" ><b><span style="font-size:12pt;">
		<input type=text name="forestWriter" size="30"></span></b></td>
    </tr>
    
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;"><input type=submit value=등록하기> 
        <input type=reset value=초기화>
        <input type="button" value="취소" id="cancleBtn"></span></b></td>
    </tr>
</table>

</form>

<hr>
</div>

<%@ include file="../include/footer.jsp" %>
</BODY>