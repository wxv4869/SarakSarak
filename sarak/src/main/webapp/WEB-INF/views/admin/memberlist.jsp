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
	
	/* 상세 페이지 이동 버튼 */
	$(".move").on("click", function(e) {
		
		e.preventDefault();
		
		moveForm.append("<input type='hidden' name='mid' value='" + $(this).attr("href") + "'>");
		
		moveForm.attr("action", "/admin/memberget");
		
		moveForm.submit();
		
	});
	
});
</script>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">회원 목록</h1>
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
					        <th>#아이디</th>
					        <th>이름</th>
					        <th>전화번호</th>
					        <th>이메일</th>
					        <th>가입일</th>
					        <th>권한</th>
					    </tr>
					</thead>
					<c:forEach items="${memberlist}" var="member">
						<tr>
							<td><c:out value="${member.mid}"/></td>
							<td>
								<a class="move" href='<c:out value="${member.mid}"/>'>
									<c:out value="${member.mname}"/>
								</a>
							</td>
							<td><c:out value="${member.phone}"/></td>
							<td><c:out value="${member.email}"/></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.mregdate}"/></td>
							<td>
								<c:forEach items="${member.authList}" var="auth">
									<c:out value="${auth.auth}" />
								</c:forEach>
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
				<form id='moveForm' action="/admin/memberlist" method='get'>
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