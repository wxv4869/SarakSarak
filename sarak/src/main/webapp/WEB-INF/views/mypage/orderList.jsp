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
    <link rel="stylesheet" href="../../resources/dist/css/orderList.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script type="text/javascript">
 	function addToCart(bookId) {
		
	    var quantity = 1;    // 리스트에서 장바구니 처리 요청은 quantity를 1로 고정

	    <sec:authorize access="isFullyAuthenticated()">
	        $.ajax({
	            type: "POST",
	            url: "/cart/add",
	            data: { bookId: bookId, quantity: quantity, ${_csrf.parameterName}: '${_csrf.token}' },
	            success: function(response) {
	                alert("해당 상품이 장바구니에 추가되었습니다.");
	            },
	            error: function() {
	                alert("상품을 장바구니에 추가하는데 실패했습니다.");
	            }
	        });
	    </sec:authorize>

	    <sec:authorize access="isAnonymous()">
	        alert("로그인이 필요합니다.");
	    </sec:authorize>
	}
	 
	$(document).ready(function() {
			
		var actionForm = $("#actionForm");
			
		// 페이징, 페이지 이동 처리
		$(".paginate_button a").on("click", function(e) {
			
			e.preventDefault();
			
			console.log('click');
			
			console.log($(this).attr("href"));
			

			actionForm.find("input[name = 'pageNum']").val($(this).attr("href"));
			
			actionForm.submit();
			
		});
			
		$(".move").on("click", function(e) {
			
			e.preventDefault();
			
			actionForm.append("<input type='hidden' name='orderid' value='" + $(this).attr("href") + "'>");
			
			actionForm.attr("action", "/mypage/orderDetail");
			
			actionForm.submit();
			
			history.replaceState({ page: "orderDetail", orderid: orderid }, "order Detail", "/mypage/orderDetail?orderid=" + orderid);
			
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
	       	<div class="mypage_content_subject"><span>주문 내역</span></div>
	       	<div class="order_table_wrap">	       	
	       		<c:if test="${listCheck != 'empty'}">
		       		<table class="order_table">
				        <colgroup>
					        <col width="21%">
					        <col width="20%">
					        <col width="20%">
					        <col width="20%">
					       	<col width="19%%">
				       	</colgroup>
		            	<thead>
			            	<tr>
				                <td class="th_column_1">주문 번호</td>
				                <td class="th_column_2">수령자</td>
				                <td class="th_column_3">주문 날짜</td>
				                <td class="th_column_4">주문 상태</td>
			                </tr>
		                </thead>
		                <c:forEach items="${list}" var="list">
			                <tr class="list_td">
				                <td>
				                	<a class='move' href='<c:out value="${list.orderid}"/>'>
	                                <c:out value="${list.orderid}"/></a>			
	                            </td>
				                <td><c:out value="${list.mid}"></c:out></td>
				                <td><fmt:formatDate value="${list.orderdate}" pattern="yyyy-MM-dd"/></td>
				                <td style="<c:if test="${list.orderstate == '주문취소'}">color:#8E8E8E;</c:if> <c:if test="${list.orderstate == '배송완료'}">color:#0066FF;</c:if>" class="list_orderstate"><c:out value="${list.orderstate}"/></td>
			               	</tr>
		               	</c:forEach>
					</table>
	     		</c:if>      	
	       	
	       		<c:if test="${listCheck == 'empty'}">
					<div class="empty-orderList">
						<img src="../resources/img/empty.png">
						<p>주문 내역이 없습니다.</p>
					</div>
				</c:if>
			
				<c:if test="${listCheck != 'empty'}">
	       	
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
					<form id='actionForm' action="/mypage/orderList" method='get'>
						<input type='hidden' name='mid' value='${member.mid}'>
						<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
						<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
					</form>
					<!-- 페이징 영역 끝 -->
				</c:if>
	       	</div>
	    </div>
	    <div class="clearfix"></div>	
	</div>
	<!-- contents-area -->
	<div class="mypage_wrap">
	
	</div>
	<%@include file="../includes/footer.jsp"%>	
</div>