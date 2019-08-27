<%@ include file="../include/topcontent.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
	
	
  <!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${path}/resources/js/modal.js"></script>
  <link rel="stylesheet" type="text/css" href="${path}/resources/css/modal.css">

<script>
	//원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page){
		location.href="${pageContext.request.contextPath}/faq?curPage="+page+"&option=${map.option}"+"&keyWord=${map.keyWord}";
	}

	function sendDelete(faqNo){
		/* document.requestForm.action="${pageContext.request.contextPath}/faqDelete"
		document.requestForm.submit(); */
		$.ajax(
			{
				beforeSend : function(xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
				url: "${pageContext.request.contextPath}/faqDelete?faqNo="+faqNo,
				type :"post"
			})
			location.reload();
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
	
	<%-- <div class="panel-group" id="accordion">
	  <div class="panel panel-default">
	    <div class="panel-heading">
	      <h4 class="panel-title">
	        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne?${faqDto.faqNo}">
	          ${faqDto.faqTitle}
	        </a>
	      </h4>
	    </div>
	    <div id="collapseOne?${faqDto.faqNo}" class="panel-collapse collapse">
	      <div class="panel-body">
	        ${faqDto.faqContent}
	      </div>
	    </div>
	  </div>
 	</div> --%>

	<%-- <form name="requestForm" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
	
    <c:choose>
    <c:when test="${empty map.list}">
	<div>
    	<p align="center"><b><span style="font-size:9pt;">없습니다.</span></b></p>
    </div>
    </c:when>
    
    <c:otherwise>
    <div class="panel-group" id="accordion">
		<div class="panel panel-default">
		<c:forEach items="${map.list}" var="faqDto" varStatus="status">
		<form name="requestForm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<div class="panel-heading">
	      <h4 class="panel-title">
	        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne?${faqDto.faqNo}">
	          ${faqDto.faqTitle}
	        </a>
			<%-- <input type=hidden name="faqNo" id="faqNo" value="${faqDto.faqNo}"> --%>
			<%-- <input class="btn btn-xs btn-warning" type="button" value="수정하기" onClick="sendUpdate(${faqDto.faqNo})"> --%>
			<input class="btn btn-xs btn-danger" type="button" value="삭제하기" onClick="sendDelete(${faqDto.faqNo})">
	      </h4>
	    </div>
	    <div id="collapseOne?${faqDto.faqNo}" class="panel-collapse collapse">
	      <div class="panel-body">
	        ${faqDto.faqContent}
	     </div>
	    </div>
	    </form>
   		</c:forEach>
    	</div>
    </div>
	</c:otherwise>
    </c:choose>
    
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

	<%-- <div><a href="${pageContext.request.contextPath}/faqWrite">글쓰기</a></div> --%>
	<button id="createBtn" type="button" class="btn btn-info btn-sm"
			data-toggle="modal">글 쓰기</button>
	<jsp:include page="faqWrite.jsp" />
</div>


<%@ include file="../include/footer.jsp"%>








