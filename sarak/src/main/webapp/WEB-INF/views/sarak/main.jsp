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
	<link rel="stylesheet" href="../../resources/dist/css/main.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
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
	
	<section class="bannerContainer">
		<input id="select1" name="radioBanner" type="radio" class="banner_input1" checked="" />
        <label for="select1" class="label_btn1">1</label>

        <input id="select2" name="radioBanner" type="radio" class="banner_input2" />
        <label for="select2" class="label_btn2">2</label>

        <input id="select3" name="radioBanner" type="radio" class="banner_input3" />
        <label for="select3" class="label_btn3">3</label>

        <ul class="banner_mask">
            <li>
               <a href="#"><img src="../../resources/img/banner.png" alt="중고장터 광고1"></a>
            </li>
            <li>
                <a href="#"><img src="../../resources/img/banner.png" alt="중고장터 광고2"></a>
            </li>
            <li>
                <a href="#"><img src="../../resources/img/banner.png" alt="이벤트"></a>
            </li>
        </ul>
	</section>
	
	<section>
		<div class="bestProductWapper">
			<div class="ProductNav">
				<div class="title">실시간 베스트셀러</div>
				<div class="more"><a href="/sarak/bestBookList">더보기</a></div>
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
				<div class="more"><a href="/sarak/newBookList">더보기</a></div>
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
	</section>
	<%@include file="../includes/footer.jsp"%>
</div>