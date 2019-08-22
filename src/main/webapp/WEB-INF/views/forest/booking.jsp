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
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"/>
<SCRIPT type="text/javascript">
$(function(){
	$("#cancleBtn").click(function(){
		history.back();
	})
}) 	
</SCRIPT>

<style type="text/css">

</style>

</HEAD>
<BODY>
<div id="container" class="layout">
    
    <h2 class="container_title">예약 정보</h2>
    <form id="frm" name="frm" method="post" action="">
        <input type="hidden" name="egovframework.double.submit.preventer.parameter.name" value="E2C8BF58-C699-4E23-A1F6-240A24AE78F4">
        <input type="hidden" name="_csrf" value="10914b9a-016f-4938-b903-f21fe2cca7e3">
        <input type="hidden" id="insttId" name="insttId" value="0111">
        <input type="hidden" id="goodsId" name="goodsId" value="G01110200200300139">
        <input type="hidden" id="s_rsrvtBgDt" name="rsrvtBgDt" value="20190916">
        <input type="hidden" id="s_rsrvtEdDt" name="rsrvtEdDt" value="20190917">
        <input type="hidden" id="stngNofpr" name="stngNofpr" value="2">
        <input type="hidden" id="sthngCnt" name="sthngCnt" value="">
        <input type="hidden" id="rsrvtTpcd" name="rsrvtTpcd" value="01">
        <input type="hidden" id="rsrvtTpeCd" name="rsrvtTpeCd" value="04">
        <input type="hidden" id="rsrvtWtngSctin" name="rsrvtWtngSctin" value="01">
        <input type="hidden" id="srchPrd" name="srchPrd" value="">
        <input type="hidden" id="srchInsttArcd" name="srchInsttArcd" value="">
        <input type="hidden" id="srchFcfrsFclNm" name="srchFcfrsFclNm" value="">
        <input type="hidden" id="houseCampSctin" name="houseCampSctin" value="">
        <input type="hidden" name="hmpgId" value="FRIP">
        <input type="hidden" id="goodsClsscHouseCdArr" name="goodsClsscHouseCdArr" value="">
    
        <div id="txt">
            <div class="stayroom charge_wrap">
                <div class="stay_left">
                    <div class="stay_border"><div class="stay_info">
                        <div class="st_img">
                        	<img src="https://image.foresttrip.go.kr//ino/goods/2017_07_28_13_41_250.jpg" alt="야영데크(101)" onerror="this.src = '/images/common/no_img.gif'; this.alt = '표시할 이미지 없습니다';">    
                        </div>    
                    	<div class="st_con">
                    		<div class="con_tp">
                    			<ul>
									<li>
										<div class="st_tit">산림휴양시설</div>
										<span class="st_txt">대관령 자연휴양림</span>
									</li>
									<li>
									    <span class="st_tit">시설</span>
									    <span class="st_txt">야영데크(101)(13㎡) 기준:1인 최대:4인</span>
									</li>
									<li>
									    <span class="st_tit">숙박기간</span>    
									    <span class="st_txt">2019.09.16 ~ 2019.09.17 (1박2일)</span>
									</li>
									<li>
										<span class="st_tit">편의시설</span>
										<span class="st_txt">샤워장,화장실,온수샤워장,취사대,음수대</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
 



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
                <div class="stay_right">
                    <div class="stay_result_border complete">
                        <strong>예약선택</strong>
                        <div class="money_wrap mb_40"><ul><li><b>이용일</b>2019.09.16~2019.09.17(1박2일)</li><li><b>기준인원</b>1명</li><li><b>시설</b>야영데크(101),4인실(13㎡)</li></ul></div>
                        <strong>예약금액</strong>
                        <div class="result_total"><div class="days_ch"><span class="d_left">2019.09.16(비수기/평일)<span class="d_right">7,000원</span></span></div></div>
                        <div class="total">
                            <span class="all_t">합계</span>
                            <span class="mn_num">7,000원</span>
                        </div>
                        <div id="care_ful02" style="display:none;">
                            <p class="care_ful02">※ 정원 초과시 1인당 아래의 추가 요금 발생</p>
                            <div id="addNofprUnprc" class="result_total"><div class="days_ch"><span class="d_left">2019.09.16(비수기/평일)<span class="d_right">7,000원</span></span></div></div>
                        </div>
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
                            <label for="dogNumber_1" class="mt_10">반려견 등록번호 1 <span class="red">*</span> </label>
                            <div class="form_style">
                                <input type="text" id="cmdogOneRgno" name="cmdogOneRgno" value="" title="반려견 등록번호 1" maxlength="15" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" autocomplete="off">
                            </div>
                            <label for="dogNumber_2">반려견 등록번호 2</label>
                            <div class="form_style">
                                <input type="text" id="cmdogTwoRgno" name="cmdogTwoRgno" value="" title="반려견 등록번호 2" maxlength="15" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" autocomplete="off">
                            </div>
                        </div>
                        <!--  반려견 등록번호 입력(2019.07.19) -->
                        
						<div class="agree_btc mt_40">
						    <p class="center war_tit">유의사항 및 이용약관을 확인하신 후<br> 동의하시면 체크해주세요.</p>
						    <div class="mt_10 agree_ra_bt">
						        <label for="arr_01">
						            <input id="arr_01" type="checkbox" name="agree" lang="required" title="이용약관 동의"> <span>약관에 동의합니다.</span>
						        </label>
						    </div>
						</div>
                        
                        <div class="total_go">
                            <button type="button" id="btnRsrvt" onclick="fn_clickRsrvtRqest(); return false;">예약</button>
                            <button type="button" id="btnWtng" onclick="fn_clickWtngRqest(); return false;" style="display:none;">대기신청</button>
                            
                        </div>
                    </div>
                </div>
            </div>
            
            
            
                
                    <div style="margin-top:50px;">
                        <div class="agree_wrap basic type02 fold_list">
                
                        <div class="agree_txt">
                            <p></p><p class="0" style="text-align:center;word-break:keep-all;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-weight:bold;font-size:17.0pt;">Forrest 웹사이트 이용약관<span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:17.0pt;">&nbsp;</span></p><p class="0"><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-weight:bold;font-size:13.0pt;">제</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-weight:bold;font-size:13.0pt;">1</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-weight:bold;font-size:13.0pt;">조</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-weight:bold;font-size:13.0pt;">(</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-weight:bold;font-size:13.0pt;">목적</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-weight:bold;font-size:13.0pt;">)</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">이 약관은 산림청이 운영하는</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">Forr</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">est&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">웹사이트</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">(</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">이하</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;“</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">당 사이트</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">”)</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">에서 제공하는 인터넷 관련 서비스</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">(</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">이하</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;“</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">서비스</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">”)</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">를 이용함에 있어 웹사이트와 이용자의 권리</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">·</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">의무 및 책임사항을 규정함을 목적으로 합니다</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">.</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;font-weight:bold;font-size:13.0pt;"><span style="font-size: 13pt;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-weight:bold;font-size:13.0pt;">제</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-weight:bold;font-size:13.0pt;">2</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-weight:bold;font-size:13.0pt;">조</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-weight:bold;font-size:13.0pt;">(</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-weight:bold;font-size:13.0pt;">정의</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-weight:bold;font-size:13.0pt;">)</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;mso-hansi-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">①</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;“</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">이용자</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">”</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">란 당 사이트에 접속하여 이 약관에 따라 서비스를 제공받는 자를 말합니다</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">.</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;mso-hansi-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">②</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;“</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">회원</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">”</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">이란 당 사이트에서 정한 가입 양식에 따라 개인정보를</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">제공하여 등록을 한 자로서</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">,&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">당 사이트의 정보를 지속적으로</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">제공받으며</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">,&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">서비스를 계속적으로 이용할 수 있는 자를 말합니다</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">.</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;mso-hansi-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">③</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">본 약관에서 정의하지 않은 용어는 개별서비스에 대한 별도 약관 및 이용규정</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">,&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">조례에서 정의하거나 일반적인 개념에 의합니다</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">.</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><br> <span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-weight:bold;font-size:13.0pt;">제</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-weight:bold;font-size:13.0pt;">3</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-weight:bold;font-size:13.0pt;">조</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-weight:bold;font-size:13.0pt;">(</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-weight:bold;font-size:13.0pt;">약관의 효력과 변경</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-weight:bold;font-size:13.0pt;">)</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;mso-hansi-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">①</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">이 약관은 당 사이트의 서비스 초기 화면에 게시함으로서 효력을</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">발생합니다</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">.</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;mso-hansi-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">②</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">당 사이트의 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행 약관과 함께 당 사이트의 공지사항에 공지합니다</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">.&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">다만</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">,&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;30</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">일이상의 사전 유예 기간을 두고 공지합니다</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">.&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">이 경우 산림청은 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">.</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;mso-hansi-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">③</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">당 사이트 약관의 규제 등에 관한 법률 등 관련 법령을 위배하지 않는 범위 내에서 이 약관을 개정할 수 있으며 개정된 약관은 제</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">1</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">항과 같은 방법으로 공지함으로써 효력을 발생합니다</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">.</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;mso-hansi-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">④</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">&nbsp;</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">산림휴양시설 운영</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">·</span><span style="font-family:나눔고딕;mso-fareast-font-family:나눔고딕;font-size:12.0pt;">관리에 부당하거나 불법이라고 인정되는 행위에 대한 조치를 위하여 약관을 개정하는 경우에는 유예기간 없이 당 사이트 공지사항에 게시함으로서 효력을 발생합니다</span><span lang="EN-US" style="mso-fareast-font-family:나눔고딕;font-family:나눔고딕;mso-ascii-font-family:나눔고딕;mso-font-width:100%;letter-spacing:0pt;mso-text-raise:0pt;font-size:12.0pt;">.</span></p><p class="0" style="line-height:165%;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;"><br> 
                        </div>
                
                        </div>
                    </div>
                
                
<div class="container">
  <h2><b>위약금 정책</b></h2>
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

</BODY>
</html>