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
<SCRIPT type="text/javascript">

$(function(){

	$("#selectDate").click(function(){
		var startDate=$("#startDate").val();
		var endDate=$("#endDate").val();
		
		if(startDate!="" && endDate!=""){
			var arr1 = startDate.split("-");
			var arr2 = endDate.split("-");
			var dif = Number(arr2[2])-Number(arr1[2]);
			//alert( dif);
			var lodgePrice=Number($("#lodgePrice").val());
			$("#checkPrice").val(lodgePrice*dif);
			$("#totalPrice").val(lodgePrice*dif);
			
		} else {
			alert("날짜를 선택해주세요");
		}
	})
	
	
	$("#peopleNum").change(function(){
		var checkPrice = Number($("#checkPrice").val());
		if($(this).val()>4){
			
			var result = checkPrice + Number($(this).val()-4)*10000;
			$("#totalPrice").val("");
			$("#totalPrice").val(result);
		} else if($(this).val()<5){
			$("#totalPrice").val("");
			$("#totalPrice").val(checkPrice);
		}
	})
	
	$("#insertBtn").click(function(){
		if($("#arr_01").is(":checked") == true){
			window.opener.name = "parentPage"; // 부모창의 이름 설정
		    $("#booking").target = "parentPage"; // 타켓을 부모창으로 설정
		    $("#booking").action = "${pageContext.request.contextPath}/forest/bookingInsert";
		    $("#booking").submit();
		    alert("예약이 완료되었습니다.");
		    window.opener.location="${pageContext.request.contextPath}/forest/bookList";
		    self.close();
		} else if($("input").val()==""){
			alert("정보를 입력해주세요")
		} else {
			alert("약관에 동의해주세요");
		}
	})
	
	$("#cancleBtn").click(function(){
		if (confirm("완료되지 않은 예약정보는 저장되지 않습니다. 취소하시겠습니까?")) {
			window.close();
		}
		
	})
}) 	
</SCRIPT>

<style type="text/css">
li {
	margin:30px 0px;
}
</style>

