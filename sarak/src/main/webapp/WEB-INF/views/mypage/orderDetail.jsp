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
    <link rel="stylesheet" href="../../resources/dist/css/mypage.css">
    <link rel="stylesheet" href="../../resources/dist/css/orderDetail.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script type="text/javascript">
	/* 총 주문 정보 세팅 (배송비, 총 가격, 마일리지, 물품 수, 종류) */
	function setTotalInfo() {

		let totalPrice = 0;    // 총 가격
		let totalCount = 0;    // 총 갯수
		let totalKind = 0;    // 총 종류
		let deliveryPrice = 0;    // 배송비
			
		$(".goods_table_price_td").each(function(index, element) {
			
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
		
		setTotalInfo();
		
		$(".order_btn").on("click", function(e) {
			
			console.log("click");
			
			e.preventDefault();
			
			let id = $(this).data("orderid");
			
			console.log(id);
			
			$("#deleteForm").find("input[name='orderid']").val(id);
			
			$("#deleteForm").submit();
			
		});
			
	});
	</script>
</head>

<div class="sarakMainWrapper">
	<%@include file="../includes/header.jsp"%>
	<div class="mypage_wrap">
		<!-- 네비영역 -->
	    <div class="mypage_navi_wrap">
	        <div class="nav_title">마이페이지</div>
			<hr>
				<ul>
					<li>
						<a class="nav_list_01" href='/mypage/orderList?mid=<c:out value="${principal.member.mid}"/>'>주문 내역</a>
					</li>
					<li>
						<a class="nav_list_02" href='/mypage/profile?mid=<c:out value="${principal.member.mid}"/>'>내 정보 수정</a>
					</li>
				</ul>	
	    </div>
	    <div class="mypage_content_wrap">
	       	<div class="mypage_content_subject"><span>주문 상세</span></div>
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
										<tbody class="shipitem">
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
												<th>배송지</th>
												<td class="shipdetailitem">
 													[${orderItem.orderpostcode}] ${orderItem.orderaddress}								
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
					<hr class="goods_hr">
					<table class="goods_table">
						<colgroup>
							<col width="15%">
							<col width="62%">
							<col width="23%">
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
									<td class="bookinfo">
										${ods.bname}<br>
										<fmt:formatNumber value="${ods.odetailprice}" pattern="#,###원"/>
									</td>
									<td class="goods_table_price_td">
										<strong class="totalprice"><fmt:formatNumber value="${ods.odetailprice * ods.odetailquan}" pattern="#,###원" /></strong><br>
										<span class="count">(수량 ${ods.odetailquan}개)</span>
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
								<span class="totalPrice_span"><fmt:formatNumber value="${orderItem.totalprice}" pattern="#,###원"/></span>
							</li>
							<li>
								<span class="price_span_label">배송비</span>
								<span class="delivery_price_span">0</span>원
							</li>
							<li class="price_total_li">
								<strong class="price_span_label total_price_label">최종 결제 금액</strong>
								<strong class="strong_red">
									<span class="total_price_red finalTotalPrice_span">
										<fmt:formatNumber value="${orderItem.totalprice}" pattern="#,###원"/>
									</span>
								</strong>
							</li>
						</ul>
					</div>
					<!-- 버튼 영역 -->
					<c:if test="${orderstate != '주문취소' }">
						<div class="total_info_btn_div">
							<a class="order_btn" data-orderid="${orderItem.orderid}">주문 취소</a>
						</div>
						
						<!-- 주문 요청 form -->
						<form id="deleteForm" action="/mypage/orderCancle" method="post">
							<input name="orderid" type="hidden">
							<input name="mid" value="${principal.member.mid}" type="hidden">
							<input type="hidden" name="pageNum" value="${cri.pageNum}">
							<input type="hidden" name="amount" value="${cri.amount}">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
					</c:if>
				</div>
	    	</div>
	    	<div class="clearfix"></div>	
		</div>
	</div>
	<%@include file="../includes/footer.jsp"%>
</div>