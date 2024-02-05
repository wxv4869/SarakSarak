<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/adminheader.jsp"%>

<style>
.uploadDiv label {
	margin: 15px 0px;
	font-size: 16px;
}

.uploadResult {
	width: 100%;
	background-color: gray;
}

p {
	font-size: 16px;
	font-weight: bold;
}

.uploadResult ul {
	font-size: 16px;
	font-style: italic;
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
	align-content: center;
	text-align: center;
}

.uploadResult ul li img {
	width: 100px;
}

.uploadResult ul li span {
	color: white;
}

.btnDiv button {
	margin: 15px 0px;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255,255,255,0.5);
}

.bicPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bicPicture img {
	width: 600px;
}
</style>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">도서 이미지 업로드 페이지</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
		<!-- /.panel-heading -->
			<div class="panel-body">
				<div class='bigPictureWrapper'>
					<div class='bigPicture'>
					</div>
				</div>
			
				<div class='uploadDiv'>
					<label for="bid">bid 입력 : </label>
					<input type="text" id="bid" name="bid" required/><br>
					<input id='img_input' type='file'  name='bookimg' multiple/>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</div>
		
				<div class="btnDiv">
					<button id='uploadBtn'>Upload</button>
				</div>
				
				<p>### 방금 업로드한 파일 ###</p>
				<div class='uploadResult'>
					<ul>
					
					</ul>
				</div>
				
			</div>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

<script>
	$(document).ready(function() {
		
		var regex = new RegExp("(.*?)\.(png|jpg)$");
		var maxSize = 5242880;
		
		function checkExtension(fileName, fileSize) {
			
			if (fileSize >= maxSize) {
				
				alert("업로드 가능 최대 파일 사이즈를 초과했습니다.");
				
				return false;
				
			}
			
			if (!regex.test(fileName)) {
				
				alert("도서 이미지 파일은 png, jpg 타입의 파일만 업로드할 수 있습니다.");
				
				return false;
				
			}
			
			return true;
			
		}
		
		var cloneObj = $(".uploadDiv").clone();
		
		$("#uploadBtn").on("click", function(e) {
			
			e.preventDefault();
			
			var formData = new FormData();
			
			var bid = $("#bid").val();
			
			formData.append("bid", bid);
			
			var inputFile = $("input[name = 'bookimg']");
			
			var files = inputFile[0].files;
			
			console.log(files);
			
			for (var i = 0; i < files.length; i++) {
				
				if (!checkExtension(files[i].name, files[i].size)) {
					
					return false;
					
				}
				
				formData.append("bookimg", files[i]);
				
			}
			
			formData.append("${_csrf.parameterName}", "${_csrf.token}");
			
			$.ajax({
				url: '/admin/uploadAjaxAction',
				processData: false,
				contentType: false,
				data: formData,
				type: 'POST',
				dataType: 'json',
				headers: {
			        "${_csrf.parameterName}": "${_csrf.token}"
			    },
				success: function(result) {
					
					alert("이미지 파일 업로드 성공");
					
					console.log(result);
					
					showUploadedFile(result);
					
					saveToDatabase(bid, result);
					
					$(".uploadDiv").html(cloneObj);
					
				},
			    error: function(result) {
			    	
			    	alert("이미지 파일이 아닙니다.")
			    	
			    }
			});
			
			function saveToDatabase(bid, result) {
				
				$.ajax({
					url: '/admin/saveToDatabase',
					method: 'POST',
					contentType: 'application/json',
					data: JSON.stringify({bid: bid, files: result}),
					beforeSend: function(xhr) {
			            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			        },
					success: function(response) {
						
						console.log("DB 저장 성공");
					
					},
					error: function(error) {
						
						console.error("DB 저장 실패 : " + error)
						
					}
				});
			}
			
		});
		
		var uploadResult = $(".uploadResult ul");
		
		function showUploadedFile(uploadResultArr) {
			
			var str = "";
			
			$(uploadResultArr).each(function(i, obj) {
				
				var fileCallPath = encodeURIComponent(obj.uploadpath + "/" + obj.filename);
				
				str += "<li>" + "<img src='display?filename=" + fileCallPath + "'>" + "<li>";
				
				str += "<li>" + obj.filename + "</li>";
				
			});
			
			uploadResult.append(str);
			
		}
		
	});
</script>
	
<%@include file="../includes/adminfooter.jsp"%>