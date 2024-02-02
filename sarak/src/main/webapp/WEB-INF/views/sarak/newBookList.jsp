<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link rel="stylesheet" href="../../resources/dist/css/bestBook.css">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	 <script type="text/javascript">
	 
	 	function addToCart(bookId) {
			
		    var quantity = 1;    // 리스트에서 장바구니 처리 요청은 quantity를 1로 고정

		    <sec:authorize access="isFullyAuthenticated()">
		        $.ajax({
		            type: "POST",
		            url: "/cart/add",
		            data: { bookId: bookId, quantity: quantity, ${_csrf.parameterName}: '${_csrf.token}' },
		            success: function(response) {
		                alert("해당 상품이 장바구니에 추가되었습니다.");
		            },
		            error: function() {
		                alert("상품을 장바구니에 추가하는데 실패했습니다.");
		            }
		        });
		    </sec:authorize>

		    <sec:authorize access="isAnonymous()">
		        alert("로그인이 필요합니다.");
		    </sec:authorize>
		}
	 
		$(document).ready(function() {
				
				var actionForm = $("#actionForm");
				
				// 페이징, 페이지 이동 처리
				$(".paginate_button a").on("click", function(e) {
					
					e.preventDefault();
					
					console.log('click');
					
					console.log($(this).attr("href"));
					
	
					actionForm.find("input[name = 'pageNum']").val($(this).attr("href"));
					
					actionForm.submit();
					
				});
				
				$(".move").on("click", function(e) {
					
					e.preventDefault();
					
					actionForm.append("<input type='hidden' name='bid' value='" + $(this).attr("href") + "'>");
					
					actionForm.attr("action", "/sarak/bookDetail");
					
					actionForm.submit();
					
					history.replaceState({ page: "bookDetail", bid: bid }, "Book Detail", "/sarak/bookDetail?bid=" + bid);
					
				});
				
				$(".cart").on("click", function(e) {
					
			        var bookId = $(this).closest("tr").find(".bid").text();
			        
			        addToCart(bookId);
			        
			        window.location.href = "/cart/cartList";
			        
			    });
				
				// 바로 구매 버튼
				$(".buynow").on("click", function(){
					// 클릭한 바로구매 상품의 bid 가져오기
					let bid = 0;
					bid = parseInt($(".buynowBid").val());
					console.log(bid); 
					let bookCount = 1;
					console.log(bookCount);
					/* 상품정보 */
					let form_contents = ''; 
					let bookId_input = "<input name='orders[0].bid' type='hidden' value='" + bid + "'>";
					form_contents += bookId_input;
					let bookCount_input = "<input name='orders[0].bookCount' type='hidden' value='" + bookCount + "'>";
					form_contents += bookCount_input;
					$(".order_form").append(form_contents);	
					$(".order_form").submit();
				});
				
			});
		</script>

    </head>
    
    	<!-- 전체 페이지 영역 시작 -->
		<div class="sarakMainWrapper">
			<!-- 헤더 영역 시작 -->
			<%@ include file="../includes/header.jsp" %>
			<!-- 헤더 영역 끝 -->
			
			<!-- 미들 영역 시작 -->
			<div class="sarakMiddleArea">
				<!-- 전체도서 목록 영역 -->
				<div class="contents_inner">
					<div class="allbook_wrap">
					<h2 class="title_heading">신간도서</h2>
						<div class="allbook_prod">
							<table>
								<c:forEach var="newBook" items="${newBookList}">
									<tr>
										<td class="num">
											<div class="bid">${newBook.bid}</div>
										</td>
										<td class="mainimage">
											<c:forEach items="${newBook.attachList}" var="attach">
												<c:if test="${fn:contains(fn:toLowerCase(fn:substringBefore(attach.filename, '.')), 'mainimg')}">
											    	<a href="#"><img src="<c:url value='/sarak/display'/>?filename=<c:out value='${attach.uploadpath}/${attach.filename}'/>" alt="${bestBook.bname}"/></a>
												</c:if>
											</c:forEach>
										</td>
										<td class="detail">
											<div class="bname">
												<a class='move' href='<c:out value="${newBook.bid}"/>'>
													<strong><c:out value="${newBook.bname}"/></strong>
												</a>
											</div>
											<div class="etc">
												${newBook.authorname} 지음 | ${newBook.publisher} | <fmt:formatDate value="${newBook.pubdate}" pattern="yyyy.MM.dd"/>
											</div><br>
											<div class="bprice">
												<strong><fmt:formatNumber value="${newBook.bprice}" pattern="#,###원"/></strong>
											</div><br>
											<div class="summary">
												${fn:replace(fn:substring(newBook.summary, 0, 100), '\\n', ' ')}${fn:length(newBook.summary) > 100 ? '...' : ''}
											</div>
										</td>
										<td class="btn-group">
											<div class="cartbtn">
												<input type="button" class="cart" name="btn" value="장바구니"></button>
											</div>
											<div class="buynowbtn">
												<input type="button" class="buynow" name="btn" value="바로구매"></button>
												<input type="hidden" class="buynowBid" name="bid" value="${newBook.bid}">
											</div>
										</td>
									</tr>
									
									<!-- 주문 form -->
									<form action="/sarak/order/" method="get" class="order_form">
										<input type="hidden" name="mid" value="${principal.member.mid }">
										<input type="hidden" name="orders[0].bid" value="">
										<input type="hidden" name="orders[0].bookCount" value="">
									</form>
									
									<!-- 구분 선 -->
									<tr>
										<td colspan="8" class="separator"></td>
									</tr>
								</c:forEach>
							</table>
							
							<!-- 페이징 영역 시작 -->
							<div class="pull-right">
								<ul class="pagination">
									<c:if test="${pageMaker.prev}">
										<li class="paginate_button previous"><a href="${pageMaker.startPage - 1}">이전</a></li>
									</c:if>
									
									<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
										<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : ''}">
											<a href="${num}">${num}</a>
										</li>
									</c:forEach>
									
									<c:if test="${pageMaker.next}">
										<li class="paginate_button next"><a href="${pageMaker.endPage + 1}">다음</a></li>
									</c:if>
								</ul>
							</div>
							<form id='actionForm' action="/sarak/bestBookList" method='get'>
								<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
								<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
							</form>
							<!-- 페이징 영역 끝 -->
						</div>
					</div>
				</div>
				
			</div>
			<!-- 미들 영역 끝 -->
			
			<!-- footer 영역 시작 -->
			<%@ include file="../includes/footer.jsp" %>
			<!-- footer 영역 끝 -->
			
		</div>
		<!-- 전체 페이지 영역 끝 -->
    