</HEAD>
<BODY>
<%@ include file="background.jsp" %>
<div id="back">
<form name="bookingForm" method="post" action="${pageContext.request.contextPath}/forest/bookingInsert" id="booking">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<input type="hidden" name="bookId" value="qortmd8886">
<input type="hidden" name="lodgeCode" value="${bookingDTO.lodgeCode}">
<div id="container" class="layout">
    
    <h2 class="container_title">예약 정보</h2>
      
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
					<%-- <img src="${pageContext.request.contextPath}/resources/images/forestImg/${dto.forestFilename}.jpg"
						style="width: 600px; height: 400px;" /><br /> --%> <%-- ${dto.forestFilename } --%>
					<img src="${pageContext.request.contextPath}/resources/images/forestImg/${bookingDTO.forestFilename}.jpg"
						style="width: 100%; height: 40%">
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
                     	    <b>숙박 이름</b><br>
                        	<h2><i class='fas fa-bed' style='font-size:36px'></i>${bookingDTO.lodgeName}</h2>
                        
                       
                          <li>
                            <b>숙박 이용일</b><br>
                            <i class='far fa-calendar-alt' style='font-size:30px'></i>체크인 날짜 &nbsp;&nbsp;&nbsp;&nbsp;- <input type="date" id="startDate" name="startDate"><br>
                            <i class='fas fa-calendar-alt' style='font-size:30px'></i>체크아웃 날짜 - <input type="date" id="endDate" name="endDate">
                            <input type="button" id="selectDate" value="날짜선택">
                          </li>
                          <li><b>시설</b><br>
                          	<i class='fas fa-university' style='font-size:30px'></i>
                          	야영데크(101),4인실(13㎡)
                          </li>
                          <li>
                            <b>사용 인원</b><br>
                            <i class='fas fa-user-check' style='font-size:25px'></i> &nbsp;<input type="number" name="peopleNum" min="1" max="100" id="peopleNum"> 명 <br>
                           	 ※ 정원 초과시 1인당 만원 추가 요금 발생
                          </li>
                        </ul>
                     	</div>
                        <strong>예약금액</strong><br>
                        <i class='fas fa-money-check-alt' style='font-size:27px; margin-top: 2px'></i>
                        1박가격 - <input type="text" name="lodgePrice" id="lodgePrice" value="${bookingDTO.lodgePrice}" size="15" readonly="readonly" style="text-align: right;">원<br>
                        <i class='fas fa-money-check-alt' style='font-size:27px; margin-top: 2px'></i>
                                                     총 가격 - <input type="text" id="totalPrice" name="totalPrice" value="" readonly="readonly" style="margin-left: 5px;text-align: right;" size="15">원
                        <br> <input type="hidden" id="checkPrice" value="">
                    </div>
                    <div class="stay_result_border complete solo">
                        <strong>자동예약 방지숫자</strong>
                        
                        <div class="auto_none">
                            <div class="spicker">
                                <div class="sp_left">
                                    <img id="captchaImg" title="캡챠이미지" src="${pageContext.request.contextPath}/resources/images/forestImg/자동예약방지.png">
                                </div>
                                <div id="captchaAudio" style="display:none;"></div>
                                <div class="sp_right">
                                
                                    <a href="javascript:;" onclick="javascript:fn_clickRefreshCaptcher('/rep/cm/captchaImg.do?_csrf=10914b9a-016f-4938-b903-f21fe2cca7e3');" title="새로고침"><img src="https://image.foresttrip.go.kr/images/content/capcha_refrash.png" alt=""><span class="hide">새로고침</span></a>
                                    <a href="javascript:;" onclick="javascript:fn_clickListen('/rep/cm/captchaAudio.do?_csrf=10914b9a-016f-4938-b903-f21fe2cca7e3');" title="듣기"><img src="https://image.foresttrip.go.kr/images/content/capcha_spicker.png" alt=""><span class="hide">듣기</span></a>
                                </div>
                            </div>
                            <div class="auto_txt">
                                <input type="text" id="atmtcRsrvtPrvntChrct" name="atmtcRsrvtPrvntChrct" value="" lang="required" title="자동예약 방지숫자" maxlength="6" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" autocomplete="off">
                            </div>
                        </div>
                        
                        <!--  반려견 등록번호 입력(2019.07.19) -->
                        <div id="cmDogRgNo" class="stay_dog_number mt_20">
                            <p class="war_txt">※ <span class="red">[반려견동반 필수]</span>반려견 이용약관 부적격/증빙 미지참시 <span class="red">입실불가</span>하며 위약금이 부과됩니다.</p>
                            <label for="dogNumber_1" class="mt_10">반려견 등록번호  <span class="red">*</span> </label>
                            <div class="form_style">
                                <input type="text" id="cmdogOneRgno" name="cmdogOneRgno" value="" title="반려견 등록번호 1" maxlength="15" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" autocomplete="off">
                            </div>
                        </div><br>
                        
                        <!--  반려견 등록번호 입력(2019.07.19) -->
                        
						
                        
                        
                    </div>
                </div>
            </div>
            
            
            
                <div style="text-align: center;">
                <br>
               <hr color="black" style="border-width: medium;">
                    <div style="margin-top:50px;">
                        <div class="agree_wrap basic type02 fold_list">
                
                        <div class="agree_txt">
                            <p></p><p class="0" style="text-align:center;word-break:keep-all;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-weight:bold;font-size:17.0pt;">Forrest 웹사이트 이용약관<span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:17.0pt;">&nbsp;</span></p><p class="0"><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-weight:bold;font-size:13.0pt;">제</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-weight:bold;font-size:13.0pt;">1</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-weight:bold;font-size:13.0pt;">조</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-weight:bold;font-size:13.0pt;">(</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-weight:bold;font-size:13.0pt;">목적</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-weight:bold;font-size:13.0pt;">)</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">이 약관은 산림청이 운영하는</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">Forr</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">est&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">웹사이트</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">(</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">이하</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;“</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">당 사이트</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">”)</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">에서 제공하는 인터넷 관련 서비스</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">(</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">이하</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;“</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">서비스</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">”)</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">를 이용함에 있어 웹사이트와 이용자의 권리</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">·</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">의무 및 책임사항을 규정함을 목적으로 합니다</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">.</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;font-weight:bold;font-size:13.0pt;"><span style="font-size: 13pt;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-weight:bold;font-size:13.0pt;">제</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-weight:bold;font-size:13.0pt;">2</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-weight:bold;font-size:13.0pt;">조</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-weight:bold;font-size:13.0pt;">(</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-weight:bold;font-size:13.0pt;">정의</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-weight:bold;font-size:13.0pt;">)</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;mso-hansi-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">①</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;“</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">이용자</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">”</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">란 당 사이트에 접속하여 이 약관에 따라 서비스를 제공받는 자를 말합니다</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">.</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;mso-hansi-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">②</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;“</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">회원</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">”</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">이란 당 사이트에서 정한 가입 양식에 따라 개인정보를</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">제공하여 등록을 한 자로서</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">,&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">당 사이트의 정보를 지속적으로</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">제공받으며</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">,&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">서비스를 계속적으로 이용할 수 있는 자를 말합니다</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">.</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;mso-hansi-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">③</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">본 약관에서 정의하지 않은 용어는 개별서비스에 대한 별도 약관 및 이용규정</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">,&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">조례에서 정의하거나 일반적인 개념에 의합니다</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">.</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><br> <span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-weight:bold;font-size:13.0pt;">제</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-weight:bold;font-size:13.0pt;">3</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-weight:bold;font-size:13.0pt;">조</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-weight:bold;font-size:13.0pt;">(</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-weight:bold;font-size:13.0pt;">약관의 효력과 변경</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-weight:bold;font-size:13.0pt;">)</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;mso-hansi-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">①</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">이 약관은 당 사이트의 서비스 초기 화면에 게시함으로서 효력을</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">발생합니다</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">.</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;mso-hansi-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">②</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">당 사이트의 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행 약관과 함께 당 사이트의 공지사항에 공지합니다</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">.&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">다만</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">,&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;30</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">일이상의 사전 유예 기간을 두고 공지합니다</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">.&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">이 경우 산림청은 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">.</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;mso-hansi-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">③</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">당 사이트 약관의 규제 등에 관한 법률 등 관련 법령을 위배하지 않는 범위 내에서 이 약관을 개정할 수 있으며 개정된 약관은 제</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">1</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">항과 같은 방법으로 공지함으로써 효력을 발생합니다</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">.</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;mso-hansi-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">④</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">산림휴양시설 운영</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">·</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">관리에 부당하거나 불법이라고 인정되는 행위에 대한 조치를 위하여 약관을 개정하는 경우에는 유예기간 없이 당 사이트 공지사항에 게시함으로서 효력을 발생합니다</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">.</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><br> 
                        </div>
                
                        </div>
                    </div>
                    <hr color="black" style="border-width: thin;">
                <div class="agree_btc mt_40">
				    <p class="center war_tit">※유의사항 및 이용약관을 확인하신 후 동의하시면 체크해주세요.</p>
				    <div class="mt_10 agree_ra_bt">
				        <label for="arr_01">
				            <input id="arr_01" type="checkbox" name="agree" lang="required" title="이용약관 동의"> <span>약관에 동의합니다.</span>
				        </label>
				    </div>
				</div>
                <div class="total_go">
	                <button type="button" class="btn btn-success" id="insertBtn" style="font-size:large;">
						예약완료
					</button>
	                <button type="button" class="btn btn-secondary" id="cancleBtn" style="font-size:large;">
						취소하기
					</button>
                </div>
                </div> 
                </form>
                <hr color="black" style="border-width: medium;">
                <br>
