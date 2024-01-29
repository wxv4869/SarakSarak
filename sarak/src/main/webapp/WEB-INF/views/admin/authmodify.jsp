<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="../includes/adminheader.jsp" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">회원 정보 수정</h1>
		<!-- /.page-header -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <!-- /.panel-heading -->
				
			<div class="panel-body">
				<form role="form" action="/admin/authmodify" method="post">
					<div class="form-group">
			          <label>회원 아이디</label> <input class="form-control" name='mid'
			            value='<c:out value="${member.mid }"/>' readonly="readonly">
			        </div>
				       <div class="form-group">
				          <label>회원 권한</label>     
				          	<c:forEach items="${member.authList}" var="auth">
				        		<input class="form-control" name='auth' value='<c:out value="${auth.auth}" />' >
				        		
				   	 		</c:forEach>
				        </div>
				        
				        <button type="submit" data-oper="modify" class="btn btn-default">Auth Modify</button>
				        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
			      </form>
			      <!-- form-group -->
			</div>
			<!-- panel-boby -->
			        
			        
			<div class="panel-body">

			    <button type="submit" data-oper="list" class="btn btn-default">List</button>
			</div>
			<!-- panel-boby -->
			
		</div>
		<!-- panel panel-default -->
		
	</div>
	<!-- col-lg-12 -->

</div>
<!-- /.row -->

                     <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                                        </div>
                                        <div class="modal-body">
                                            처리가 완료되었습니다.
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                            
<script type="text/javascript">
            	$(document).ready(function() {
            		var result = '<c:out value="${result}"/>';
            		
            		checkModal(result);
            		
            		history.replaceState({}, null, null);
            		
            		function checkModal(result) {
            			if(result === '' || history.state) {
            				return;
            				
            				Log.info(history.state);
            			}
            			
            			if(parseInt(result) > 0 ){
            				$(".modal-body").html( result)
            			}
            			
            			$("#myModal").modal("show");
            		}

            		
            		
            	});
 </script>
            


<script type="text/javascript">
	$(document).ready(function() {
		
		var formObj = $("form");
		
		$('button').on("click", function(e) {
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation === 'list'){
				// move to list
				formObj.attr("action", "/admin/memberlist").attr("method", "get");
				formObj.empty();
			}
			
			formObj.submit();
		});
	});
</script>


<%@include file="../includes/adminfooter.jsp" %>