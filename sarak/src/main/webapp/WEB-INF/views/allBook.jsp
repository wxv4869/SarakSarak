<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="../../resources/css/allBook.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/6.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">

		function loadJson() {    // 도서 목록 비동기
			$.ajax({
				url:"${cpath}/allBookListAjax",
				type:"get",
				dataType:"json",
				success:ajaxHtml,
				error:function() {alert("error");}
			});
		}
		 	
		function ajaxHtml(data) {    // 도서 목록 html 형식으로 출력
			
			var html = "<table class='table'>";
			html += "<tr>";
			html += "<td>번호</td>";
			html += "<td>제목</td>";
			html += "<td>가격</td>";
			html += "<td>ISBN</td>";
			html += "<td>출간일</td>";
			html += "<td>출판사</td>";
			html += "<td>작가번호</td>";
			html += "</tr>";
			
			$.each(data, (index, obj) => {
				
				html += "<tr>";
		   		html += "<td>" + obj.bid + "</td>";
		   		html += "<td>" + obj.bname + "</td>";
		   		html += "<td>" + obj.bprice + "</td>";
		   		html += "<td>" + obj.isbn + "</td>";
		   		html += "<td>" + obj.pubdate + "</td>";
		   		html += "<td>" + obj.publisher + "</td>";
		   		html += "<td>" + obj.authorid + "</td>";
		   		html += "</tr>";
		   		
			});
			
			html += "</table>";
			
			$("#ajaxAllBookList").html(html);
			
		}
		 
		$(document).ready(function() {    // 페이징, 페이지 이동 처리
			
			var actionForm = $("#actionForm");
			
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
			<div id="sarakHeaderArea">
				<div class="sarakHeaderWrap">
					<!-- 헤더 Top 영역 시작 -->
					<div class="sarakHeaderTop">
						<!-- 유틸 메뉴 (로그인, 회원가입, 고객센터) 시작 -->
						<ul>
							<li id="loginText">
								<em class="txt">로그인</em>
							</li>
							<li id="registerText">
								<em class="txt">회원가입</em>
							</li>
							<li id="serviceText">
								<em class="txt">고객센터</em>
							</li>
						</ul>
					</div>
					<!-- 헤더 Top 영역 끝 -->
					
					<!-- 헤더 Mid 영역 시작 -->
					<div class="sarakHeaderMid">
						<div class="sarakSearch">
						
						</div>
					</div>
					<!-- 헤더 Mid 영역 끝 -->
					
					<!-- 헤더 Nav 메뉴 영역 시작 -->
					<div class="sarakHeaderNav">
						<dl>
							<dd>
								<ul>
									<li>전체도서</li>
									<li>베스트도서</li>
									<li>신간도서</li>
									<li>공지사항</li>
								</ul>
							</dd>
						</dl>
					</div>
					<!-- 헤더 Nav 메뉴 영역 끝 -->
					
				</div>
			</div>
			<!-- 헤더 영역 끝 -->
			
			<!-- 미들 영역 시작 -->
			<div class="sarakMiddleArea">
				<!-- 전체도서 목록 영역 -->
				<div class="contents_inner">
					<div class="allbook_wrap">
					<h2 class="title_heading">전체도서</h2>
						<div class="allbook_prod">
							<table class="table table-hover table-bordered">
								<tr>
									<td>번호</td>
									<td>제목</td>
									<td>가격</td>
									<td>ISBN</td>
									<td>출간일</td>
									<td>출판사</td>
									<td>작가번호</td>
								</tr>
								<c:forEach var="vo" items="${allBookList}">
									<tr>
										<td>${vo.bid}</td>
										<td>${vo.bname}</td>
										<td>${vo.bprice}</td>
										<td>${vo.isbn}</td>
										<td>${vo.pubdate}</td>
										<td>${vo.publisher}</td>
										<td>${vo.authorid}</td>
									</tr>
								</c:forEach>
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
			<div class="sarakFooterArea">
								
				<!-- 기업 정보 영역 -->
				<div class="sarakInfoArea">
				
				</div>
				
			</div>
			<!-- footer 영역 끝 -->
			
		</div>
		<!-- 전체 페이지 영역 끝 -->
	</body>
</html>