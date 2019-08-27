<%@ include file="../include/topcontent.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
	
  <script type="text/javascript" src="${path}/resources/js/modal.js"></script>
  <link rel="stylesheet" type="text/css" href="${path}/resources/css/modal.css">

<script>
	//원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page){
		location.href="${pageContext.request.contextPath}/faq?curPage="+page+"&option=${map.option}"+"&keyWord=${map.keyWord}";
	}

	function sendDelete(faqNo){
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
<div style="background-color:#fff; margin-top:40px;" class="container">
	<h1 class="container_title">자주하는 질문</h1>
	<div style="text-align:center; margin-bottom:15px; border-top: 2px solid #000; padding: 30px 20px 30px 20px; background: #f8f7fc;">
	<form method="post" action="${pageContext.request.contextPath}/faq">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<select name="option" class="form-control" style="width:15%; display:inline-block; float:left;">
			<option value="all" <c:out value="${map.option == 'all'?'selected':''}"/>>제목+내용</option>
			<option value="title" <c:out value="${map.option == 'title'?'selected':''}"/>>제목</option>
			<option value="content" <c:out value="${map.option == 'content'?'selected':''}"/>>내용</option>
		</select>
		<div class="input-group">
		    <input type="text" class="form-control" size="40" placeholder="검색창(제목,내용)" value="${map.keyWord}" name="keyWord">
		    <div class="input-group-btn">
		      <button class="btn btn-default" type="submit">
		        <i class="glyphicon glyphicon-search"></i>
		      </button>
	   		</div>
  		</div>
	</form>
	</div>
	
	<div style="text-align:right">총 게시글 : <font color="#db001a">${map.count}</font>건</div>
    <c:choose>
    <c:when test="${empty map.list}">
	<div>
    	<p align="center"><b><span style="font-size:9pt;">없습니다.</span></b></p>
    </div>
    </c:when>
    
    <c:otherwise>
    <div class="panel-group" id="faqAccordion">
		<div class="panel panel-default">
		<c:forEach items="${map.list}" var="faqDto" varStatus="status">
		<form name="requestForm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question${faqDto.faqNo}" style="border-bottom:1px solid #e7e7e7; padding:20px 15px;">
          <h4 class="panel-title"><a href="#" class="ing">Q: ${faqDto.faqTitle}</a></h4>
		</div>
	    <div id="question${faqDto.faqNo}" class="panel-collapse collapse" style="height: 0px; background:#f7f7fb;">
           <div class="panel-body">
               <h5><span class="label label-primary">답변</span></h5>
               <p>${faqDto.faqContent}</p>
               <p style="float: right;">
               <%-- <input class="btn btn-xs btn-warning" type="button" value="수정하기" onClick="sendUpdate(${faqDto.faqNo})"> --%>
               <input class="btn btn-xs btn-danger" type="button" value="삭제하기" onClick="sendDelete(${faqDto.faqNo})">
               </p>
           </div>
         </div>
	    </form>
   		</c:forEach>
    	</div>
    </div>
	</c:otherwise>
    </c:choose>
    
    <!-- 페이징 -->
	<div style="text-align:center">
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

	<button id="createBtn" type="button" class="btn btn-info btn-sm" data-toggle="modal" style="float:right">글 쓰기</button>
</div>
<jsp:include page="faqWrite.jsp" />

<%@ include file="../include/footer.jsp"%>