<%@ include file="../include/topcontent.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="${path}/resources/js/summernote-ko-KR.js"></script>


<script>
	$(function() {
		$('#summernote').summernote({
 	    	placeholder: '내용입력',
	        minHeight: 400,
	        maxHeight: null,
	        focus: false, 
	        lang : 'ko-KR',
	        
	        callbacks: {
				onImageUpload: function(files, editor, welEditable) {
		            for (var i = files.length - 1; i >= 0; i--) {
		            	sendFile(files[i], this);
		            }
		        }
			}
	  });
	})
	
	function sendFile(file, el) {
		var data = new FormData();
      	data.append('file', file);
      	$.ajax({
        	data: data,
        	type: "POST",
        	url: '/faqInsert',
        	cache: false,
        	contentType: false,
        	enctype: 'multipart/form-data',
        	processData: false,
        	success: function(img_name) {
          		$(el).summernote('editor.insertImage', img_name);
        	}
      	});
    }
</script>

<div style="margin-top:50px; line-height : 1em">
	<form action="">
		<input type="text" name="title" placeholder="제목"/>
		<input type="text" name="adminId" placeholder="작성자"/>
		<textarea id="summernote" name="content"></textarea>
		<input type="submit" value="작성"/>
	</form>
</div>