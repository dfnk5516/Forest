<%@ include file="../include/topcontent.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div style="text-align:center">
	<h1 style="color:green">1 : 1 문의</h1>
	<form method="post" action="${pageContext.request.contextPath}/qnalist">
		<select name="option" style="height:30px; float:left">
			<option value="title">제목</option>
			<option value="name">작성자</option>
		</select>
		<input type="text" size="50" placeholder="검색창(제목,이름)" value="${map.keyWord}" name="keyWord" style="height:30px; float:left">
		<input type="submit" value="검색" style="height:30px; float:left">
	</form>
</div>

<div>
	<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">
	
		<colgroup>
			<col width="5%"/>
			<col width="10%"/>
			<col width="15%"/>
			<col width="5%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="15%"/>
		</colgroup>
		
		<tr>
	        <td bgcolor="#00cc00">
	            <p align="center">
	            <font color="white"><b><span style="font-size:12pt;">번호</span></b></font></p>
	        </td>
	        <td bgcolor="#00cc00">
	            <p align="center"><font color="white"><b><span style="font-size:12pt;">작성자</span></b></font></p>
	        </td>
	        <td bgcolor="#00cc00">
	            <p align="center"><font color="white"><b><span style="font-size:12pt;">시설</span></b></font></p>
	        </td>
	        <td bgcolor="#00cc00">
	            <p align="center"><font color="white"><b><span style="font-size:12pt;">비밀글</span></b></font></p>
	        </td>
	        <td bgcolor="#00cc00">
	            <p align="center"><font color="white"><b><span style="font-size:12pt;">제목</span></b></font></p>
	        </td>
	        <td bgcolor="#00cc00">
	            <p align="center"><font color="white"><b><span style="font-size:12pt;">작성일</span></b></font></p>
	        </td>
	        <td bgcolor="#00cc00">
	            <p align="center"><font color="white"><b><span style="font-size:12pt;">답변상태</span></b></font></p>
	        </td>
	    </tr>
	    
	    <c:choose>
	    
		    <c:when test="${qnaDTO==null}">
			<tr>
		        <td colspan="5">
		            <p align="center"><b><span style="font-size:9pt;">등록된 질문이 없습니다.</span></b></p>
		        </td>
		    </tr>
		    </c:when>
		    
	    	<c:otherwise>
				<c:forEach items="${qnaDTO}" var="dto">
				    <tr onmouseover="this.style.background='#eaeaea'" onmouseout="this.style.background='white'">
				        <td bgcolor="">
				            <p align="center"><span style="font-size:12pt;">${dto.qnaNo}</span></p>
				        </td>
				        <td bgcolor="">
							<p align="center"><span style="font-size:12pt;">${dto.userDTO.userName}</span></p>
				        </td>
				        <td bgcolor="">
				            <p align="center"><span style="font-size:12pt;">${dto.qnaPlace}</span></p>
				        </td>		        
				        <td bgcolor="">
				            <p align="center"><span style="font-size:12pt;">${dto.qnaSecret}</span></p>
				        </td>
				        <td bgcolor="">
				            <p align="center"><span style="font-size:12pt;">${dto.qnaTitle}</span></p>
				        </td>
				         
				         <td bgcolor="">
				            <p align="center"><span style="font-size:12pt;">${dto.writeDay}</span></p>
				        </td>
				        <td bgcolor="">
				        	<c:choose>
				        		<c:when test="${dto.qnaAnswer==null}">
				            		<p align="center"><font color="red"><span style="font-size:12pt;">답변 대기</span></p>				     
								</c:when>
								<c:otherwise>				        		
									<p align="center" color="blue"><font color="blue"><span style="font-size:12pt;">답변 완료</span></p>								
				        		</c:otherwise>
				        	</c:choose>
				        </td>
				    </tr>
		    	</c:forEach>
			</c:otherwise>
		
	    </c:choose>
	    
	</table>
	
</div>

<%@ include file="../include/footer.jsp"%>

