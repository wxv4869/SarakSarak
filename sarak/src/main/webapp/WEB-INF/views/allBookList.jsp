<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="../../resources/css/allBook.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">

		function loadJson() {    // 도서 목록 비동기
			$.ajax({
				url: '<c:url value="/allBookListAjax"/>',
				type: 'get',
				dataType: 'json',
				success: ajaxHtml,
				error:function() {alert('error');}
			});
		}
		 	
		function ajaxHtml(data) {    // 도서 목록 html 형식으로 출력
			
			var html = "<table class='table'>";
			html += "<tr>";
			html += "<td>번호</td>";
			html += "<td>제목</td>";
			html += "<td>가격</td>";
			html += "<td>출간일</td>";
			html += "<td>출판사</td>";
			html += "<td>작가번호</td>";
			html += "<td>줄거리</td>";
			html += "</tr>";
			
			$.each(data, (index, obj) => {
				
				html += "<tr>";
		   		html += "<td>" + obj.bid + "</td>";
		   		html += "<td>" + obj.bname + "</td>";
		   		html += "<td>" + obj.bprice + "</td>";
		   		html += "<td>" + obj.pubdate + "</td>";
		   		html += "<td>" + obj.publisher + "</td>";
		   		html += "<td>" + obj.authorid + "</td>";
		   		html += "<td>" + obj.summary + "</td>";
		   		html += "</tr>";
		   		
			});
			
			html += "</table>";
			
			$("#ajaxAllBookList").html(html);
			
		}
		 
		$(document).ready(function() {
			
			(function() {
				
				var bid = '<c:out value = "${attach.bid}" />';
				
				$.getJSON("/sarak/getAttachList", {bid: bid}, function(arr) {
					
					console.log(arr);
					
				});
				
			})();
			
			var actionForm = $("#actionForm");
			
			// 페이징, 페이지 이동 처리
			$(".paginate_button a").on("click", function(e) {
				
				e.preventDefault();
				
				console.log('click');
				
				actionForm.find("input[name = 'pageNum']").val($(this).attr("href"));
				
				actionForm.submit();
				
			});
			
		});
	</script>
    
	<title>사락사락 전체 도서 페이지</title>
	
	</head>
	
	<body>
		<!-- 전체 페이지 영역 시작 -->
		<div class="sarakMainWrapper">
			<!-- 헤더 영역 시작 -->
			<%@ include file="includes/header.jsp" %>
			<!-- 헤더 영역 끝 -->
			
			<!-- 미들 영역 시작 -->
			<div class="sarakMiddleArea">
				<!-- 전체도서 목록 영역 -->
				<div class="contents_inner">
					<div class="allbook_wrap">
					<h2 class="title_heading">전체도서</h2>
						<div class="allbook_prod">
						
							<style>
								.title_heading {
									text-align: center;
									margin-top: 20px;
								}
								
								.allbook_prod table {
									width: 100%;
								}
								
								.allbook_prod td {
									text-align: center;
									vertical-align: middle;
								}
								
								.mainimage img {
									max-width: 100px;
									max-height: 150px;
									width: auto;
									height: auto;
								}
								
								.summary {
									margin-top: 10px;
								}
								
								.separator {
									background-color: #ddd;
									height: 1px;
								}
							</style>
						
							<table>
								<tr>
									<td>번호</td>
									<td>표지</td>
									<td>제목</td>
									<td>가격</td>
									<td>출간일</td>
									<td>출판사</td>
									<td>작가번호</td>
								</tr>
								
								<c:forEach var="vo" items="${allBookList}">
									<tr>
										<td>${vo.bid}</td>
										<td class="mainimage">
											<img src="<c:url value='/sarak/display'/>?filename=<c:out value='${vo.attachList[0].uploadpath}/${vo.attachList[0].filename}'/>" alt="표지 이미지"/>
										</td>
										<td>
											<div style="display: flex; align-items: center;">
												<div style="flex: 1;">
													<strong>${vo.bname}</strong>
												</div>
											</div>
										</td>
										<td>${vo.bprice}</td>
										<td>${vo.isbn}</td>
										<td>${vo.pubdate}</td>
										<td>${vo.publisher}</td>
										<td>${vo.authorid}</td>
									</tr>
									
									<!-- 줄거리 -->
									<tr>
										<td></td>
										<td colspan="7">
											<div class="summary">
												<strong>줄거리:</strong>
												${fn:substring(vo.summary, 0, 30)}${fn:length(vo.summary) > 30 ? '...' : ''}
											</div>
										</td>
									</tr>
									
									<!-- 회색 선 -->
									<tr>
										<td colspan="8" class="separator"></td>
									</tr>
								</c:forEach>
								
								<%-- <c:forEach var="vo" items="${allBookList}">
									<tr>
										<td>${vo.bid}</td>
										<td class="mainimage">
											<img src="<c:url value='/sarak/display'/>?filename=<c:out value='${vo.attachList[0].uploadpath}/${vo.attachList[0].filename}'/>"
													style="max-width: 100px; max-height: 150px; width: auto; height: auto;"/>
										</td>
										<td>${vo.bname}</td>
										<td>${vo.bprice}</td>
										<td>${vo.pubdate}</td>
										<td>${vo.publisher}</td>
										<td>${vo.authorid}</td>
									</tr>
								</c:forEach> --%>
								
								
							</table>
							
							<!-- 페이징 영역 시작 -->
							<div class="pull-right">
								<ul class="pagination">
									<c:if test="${pageMaker.prev}">
										<li class="paginate_button previous"><a href="${pageMaker.startPage - 1}">이전</a></li>
									</c:if>
									
									<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
										<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : ''}">
											<a href="${num}">${num}</a>
										</li>
									</c:forEach>
									
									<c:if test="${pageMaker.next}">
										<li class="paginate_button next"><a href="${pageMaker.endPage + 1}">다음</a></li>
									</c:if>
								</ul>
							</div>
							<form id='actionForm' action="/sarak/allBookList" method='get'>
								<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
								<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
							</form>
							<!-- 페이징 영역 끝 -->
						</div>
					</div>
				</div>
				
			</div>
			<!-- 미들 영역 끝 -->
			
			<!-- footer 영역 시작 -->
			<%@ include file="includes/footer.jsp" %>
			<!-- footer 영역 끝 -->
			
		</div>
		<!-- 전체 페이지 영역 끝 -->
	</body>
</html>