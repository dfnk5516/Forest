<%@ include file="../include/topcontent.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1 style="color:green; font-size: 40px; text-align:center; margin-top:70px; margin-bottom:70px">1 : 1 문의 게시판</h1>
 <div align="center">
 <table align="center" cellpadding="5" cellspacing="2" width="60%" border='1'>
    <tr>
        <td width="1220" height="20" colspan="4" bgcolor="#457E3E">
            <p align="center"><font color="white" size="3"><b>
             질문 제목 : ${dto.qnaTitle}</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="100" height="40px" >
            <p align="center"><b><span style="font-size:12pt;">작성일</span></b></p>
        </td>
        <td width="300" height="40px">
        	<span style="font-size:12pt;"><b>${dto.writeDay}</b></span>
        </td>
        <td width="100" height="40px" >
			<p align="center"><b><span style="font-size:12pt;">작성자</span></b></p>
		</td>
        <td width="100" height="40px">
			<p><b><span style="font-size:12pt;"></span>${dto.userDTO.userName}</b></p>
		</td>
    </tr>
    <tr>
        <td width="100" height="40px" >
            <p align="center"><b><span style="font-size:12pt;">시설</span></b></p>
        </td>
        <td width="300" height="40px">
        	<span style="font-size:12pt;"><b>${dto.qnaPlace}</b></span>
        </td>
        <td width="100" height="40px" >
			<p align="center"><b><span style="font-size:12pt;">이메일</span></b></p>
		</td>
        <td width="100" height="40px">
			<p><b><span style="font-size:12pt;"></span>${dto.userDTO.userEmail}</b></p>
		</td>
    </tr>
    <tr>
		<td width="100 !important" height="100" valign="top">
            <p align="center"><b><span style="font-size:12pt;">질문 내용</span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450 !important" height="100" valign="top" colspan="3">
        <span style="font-size:12pt; white-space:normal;"><b><pre>${dto.qnaContent}</pre></b></span></td>
    </tr>
    
	 <c:choose>    
     	<c:when test="${dto.qnaAnswer==null}">
	       <tr>
		        <td width="100 !important" height="100">
		            <p align="center"><b><span style="font-size:12pt;">답변 내용</span></b></p>
		        </td>
		        <td width="450" height="100" colspan="3">
		        	<span style="font-size:12pt;"></span>
		  			<input type="text" style="font-size:12pt; height:90px; width:80%;" placeholder="답변을 입력해주세요">
		  			<input type="submit" style="font-size:12pt; height:90px; width:15%;">
		        </td>
	    	</tr>
    	</c:when>
    	<c:otherwise>
		    <tr>
		        <td width="100 !important" height="100">
		            <p align="center"><b><span style="font-size:12pt;">답변 내용</span></b></p>
		        </td>
		        <td width="450" height="100" colspan="3">
		        	<span style="font-size:12pt; white-space:normal;"><b>${dto.qnaAnswer}</b></span>
		        </td>
		    </tr>
    	</c:otherwise>
    </c:choose>
</table>

<div align="center"><span style="font-size:14pt;"><a href="${pageContext.request.contextPath}/qnalist" style="text-decoration:none;">리스트로 돌아가기</a></span></div>
</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>