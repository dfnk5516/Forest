<%@ include file="../include/topcontent.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="css/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
//게시글 toggle
$(function() {
    $("#faqAccodion").accordion({
      collapsible: true
    });
  });
</script>
<script>
	//원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page){
		location.href="${pageContext.request.contextPath}/faq?curPage="+page+"&option=${map.option}"+"&keyWord=${map.keyWord}";
	}
</script>

<div style="background-color:#fff">

	<div style="text-align:center">
	<form method="post" action="${pageContext.request.contextPath}/faq">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<select name="option">
		<option value="all" <c:out value="${map.option == 'all'?'selected':''}"/>>제목+내용</option>
		<option value="title" <c:out value="${map.option == 'title'?'selected':''}"/>>제목</option>
		<option value="content" <c:out value="${map.option == 'content'?'selected':''}"/>>내용</option>
		</select>
		<input type="text" size="50" placeholder="검색창(제목,내용)" value="${map.keyWord}" name="keyWord" style="display:inline; width:40%">
		<input type="submit" value="검색">
	</form>
	</div>
	
	<div>총 ${map.count}개</div>

	<!-- <tr>
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
    </tr> -->
    
   
    <div id="faqAccodion">
    <c:choose>
    <c:when test="${empty map.list}">
	<div>
    	<p align="center"><b><span style="font-size:9pt;">없습니다.</span></b></p>
    </div>
    </c:when>
    <c:otherwise>
	<c:forEach items="${map.list}" var="faqDto" varStatus="status">
			<h3>${faqDto.faqTitle}</h3>
			<div>
				<p>${faqDto.faqContent}</p>
			</div>
		    <%-- <tr onmouseover="this.style.background='#eaeaea'" onmouseout="this.style.background='white'">
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
		    </tr> --%>
    </c:forEach>
	</c:otherwise>
    </c:choose>
    </div>
    
    <!-- 페이징 -->
	<div>
		<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
		<c:if test="${map.boardPager.curBlock > 1}">
			<a href="javascript:list('1')">[처음]</a>
		</c:if>
		
		<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
		<c:if test="${map.boardPager.curBlock > 1}">
			<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
		</c:if>
		
		<!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 -->
		<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
			<!-- 현재페이지이면 하이퍼링크 제거 -->
			<c:choose>
				<c:when test="${num == map.boardPager.curPage}">
					<span style="color: red">${num}</span>&nbsp;
				</c:when>
				<c:otherwise>
					<a href="javascript:list('${num}')">${num}</a>&nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
		<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
			<a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
		</c:if>
		
		<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
		<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
			<a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
		</c:if>
	</div>
<!-- 페이징 -->

	<div><a href="${pageContext.request.contextPath}/faqWrite">글쓰기</a></div>
</div>


<%@ include file="../include/footer.jsp"%>








