<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
    
    <link rel="stylesheet" href="../resources/dist/css/allBook.css">
    <link rel="stylesheet" href="../resources/dist/css/bookDetail.css">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
		$(document).ready(function() {
			
			// 수량 선택 : 증감에 따른 총 상품 가격 변동 함수
			function updateTotalPrice() {
				
				var bprice = ${bookVO.bprice};
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
			
			// 장바구니 담기 버튼
			$(".cart").on("click", function(e) {

				<sec:authorize access="isFullyAuthenticated()">
					var bookId = ${bookVO.bid};
			        var quantity = $(".quantity").val();
	
			        // AJAX를 사용하여 서버로 데이터 전송
			        $.ajax({
			            type: "POST",
			            url: "/cart/add",
			            data: { bookId: bookId, quantity: quantity, ${_csrf.parameterName}: '${_csrf.token}' },
			            success: function(response) {
			                alert("해당 상품이 장바구니에 추가되었습니다.");
			            },
			            error: function() {
			                alert("상품을 장바구니에 추가하는데 실패했습니다.")
			            }
			        });
		        </sec:authorize>
					
				<sec:authorize access="isAnonymous()">
		            alert("로그인이 필요합니다.");
		        </sec:authorize>
				
			});
			
		});
	</script>
    
    <title>도서 상세 페이지</title>
    
    </head>
    
    <body>
		<!-- 전체 페이지 영역 시작 -->
		<div class="sarakMainWrapper">
			<!-- 헤더 영역 시작 -->
			<%@ include file="../includes/header.jsp" %>
			<!-- 헤더 영역 끝 -->
			
			<!-- 미들 영역 시작 -->
			<div class="sarakMiddleArea">
				<!-- 도서 상세 정보 -->
				<c:if test="${not empty bookVO}">
					<div class="content-wrapper">
						<div class="main-content">
							<div class="book-allinfo">
								<!-- 도서 제목 -->
								<div class="bname">${bookVO.bname}</div>
							
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
										<fmt:formatNumber value="${bookVO.bprice}" pattern="#,###원"/>
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
													<td class="total-price"><fmt:formatNumber value="${bookVO.bprice}" pattern="#,###원"/></td>
												</tr>
											</tbody>
										</table>
									</div>
									
									<div class="authorname">
										${bookVO.authorname} 저자(글)
									</div>
									<div class="publisher">
										${bookVO.publisher} | <fmt:formatDate value="${bookVO.pubdate}" pattern="yyyy년 MM월 dd일"/>
									</div>
									
									<div class="btn-group">
										<div class="cartbtn">
											<input type="button" class="cart" name="btn" value="장바구니">
										</div>
										<div class="buynowbtn">
											<input type="button" class="buynow" name="btn" value="바로구매">
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
									${fn:replace(bookVO.summary, '\\n', '<br><br>')}
								</div>
								
								<div class="separator"></div>
								
								<div class="subheading">작가 소개</div>
								<div class="authorinfo">
									<div class="authorinfo-name">
										저자(글) ${bookVO.authorname}
									</div>
									<div class="authorinfo-desc">
										${fn:replace(bookVO.authordesc, '\\n', ' ')}
									</div>
								</div>
								
								<div class="separator"></div>
								
								<div class="subheading">목차</div>
								<div class="contents">
									${fn:replace(bookVO.contents, '\\n', '<br><br>')}
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
														${bookVO.isbn}
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row">발행(출시)일자</th>
												<td>
													<div class="basic-pubdate">
														<fmt:formatDate value="${bookVO.pubdate}" pattern="yyyy년 MM월 dd일"/>
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
				</c:if>
			</div>
			<!-- 미들 영역 끝 -->
			
			<!-- footer 영역 시작 -->
			<%@ include file="../includes/footer.jsp" %>
			<!-- footer 영역 끝 -->
			
		</div>
		<!-- 전체 페이지 영역 끝 -->
	</body>
    
</html>