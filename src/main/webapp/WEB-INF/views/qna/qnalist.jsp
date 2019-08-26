<%@ include file="../include/topcontent.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
$(function(){
	$(".qna_content").click(function(){
		var qnaNo=$(this).find("[name=qnaNo]").val();
		alert(qnaNo);
		location="${pageContext.request.contextPath}/qna/"+qnaNo;
	});
	
	$("#insert").click(function(){
		location="${pageContext.request.contextPath}/qnaForm";
	});

})

</script>
</head>
<body>
<div>
	<h1 style="color:green; font-size: 40px; text-align:center; margin-top:70px; margin-bottom:70px">1 : 1 문의 게시판</h1>
	
		<select name="keyField" id="keyField" 
				style="height:30px; float:left;">
			<option value="0">선택</option>				
			<option value="qna_title">제목</option>
			<option value="qna_name">작성자</option>
		</select>
		<input type="text" size="50" name="keyWord" id="keyWord" 
			   style="height:30px; float:left">
		<button type="button" id="searchBtn" style="height:30px; float:left">
			검색
		</button>
</div>

<div>
	<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black" style="margin-bottom:200px;">
	
		<colgroup>
			<col width="5%"/>
			<col width="10%"/>
			<col width="15%"/>
			<col width="15%"/>
			<col width="25%"/>
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
				        <c:choose>
				        	<c:when test="${dto.qnaSecret==0}">		        
						        <p></p>
						    </c:when>
						    <c:otherwise>
						    	<img src="/controller/resources/images/lock.PNG" alt="lock" width="10px" height="10px" align="center">
						    </c:otherwise>
				        </c:choose>
				        </td>
				        <td bgcolor="" class="qna_content">
				            <p align="center"  style="font-size:12pt;"><input type="hidden" name="qnaNo" value="${dto.qnaNo}">${dto.qnaTitle}</p>
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
	<button id="insert">질문 등록</button>
</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>

