<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@include file="../includes/adminheader.jsp"%>

<style>
/* 입력란 공란 경고 태그 */
.form-group span {	
	display: none;
	padding-top: 10px;
	text-align: center;
	color: #e05757;
	font-weight: 300;
}
</style>

<script type="text/javascript">
$(document).ready(function() {

	var moveForm = $("#moveForm");
	
	var modifyForm = $("#modifyForm");
	
	/* 상세 페이지 이동 버튼 */
	$(".cancel-btn").on("click", function(e) {
		
		e.preventDefault();
		
		moveForm.attr("action", "/admin/authorget");
		
		moveForm.submit();
		
	});
	
	/* 수정 버튼 작동 및 유효성 검사 */
	$(".modify-btn").on("click", function(e) {
		
		// 작가 이름과 소개가 공란이면 수정 처리하지 않음
		var authorname = $(".form-group input[name='authorname']").val();
		var authordesc = $(".form-group input[name='authordesc']").val();
		
		var nameCheck = false;
		var descCheck = false;
		
		e.preventDefault();
		
		if (!authorname) {
			
			$("#warn_authorname").css("display", "block");
			
		} else {
			
			$("#warn_authorname").css("display", "none");
			
			nameCheck = true;
			
		}
		
		if (!authordesc) {
			
			$("#warn_authordesc").css("display", "block");
			
		} else {
			
			$("#warn_authordesc").css("display", "none");
			
			descCheck = true;
			
		}
		
		if (nameCheck && descCheck) {
			
			modifyForm.submit()
			
		} else {
			
			return false;
			
		}
		
	});
	
});
</script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">작가 정보 수정</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
		<!-- /.panel-heading -->
			<form id="modifyForm" action="/admin/authormodify" method="post">
				<div class="panel-body">
					<div class="form-group">
						<label>작가 번호</label>
						<input class="form-control" name='authorid' value='<c:out value="${author.authorid}"/>' readonly="readonly">
					</div>
	
					<div class="form-group">
						<label>작가 이름</label><br>
						<input name='authorname' value='<c:out value="${author.authorname}"/>'>
						<span id="warn_authorname">작가 이름을 입력 해주세요.</span>
					</div>
	
					<div class="form-group">
						<label>작가 소개글</label><br>
						<input name='authordesc' value='<c:out value="${author.authordesc}"/>'>
						<span id="warn_authordesc">작가 소개글을 입력 해주세요.</span>
					</div>
					
					<div class="btn_section">
						<button id="cancel-btn" class="cancel-btn">취소</button>
	                   	<button id="modify-btn" class="modify-btn">수정</button>
	                   	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</div> 
	    		</div>
	    	</form>
    		<!--  end panel-body -->
    		<form id="moveForm" method="get">
    			<input type="hidden" name="authorid" value='<c:out value="${author.authorid}"/>'/>
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