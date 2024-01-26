<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>Upload With Ajax</h1>
		
		<div class='uploadDiv'>
			<label for="bid">bid 입력 : </label>
        	<input type="text" id="bid" name="bid" required/>
        	<br>
			<input type='file'  name='bookimg' multiple/>
		</div>
		
		<button id='uploadBtn'>Upload</button>
		
		<div class='uploadResult'>
			<h4>### 방금 업로드한 파일 ###</h4>
			<ul>
			
			</ul>
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
					
					$.ajax({
						url: '/uploadAjaxAction',
						processData: false,
						contentType: false,
						data: formData,
						type: 'POST',
						dataType: 'json',
						success: function(result) {
							
							alert("이미지 파일 업로드 성공");
							
							showUploadedFile(result);
							
							saveToDatabase(bid, result);
							
							$(".uploadDiv").html(cloneObj);
							
						}
					});
					
					function saveToDatabase(bid, result) {
						
						$.ajax({
							url: '/saveToDatabase',
							method: 'POST',
							contentType: 'application/json',
							data: JSON.stringify({bid: bid, files: result}),
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
						
						str += "<li>" + obj.filename + "</li>";
						
					});
					
					uploadResult.append(str);
					
				}
				
			});
		</script>
	</body>
</html>