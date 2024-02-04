<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@include file="../includes/adminheader.jsp"%>

<style>
.form-group span {	
	display: none;
    padding-top: 10px;
    color: #e05757;
    font-weight: 300;
}

.ck-content {
    height: 170px;
}

.ui-datepicker-trigger {
    margin-left: 15px;
    width: 8%;
    height: 26px;
    font-weight: 600;
    background-color: #d9d9d9;
    font-size: 12px;
    cursor: pointer;
}

input[name='pubdate'] {
    text-align: center;
}

.authorid_btn {
    margin-left: 15px;
    width: 8%;
    height: 26px;
    font-weight: 600;
    background-color: #d9d9d9;
    font-size: 12px;
    cursor: pointer;
}

#authorname_input {
    text-align: center;
}
</style>

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  
<!-- 위지윅 : 줄거리, 목차 입력란 -->
<script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>

<!-- datepicker : 출간일 입력을 위한 달력 위젯 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>

$(document).ready(function() {
	
	var insertForm = $("#insertForm");
	
	/* 목록 페이지 이동 버튼 */
	$("#cancel-btn").click(function() {
		
		location.href="/admin/booklist";
		
	});
	
	/* 줄거리 위지윅 적용 */
	ClassicEditor
		.create(document.querySelector('#bookSummary_textarea'))
		.catch(error=>{
			console.error(error);
		});
		
	/* 목차 위지윅 적용 */	
	ClassicEditor
	.create(document.querySelector('#bookContents_textarea'))
	.catch(error=>{
		console.error(error);
	});
	
	/* 출간일 datepicker 적용 */
	const config = {
			
		dateFormat: 'yy/mm/dd',
		showOn : "button",
		buttonText:"날짜 선택",
		prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    yearSuffix: '년',
	    changeMonth: true,
        changeYear: true
		
	}
	
	$(function() {
		
		  $( "input[name='pubdate']" ).datepicker(config);
		  
	});
	
	/* 작가 선택 버튼 */
	$(".authorid_btn").on("click",function(e) {
		
		e.preventDefault();
		
		let popUrl = "/admin/authorPop";
		
		let popOption = "width=650px, height=550px, top=300px, left=300px, scrollbars=yes";
		
		window.open(popUrl, "작가 찾기", popOption);
		
	});
	
	/* 도서 등록 버튼 */
	$("#insert-btn").click(function(e) {
		
		e.preventDefault();
		
		/* 상품 등록 유효성 검사 */
		var bnameCk = false;
		var bpriceCk = false;
		var isbnCk = false;
		var pubdateCk = false;
		var publisherCk = false;
		var authoridCk = false;
		var summaryCk = false;
		var contentsCk = false;
		
		var bname = $("input[name='bname']").val();
		var bprice = $("input[name='bprice']").val();
		var isbn = $("input[name='isbn']").val();
		var pubdate = $("input[name='pubdate']").val();
		var publisher = $("input[name='publisher']").val();
		var authorid = $("input[name='authorid']").val();
		var summary = $(".bsm p").html();
		var contents = $(".bct p").html();
		
		if (bname) {
			$("#warn_bname").css('display', 'none');
			bnameCk = true;
		} else {
			alert("bname 실패");
			$("#warn_bname").css('display', 'block');
			bnameCk = false;
		}
		
		if (bprice != 0) {
			$("#warn_bprice").css('display', 'none');
			bpriceCk = true;
		} else {
			alert("bprice 실패");
			$("#warn_bprice").css('display', 'block');
			bpriceCk = false;
		}
		
		if (isbn) {
			$("#warn_isbn").css('display', 'none');
			isbnCk = true;
		} else {
			alert("isbn 실패");
			$("#warn_isbn").css('display', 'block');
			isbnCk = false;
		}
		
		if (pubdate) {
			$("#warn_pubdate").css('display', 'none');
			pubdateCk = true;
		} else {
			alert("pubdate 실패");
			$("#warn_pubdate").css('display', 'block');
			pubdateCk = false;
		}
		
		if (publisher) {
			$("#warn_publisher").css('display', 'none');
			publisherCk = true;
		} else {
			alert("publisher 실패");
			$("#warn_publisher").css('display', 'block');
			publisherCk = false;
		}
		
		if (authorid) {
			$("#warn_authorid").css('display', 'none');
			authoridCk = true;
		} else {
			alert("authorid 실패");
			$("#warn_authorid").css('display', 'block');
			authoridCk = false;
		}
		
		if (summary != '<br data-cke-filler="true">') {
			$("#warn_summary").css('display', 'none');
			summaryCk = true;
		} else {
			alert("summary 실패");
			$("#warn_summary").css('display', 'block');
			summaryCk = false;
		}
		
		if (contents != '<br data-cke-filler="true">') {
			$("#warn_contents").css('display', 'none');
			contentsCk = true;
		} else {
			alert("contents 실패");
			$("#warn_contents").css('display', 'block');
			contentsCk = false;
		}
		
		if (bnameCk && bpriceCk && isbnCk && pubdateCk && publisherCk && authoridCk && summaryCk && contentsCk) {
			alert("유효성 검사 통과");
			insertForm.append("<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/>");
			insertForm.submit();
		} else {
			alert("유효성 검사 실패");
			return false;
		}
		
	});
	
});

</script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">도서 등록</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
		<!-- /.panel-heading -->
			<form id="insertForm" action="/admin/bookinsert" method="post">
				<div class="panel-body">
					<div class="form-group">
						<label>도서 제목</label><br>
						<input name="bname">
						<span id="warn_bname">제목을 입력해 주세요.</span>
					</div>
					
					<div class="form-group">
						<label>가격</label><br>
						<input name="bprice" value="0">
						<span id="warn_bprice">가격을 입력해 주세요.</span>
					</div>
					
					<div class="form-group">
						<label>ISBN</label><br>
						<input name="isbn">
						<span id="warn_isbn">ISBN을 입력해 주세요.</span>
					</div>
					
					<div class="form-group">
						<label>출간일</label><br>
						<input name="pubdate" autocomplete="off" readonly="readonly">
						<span id="warn_pubdate">출간일을 입력해 주세요.</span>
					</div>
					
					<div class="form-group">
						<label>출판사</label><br>
						<input name="publisher">
						<span id="warn_publisher">출판사를 입력해 주세요.</span>
					</div>
					
					<div class="form-group">
						<label>작가 번호</label><br>
						<input name="authorname" id="authorname_input" readonly="readonly">
						<input name="authorid" id="authorid_input" type="hidden">
						<button class="authorid_btn">작가 선택</button>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<span id="warn_authorid">작가를 선택해 주세요.</span>
					</div>
					
					<div class="form-group bsm">
						<label>줄거리</label><br>
						<textarea name="summary" id="bookSummary_textarea"></textarea>
						<span id="warn_summary">줄거리를 입력해 주세요.</span>
					</div>
					
					<div class="form-group bct">
						<label>목차</label><br>
						<textarea name="contents" id="bookContents_textarea"></textarea>
						<span id="warn_contents">목차를 입력해 주세요.</span>
					</div>
				</div>
			</form>
					
			<div class="btn_section">
				<button id="cancel-btn" class="cancel-btn">취소</button>
              	<button id="insert-btn" class="insert-btn">등록</button>
              	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</div>
		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<%@include file="../includes/adminfooter.jsp"%>