<div class="container" style="margin-top: 10px;background-color: white;">
  <h2 style="text-align: center;"><b>위약금 정책</b></h2>
  <br>            
  <table class="table table-striped">
    <thead>
      <tr>
        <th rowspan="2">위약금규정일수</th>
        <th colspan="2">성수기</th>
        <th colspan="2">비수기</th>
      </tr>
      <tr>
        <th>평일</th>
        <th>주말</th>
        <th>평일</th>
        <th>주말</th>
      </tr>
    </thead>
    <tbody>
      <tr>
         <td>0</td>
         <td>80%</td>
         <td>80%</td>
         <td>20%</td>
         <td>20%</td>
      </tr>
 
      <tr>
         <td>1</td>
         <td>60%</td>
         <td>60%</td>
         <td>10%</td>
         <td>10%</td>
      </tr>
 
      <tr>
         <td>2</td>
         <td>60%</td>
         <td>60%</td>
         <td>0%</td>
         <td>0%</td>
      </tr>
 
      <tr>
         <td>3</td>
         <td>40%</td>
         <td>40%</td>
         <td>0%</td>
         <td>0%</td>
      </tr>
 
      <tr>
         <td>4</td>
         <td>40%</td>
         <td>40%</td>
         <td>0%</td>
         <td>0%</td>
      </tr>
 
      <tr>
         <td>5</td>
         <td>20%</td>
         <td>20%</td>
         <td>0%</td>
         <td>0%</td>
      </tr>
 
      <tr>
         <td>6</td>
         <td>20%</td>
         <td>20%</td>
         <td>0%</td>
         <td>0%</td>
      </tr>
 
      <tr>
         <td>7</td>
         <td>10%</td>
         <td>10%</td>
         <td>0%</td>
         <td>0%</td>
      </tr>
 
      <tr>
         <td>8</td>
         <td>10%</td>
         <td>10%</td>
         <td>0%</td>
         <td>0%</td>
      </tr>
 
      <tr>
         <td>9</td>
         <td>10%</td>
         <td>10%</td>
         <td>0%</td>
         <td>0%</td>
      </tr>
 
      <tr>
         <td>10</td>
         <td>0%</td>
         <td>0%</td>
         <td>0%</td>
         <td>0%</td>
      </tr>
    </tbody>
  </table>
</div>
</div>

<%@ include file="../include/footer.jsp" %>
</BODY>
</html>