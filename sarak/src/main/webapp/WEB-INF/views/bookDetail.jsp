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
		$(document).ready(function() {
			
			// 수량 선택 : 증감에 따른 총 상품 가격 변동 함수
			function updateTotalPrice() {
				
				var bprice = ${book.bprice};
				var quan = $(".quantity").val();
				var totalPrice = bprice * quan;
				
				$(".total-price").text(totalPrice.toLocaleString() + "원");
				
			}
			
			// 수량 선택 : 플러스 버튼 클릭 함수
			$(".plus").click(function() {
				
				var quan = $(".quantity").val();
				var plusQuan = Number(quan) + 1;
				
				if (plusQuan >= 10) {
					
					$(".quantity").val(quan);
					
				} else {
					
					$(".quantity").val(plusQuan);
					
					updateTotalPrice();
					
				}
				
			});
			
			// 수량 선택 : 마이너스 버튼 클릭 함수
			$(".minus").click(function() {
				
				var quan = $(".quantity").val();
				var minusQuan = Number(quan) - 1;
				
				if (minusQuan <= 0) {
					
					$(".quantity").val(quan);
					
				} else {
					
					$(".quantity").val(minusQuan);
					
					updateTotalPrice();
					
				}
				
			});
			
			// 수량이 변경될 때마다 updateTotalPrice() 함수 호출
			$(".quantity").on("input", function() {
				
				updateTotalPrice();
				
			});
			
		});
	</script>
    
    <style>
		@charset "UTF-8";
		
		*{
			margin: 0;
			padding:0;
		}
		
		.sarakMiddleArea {
			margin: 0px 0px 150px 0px;
		}
		
		
		.bname {
			text-align: center;
			margin-top: 80px;
			margin-bottom: 80px;
			font-size: 26px;
			font-weight: bold;
		}
		
		.book-info {
			float: right;
			margin-right: 120px;
			width: 350px;
		}
		
		.book-allinfo {
			overflow: hidden;
		}
		
		.bprice {
			padding: 20px;
			font-size: 18px;
			font-weight: bold;
		}
		
		.select-box {
			border-top: 1px solid #d8d8d8;
			padding: 20px 20px 20px 20px;
		}
		
		.tbl-select-box {
			font-size: 15px;
			font-weight: bold;
			padding: 20px 20px 5px 20px;
		}
		
		.tbl-select-box th {
			line-height: 40px;
			text-align: left;
		}
		
		.tbl-select-box td {
			line-height: 40px;
			text-align: right;
		}
		
		.quanbox {
			display: flex;
			width: 130px;
			height: 50px;
			align-items: center;
			border: solid;
			border-width: 1px;
			border-color: #a4a4a4;
			border-radius: 8px;
			padding-left: 3px;
		}
		
		.quanbox button {
			width: 40px;
			height: 40px;
			font-size: 15px;
			font-weight: bold;
			background-color: white;
			cursor: pointer;
			text-align: center;
			border: none;
		}
		
		.quantity {
			font-size: 14px;
			width: 40px;
			height: 40px;
			text-align: center;
			border: none;
		}
		
		.authorname {
			border-top: 1px solid #d8d8d8;
			font-size: 15px;
			font-weight: bold;
			padding: 20px 20px 5px 20px;    /* 순서 : 상 우 하 좌 */
		}
		
		.publisher {
			font-size: 15px;
			color: #6e6e6e;
			padding: 5px 20px 20px 20px;
			
		}
		
		.mainimg img {
			width: 310px;
			height: auto;
			box-shadow: 0 20px 60px rgba(0, 0, 0, 0.12);
			float: left;
			margin-left: 120px;
			margin-right: 80px;
		}
		
		.detailimg img {
			margin: auto;
			display: block;
			width: 700px;
			height: auto;
		}
		
		.subheading {
			font-size: 24px;
			font-weight: bold;
			margin: 0px 40px 50px 40px;
		}
		
		.summary {
			margin: 0px 40px 50px 40px;
			font-size: 16px;
			color: #6e6e6e;
		}
		
		.contents {
			margin: 0px 40px 50px 40px;
			font-size: 16px;
			color: #6e6e6e;
		}
		
		.book-info-detail-basic {
			margin: 0px 40px 50px 40px;
			display: block;
			padding: 20px 0px 20px 10px;
			border-top: 1px solid #000;
			border-bottom: 1px solid #d9d9d9;
		}
		
		.tbl-info th {
			padding: 12px 10px;
			width: 200px;
			line-height: 35px;
			text-align: left;
			font-size: 16px;
			font-weight: 500;
			color: #000;
			vertical-align: top;
		}
		
		.tbl-info td {
			padding: 12px 10px;
			line-height: 35px;
			text-align: left;
			font-size: 16px;
			font-weight: 400;
			color: #767676;
			vertical-align: top;
		}
		
		.separator {
			border-top: 1px solid #d9d9d9;
  			margin: 50px 0px 50px 0px;
		}
		
		.btn-group {
			margin-top: 75px;
			display: flex;
			align-items: center;
		}
		
		.cartbtn input {
			width: 120px;
			height: 60px;
			background-color: #8e8e8e;
			border: none;
			font-size: 16px;
			font-weight: bold;
			color: white;
			margin-right: 10px;
			border-radius: 15px;
		}
		
		.buynowbtn input {
			width: 120px;
			height: 60px;
			background-color: #8ee6db;
			border: none;
			font-size: 16px;
			font-weight: bold;
			color: white;
			border-radius: 15px;
		}
		
	</style>
    
    <title>도서 상세 페이지</title>
    
    </head>
    
    <body>
		<!-- 전체 페이지 영역 시작 -->
		<div class="sarakMainWrapper">
			<!-- 헤더 영역 시작 -->
			<%@ include file="includes/header.jsp" %>
			<!-- 헤더 영역 끝 -->
			
			<!-- 미들 영역 시작 -->
			<div class="sarakMiddleArea">
				<!-- 도서 상세 정보 -->
				
				<div class="content-wrapper">
					<div class="main-content">
						<div class="book-allinfo">
							<!-- 도서 제목 -->
							<div class="bname">${book.bname}</div>
						
							<!-- 도서 표지 이미지 -->
							<div class="mainimg">
								<c:forEach var="attach" items="${attachList}">
									<!-- filename에 "mainimg"가 포함된 이미지만 로드 -->
									<c:if test="${fn:contains(attach.filename, 'mainimg')}">
										<img src="<c:url value='/sarak/display'/>?filename=${attach.uploadpath}/${attach.filename}" alt="첨부 이미지"/>
									</c:if>
								</c:forEach>
							</div>
							
							<div class="book-info">
								<div class="bprice">
									<fmt:formatNumber value="${book.bprice}" pattern="#,###원"/>
								</div>
								
								<div class="select-box">
									<table class="tbl-select-box">
										<colgroup>
											<col style="width: 70%;">
											<col style="width: 30%;">
										</colgroup>
										<tbody>
											<tr style="margin-bottom: 10px;">
												<th scope="row">배송비 : </th>
												<td>0원(무료)</td>
											</tr>
											<tr>
												<th scope="row">수량 : </th>
												<td>
													<div class="quanbox">
														<button type="button" class="minus">-</button>
														<input  class="quantity" value="1" readonly="readonly"/>
														<button type="button" class="plus">+</button>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								
								<div class="select-box">
									<table class="tbl-select-box">
										<colgroup>
											<col style="width: 70%;">
											<col style="width: 30%;">
										</colgroup>
										<tbody>
											<tr style="margin-bottom: 10px;">
												<th scope="row">총 상품 금액 : </th>
												<td class="total-price"><fmt:formatNumber value="${book.bprice}" pattern="#,###원"/></td>
											</tr>
										</tbody>
									</table>
								</div>
								
								<div class="authorname">
									${book.authorname} 저자(글)
								</div>
								<div class="publisher">
									${book.publisher} | <fmt:formatDate value="${book.pubdate}" pattern="yyyy년 MM월 dd일"/>
								</div>
								
								<div class="btn-group">
									<div class="cartbtn">
										<input type="button" class="cart" name="btn" value="장바구니"></button>
									</div>
									<div class="buynowbtn">
										<input type="button" class="buynow" name="btn" value="바로구매"></button>
									</div>
								</div>
							</div>
						</div>
						
						<div class="separator"></div>
						
						<!-- 도서 상세 이미지 -->
						<div class="detailimg">
							<c:forEach var="attach" items="${attachList}">
								<!-- filename에 "detailimg"가 포함된 이미지만 로드 -->
								<c:if test="${fn:contains(attach.filename, 'detailimg')}">
									<img src="<c:url value='/sarak/display'/>?filename=${attach.uploadpath}/${attach.filename}" alt="첨부 이미지"/>
								</c:if>
							</c:forEach>
						</div>
						
						<div class="separator"></div>
						
						<div class="book-info-detail">
							<div class="subheading">도서 소개</div>
							<div class="summary">
								${fn:replace(book.summary, '\\n', '<br><br>')}
							</div>
							
							<div class="separator"></div>
							
							<div class="subheading">목차</div>
							<div class="contents">
								${fn:replace(book.contents, '\\n', '<br><br>')}
							</div>
							
							<div class="separator"></div>
							
							<div class="subheading">기본 정보</div>
							<div class="book-info-detail-basic">
								<table class="tbl-info">
									<colgroup>
										<col style="width: 20%;">
										<col style="width: 80%;">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">ISBN</th>
											<td>
												<div class="basic-isbn">
													${book.isbn}
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row">발행(출시)일자</th>
											<td>
												<div class="basic-pubdate">
													<fmt:formatDate value="${book.pubdate}" pattern="yyyy년 MM월 dd일"/>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row">쪽수</th>
											<td>
												<div class="basic-pages">
													준비중
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row">총권수</th>
											<td>
												<div class="basic-volumn">
													1권
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
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