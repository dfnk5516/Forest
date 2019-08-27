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
 	    	placeholder: '내용을 입력하세요',
	        minHeight: 300,
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
      		beforeSend : function(xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
        	data: data,
        	type: 'POST',
        	url: '${pageContext.request.contextPath}/imageUpload',
        	cache: false,
        	contentType: false,
        	enctype: 'multipart/form-data',
        	processData: false,
        	success: function(fileUrl) {
          		$(el).summernote('editor.insertImage', fileUrl);
        	},
        	error: function(error){
        		alert(error)
        	}
      	});
    }
</script>
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<form method="post" action="${pageContext.request.contextPath}/faqInsert">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 id="modal-title" class="modal-title"></h4>
			</div>
			<div class="modal-body">
				<table class="table">
					<tr>
						<td><input class="form-control" id="userName" name="faqTitle" type="text" placeholder="제목을 입력하세요"></td>
					</tr>
					<tr>
						<td><textarea id="summernote" name="faqContent"></textarea></td>
					</tr>					
				</table>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-success">Submit</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
		</form>
	</div>
</div>
<!-- <div style="margin-top:50px; line-height : 1em">
	<form action="">
		<input type="text" name="title" placeholder="제목"/>
		<input type="text" name="adminId" placeholder="작성자"/>
		<textarea id="summernote" name="content"></textarea>
		<input type="submit" value="작성"/>
	</form>
</div> -->