<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href="../../resources/dist/css/allBook.css">
	<link rel="stylesheet" href="../../resources/dist/css/order.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script type="text/javascript">
	/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
	function setTotalInfo() {

		let totalPrice = 0;    // 총 가격
		let totalCount = 0;    // 총 갯수
		let totalKind = 0;    // 총 종류
		let deliveryPrice = 0;    // 배송비
		let finalTotalPrice = 0;    // 최종 가격(총 가격 + 배송비)	
			
		$(".goods_table_price_td").each(function(index, element) {
			
			// 총 가격
			totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
			
			// 총 갯수
			totalCount += parseInt($(element).find(".individual_bookCount_input").val());
			
			// 총 종류
			totalKind += 1;
			
		});	
	
		finalTotalPrice = totalPrice + deliveryPrice;	

		/* 값 삽입 */
		// 총 가격
		$(".totalPrice_span").text(totalPrice.toLocaleString());
		
		// 총 갯수
		$(".goods_kind_div_count").text(totalCount);
		
		// 총 종류
		$(".goods_kind_div_kind").text(totalKind);
		
		// 배송비
		$(".delivery_price_span").text(deliveryPrice.toLocaleString());	
		
		// 최종 가격(총 가격 + 배송비)
		$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
			
	}

	$(document).ready(function() {
		
		/* 주문 조합정보란 최신화 */
		setTotalInfo();
		
		/* 주문 요청 */
		$(".order_btn").on("click", function() {

			/* 주소 정보 & 받는이*/
			$(".addressInfo_input_div").each(function(i, obj) {
				
					$("input[name='ordername']").val($(obj).find(".ordername_input").val());
					$("input[name='orderphone']").val($(obj).find(".orderphone_input").val());
					$("input[name='orderpostcode']").val($(obj).find(".orderpostcode_input").val());
					$("input[name='orderaddress']").val($(obj).find(".orderaddress_input").val());
				
					/* 상품정보 */
					let form_contents = ''; 
					
					$(".goods_table_price_td").each(function(index, element) {
						
						let bookId = $(element).find(".individual_bookId_input").val();
						let bookCount = $(element).find(".individual_bookCount_input").val();
						
						let bookId_input = "<input name='orders[" + index + "].bid' type='hidden' value='" + bookId + "'>";
						form_contents += bookId_input;
						
						let bookCount_input = "<input name='orders[" + index + "].odetailquan' type='hidden' value='" + bookCount + "'>";
						form_contents += bookCount_input;
						
					});	
					
					$(".order_form").append(form_contents);	
					
					console.log();
					
					/* 서버 전송 */
					$(".order_form").submit();
				
			});	
			
		});
			
	});
	</script>
</head>

<div class="sarakMainWrapper">
	<%@include file="../includes/header.jsp"%>
	<section>
		<div class="content_main">
			<!-- 배송지 정보 -->
			<div class="addressInfo_div">
				<div class="addressInfo_input_div_wrap">
					<div class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
						<table>
							<colgroup>
								<col width="30%">
								<col width="70%">
							</colgroup>
							<tbody>
								<tr>
									<th>이름</th>
									<td>
										${memberInfo.mname}
									</td>
								</tr>
								<tr>
									<th>연락처</th>
									<td>
										${memberInfo.phone}
									</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>
										[${memberInfo.postcode}] ${memberInfo.address}	
										<input class="ordername_input" value="${memberInfo.mname}" type="hidden">
										<input class="orderphone_input" type="hidden" value="${memberInfo.phone}">
										<input class="orderpostcode_input" type="hidden" value="${memberInfo.postcode}">
										<input class="orderaddress_input" type="hidden" value="${memberInfo.address}">							
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- 상품 정보 -->
			<div class="orderGoods_div">
				<!-- 상품 종류 -->
				<div class="goods_kind_div">
					주문상품 <span class="goods_kind_div_kind"></span>종 <span class="goods_kind_div_count"></span>개
				</div>
				<div class="line"></div>
				<table class="goods_table">
					<colgroup>
						<col width="15%">
						<col width="62%">
						<col width="23%">
					</colgroup>					
					<tbody>
						<c:forEach items="${orderList}" var="list">
							<tr>
								<td>
									<!-- 이미지 <td>-->
									<div class="image_wrap">
										<img src="<c:url value='/sarak/display'/>?filename=<c:out value='${list.attachList[0].uploadpath}/${list.attachList[0].filename}'/>" alt="표지 이미지"/>
									</div>
								</td>
								<td class="bookinfo">
									${list.bname}<br>
									<fmt:formatNumber value="${list.bprice}" pattern="#,###원"/>
								</td>
								<td class="goods_table_price_td">
									<strong class="totalprice"><fmt:formatNumber value="${list.totalPrice}" pattern="#,###원"/></strong><br>
									<span class="count">(수량 ${list.bookCount}개)</span>
									<input type="hidden" class="individual_bookPrice_input" value="${list.bprice}">
									<input type="hidden" class="individual_bookCount_input" value="${list.bookCount}">
									<input type="hidden" class="individual_totalPrice_input" value="${list.bprice * list.bookCount}">
									<input type="hidden" class="individual_bookId_input" value="${list.bid}">
								</td>
								
							</tr>							
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- 주문 종합 정보 -->
			<div class="total_info_div">
				<!-- 가격 종합 정보 -->
				<div class="total_info_price_div">
					<ul>
						<li>
							<span class="price_span_label">상품 금액</span>
							<span class="totalPrice_span">100000</span>원
						</li>
						<li>
							<span class="price_span_label">배송비</span>
							<span class="delivery_price_span">100000</span>원
						</li>
						<li class="price_total_li">
							<strong class="price_span_label total_price_label">최종 결제 금액</strong>
							<strong class="strong_red">
								<span class="total_price_red finalTotalPrice_span">
									1500000
								</span>원
							</strong>
						</li>
					</ul>
				</div>
				<!-- 버튼 영역 -->
				<div class="total_info_btn_div">
					<a class="order_btn">결제하기</a>
				</div>
				<!-- 주문 요청 form -->
				<form class="order_form" action="/sarak/order" method="post">
					<!-- 주문자 회원번호 -->
					<input name="mid" value="${memberInfo.mid}" type="hidden">
					<!-- 주소록 & 받는이-->
					<input name="ordername" type="hidden">
					<input name="orderphone" type="hidden">
					<input name="orderpostcode" type="hidden">
					<input name="orderaddress" type="hidden">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			</div>
		</div>
	</section>
	<div class="footerDiv">
		<%@include file="../includes/footer.jsp"%>
	</div>
</div>