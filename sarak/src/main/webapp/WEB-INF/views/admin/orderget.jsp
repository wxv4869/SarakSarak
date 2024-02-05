<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@include file="../includes/adminheader.jsp"%>

<script type="text/javascript">
$(document).ready(function() {

	var moveForm = $("#moveForm");
	
	/* 목록 페이지 이동 버튼 */
	$(".list-btn").on("click", function(e) {
		
		e.preventDefault();
		
		$("input[name=orderid]").remove();
		
		moveForm.attr("action", "/admin/orderlist");
		
		moveForm.submit();
		
	});

});
</script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">주문 상세 페이지</h1>
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
					        <td>도서 번호</td>
					        <td>도서명</td>
					        <td>수량</td>
					        <td>총 가격</td>
					        <td>리뷰 작성 여부</td>
					    </tr>
					</thead>
					<c:forEach items="${orderdetail}" var="order">
						<tr>
							<td>
								<c:out value="${order.bid}"/>
							</td>
							<td>
								<c:out value="${order.bname}"/>
							</td>
							<td>
								<c:out value="${order.odetailquan}"/>
							</td>
							<td>
								<fmt:formatNumber value="${order.odetailprice}" pattern="#,###원"/>
							</td>
							<td>
								<c:out value="${order.doreview}"/>
							</td>
						</tr>
					</c:forEach>
				</table>
			
				<div class="btn_section">
					<button id="list-btn" class="list-btn">목록</button>
                   	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</div> 
    		</div>
    		<!--  end panel-body -->
    		<form id="moveForm" method="get">
    			<input type="hidden" name="bid" value='<c:out value="${order.orderid}"/>'/>
    			<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'/>
    			<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'/>
    		</form>
		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<%@include file="../includes/adminfooter.jsp"%>