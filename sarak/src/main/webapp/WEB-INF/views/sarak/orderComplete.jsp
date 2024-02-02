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
	function setTotalInfo(){

			let totalPrice = 0;				// 총 가격
			let totalCount = 0;				// 총 갯수
			let totalKind = 0;				// 총 종류
			let deliveryPrice = 0;			// 배송비
			
			$(".goods_table_price_td").each(function(index, element){
				// 총 가격
				totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
				// 총 갯수
				totalCount += parseInt($(element).find(".individual_bookCount_input").val());
				// 총 종류
				totalKind += 1;
			});	
	

			
			// 총 갯수
			$(".goods_kind_div_count").text(totalCount);
			// 총 종류
			$(".goods_kind_div_kind").text(totalKind);	
			
		}
	$(document).ready(function() {
		
		/* 주문 조합정보란 최신화 */
		setTotalInfo();
			
		});
			
			
	</script>
	
</head>

<div class="sarakMainWrapper">
	<%@include file="../includes/header.jsp"%>
	
	<section >
		<div>
			${orderItem }
		</div>
		<div class="content_main">
				<!-- 배송지 정보 -->
				<div class="addressInfo_div">
					<div class="addressInfo_input_div_wrap">
						<div class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
									<table>
										<colgroup>
											<col width="25%">
											<col width="*">
										</colgroup>
										<tbody>
											<tr>
												<th>이름</th>
												<td>
													${orderItem.ordername}
												</td>
											</tr>
											<tr>
												<th>연락처</th>
												<td>
													${orderItem.orderphone}
												</td>
											</tr>
											<tr>
												<th>주소</th>
												<td>
 													${orderItem.orderpostcode} <br>${orderItem.orderaddress}								
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
					<!-- 상품 테이블 -->
					<table class="goods_subject_table">
						<colgroup>
							<col width="15%">
							<col width="45%">
							<col width="40%">
						</colgroup>
						<tbody>
							<tr>
								<th>이미지</th>
								<th>상품 정보</th>
								<th>판매가</th>
							</tr>
						</tbody>
					</table>
					<table class="goods_table">
						<colgroup>
							<col width="15%">
							<col width="45%">
							<col width="40%">
						</colgroup>					
						<tbody>
								<c:forEach items="${orderItem.orders}" var="ods">
								<tr>
									<td>
										<!-- 이미지 <td>-->
										<div class="image_wrap">
											<img src="<c:url value='/sarak/display'/>?filename=<c:out value='${ods.attachList[0].uploadpath}/${ods.attachList[0].filename}'/>" alt="표지 이미지"/>
										</div>
									</td>
									<td>${ods.bname}</td>
									<td class="goods_table_price_td">
										<fmt:formatNumber value="${ods.odetailprice}" pattern="#,### 원" /> | 수량 ${ods.odetailquan}개
										<br><fmt:formatNumber value="${ods.odetailprice * ods.odetailquan}" pattern="#,### 원" />
										<input type="hidden" class="individual_bookCount_input" value="${ods.odetailquan}">
										<input type="hidden" class="individual_totalPrice_input" value="${ods.odetailprice * ods.odetailquan}">
	
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
								<span class="totalPrice_span">${orderItem.totalprice}</span>원
							</li>
							<li>
								<span class="price_span_label">배송비</span>
								<span class="delivery_price_span">0</span>원
							</li>
							<li class="price_total_li">
								<strong class="price_span_label total_price_label">최종 결제 금액</strong>
								<strong class="strong_red">
									<span class="total_price_red finalTotalPrice_span">
										${orderItem.totalprice}
									</span>원
								</strong>
							</li>
						</ul>
					</div>
				</div>
			</div>
	</section>
	<%@include file="../includes/footer.jsp"%>
	
</div>