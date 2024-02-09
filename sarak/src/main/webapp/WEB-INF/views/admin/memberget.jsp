<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@include file="../includes/adminheader.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">회원 정보 페이지</h1>
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
					<label>회원 아이디</label> <input class="form-control" name='mid' value='<c:out value="${member.mid}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>회원 비밀번호</label> <input class="form-control" name='mpw' value='<c:out value="${member.mpw}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>회원 이름</label> <input class="form-control" name='mname' value='<c:out value="${member.mname}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>회원 전화번호</label> <input class="form-control" name='phone' value='<c:out value="${member.phone}"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>회원 이메일</label> <input class="form-control" name='email' value='<c:out value="${member.email}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>회원 우편번호</label> <input class="form-control" name='postcode' value='<c:out value="${member.postcode}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>회원 주소</label>
					<textarea class="form-control" rows="3" name='address' readonly="readonly"><c:out value="${member.address}"/></textarea>
				</div>
   
				<div class="form-group">
					<label>회원 가입일</label> 
					<input class="form-control" name='mregdate' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${member.mregdate}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>회원 권한</label>     
					<c:forEach items="${member.authList}" var="auth">
						<input class="form-control" name='auth' value='<c:out value="${auth.auth}"/>' readonly="readonly">
					</c:forEach>
				</div>
      
				<button data-oper='membermodify' class="btn btn-default" >Member Modify</button>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<button data-oper='authmodify' class="btn btn-default" >Auth Modify</button>
				<button data-oper='list' class="btn btn-info" >List</button>
				<button type="submit" data-oper="remove" class="btn btn-default">Remove</button>

				<form id='operForm' action="/admin/membermodify" method="get">
					<input type='hidden' id='mid' name='mid' value='<c:out value="${member.mid}"/>'>
					<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'/>
					<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'/>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>

				<form id='operForm2' action="/admin/authmodify" method="get">
					<input type='hidden' id='mid' name='mid' value='<c:out value="${member.mid}"/>'>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>

				<form id='operForm3' action="/admin/memberremove" method="post">
					<input type='hidden' id='mid' name='mid' value='<c:out value="${member.mid}"/>'>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
			</div>
			<!--  end panel-body -->
		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<script type="text/javascript">
$(document).ready(function() {

	var operForm = $("#operForm"); 
	var operForm2 = $("#operForm2"); 
	var operForm3 = $("#operForm3"); 

	$("button[data-oper='membermodify']").on("click", function(e) {
	  
		operForm.attr("action","/admin/membermodify").submit();
	  
	});

	$("button[data-oper='authmodify']").on("click", function(e) {
	   
		operForm2.attr("action","/admin/authmodify").submit();
	   
	});
	
	$("button[data-oper='remove']").on("click", function(e) {
	   
		operForm3.attr("action","/admin/memberremove").submit();
	
	});


	$("button[data-oper='list']").on("click", function(e) {
	  
		operForm.find("#mid").remove();
		
		operForm.attr("action","/admin/memberlist")
		
		operForm.submit();
	  
	});  
});
</script>

<%@include file="../includes/adminfooter.jsp"%>