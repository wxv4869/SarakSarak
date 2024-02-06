<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="../includes/adminheader.jsp" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">회원 정보 수정</h1>
		<!-- /.page-header -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
    	<div class="panel panel-default">
		<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="/admin/membermodify" method="post">
					<div class="form-group">
						<label>회원 아이디</label> <input class="form-control" name='mid' value='<c:out value="${member.mid}"/>' readonly="readonly">
	        		</div>
			        
					<div class="form-group">
						<label>회원 이름</label> <input class="form-control" name='mname' value='<c:out value="${member.mname}"/>'>
					</div>
			        
					<div class="form-group">
						<label>회원 전화번호</label> <input class="form-control" name='phone' value='<c:out value="${member.phone}"/>'>
					</div>
			        
					<div class="form-group">
						<label>회원 이메일</label> <input class="form-control" name='email' value='<c:out value="${member.email }"/>'>
					</div>
					
					<div class="form-group">
						<label>회원 우편번호</label> <input class="form-control" name='postcode' value='<c:out value="${member.postcode }"/>'>
					</div>
					
					<div class="form-group">
						<label>회원 주소</label>
						<textarea class="form-control" rows="3" name='address'><c:out value="${member.address}" /></textarea>
					</div>
					
					<button type="submit" data-oper="modify" class="btn btn-default">Member Modify</button>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
					<button type="submit" data-oper="list" class="btn btn-default">List</button>
				</form>
			</div>
			<!-- panel-boby -->
		</div>
		<!-- panel panel-default -->
	</div>
	<!-- col-lg-12 -->
</div>
<!-- /.row -->

<script type="text/javascript">
$(document).ready(function() {
	
	var formObj = $("form");
	
	$('button').on("click", function(e) {
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'list'){
			
			// move to list
			formObj.attr("action", "/admin/memberlist").attr("method", "get");
			
			formObj.empty();
			
		}
		
		formObj.submit();
		
	});
	
});
</script>

<%@include file="../includes/adminfooter.jsp" %>