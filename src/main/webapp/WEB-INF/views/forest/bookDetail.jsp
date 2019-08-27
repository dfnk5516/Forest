<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/booking.css" />

<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"/>

<style type="text/css">
li {
	margin:30px 0px;
}

</style>
<script type="text/javascript">
$(function(){
	$("#cancleBtn").click(function(){
		if(confirm("예약을 취소하시겠습니까?")){
			
		}
	})
})
</script>
</HEAD>
<BODY>
<%@ include file="background.jsp" %>
<div id="back">
<input type="hidden" name="lodgeCode" value="${bookingDTO.lodgeCode}">
<div id="container" class="layout">
    
    <h2 class="container_title">예약 상세 정보</h2>
      
        <div id="txt">
            <div class="stayroom charge_wrap">
                <div class="stay_left" style="background-color: white;">
                    <div class="stay_border"><div class="stay_info">
        <h2>${bookingDTO.forestName}</h2>	
		<table class="table" border="1" style="height: 300px;">
			<colgroup>
				<col width="250px">
				<col width="250px">
			</colgroup>
			<tbody>

				<tr>
					<td colspan="2">
					<img src="${pageContext.request.contextPath}/resources/images/forestImg/${bookingDTO.forestFilename}.jpg"
						style="width: 100%; height: 300px">
					</td>
				</tr>
				<tr>
					<td>${bookingDTO.forestName }</td>

					<td>${bookingDTO.forestType }</td>
				</tr>
				<tr>
					<td colspan="3">${bookingDTO.forestFacil}<br><p></td>
				</tr>
				<tr>
					<td colspan="3">${bookingDTO.forestAddr}</td>
				</tr>
				<tr>
					<td>뭐넣어야하지</td>

					<td>${bookingDTO.forestTel }</td>
				</tr>
			</tbody>
			<tfoot>
			</tfoot>
		</table>
		<div class="regend_icGroup">
		    <span class="ti"><b>범례 : </b></span>
		    <span><img src="https://image.foresttrip.go.kr/portal/images/content/ic_2.png" alt=""> 에어컨</span>
		    <span><img src="https://image.foresttrip.go.kr/portal/images/content/ic_3.png" alt=""> 반려견</span>
		    <span><img src="https://image.foresttrip.go.kr/portal/images/content/ic_4.png" alt=""> 전기</span>
		    <span><img src="https://image.foresttrip.go.kr/portal/images/content/ic_5.png" alt=""> 온수</span>
		    <span><img src="https://image.foresttrip.go.kr/portal/images/content/ic_6.png" alt=""> 장애인시설</span>
		    <span><img src="https://image.foresttrip.go.kr/portal/images/content/ic_7.png" alt=""> 바우처 </span>
		</div> 
						</div>
					</div>
				</div>
 <hr>
                    </div>
                </div>
                <div class="stay_right" style="background-color: lightgray;">
                    <div class="stay_result_border complete">
                    <div class="money_wrap mb_40">
                     <ul>
                     	  <li>
                     	    <img src="${pageContext.request.contextPath}/resources/images/${bookingDTO.lodgeFilename}.jpg"
								style="width: 32%; height: 50%;border-radius: 50px;">
                        	<h2><i class='fas fa-bed' style='font-size:36px'></i>${bookingDTO.lodgeName}</h2>
                        
                       
                          <li>
                            <b>숙박 이용일</b><br>
                            <i class='far fa-calendar-alt' style='font-size:30px'></i>체크인 날짜 &nbsp;&nbsp;&nbsp;&nbsp;- <input class="inputInfo" type="text" id="startDate" name="startDate" value="${bookingDTO.startDate.substring(0,10)}" readonly="readonly"><br>
                            <i class='fas fa-calendar-alt' style='font-size:30px'></i>체크아웃 날짜 - <input type="text" id="endDate" name="endDate" value="${bookingDTO.endDate.substring(0,10)}" readonly="readonly">
                          </li>
                          <li><b>시설</b><br>
                          	<i class='fas fa-university' style='font-size:30px'></i>
                          	야영데크(101),4인실(13㎡)
                          </li>
                          <li>
                            <b>사용 인원</b><br>
                            <i class='fas fa-user-check' style='font-size:25px'></i> &nbsp;<input type="text" name="peopleNum" value="${bookingDTO.peopleNum}" size="5"> 명 <br>
                          </li>
                        </ul>
                     	</div>
                    </div>
      
	                <button type="button" class="btn btn-secondary" id="cancleBtn" style="font-size:large;">
						취소하기
					</button>
	                

</div>
<%@ include file="../include/footer.jsp" %>
</BODY>
</html>