<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<h2>도서 이미지 업로드 페이지입니다.</h2>
		<form action="uploadFormAction" method="post" enctype="multipart/form-data">
			<label for="bid">bid 입력 : </label>
			<input type="text" name="bid" id="bid" required/>
			<br>
			<label for="bookimg">도서 표지 이미지 업로드 : </label>
			<input type="file" name="bookimg" multiple/>
			<br>
			<button>Submit</button>
		</form>
	</body>
</html> 