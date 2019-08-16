<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="css/style.css">

<div style="text-align:center">
<form method="post" action="${pageContext.request.contextPath}/list">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<select name="option">
	<option value="all">제목+내용</option>
	<option value="title">제목</option>
	<option value="content">내용</option>
	</select>
	<input type="text" size="50" placeholder="검색창(제목,내용)" value="${map.keyWord}" name="keyWord">
	<input type="submit" value="검색">
</form>
</div>
<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">
<caption>자주하는 질문</caption>
	<colgroup>
		<col width="15%"/>
		<col width="30%"/>
		<col width="16%"/>
		<col width="16%"/>
		<col width="7%"/>
		<col width="7%"/>
	</colgroup>
	<tr>
        <td bgcolor="#00cc00">
            <p align="center">
            <font color="white"><b><span style="font-size:9pt;">번호</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">아이디</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">제목</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">내용</span></b></font></p>
        </td>
        
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">이미지</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">작성일</span></b></font></p>
        </td>
    </tr>
    <c:choose>
    <c:when test="${empty map.list}">
	<tr>
        <td colspan="5">
            <p align="center"><b><span style="font-size:9pt;">없습니다.</span></b></p>
        </td>
    </tr>
    </c:when>
    <c:otherwise>
	<c:forEach items="${map.list}" var="faqDto">
		    <tr onmouseover="this.style.background='#eaeaea'" onmouseout="this.style.background='white'">
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">${faqDto.faqNo}</span></p>
		        </td>
		        <td bgcolor="">
					<p><span style="font-size:9pt;">${faqDto.faqId}</span></p>
		        </td>
		        
		        <td bgcolor="">
		            <p><span style="font-size:9pt;">${faqDto.faqTitle}</span></p>
		        </td>
		        <td bgcolor="">
		            <p><span style="font-size:9pt;">${faqDto.faqContent}</span></p>
		        </td>
		         
		         <td bgcolor="">
		            <p><span style="font-size:9pt;">${faqDto.faqImg}</span></p>
		        </td>
		         <td bgcolor="">
		            <p><span style="font-size:9pt;">${faqDto.faqDate}</span></p>
		        </td>
		    </tr>
    </c:forEach>
	</c:otherwise>
    </c:choose>
</table>











