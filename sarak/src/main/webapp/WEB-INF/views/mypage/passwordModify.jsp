<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="../../resources/dist/css/mypage.css">
    <link rel="stylesheet" href="../../resources/dist/css/profile.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
	<script type="text/javascript">
   	$(document).ready(function() {
      		
		var formObj = $("form[role='form']");
      		
		$("button[type='submit']").on("click", function(e) {
      			    
			e.preventDefault();
	    		
			console.log("submit clicked");
	    			    
			var pwd = $("input[name='mpw']").val();
	    			    
			console.log(pwd)
      			    
			if(pwd.length == 0){
	   			    	
				alert("비밀번호를 입력하세요.");
	   			    	
				$("input[name='mpw']").focus();
	   			    	
				return false;
	   			    	
			}
      			
			formObj.submit();

		});
      		 
   	});
	</script>
</head>

<div class="sarakMainWrapper">
	<%@include file="../includes/header.jsp"%>
	<div class="mypage_wrap">
		<!-- 네비영역 -->
	    <div class="mypage_navi_wrap">
	        <div class="nav_title">마이페이지</div>
			<hr>
				<ul>
					<li>
						<a class="nav_list_01" href='/mypage/orderList?mid=<c:out value="${principal.member.mid}"/>'>주문 내역</a>
					</li>
					<li>
						<a class="nav_list_02" href='/mypage/profile?mid=<c:out value="${principal.member.mid}"/>'>내 정보 수정</a>
					</li>
				</ul>	
	    </div>
	    <div class="mypage_content_wrap">
	       	<div class="mypage_content_subject"><span>내 정보 수정</span></div> 
	    	<div class="profile-wrap">
	      	<!-- /.panel-heading -->
				<div class="profile-body">
					<form role="form" action="/mypage/passwordModify" method="post">
						<div class="profile-title">
					      <label>아이디</label>
					      <label>비밀번호</label>
					    </div>
				    
					    <div class="profile-input">
						    <input class="profile-form-control" name='mid' value='<c:out value="${member.mid}"/>' readonly="readonly">
						   	<input class="profile-form-control" name='mpw' value='<c:out value="" />'>
					    </div>
						<button type="submit" data-oper="modify" class="profilepwd-pwdmBtn">비밀번호 수정</button>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>
				</div>
				<!-- panel-boby -->
			</div>
			<!-- panel panel-default -->
	    </div>
	    <div class="clearfix"></div>	
	</div>
	<!-- contents-area -->
	<div class="mypage_wrap">

	</div>
	<%@include file="../includes/footer.jsp"%>
</div>