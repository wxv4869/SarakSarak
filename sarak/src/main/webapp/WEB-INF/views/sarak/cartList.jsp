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
	    <link rel="stylesheet" href="/resources/dist/css/cartList.css">
	
	    <!-- Custom Fonts -->
	    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	    
	    <script type="text/javascript">
		$(document).ready(function() {
			
			// 장바구니 종합 정보 구하기
			let totalPrice = 0;    // 모든 장바구니 상품(bprice * cartquan) 가격 합산
			let totalCount = 0;    // 모든 장바구니 상품 수량 합산
			
			$(".td-hidden-cart-info").each(function(index, element) {
				
				// 총 가격
				totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
				
				// 총 개수
				totalCount += parseInt($(element).find(".individual_cartquan_input").val());
				
			});
			
			$(".totalPrice").text(totalPrice.toLocaleString() + "원");
			
			$(".totalQuantity").text(totalCount);
			
			$(".delete").on("click", function(e) {
			
				<sec:authorize access="isFullyAuthenticated()">
				
					var cartid = $(this).data("cartid");
					
					$.ajax({
			            type: "POST",
			            url: "/cart/delete",
			            data: { cartid: cartid, ${_csrf.parameterName}: '${_csrf.token}' },
			            success: function(response) {
			                alert("해당 상품이 삭제되었습니다.");
			            },
			            error: function() {
			                alert("상품을 삭제하는데 실패했습니다.")
			            }
			        });
					
				</sec:authorize>
				
			});
			
			let actionForm = $("#actionForm");
			
			$(".move").on("click", function(e) {
				
				e.preventDefault();
				
				let bid = $(this).data("bid");
				
				actionForm.append("<input type='hidden' name='bid' value='" + bid + "'>");
				
				actionForm.attr("action", "/sarak/bookDetail");
				
				actionForm.submit();
				
				history.replaceState({ page: "bookDetail", bid: bid }, "Book Detail", "/sarak/bookDetail?bid=" + bid);
				
				location.reload();
				
			});
			
			// 수량 버튼
			$(".plus-btn").on("click", function() {
				
				let quantity = $(this).parent("div").find("input").val();
				
				if (quantity < 10) {
				
					$(this).parent("div").find("input").val(++quantity);
					
				} else {
					
					$(this).parent("div").find("input").val(quantity);
					
				}
				
			});
			
			$(".minus-btn").on("click", function() {
				
				let quantity = $(this).parent("div").find("input").val();
				
				if (quantity > 1) {
				
					$(this).parent("div").find("input").val(--quantity);
					
				} else {
					
					$(this).parent("div").find("input").val(quantity);
					
				}
				
			});
			
			// 수량 변경 버튼
			$(".quantity-modify-btn").on("click", function() {
				
				<sec:authorize access="isFullyAuthenticated()">
					let cartid = $(this).data("cartid");
				
					let quantity = $(this).parent("td").find("input").val();
	
			        // AJAX를 사용하여 서버로 데이터 전송
			        $.ajax({
			            type: "POST",
			            url: "/cart/update",
			            data: { cartid: cartid, quantity: quantity, ${_csrf.parameterName}: '${_csrf.token}' },
			            success: function(response) {
			                alert("수량이 변경되었습니다.");
			                location.reload();
			            },
			            error: function() {
			                alert("수량 변경에 실패했습니다.")
			            }
			        });
	        	</sec:authorize>
				
				<sec:authorize access="isAnonymous()">
		            alert("로그인이 필요합니다.");
		        </sec:authorize>
				
			});
			
			// 주문하기 버튼
			$(".btn-order").on("click", function(){
			    	
		        var orderForm = $("<form action='/sarak/order/' method='get' class='order_form'></form>");
	
		        var orderNumber = 0;
		        
		        var mid = $(".individual_memberId_input").val();
	
		        $(".td-hidden-cart-info").each(function () {
		        	
		            var bid = $(this).find(".individual_bookId_input").val();
		            var bookCount = $(this).find(".individual_cartquan_input").val();
		            
		            orderForm.append("<input type='hidden' name='orders[" + orderNumber + "].bid' value='" + bid + "'>");
		            orderForm.append("<input type='hidden' name='orders[" + orderNumber + "].bookCount' value='" + bookCount + "'>");
	
		            orderNumber += 1;
			        
			    });
		        
		        orderForm.append("<input type='hidden' name='mid' value='" + mid + "'>");
		        
		        $("body").append(orderForm);
		        
		        orderForm.submit();
				
			});
			
		});
		</script>
	
		<title>장바구니 페이지</title>
	
	</head>
	
	<body>
		<!-- 전체 페이지 영역 시작 -->
		<div class="sarakMainWrapper">
			<!-- 헤더 영역 시작 -->
			<%@ include file="../includes/header.jsp" %>
			<!-- 헤더 영역 끝 -->
			<!-- 미들 영역 시작 -->
			<div class="sarakMiddleArea">
				<!-- 전체도서 목록 영역 -->
				<div class="contents_inner">
					<div class="cart_wrap">
						<h2 class="title_heading">장바구니 (<span class="totalQuantity"></span>)</h2>
						<div class="cart-list">
							<c:if test="${empty cartList}">
								<div class="empty-cart">
									<img src="../resources/img/empty.png">
									<p>장바구니에 담긴 상품이 없습니다.</p>
								</div>
							</c:if>
							<c:if test="${not empty cartList}">
								<table class="tbl-cartlist">
									<c:forEach var="cart" items="${cartList}">
										<tr>
											<td class="td-hidden-cart-info">
												<input type="hidden" class="individual_bprice_input" value="${cart.bprice}">
												<input type="hidden" class="individual_cartquan_input" value="${cart.cartquan}">
												<input type="hidden" class="individual_totalPrice_input" value="${cart.bprice * cart.cartquan}">
												<input type="hidden" class="individual_cartId_input" value="${cart.cartid}">
												<input type="hidden" class="individual_bookId_input" value="${cart.bid}">
												<input type="hidden" class="individual_memberId_input" value="${cart.mid}">
											</td>
											<td class="mainimage">
												<img src="<c:url value='/sarak/display'/>?filename=<c:out value='${cart.uploadpath}/${cart.filename}'/>" alt="표지 이미지"/>
											</td>
											<td class="detail">
												<div class="bname">
													<a class='move' data-bid='${cart.bid}'>
														<c:out value="${cart.bname}"/>
													</a>
												</div>
												<div class="bprice">
													<fmt:formatNumber value="${cart.bprice}" pattern="#,###원"/>
												</div>
												<div class="quan">
													(수량 : ${cart.cartquan})
												</div>
											</td>
											
											<td class="change-quan">
												<div class="change-quan-div">
													<input type="text" value="${cart.cartquan}" class="quantity-input">	
													<button class="quantity-btn plus-btn">▲</button>
													<button class="quantity-btn minus-btn">▼</button>
												</div>
												<a class="quantity-modify-btn" data-cartid="${cart.cartid}">변경</a>
											</td>
											
											<td class="btn">
												<div class="btn-delete">
													<a href="/cart/cartList"><Button class="delete" type="button" data-cartid="${cart.cartid}"><img id="delete-icon" src="../resources/img/delete.png"></Button></a>
												</div>
											</td>
										</tr>

										<!-- 구분 선 -->
										<tr>
											<td colspan="8" class="separator"></td>
										</tr>
									</c:forEach>
								</table>
								
								<div class="cart-info">
									<table class="tbl-cart-info">
										<colgroup>
											<col style="width: 75%;">
											<col style="width: 25%;">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">총 상품 금액</th>
												<td class="totalPrice"></td>
											</tr>
											<tr>
												<th scope="row">배송비</th>
												<td>0원</td>
											</tr>
											<tr class="info-separator"></tr>
											<tr>
												<th scope="row" style="font-weight: bold;">결제 예정 금액</th>
												<td class="totalPrice" style="font-weight: bold;"></td>
											</tr>
										</tbody>
									</table>
									<div class="btn-order">
										<input type="button" class="btn-order" name="btn" value="주문하기">
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<!-- 미들 영역 끝 -->
			<!-- footer 영역 시작 -->
			<%@ include file="../includes/footer.jsp" %>
			<!-- footer 영역 끝 -->
		</div>
		<!-- 전체 페이지 영역 끝 -->
	</body>
</html>