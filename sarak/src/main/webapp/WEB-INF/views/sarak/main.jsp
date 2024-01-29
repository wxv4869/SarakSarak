<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href="../../resources/dist/css/allBook.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<style>

		body {
			margin: 0;
		    padding: 0;
			font-size: 20px;
		}
		img {
		    border: 0;
		}
		ol,ul {
		    list-style: none;
		    padding: 0;
		    margin: 0;
		}
		a {
			display: inline-block;
			position: relative;
			text-decoration: none;
		}
		header {
			position: relative;
			margin: 0 auto;
			height: 200px;
		}
		
		header a.mainHeder{
			position: absolute;
			margin-left: 5%;
			float: left;
			top: 30%;
		}
		
		div.wapperloginBtn{
			width: 100%;
			height: 20%;
			background: rgba(240, 240, 240, 1);
		}
		
		div.loginBtn {
			position: absolute;
			font-size: 13px;
			display: inline-block;
		    height: 29px;
		    text-align: center;
		    line-height: 30px;	
		    top: 2.5%;
		    right: 5%;
		
		}
		div.loginBtn a {
			text-decoration: none;
			color: #666;
			margin-left: 16px;
		}
		div.Search {
			width: 33%;
			height: 18%;
			position: absolute;
			left: 25%;
			float: left;
			top: 50%;
			border-radius: 25px;
			border: 2px solid rgba(142, 230, 219, 1);
		}
		div.Search input {
			font-size: 13px;
			height: 100%;
			width: 85%;
			padding-left: 20px;
			border: 0;
		  	background-color: transparent;
			outline: none;
			float: left;
		/*	font-family: Sam3KRFont;*/
			cursor: pointer;
		}
		div.Search button {
			height: 100%;
			border: 0;
			margin-top: 2px;
		  	background-color: transparent;
			outline: none;
			color: #666;
			text-align: center;
		/*	font-family: Sam3KRFont;*/
			cursor: pointer;
		}
		div.Search button svg{
			height: 80%;
			width: 80%;
		}
		
		div.userNav{
			height: 20%;
			cursor: pointer;
			position: absolute;
			top: 50%;
			right: 5%;
			float: right;
		}
		div.userNav button {
			height: 100%;
			border: 0;
			margin-top: 2px;
		  	background-color: transparent;
			outline: none;
			color: #666;
			text-align: center;
		/*	font-family: Sam3KRFont;*/
			cursor: pointer;
		}
		div.userNav button svg{
			height: 75%;
			width: 75%;
		}
		
		.mainHeder img {
			margin: 0 auto;
			padding: 20px;
		}
		
		nav {
			position: relative;
			width: 100%;
		}
		.menubar {
			font-size: 14px;
			font-weight: bold;
		    position: relative;
		    width: 85%;
		    height: 45px;
		    margin: 0 auto;
		}
		.menubar ul {
			margin-left: 5%;
			height: 45px;
			list-style: none;
			margin: 0;
			padding: 0;
		}
		.menubar li {
			float: left;
			padding:  0;
			width: 15%;
		}
		.menubar li a {
			color: #000;
			display: block;
			font-weight: normal;
			line-height: 45px;
			font-weight: bold;
			margin: 0;
			/*padding: 0 25px;*/
			text-align: center;
			text-decoration: none;
		}
		.menubar li a:hover,
		.menubar ul li:hover a {
			background: rgba(142, 230, 219, 1);
			color: #fff;
			text-decoration: none;
		}
		.menubar li ul{
			display: none;
			background: rgb(109,109,109);
			height: auto;
			padding: 0;
			margin: 0;
			border: 0;
			width: 200px;
			z-index: 200;
			position: absolute;
		}
		.menubar li:hover ul{
			display: block;
		}
		.menubar li li {
			background: rgb(109,109,109);
			display: block;
			float: none;
			margin: 0;
			padding: 0;
			width: 200px;
		}
		.menubar li:hover li a {
			background: none;
		}
		.menubar li ul a {
			display: block;
			height: 50px;
			font-size: 13px;
			font-style: normal;
			margin: 0;
			padding: 0 10px 0 15px;
			text-align: left;
				}
		.menubar li ul a:hover,
		.menubar li ul li:hover a {
			background: rgb(71,71,71);
			border: 0;
			color: #fff;
			text-decoration: none;
		}
		
		section.container {
		    position: relative;
		    width: 100%;
		    height: 520px;
		    margin: 0 auto;
		    box-shadow: 1px 1px 3px rgba(0,0,0,0.1);
		}
		section ul.banner_mask {
		    position: absolute;
		    width: 100%;
		    height: 520px;
		    overflow: hidden;
		}
		section ul.banner_mask li {
		    position: absolute;
		    top: 0;
		    left: 100%;
		
		}
		
		
		
		section ul.banner_mask li img{
		
		}
		
		section.container label{
		    float: left;
		    position: relative;
		    left: 50%;
		    top: 90%;
		    width: 20px;
		    height: 20px;
		    margin-left: 5px;
		    line-height: 16px;
		    text-align: center;
		    cursor: pointer;
		    background: rgba(255,255,255,0.4);
		    border-radius: 10px;
		    z-index: 1000;
		    color: rgba(0,0,0,0.9);
		}
		section.container input.banner_input1:checked ~ label.label_btn1,
		section.container input.banner_input2:checked ~ label.label_btn2,            
		section.container input.banner_input3:checked ~ label.label_btn3{
		    background: rgba(142, 230, 219, 1);
		    color: white;
		
		}
		section.container input {
		    display: none;
		} 
		section.container input.banner_input1:checked ~ .banner_mask li:nth-child(1),
		section.container input.banner_input2:checked ~ .banner_mask li:nth-child(2),            
		section.container input.banner_input3:checked ~ .banner_mask li:nth-child(3){  
		    -webkit-animation: none; 
		    transition: left 0.5s ease-in-out;
		    left: 0;
		    z-index: 10;
		}
		section.container input:checked ~ .banner_mask li{
			-webkit-animation: slideOut 0.5s ease-in-out none;
		}  
		@-webkit-keyframes slideOut {
		    0% { left: 0;}
		    100% {left: -100%;}
		}
		
		section{
			position: relative;
			width: 100%;
			height: 800px;
		}
		
		section div.bestProductWapper{
			postion: absolute;
			margin: 0 auto;
			width: 85%;
		}
		
		section div.newProductWapper{
			postion: absolute;
			margin: 0 auto;
			width: 85%;
			margin-top: 30%;
		}
		
		section .ProductNav {
			color: #000;
			margin-top: 60px;
			margin-bottom: 30px;
			display: flex;
			flex-flow: row;
			justify-content: flex-end;
		}
		
		section .title{
			font-size: 16px;
			font-weight: bolder;
		}
		
		section .more{
			font-size: 13px;
			text-decoration-line: underline;
			margin-left: auto; 
		}
		
		
		section .productItem  {
			position: absolute;
			display: flex;
			flex-flow: row;
			justify-content: center;
			align-items: center;
		}
		
		
		section li{
			height: 10px;
			list-style: none;
			padding-right: 42px;
		}
		
		section div ul img{
			width: 140px;
		}
		
		section .product {
			position: relative;
			padding-bottom: 20px;
		}
		section .product a {
			display: inline-block;
			margin: 0 auto;
			font-size: 15px;
			margin: 5px 10px;
		
		}
		section a p {
			font-size: 14px;
			line-height: 10px;
			text-decoration: none;
			color: #666;
		}
		
		hr {
			width: 100%;
			height: 1px;
			border: 0 none;
			color: #ccc;
			background-color: #ccc;
		}
		
		footer{
			position: relative;
			height: 80px;
			margin-bottom: 20px;
		
		}
		
		footer div.info {
			position: absolute;
			left: 8%;
			height: 100%;
			width: 100%;
			box-sizing: border-box;
			font-size: 13px;
		}
		
		
		footer div div.sns {
			position: absolute;
			top: 25%;
			left: 18%;
			line-height: 25px;
			box-sizing: border-box;
			font-size: 13px;
			font-weight: bold;
		    width: 80%;
		}
		.sns ul {
			height: 45px;
			list-style: none;
			margin: 0;
			padding: 0;
		}
		.sns li {
			float: left;
			padding:  0;
			width: auto;
		}
		.sns li a {
			color: #000;
			display: block;
			font-weight: normal;
			line-height: 45px;
			margin: 0;
			padding: 0 25px;
			text-align: center;
			text-decoration: none;
		}
		.sns li a:hover,
		.sns ul li:hover a {
			color: rgba(142, 230, 219, 1);
			text-decoration: none;
		}
		footer div.businessOperatorInfo {
			position: absolute;
		    height: 100%;
		    top: 120%;
		    margin-bottom: 40px;
			line-height: 20px;
			box-sizing: border-box;
		}
	
	</style>
	
	<script type="text/javascript">

		$(document).ready(function() {
			
			var actionForm = $("#actionForm");
			
			$(".move").on("click", function(e) {
				
				e.preventDefault();
				
				actionForm.append("<input type='hidden' name='bid' value='" + $(this).attr("href") + "'>");
				
				actionForm.attr("action", "/sarak/bookDetail");
				
				actionForm.submit();
				
				history.replaceState({ page: "bookDetail", bid: bid }, "Book Detail", "/sarak/bookDetail?bid=" + bid);
				
			});
			
		});
	</script>
	
