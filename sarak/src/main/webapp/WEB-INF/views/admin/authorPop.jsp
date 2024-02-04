<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
		<title>작가 선택창</title>
		
		<link rel="stylesheet" href="../../resources/dist/css/authorPop.css">
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<script>
			$(document).ready(function() {
				/* 작가 선택 및 팝업창 닫기 */
				$(".move").on("click", function(e) {
					
					e.preventDefault();
					
					let authorid = $(this).attr("href");
					
					let authorname= $(this).data("name");
					
					$(opener.document).find("#authorid_input").val(authorid);
					
					$(opener.document).find("#authorname_input").val(authorname);
					
					window.close();
	
				});
				
			});
		</script>
	</head>

	<body>
		<h1>작가 선택 pop 페이지</h1>
	
		<div class="subject_name_warp">
			<span>작가 선택</span>
		</div>
		<div class="content_wrap">
			<!-- 게시물 표 영역 -->
			<div class="author_table_wrap">
				<div class="table_exist">
					<table class="author_table">
						<thead>
							<tr>
								<td class="th_column_1">작가 번호</td>
								<td class="th_column_2">작가 이름</td>
							</tr>
						</thead>
						<c:forEach items="${list}" var="author">
							<tr>
								<td><c:out value="${author.authorid}"></c:out></td>
								<td>
									<a class="move" href='<c:out value="${author.authorid}"/>' data-name='<c:out value="${author.authorname}"/>'>
										<c:out value="${author.authorname}"></c:out>
									</a>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>