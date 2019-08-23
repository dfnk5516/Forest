<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>
		<span>
		 제목<input type=text value="">
		</span>
		<span>
		 비밀글 여부 <input type=checkbox value="">
		</span>
	</div>
	<div>
		<span>
		작성자 ${dto.userDTO.userName}
		</span>
		<span>
		휴양림선택
		<select name="option" style="float:left">
			<option value="">강릉임해자연휴양림</option>
			<option value="">강화군 석모도자연휴양림</option>
			<option value="">검봉산자연휴양림</option>
			<option value="">고산자연휴양림</option>
			<option value="">남원자연휴양림</option>
			<option value="">남해편백자연휴양림</option>
			<option value="">덕유산자연휴양림</option>
			<option value="">박달재자연휴양림</option>
			<option value="">백운산자연휴양림</option>
			<option value="">비슬산자연휴양림</option>
			<option value="">서운산자연휴양림</option>
			<option value="">순천자연휴양림</option>
			<option value="">안면도자연휴양림</option>
			<option value="">옥성자연휴양림</option>			
		</select>
		</span>	
	</div>
	<div>
		<span>
		 이메일<input type=text value="">@<input type=text value="">
		 <select name="option" style="float:left">
		 	<option value="">naver.com</option>
			<option value="">daum.net</option>
			<option value="">google.com</option>
			<option value="">hanmail.net</option>
		 </select>
		</span>		
	</div>	
	<div>
		<span>
		내용<input type=text placeholer="내용을 입력해주세요">
		</span>
	</div>
	
	<button>등록</button>
	<button>취소</button>
	
	</div>
</body>
</html>