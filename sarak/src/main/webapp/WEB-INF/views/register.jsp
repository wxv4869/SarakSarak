<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<link rel="stylesheet" href="../../resources/dist/css/register.css">
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".btn-cancel").on("click", function() {
			
			location.href = "/customLogin";
					    
		})
	
		$("#submit").on("click", function() {
			
			if($("#mloginid").val()=="") {
				alert("아이디를 입력해주세요.");
				$("#mloginid").focus();
				return false;
			}
			
			if($("#mpw").val()=="") {
				alert("비밀번호를 입력해주세요.");
				$("#mpw").focus();
				return false;
			}
			
			if($("#mname").val()=="") {
				alert("성명을 입력해주세요.");
				$("#mname").focus();
				return false;
			}
			
			if($("#phone").val()=="") {
				alert("전화번호를 입력해주세요.");
				$("#phone").focus();
				return false;
			}
			
			if($("#email").val()=="") {
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return false;
			}
			
			if($("#postcode").val()=="") {
				alert("우편번호를 입력해주세요.");
				$("#postcode").focus();
				return false;
			}
			
			if($("#address").val()=="") {
				alert("상세주소를 입력해주세요.");
				$("#address").focus();
				return false;
			}
			
		});
		
	})
	</script>
	<body>
		<div id="registerContainer">
		    <div class="register-wrap">
		    	<div class="register_content_subject">
					<h2>회원가입</h2>
				</div>
				<!-- /.panel-heading -->
				<div class="register-body">
					<form action="/register" method="post">
						<table>
							<tr>
								<td class="col1">아이디</td>
								<td class="col2"><input class="profile-form-control" type="text" id="mid" name="mid" placeholder="아이디를 입력해 주세요."/></td>
							</tr>
							
							<tr>
								<td class="col1">비밀번호</td>
								<td class="col2"><input class="profile-form-control" type="password" id="mpw" name="mpw" placeholder="비밀번호를 입력해 주세요."/></td>
							</tr>
							
							<tr>
								<td class="col1">이름</td>
								<td class="col2"><input class="profile-form-control" type="text" id="mname" name="mname" placeholder="이름을 입력해 주세요."/></td>
							</tr>
							
							<tr>
								<td class="col1">전화번호</td>
								<td class="col2"><input class="profile-form-control" type="text" id="phone" name="phone" placeholder="전화번호를 입력해 주세요."/></td>
							</tr>
							
							<tr>
								<td class="col1">이메일</td>
								<td class="col2"><input class="profile-form-control" type="text" id="email" name="email" placeholder="이메일을 입력해 주세요."/></td>
							</tr>
							
							<tr>
								<td class="col1">우편번호</td>
								<td class="col2"><input class="profile-form-control" type="text" id="postcode" name="postcode" placeholder="우편번호를 입력해 주세요."/></td>
							</tr>
							
							<tr>
								<td class="col1">상세 주소</td>
								<td class="col2"><input class="profile-form-control" type="text" id="address" name="address" placeholder="상세주소를 입력해 주세요."/></td>
							</tr>
						</table>
						
						<div class="form-group has-feedback">
							<button class="btn-register" type="submit" id="submit">회원가입</button>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
							<button class="btn-cancel" type="button">취소</button>
						</div>
					</form>
				</div>
	    	</div>
		</div>
		<div class="clearfix"></div>
	</body>
</html>