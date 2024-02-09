<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@include file="../includes/adminheader.jsp" %>

<style>
.orderstate {
	font-weight: 600;
	font-style: italic;
	text-align: center;
}
</style>
 
<script type="text/javascript">
function updateOrderState(orderid) {
	
	var newOrderState = "배송완료";
	
	$.ajax({
		type: "POST",
		url: "/admin/updateOrderState",
		data: {
			orderid: orderid,
			orderstate: newOrderState,
			_csrf: '${_csrf.token}'
		},
		success: function(response) {
			console.log(response);
			alert("주문 상태를 배송완료로 업데이트했습니다.");
			location.reload();
		},
		error: function(error) {
			console.error(error);
			alert("주문 상태 업데이트 실패");
		}
	});
}

$(document).ready(function() {
	
	var moveForm = $("#moveForm");
	
	/* 페이지 이동 버튼 */
	$(".paginate_button a").on("click", function(e) {
		
		e.preventDefault();
		
		moveForm.find("input[name = 'pageNum']").val($(this).attr("href"));
		
		moveForm.submit();
		
	});
	
	/* 주문 상태에 따라 글자색 변경 */
	$(".orderstate").each(function() {
		
		var orderStateText = $(this).text().trim();
		
		if (orderStateText.includes("배송완료")) {
			
			$(this).css("color", "blue");
			
		} else if (orderStateText.includes("배송준비중")) {
			
			$(this).css("color", "red");
			
		}
		
	});
	
	/* 상세 페이지 이동 버튼 */
	$(".move").on("click", function(e) {
		
		e.preventDefault();
		
		moveForm.append("<input type='hidden' name='orderid' value='" + $(this).attr("href") + "'>");
		
		moveForm.attr("action", "/admin/orderget");
		
		moveForm.submit();
		
	});
	
});
</script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">주문 목록</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
            
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
		<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover" >
					<thead>
						<tr>
							<td>주문 번호</td>
							<td>주문 회원 아이디</td>
							<td>주문 날짜</td>
							<td>총 금액</td>
							<td>주문 상태</td>
							<td>주문자 이름</td>
							<td>주문자 전화번호</td>
							<td>배송지 우편번호</td>
							<td>배송지 상세 주소</td>
						</tr>
					</thead>
					<c:forEach items="${orderlist}" var="order">
                         <tr>
                       		<td class="orderid">
								<a class="move" href='<c:out value="${order.orderid}"/>'>
                       				<c:out value="${order.orderid}"/>
                       			</a>
                       		</td>
                       		<td>
                       			<c:out value="${order.mid}"/>
                       		</td>
                       		<td>
                       			<fmt:formatDate value="${order.orderdate}" pattern="yyyy년 MM월 dd일"/>
                       		</td>
                       		<td>
                       			<fmt:formatNumber value="${order.totalprice}" pattern="#,###원"/>
                       		</td>
                       		<td class="orderstate">
                       			<c:out value="${order.orderstate}"/>
                       			<input type="hidden" value="${order.orderid}">
                       			<c:if test="${fn:contains(order.orderstate, '배송준비중')}">
                       				<button id="update-btn" class="update-btn" onclick="updateOrderState('<c:out value="${order.orderid}"/>')" style="cursor: pointer; margin-left: 10px;">update</button>
                       			</c:if>
                       		</td>
                      		<td>
                      			<c:out value="${order.ordername}"/>
                      		</td>
                      		<td>
                      			<c:out value="${order.orderphone}"/>
                      		</td>
                      		<td>
                      			<c:out value="${order.orderpostcode}"/>
                      		</td>
                      		<td>
                      			<c:out value="${order.orderaddress}"/>
                      		</td>
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
				<form id='moveForm' action="/admin/orderlist" method='get'>
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				</form>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
            
<%@include file="../includes/adminfooter.jsp" %>