</head>

<div class="sarakMainWrapper">
	<%@include file="../includes/header.jsp"%>
	
	<section class="container">
		<input id="select1" name="radioBanner" type="radio" class="banner_input1" checked="" />
        <label for="select1" class="label_btn1">1</label>

        <input id="select2" name="radioBanner" type="radio" class="banner_input2" />
        <label for="select2" class="label_btn2">2</label>

        <input id="select3" name="radioBanner" type="radio" class="banner_input3" />
        <label for="select3" class="label_btn3">3</label>

        <ul class="banner_mask">
            <li>
                <a href="#"><img src="" alt="중고장터 광고1"></a>
            </li>
            <li>
                <a href="#"><img src="" alt="중고장터 광고2"></a>
            </li>
            <li>
                <a href="#"><img src="" alt="이벤트"></a>
            </li>
        </ul>
	</section>
	
	<section>
		<div class="bestProductWapper">
			<div class="ProductNav">
				<div class="title">실시간 베스트셀러</div>
				<div class="more">더보기</div>
			</div>
			
			<ul class="productItem">
				<c:forEach items="${bestBookList}" var="best" varStatus="status">
					<c:if test="${status.index < 5}">
						<c:forEach items="${best.attachList}" var="attach" >
							<c:if test="${fn:contains(fn:toLowerCase(fn:substringBefore(attach.filename, '.')), 'mainimg')}">
						   	<a class='move' href='<c:out value="${best.bid}"/>'>
						   	<li>
						   	<img src="<c:url value='/sarak/display'/>?filename=<c:out value='${attach.uploadpath}/${attach.filename}'/>" alt="${best.bname}"/>
						   	</li>
						   	</a>
						   	</c:if>
						</c:forEach>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	<div class="newProductWapper">
		<div class="ProductNav">
			<div class="title">이번 달 신간 도서</div>
			<div class="more">더보기</div>
		</div>
		
		<ul class="productItem">
			<c:forEach items="${newBookList}" var="newBook" varStatus="status">
				<c:if test="${status.index < 5}">
					<c:forEach items="${newBook.attachList}" var="attach">
						<c:if test="${fn:contains(fn:toLowerCase(fn:substringBefore(attach.filename, '.')), 'mainimg')}">
				    	<a class='move' href='<c:out value="${newBook.bid}"/>'>
				    	<li>
				    	<img src="<c:url value='/sarak/display'/>?filename=<c:out value='${attach.uploadpath}/${attach.filename}'/>" alt="${newBook.bname}"/>
						</li>
						</a>	
						</c:if>
					</c:forEach>
				</c:if>
			</c:forEach>
		</ul>
	</div>
	
							<form id='actionForm' action="/sarak/allBookList" method='get'>
								<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
								<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
							</form>
							<!-- 페이징 영역 끝 -->
	</section>
	<%@include file="../includes/footer.jsp"%>
	
</div>