<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/adminheader.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	
	var moveForm = $("#moveForm");
	
	/* 페이지 이동 버튼 */
	$(".paginate_button a").on("click", function(e) {
		
		e.preventDefault();
		
		moveForm.find("input[name = 'pageNum']").val($(this).attr("href"));
		
		moveForm.submit();
		
	});
	
	/* 도서 등록 버튼 */
	$(".insert-btn").on("click", function(e) {
		
		self.location = "/admin/bookinsert"
		
	});
	
	/* 도서 등록 처리 결과 */
	var iResult = '<c:out value="${insert_result}"/>';
	
	checkResult(iResult);
	
	function checkResult(iResult) {
		
		if (iResult == '') {
			
			return;
			
		}
		
		alert("도서 '" + iResult + "'등록이 완료되었습니다.");
		
	}
	
	/* 상세 페이지 이동 버튼 */
	$(".move").on("click", function(e) {
		
		e.preventDefault();
		
		moveForm.append("<input type='hidden' name='bid' value='" + $(this).attr("href") + "'>");
		
		moveForm.attr("action", "/admin/bookget");
		
		moveForm.submit();
		
	});
	
	/* 도서 정보 수정 결과 */
	var modify_result = '${modify_result}';
	
	if (modify_result == 1) {
		
		alert("도서 정보 수정이 완료되었습니다.");
		
	}
	
	/* 도서 삭제 결과 */
	var delete_result = "${delete_result}";
	
	if (delete_result == 1) {
		
		alert("삭제가 완료되었습니다.");
		
	} else if (delete_result == 2) {
		
		alert("삭제에 실패했습니다...");
		
	}
	
});
</script>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">도서 목록</h1>
       	<button id="insert-btn" type="button" class="insert-btn">새 도서 등록하기</button>   	
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
							<td>도서 이름</td>
							<td>도서 가격</td>
							<td>도서 ISBN</td>
							<td>도서 출간일</td>
							<td>도서 출판사</td>
						</tr>
					</thead>
					<c:forEach items="${booklist}" var="book">
						<tr>
							<td>
								<c:out value="${book.bid}"/>
							</td>
							<td>
								<a class="move" href='<c:out value="${book.bid}"/>'>
									<c:out value="${book.bname}"/>
								</a>
							</td>
							<td>
								<fmt:formatNumber value="${book.bprice}" pattern="#,###원"/>
							</td>
							<td>
								<c:out value="${book.isbn}"/>
							</td>
							<td>
								<fmt:formatDate value="${book.pubdate}" pattern="yyyy.MM.dd"/>
							</td>
							<td>
								<c:out value="${book.publisher}"/>
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
				<form id='moveForm' action="/admin/booklist" method='get'>
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