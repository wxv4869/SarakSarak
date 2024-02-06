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
					<form role="form" action="/mypage/profileModify" method="post">
						<div class="profile-title">
					      <label>아이디</label>
					      <label>이름</label>
					      <label>전화번호</label>
					      <label>이메일</label>
					      <label>우편번호</label>
					      <label class="profile-textarea">상세 주소</label>
					    </div>

					    <div class="profile-input">
					    	<input class="profile-form-control" name='mid' value='<c:out value="${member.mid}"/>' readonly="readonly">
					    	<input class="profile-form-control" name='mname' value='<c:out value="${member.mname}"/>'>
						    <input class="profile-form-control" name='phone' value='<c:out value="${member.phone}"/>'>
						   	<input class="profile-form-control" name='email' value='<c:out value="${member.email}"/>'>
						   	<input class="profile-form-control" name='postcode' value='<c:out value="${member.postcode}"/>'>
						   	<textarea class="profile-form-control" rows="3" name='address'><c:out value="${member.address}"/></textarea>
					    </div>

						<button type="submit" data-oper="modify" class="profileModify-modifyBtn">정보 수정</button>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>
				
					<div class="profilepwd-title">
				    	<label>회원 비밀번호</label> 
				    </div>
				    <div>
				    	<div class="profile-form-control">******* <button onclick="location.href='/mypage/passwordModify?mid=<c:out value="${principal.member.mid}"/>'" class="profilePwd-modifyBtn">비밀번호 변경</button></div>
				    </div>
				</div>
				<!-- panel-boby -->
			</div>
			<!--  end panel-body -->
	    </div>
	    <div class="clearfix"></div>	
	</div>
	<!-- contents-area -->
    <div class="mypage_wrap">

    </div>
	<%@include file="../includes/footer.jsp"%>
</div>