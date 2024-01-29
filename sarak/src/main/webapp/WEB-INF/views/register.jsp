<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/customLogin";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#mloginid").val()==""){
					alert("아이디를 입력해주세요.");
					$("#mloginid").focus();
					return false;
				}
				if($("#mpw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#mpw").focus();
					return false;
				}
				if($("#mname").val()==""){
					alert("성명을 입력해주세요.");
					$("#mname").focus();
					return false;
				}
				if($("#phone").val()==""){
					alert("전화번호를 입력해주세요.");
					$("#phone").focus();
					return false;
				}
				if($("#email").val()==""){
					alert("아이디를 입력해주세요.");
					$("#email").focus();
					return false;
				}
				if($("#postcode").val()==""){
					alert("우편번호를 입력해주세요.");
					$("#postcode").focus();
					return false;
				}
				if($("#address").val()==""){
					alert("상세주소를 입력해주세요.");
					$("#address").focus();
					return false;
				}
			});
			
				
			
		})
	</script>
	<body>
		<section id="container">
			<form action="/register" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="mid">아이디</label>
					<input class="form-control" type="text" id="mid" name="mid" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="mpw">비밀번호</label>
					<input class="form-control" type="password" id="mpw" name="mpw" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="mname">이름</label>
					<input class="form-control" type="text" id="mname" name="mname" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="phone">전화번호</label>
					<input class="form-control" type="text" id="phone" name="phone" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="email">이메일</label>
					<input class="form-control" type="text" id="email" name="email" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="postcode">우편번호</label>
					<input class="form-control" type="text" id="postcode" name="postcode" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="address">상세주소</label>
					<input class="form-control" type="text" id="address" name="address" />
				</div>																
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원가입</button>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
		
	</body>
	
</html>