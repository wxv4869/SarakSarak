<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@include file="../includes/adminheader.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">회원 목록</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<!--<c:out value="${memberlist}" /> -->
                            <table class="table table-striped table-bordered table-hover" >
                                <thead>
                                    <tr>
                                        <th>#아이디</th>
                                        <th>이름</th>
                                        <th>전화번호</th>
                                        <th>이메일</th>
                                        <th>가입일</th>
                                        <th>권한</th>
                                    </tr>
                                </thead>
                                   <c:forEach items="${memberlist}" var="member">
                                	<tr>
                                		<td><c:out value="${member.mid }" /></td>
                                		<td> <a href='/admin/memberget?mid=<c:out value="${member.mid }"/>'>
                                			<!-- <a class='move' href='<c:out value="${member.mid }"/>'> -->
                                			<c:out value="${member.mname }"/></a>
                                			<!--<b>[ <c:out value="${ memberList.replyCnt}"/> ]</b> -->
                                		</td>
                                		<td><c:out value="${member.phone }" /></td>
                                		<td><c:out value="${member.email }" /></td>
                                		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.mregdate }"/></td>
                                		<td>
										    <c:forEach items="${member.authList}" var="auth">
										        <c:out value="${auth.auth}" />
										    </c:forEach>
										</td>
                                	</tr>
                                </c:forEach>

                            </table>
 
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
				<%@include file="../includes/adminfooter.jsp" %>