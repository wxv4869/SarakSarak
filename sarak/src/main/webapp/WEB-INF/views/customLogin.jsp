<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="">
	
	    <title>Login</title>
	
		<link rel="stylesheet" href="../../resources/dist/css/customLogin.css">
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script>
    	$(".btn-success").on("click", function(e) {
    		
    		e.preventDefault();
    		
    		$("form").submit();
    		
    	})
    	</script>
	</head>
	
	<body>
	    <div class="loginContainer">
	        <div class="row">
				<div class="header">
				    <h2 class="title">로그인</h2>
				</div>
                <div class="body">
					<form role="form" method='post' action="/login">
					    <fieldset>
					    	<div class="form-outline">
						     	<div class="form-group">
						            <input class="form-control" placeholder="아이디를 입력해 주세요." name="username" type="text" autofocus>
						        </div>
					        	<div class="line"></div>
						        <div class="form-group">
						            <input class="form-control" placeholder="비밀번호를 입력해 주세요." name="password" type="password" value="">
								</div>
					    	</div>
					        
					        <div class="checkbox">
					        	<input name="remember-me" type="checkbox">
					            <label>간편 로그인 정보 저장</label>
					        </div>
					    	<input class="submitBtn" type="submit" value="로그인">
						</fieldset>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
					<div class="registerQ">
						아직 회원이 아니신가요?
						<a href="/register">회원가입</a>
					</div>   
	            </div>
	        </div>
	    </div>
	</body>
</html>