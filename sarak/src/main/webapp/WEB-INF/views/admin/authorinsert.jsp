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
	color: #e05757;
	font-weight: 300;
}
</style>

<script>
$(document).ready(function(e) {
	
	var insertForm = $("#insertForm");
	
	/* 목록 페이지 이동 버튼 */
	$("#cancel-btn").click(function(e) {
		
		location.href="/admin/authorlist";
		
	});
	
	/* 등록 버튼 작동 및 유효성 검사 */
	$(".insert-btn").click(function(e) {
		
		// 작가 이름과 소개가 공란이면 등록 처리하지 않음
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
			
			insertForm.submit();
			
		} else {
			
			return false;
			
		}
		
	});
	
});
</script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">작가 등록</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
		<!-- /.panel-heading -->
			<form id="insertForm" action="/admin/authorinsert" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<div class="panel-body">
					<div class="form-group">
						<label>작가 이름</label><br>
						<input name="authorname">
						<span id="warn_authorname">작가 이름을 입력해 주세요.</span>
					</div>
	
					<div class="form-group">
						<label>작가 소개글</label><br>
						<input name="authordesc">
						<span id="warn_authordesc">작가 소개글을 입력해 주세요.</span>
					</div>
				</div>
			</form>
					
			<div class="btn_section">
				<button id="cancel-btn" class="cancel-btn">취소</button>
              	<button id="insert-btn" class="insert-btn">등록</button>
			</div>
		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<%@include file="../includes/adminfooter.jsp"%>