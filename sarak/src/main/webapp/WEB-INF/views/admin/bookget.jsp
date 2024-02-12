<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@include file="../includes/adminheader.jsp"%>

<script type="text/javascript">
/* 선택 이미지 삭제 함수 */
function deleteImgFile(filename) {
	
	var bid = '<c:out value="${book.bid}"/>'
	
	if (confirm("정말로 삭제하시겠습니까?")) {
		$.ajax({
			type: "POST",
			url: "/admin/deleteEachImg",
			data: {
				filename: filename,
				bid: bid,
				_csrf: '${_csrf.token}'
			},
			success: function(response) {
				console.log(response);
				alert("해당 이미지가 삭제되었습니다.");
				location.reload();
			},
			error: function(error) {
				console.error(error);
				alert("해당 이미지를 삭제하는데 실패했습니다.");
			}
		});
	}
}

$(document).ready(function() {

	var moveForm = $("#moveForm");
	
	/* 목록 페이지 이동 버튼 */
	$(".list-btn").on("click", function(e) {
		
		e.preventDefault();
		
		$("input[name=bid]").remove();
		
		moveForm.attr("action", "/admin/booklist");
		
		moveForm.submit();
		
	});
	
	/* 수정 페이지 이동 버튼 */
	$(".modify-btn").on("click", function(e) {
		
		e.preventDefault();
		
		var addInput = '<input type="hidden" name="bid" value="${book.bid}">';
		
		moveForm.append(addInput);
		
		moveForm.attr("action", "/admin/bookmodify");
		
		moveForm.submit();
		
	});
	
	/* 삭제 버튼 */
	$("#delete-btn").on("click", function(e) {
		
		e.preventDefault();
		
		if (confirm("삭제하시면 해당 도서의 이미지, 재고, 판매량 데이터도 함께 삭제되며 복구할 수 없습니다. 그래도 삭제하시겠습니까?")) {
		
			moveForm.find("input").remove();
			
			moveForm.append('<input type="hidden" name="bid" value="${book.bid}">');
			
			moveForm.append("<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/>");
			
			moveForm.attr("action", "/admin/bookdelete");
			
			moveForm.attr("method", "post");
			
			moveForm.submit();
			
		}
		
	});

});
</script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">도서 정보 페이지</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
		<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="form-group">
					<label>도서 번호</label>
					<input class="form-control" name='bid' value='<c:out value="${book.bid}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>제목</label>
					<input class="form-control" name='bname' value='<c:out value="${book.bname}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>가격</label>
					<input class="form-control" name='bprice' value='<fmt:formatNumber value="${book.bprice}" pattern="#,###원"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>ISBN</label>
					<input class="form-control" name='isbn' value='<c:out value="${book.isbn}"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>출간일</label>
					<input class="form-control" name='pubdate' value='<fmt:formatDate value="${book.pubdate}" pattern="yyyy년 MM월 dd일"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>출판사</label>
					<input class="form-control" name='publisher' value='<c:out value="${book.publisher}"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>작가 번호</label>
					<input class="form-control" name='authorid' value='<c:out value="${book.authorid}"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>작가 이름</label>
					<input class="form-control" name='authorname' value='<c:out value="${book.authorname}"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>줄거리</label>
					<input class="form-control" name='summary' value='<c:out value="${book.summary}"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>목차</label>
					<input class="form-control" name='contents' value='<c:out value="${book.contents}"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>도서 표지 이미지</label>
					<c:forEach items="${attachList}" var="attach">
						<c:if test="${fn:contains(attach.filename, 'mainimg')}">
							<img src="<c:url value='/admin/display'/>?filename=${attach.uploadpath}/${attach.filename}" style="max-width: 20%;"/>
							<span>(파일경로 : c:\saraksarak\<c:out value="${attach.uploadpath}"/> | 파일명 : <c:out value="${attach.filename}"/> )</span>
							<button id="delete_mainimg" onclick="deleteImgFile('<c:out value="${attach.filename}"/>')">삭제하기</button>
						</c:if>
					</c:forEach>
				</div>
				
				<div class="form-group">
					<label>도서 상세 이미지</label>
					<c:forEach items="${attachList}" var="attach">
						<c:if test="${fn:contains(attach.filename, 'detailimg')}">
							<img src="<c:url value='/admin/display'/>?filename=${attach.uploadpath}/${attach.filename}" style="max-width: 20%;"/>
							<span>(파일경로 : c:\saraksarak\<c:out value="${attach.uploadpath}"/> | 파일명 : <c:out value="${attach.filename}"/> )</span>
							<button id="delete_detailimg" onclick="deleteImgFile('<c:out value="${attach.filename}"/>')">삭제하기</button>
						</c:if>
					</c:forEach>
				</div>
				
				<div class="form-group">
					<label>누적 판매량</label>
					<input class="form-control" name='sales' value='<c:out value="${book.sales}권"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>재고</label>
					<input class="form-control" name='stock' value='<c:out value="${book.stock}권"/>' readonly="readonly">
				</div>
				
				<div class="btn_section">
					<button id="list-btn" class="list-btn">목록</button>
                   	<button id="modify-btn" class="modify-btn">수정</button>
                   	<button id="delete-btn" class="delete-btn">삭제</button>
                   	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</div> 
    		</div>
    		<!--  end panel-body -->
    		<form id="moveForm" method="get">
    			<input type="hidden" name="bid" value='<c:out value="${book.bid}"/>'/>
    			<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'/>
    			<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'/>
    		</form>
		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<%@include file="../includes/adminfooter.jsp"%>