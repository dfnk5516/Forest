<%@ include file="../include/topcontent.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="css/style.css">
<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">
<caption id="sub"> 회원 LIST </caption>
	<colgroup>
		<col width="15%"/>
		<col width="10%"/>
		<col width="16%"/>
		<col width="10%"/>
		<col width="13%"/>
		<col width="23%"/>
		<col width="14%"/>
	</colgroup>
	<tr>
        <td bgcolor="#98b189">
            <p align="center">
            <font color="white"><b><span style="font-size:12pt;">회원 아이디</span></b></font></p>
        </td>
        <td bgcolor="#98b189">
            <p align="center"><font color="white"><b><span style="font-size:12pt;">회원 이름</span></b></font></p>
        </td>
        <td bgcolor="#98b189">
            <p align="center"><font color="white"><b><span style="font-size:12pt;">이메일</span></b></font></p>
        </td>
        <td bgcolor="#98b189">
            <p align="center"><font color="white"><b><span style="font-size:12pt;">가입일</span></b></font></p>
        </td>
        <td bgcolor="#98b189">
            <p align="center"><font color="white"><b><span style="font-size:12pt;">연락처</span></b></font></p>
        </td>
        <td bgcolor="#98b189">
            <p align="center"><font color="white"><b><span style="font-size:12pt;">주소</span></b></font></p>
        </td>
        <td bgcolor="#98b189">
            <p align="center"><font color="white"><b><span style="font-size:12pt;">등급 및 권한</span></b></font></p>
        </td>
    </tr>
    <c:choose>
	    <c:when test="${empty requestScope.list}">
			<tr>
		        <td colspan="5">
		            <p align="center"><b><span style="font-size:12pt;">등록된 회원이 없습니다.</span></b></p>
		        </td>
		    </tr>
	    </c:when>
    <c:otherwise>
	<c:forEach items="${requestScope.list}" var="userDto"> 
		    <tr onmouseover="this.style.background='#eaeaea'" onmouseout="this.style.background='white'">
		        <td bgcolor="">
		            <p align="center"><span style="font-size:12pt;">
		            ${userDto.userId}</span></p>
		        </td>
		        <td bgcolor="">
					<p><span style="font-size:11pt;">
					<a href="${pageContext.request.contextPath}/admin/read/${userDto.userId}">  <!-- URL주소 간소화(@PathVariable이용) -->
					  ${userDto.userName}
					</a>
					</span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:11pt;">
		            ${userDto.userEmail}
		            </span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:11pt;">
		            ${userDto.userEnroll}</span></p>
		        </td>
		         
 		         <td bgcolor="">
		            <p align="center"><span style="font-size:11pt;">
		            ${userDto.userTel}</span></p>
		        </td>
		         <td bgcolor="">
		            <p align="center"><span style="font-size:11pt;">
		             ${userDto.userAddr}
		           </span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:11pt;">
		            ${userDto.userGrade}</span></p>
		        </td> 
		    </tr>
    </c:forEach>
	</c:otherwise>
    </c:choose>
</table>
<hr>
<div align=right>
<span style="font-size:13pt;">&lt;<a href="${pageContext.request.contextPath}/hometest">홈페이지로 가기</a>&gt;</span>
<span style="font-size:13pt;">&lt;<a href="${pageContext.request.contextPath}/admin/write">사용자 등록하기</a>&gt;</span></div>
<%@ include file="../include/footer.jsp"%> 













