<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
	<head>
    <meta charset="UTF-8">
	<title>사락사락 메인 페이지</title>
	<link rel="stylesheet" href="resources/css/main.css">
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
			
			<!-- 미드 영역 시작 -->
			<div class="sarakMiddleArea">
				<!-- 광고 배너 영역 -->
				<h2>광고 배너 이미지</h2>
				
				<!-- 베스트도서 미리보기 영역 -->
				<div class="contents_inner">
					<div class="bestbook_wrap">
					<h2 class="title_heading">실시간 베스트셀러</h2>
			      
						<div class="bestbook_prod">
							<ul class="best_list">
								<li th:each="book : ${bestSellerBooks}">
									<div class="book_item">
										<%-- <img th:src="${book.imageUrl}" alt="Book Image"> --%>
										<h3 th:text="${book.bname}"></h3>
										<p th:text="${book.bprice}"></p>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
				<!-- 신간도서 미리보기 영역 -->
				<div class="contents_inner">
					<div class="newbook_wrap">
					<h2 class="title_heading">이번 달 신간도서</h2>
			      
						<div class="newbook_prod">
							<ul class="new_list">
					
							</ul>
						</div>
					</div>
				</div>
				
			</div>
			<!-- 미드 영역 끝 -->
			
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