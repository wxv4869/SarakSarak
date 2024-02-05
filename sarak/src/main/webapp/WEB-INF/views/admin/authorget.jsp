<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@include file="../includes/adminheader.jsp"%>

<script type="text/javascript">
$(document).ready(function() {

	var moveForm = $("#moveForm");
	
	/* 목록 페이지 이동 버튼 */
	$(".list-btn").on("click", function(e) {
		
		e.preventDefault();
		
		$("input[name=authorid]").remove();
		
		moveForm.attr("action", "/admin/authorlist");
		
		moveForm.submit();
		
	});
	
	/* 수정 페이지 이동 버튼 */
	$(".modify-btn").on("click", function(e) {
		
		e.preventDefault();
		
		moveForm.attr("action", "/admin/authormodify");
		
		moveForm.submit();
		
	});
	
	/* 삭제 버튼 */
	var deleteForm = $("#deleteForm");
	
	$("#delete-btn").on("click", function(e) {
		
		deleteForm.attr("action", "/admin/authordelete").submit();
		
	});
	
});
</script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">작가 정보 페이지</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
		<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="form-group">
					<label>작가 번호</label>
					<input class="form-control" name='authorid' value='<c:out value="${author.authorid}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>작가 이름</label>
					<input class="form-control" name='authorname' value='<c:out value="${author.authorname}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>작가 소개글</label>
					<input class="form-control" name='authordesc' value='<c:out value="${author.authordesc}"/>' readonly="readonly">
				</div>
				
				<div class="btn_section">
					<button id="list-btn" class="list-btn">목록</button>
                   	<button id="modify-btn" class="modify-btn">수정</button>
                   	<button id="delete-btn" class="delete-btn">삭제</button>
				</div> 
    		</div>
    		<!--  end panel-body -->
    		<form id="moveForm" method="get">
    			<input type="hidden" name="authorid" value='<c:out value="${author.authorid}"/>'/>
    			<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'/>
    			<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'/>
    		</form>
    		
    		<form id="deleteForm" action="/admin/authordelete" method="post">
    			<input type='hidden' id='authorid' name='authorid' value='<c:out value="${author.authorid}"/>'>
    			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    		</form>
		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<%@include file="../includes/adminfooter.jsp"%>