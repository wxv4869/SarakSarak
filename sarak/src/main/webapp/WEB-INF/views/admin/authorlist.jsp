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
	
	/* 작가 등록 버튼 */
	$(".insert-btn").on("click", function(e) {
		
		self.location = "/admin/authorinsert"
		
	});
	
	/* 작가 등록 처리 결과 */
	var result = '<c:out value="${insert_result}"/>';
	
	checkResult(result);
	
	function checkResult(result) {
		
		if (result == '') {
			
			return;
			
		}
		
		alert("작가 '${insert_result}' 등록이 완료되었습니다.");
		
	}
	
	/* 상세 페이지 이동 버튼 */
	$(".move").on("click", function(e) {
		
		e.preventDefault();
		
		moveForm.append("<input type='hidden' name='authorid' value='" + $(this).attr("href") + "'>");
		
		moveForm.attr("action", "/admin/authorget");
		
		moveForm.submit();
		
	});
	
	/* 작가 정보 수정 결과 */
	var mresult = '<c:out value="${modify_result}"/>';
	
	checkmResult(mresult);
	
	function checkmResult(mresult) {
	
		if (mresult === '1') {
			
			alert("작가 정보 수정이 완료되었습니다.");
			
		} else if (mresult === '0') {
			
			alert("작가 정보 수정을 실패하였습니다.");
			
		}
		
	}
	
	/* 삭제 버튼 */
	$("#delete-btn").on("click", function(e) {
		
		e.preventDefault();
		
		moveForm.find("input").remove();
		
		moveForm.append('<input type="hidden" name="authorid" value="${author.authorid}">');
		
		moveForm.attr("action", "/admin/authordelete");
		
		moveForm.attr("method", "post");
		
		moveForm.submit();
		
	});
	
	/* 작가 삭제 결과 */
	var delete_result = "${delete_result}";
	
	if (delete_result == 1) {
		
		alert("삭제가 완료되었습니다.");
		
	} else if (delete_result == 2) {
		
		alert("해당 작가 데이터를 참조하는 도서 데이터가 존재하고 있어 삭제할 수 없습니다.");
		
	}
	
});
</script>

<div class="row">
    <div class="col-lg-12">
	    <h1 class="page-header">작가 목록</h1>
	  	<button id="insert-btn" type="button" class="insert-btn">새 작가 등록하기</button>
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
							<td>작가 번호</td>
							<td>작가 이름</td>
						</tr>
					</thead>
					<c:forEach items="${authorlist}" var="author">
						<tr>
							<td>
								<c:out value="${author.authorid}"/>
							</td>
							<td>
								<a class="move" href='<c:out value="${author.authorid}"/>'>
									<c:out value="${author.authorname}"/>
								</a>
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
				<form id='moveForm' action="/admin/authorlist" method='get'>
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