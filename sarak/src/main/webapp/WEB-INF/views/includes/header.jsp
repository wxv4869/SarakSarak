<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="">
	
	    <title>사락사락 관리자 계정</title>
	
	    <!-- Custom CSS -->
	    <link href="/resources/dist/css/main.css" type="text/css" rel="stylesheet">
	
	    <!-- Custom Fonts -->
	    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	</head>
	
	<body>
	    <div id="wrapper">
	
		<header>
			<div class="wapperloginBtn">
				<div class="loginBtn">
					<a href="/customLogin">로그인</a>
					<a href="/register">회원가입</a>
					<a href="#">고객센터</a>
				</div>
			</div>
				
			<div class="headerNav">
				<a href="#" class="mainHeder">
					<img src="img/logo.jpg">
				</a>
				
				<div class="Search">
					<input type="text" name="pdSearch" placeholder="도서명을 입력하세요"/>
					<button>
						<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="100" height="100" viewBox="0 0 30 30">
							<path d="M 13 3 C 7.4889971 3 3 7.4889971 3 13 C 3 18.511003 7.4889971 23 13 23 C 15.396508 23 17.597385 22.148986 19.322266 20.736328 L 25.292969 26.707031 A 1.0001 1.0001 0 1 0 26.707031 25.292969 L 20.736328 19.322266 C 22.148986 17.597385 23 15.396508 23 13 C 23 7.4889971 18.511003 3 13 3 z M 13 5 C 17.430123 5 21 8.5698774 21 13 C 21 17.430123 17.430123 21 13 21 C 8.5698774 21 5 17.430123 5 13 C 5 8.5698774 8.5698774 5 13 5 z"></path>
						</svg>
					</button>
				</div>
				
				<div class="userNav">
					<button>
						<?xml version="1.0" encoding="UTF-8"?>
						<svg xmlns="http://www.w3.org/2000/svg" id="Outline" viewBox="0 0 24 24" width="512" height="512">
							<path d="M21,6H18A6,6,0,0,0,6,6H3A3,3,0,0,0,0,9V19a5.006,5.006,0,0,0,5,5H19a5.006,5.006,0,0,0,5-5V9A3,3,0,0,0,21,6ZM12,2a4,4,0,0,1,4,4H8A4,4,0,0,1,12,2ZM22,19a3,3,0,0,1-3,3H5a3,3,0,0,1-3-3V9A1,1,0,0,1,3,8H6v2a1,1,0,0,0,2,0V8h8v2a1,1,0,0,0,2,0V8h3a1,1,0,0,1,1,1Z"></path>
						</svg>
					</button>
					<button>
						<?xml version="1.0" encoding="UTF-8"?>
						<svg xmlns="http://www.w3.org/2000/svg" id="Outline" viewBox="0 0 24 24" width="512" height="512">
							<path d="M12,12A6,6,0,1,0,6,6,6.006,6.006,0,0,0,12,12ZM12,2A4,4,0,1,1,8,6,4,4,0,0,1,12,2Z"></path>
							<path d="M12,14a9.01,9.01,0,0,0-9,9,1,1,0,0,0,2,0,7,7,0,0,1,14,0,1,1,0,0,0,2,0A9.01,9.01,0,0,0,12,14Z"></path>
						</svg>
					</button>
				</div>
			</div>
		</header>
		
		<nav>
			<div class="menubar">
				<ul>
					<li><a href="/sarak/allBookList">전체도서</a></li>
					<li><a href="/sarak/bestBookList" id="current">베스트도서</a></li>
					<li><a href="/sarak/newBookList" id="com">신간도서</a></li>
					<li><a href="#">공지사항</a></li>
				</ul>
			</div>
		</nav>
	
		<div id="page-wrapper">
        
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>