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
	
	    <title>사락사락 관리자 페이지</title>
	
	    <!-- Bootstrap Core CSS -->
	    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	    <!-- MetisMenu CSS -->
	    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
	
	    <!-- DataTables CSS -->
	    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
	
	    <!-- DataTables Responsive CSS -->
	    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
	
	    <!-- Custom CSS -->
	    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">
	
	    <!-- Custom Fonts -->
	    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	    <!--[if lt IE 9]>
	        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	</head>

	<body>
	    <div id="wrapper">
	        <!-- Navigation -->
	        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
	            <div class="navbar-header">
	                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	                    <span class="sr-only">Toggle navigation</span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                </button>
	                <a class="navbar-brand" href="/index/admin">사락사락 관리자 계정</a>
	            </div>
	            <!-- /.navbar-header -->
	
	            <ul class="nav navbar-top-links navbar-right">
	                <li class="dropdown">
	                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
	                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
	                    </a>
	                    <ul class="dropdown-menu dropdown-user">
	                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
	                        </li>
	                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
	                        </li>
	                        <li class="divider"></li>
	                        <sec:authorize access="isAuthenticated()">
		                        <li>
		                        	<a href="/customLogout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
		                        </li>
	                        </sec:authorize>
	                        <sec:authorize access="isAuthenticated()">
		                        <li>
		                        	<a href="/customLogin"><i class="fa fa-sign-out fa-fw"></i> Login</a>
		                        </li>
	                        </sec:authorize>
	                    </ul>
	                    <!-- /.dropdown-user -->
	                </li>
	                <!-- /.dropdown -->
	            </ul>
	            <!-- /.navbar-top-links -->
	
	            <div class="navbar-default sidebar" role="navigation">
	                <div class="sidebar-nav navbar-collapse">
	                    <ul class="nav" id="side-menu">
	                        <li>
	                            <a href="/admin/memberlist"><i class="fa fa-users fa-fw"></i> 회원 관리</a>
	                        </li>
	                        <li>
	                            <a href="/admin/authorlist"><i class="fa fa-pencil fa-fw"></i> 작가 관리</a>
	                        </li>
	                        <li>
	                            <a href="/admin/booklist"><i class="fa fa-book fa-fw"></i> 도서 관리</a>
	                        </li>
	                        <li>
	                            <a href="/admin/uploadAjax"><i class="fa fa-photo fa-fw"></i> 도서 이미지 업로드</a>
	                        </li>
	                        <li>
	                            <a href="/admin/orderlist"><i class="fa fa-archive fa-fw"></i> 주문 관리</a>
	                        </li>
	                    </ul>
	                </div>
	                <!-- /.sidebar-collapse -->
	            </div>
	            <!-- /.navbar-static-side -->
	        </nav>
	
	        <div id="page-wrapper">
	        
	        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>