<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${!us_id.equals('admin') }">
	<c:redirect url="../user/userMain" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dapao 관리자</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link
	href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link
	href="${pageContext.request.contextPath }/resources/dist/css/AdminLTE.min.css"
	rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link
	href="${pageContext.request.contextPath }/resources/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />
<!-- adminList style -->
<link
	href="${pageContext.request.contextPath }/resources/css/adminList.css"
	rel="stylesheet" type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<!-- jQuery 2.1.4 -->
<script
	src="${pageContext.request.contextPath }/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<style>
.skin-purple-light .main-header .navbar {
	background-color: green;
}

.skin-purple-light .main-header .logo {
	background-color: green;
}

.main-sidebar {
	box-shadow: 8px 0px 5px -2px #14571f94;
}

.content-wrapper {
	background-color: #f9fafc;
}

.pagination>.active>a, .pagination>.active>a:hover {
	background-color: #14571f;
	border-color: #14571f;
}

.skin-purple-light .main-header .logo:hover {
	background-color: #14571f;
}

.skin-purple-light .main-header .navbar .sidebar-toggle:hover {
	background-color: #14571f;
}

.skin-purple-light .main-header li.user-header {
	background-color: green;
}

.col-xs-4 {
	margin-left: 70%;
}
</style>
<body class="skin-green-light sidebar-mini">

	<div class="wrapper">

		<header class="main-header">
			<!-- Logo -->
			<a href="${pageContext.request.contextPath }/resources/index2.html"
				class="logo"> <!-- mini logo for sidebar mini 50x50 pixels --> <span
				class="logo-mini"><img src="/resources/logo/logo.png"
					width="50" height="50"></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><img src="/resources/logo/logo.png"
					width="50" height="50">Dapao</span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				</a>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="${pageContext.request.contextPath }/resources/logo/back.png"
								class="user-image" alt="User Image" /> <span class="hidden-xs">관리자</span>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img
									src="${pageContext.request.contextPath }/resources/logo/back.png"
									class="img-circle" alt="User Image" />
									<p>관리자</p></li>
								<!-- Menu Body -->
								<li class="user-body">
									<!-- <div class="col-xs-4 text-center">
                      <a href="#">Followers</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Sales</a>
                    </div> -->
									<div class="col-xs-4 text-center">
										<a href="../websocket/chat?us_id=${us_id }">판다톡</a>
									</div>
								</li>
								<!-- Menu Footer-->
								<li class="user-footer"><c:if test="${!empty us_id }">
										<div class="pull-right">
											<a href="../user/userLogout" class="btn btn-default btn-flat">로그아웃</a>
										</div>
									</c:if> <c:if test="${empty us_id }">
										<div class="pull-right">
											<a href="../user/userLogin" class="btn btn-default btn-flat">로그인</a>
										</div>
									</c:if></li>
							</ul></li>
						<!-- Control Sidebar Toggle Button -->
						<!-- <li>
                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
              </li> -->
					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<div>
			<aside class="main-sidebar">
				<!-- sidebar: style can be found in sidebar.less -->
				<section class="sidebar">
					<!-- Sidebar user panel -->
					<div class="user-panel">
						<div class="pull-left image">
							<img
								src="${pageContext.request.contextPath }/resources/logo/back.png"
								class="img-circle" alt="User Image" />
						</div>
						<div class="pull-left info">
							<p>관리자</p>

							<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
						</div>
					</div>
					<!-- search form -->
					<form action="#" method="get" class="sidebar-form">
						<div class="input-group">
							<input type="text" name="q" class="form-control"
								placeholder="Search..." /> <span class="input-group-btn">
								<button type='submit' name='search' id='search-btn'
									class="btn btn-flat">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div>
					</form>
					<!-- /.search form -->
					<!-- sidebar menu: : style can be found in sidebar.less -->
					<ul class="sidebar-menu">
						<li class="header">메뉴</li>
						<li class="treeview"><a href="/user/userMain"> 
							<i class="fa fa-edit"></i> <span>회원페이지</span>
						</a>
						</li>
						<li class="header">관리</li>
						<li class="treeview"><a href="#"> <i
								class="fa fa-user-plus"></i> <span>회원관리</span> <i
								class="fa fa-angle-left pull-right"></i>
						</a>
							<ul class="treeview-menu">
								<li><a href="/admin/userList?page=1"><i class="fa fa-circle-o"></i>
										회원관리 </a></li>
								<li><a href="/admin/ownerList?page=1"><i
										class="fa fa-circle-o"></i> 사업자관리 </a></li>
							</ul></li>
						<li class="treeview"><a href="#"> <i
								class="fa fa-shopping-cart"></i> <span>상품관리</span> <i
								class="fa fa-angle-left pull-right"></i>
						</a>
							<ul class="treeview-menu">
								<li><a href="/admin/itemList?page=1"><i class="fa fa-circle-o"></i>
										회원 </a></li>
								<li><a href="/admin/prodList?page=1"><i class="fa fa-circle-o"></i>
										사업자 </a></li>
							</ul></li>
						<li><a href="/admin/expList?page=1"><i class="fa fa-twitch"></i>
								<span>체험단 신청관리</span></a></li>
						<li><a href="/admin/acList?page=1"><i class="fa fa-heart"></i> <span>신고관리</span></a></li>
						<li class="treeview"><a href="#"> <i
								class="fa fa-file-text-o"></i> <span>공지사항</span> <i
								class="fa fa-angle-left pull-right"></i>
						</a>
							<ul class="treeview-menu">
								<li><a href="/admin/noticeWriteForm"><i
										class="fa fa-circle-o"></i> 공지사항 글쓰기 </a></li>
								<li><a href="/admin/noticeList?page=1"><i
										class="fa fa-circle-o"></i> 공지사항 목록 </a></li>
							</ul></li>
						<li class="treeview"><a href="#"> <i
								class="fa fa-list-ul"></i> <span>FAQ</span> <i
								class="fa fa-angle-left pull-right"></i>
						</a>
							<ul class="treeview-menu">
								<li><a href="/admin/FAQWriteForm"><i
										class="fa fa-circle-o"></i> FAQ 글쓰기 </a></li>
								<li><a href="/admin/FAQList?page=1"><i class="fa fa-circle-o"></i>
										FAQ 목록 </a></li>
							</ul></li>
						<li><a href="/admin/reviewList?page=1"><i class="fa fa-heart"></i>
								<span>리뷰관리</span></a></li>
					</ul>
				</section>
				<!-- /.sidebar -->
			</aside>

			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">