<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>AdminLTE 2 | Dashboard</title>
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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<style>
.navbar-nav p {
	text-shadow: 1px 1px 1px #000;
}

.main-footer {
	background: #fff;
	padding: 15px;
	color: #444;
	border-top: 1px solid #d2d6de;
	margin-left: auto;
}

.content-header>h1 {
	font-size: 30px;
	font-weight: bold;
	color: cadetblue;
}

.sidebar-menu>li{
	margin: 10px;
	font-size: 1.1em;
}

.main-sidebar {
	box-shadow: 8px 0px 5px -2px #14571f94;
}
.skin-purple-light .main-header .navbar {
	background-color: green;
}

.skin-purple-light .main-header .logo{
	background-color: green;
}
.pagination>.active>a{
	background-color: green;
}
</style>
<!-- jQuery 2.1.4 -->
<script
	src="${pageContext.request.contextPath }/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<body class="skin-green-light sidebar-mini">
	<div class="wrapper">

		<header class="main-header">
			<!-- Logo -->
			<a href="/ent/entMain" class="logo"> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><img src="/resources/logo/logo.png"
					width="50" height="50">Dapao</span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" id="mini" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				</a>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="${pageContext.request.contextPath }/resources/logo/user2.jpg"
								class="user-image" alt="User Image" /> <c:choose>
									<c:when test="${empty sessionScope.own_id }">
										<span class="hidden-xs">Guest</span>
									</c:when>
									<c:otherwise>
										<span class="hidden-xs">${sessionScope.own_id}님 안녕하세요</span>
									</c:otherwise>
								</c:choose>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img
									src="${pageContext.request.contextPath }/resources/logo/user2.jpg"
									class="img-circle" alt="User Image" /> <c:choose>
										<c:when test="${empty sessionScope.own_id }">
											<p>Guest</p>
											<p class=text-mute>로그인해주세요</p>
										</c:when>
										<c:otherwise>
											<p>${sessionScope.own_id}</p>
											<p class=text-mute>환영합니다!</p>
										</c:otherwise>
									</c:choose></li>
								<!-- Menu Body -->
								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<c:choose>
											<c:when test="${empty sessionScope.own_id }">
												<a href="/ent/entLogin" class="btn btn-success btn-flat">로그인</a>
											</c:when>
											<c:otherwise>
												<a href="/ent/entLogout" class="btn btn-success btn-flat">로그아웃</a>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="pull-right">
										<c:choose>
											<c:when test="${empty sessionScope.own_id }">
												<a href="/ent/entJoin" class="btn btn-success btn-flat">회원가입</a>
											</c:when>
											<c:otherwise>
												<a href="/ent/entMain" class="btn btn-success btn-flat">내
													정보</a>
											</c:otherwise>
										</c:choose>
									</div>
								</li>
							</ul></li>
					</ul>

				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img
							src="${pageContext.request.contextPath }/resources/logo/user2.jpg"
							class="img-circle" alt="User Image" />
					</div>
					<div class="pull-left info">
						<c:if test="${empty sessionScope.own_id }">
							<p>Guest</p>
							<a href="/ent/entLogin">로그인해주세요</a>
						</c:if>
						<c:if test="${!empty sessionScope.own_id }">
							<p>${sessionScope.own_id}</p>
							<p>대나무페이 : ${ent_coin }</p>
						</c:if>
					</div>
				</div>

				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li class="header">MAIN NAVIGATION</li>
					<li class="treeview"><a href="#"> <i class="fa fa-home"></i>
							<span>상점메뉴</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li class="shop"><a href="/ent/shopMain"><i class="fa fa-home"></i>
									상점 메인페이지 </a></li>
							<li><a href="/ent/shopMainManage"><i class="fa fa-gavel"></i>
									상점 메인페이지 수정 </a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-shopping-cart"></i> <span>상품/주문 관리</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="/ent/productManage"><i
									class="fa fa-cart-plus"></i> 상품등록/수정/조회</a></li>
							<li><a href="/ent/entOrder"><i class="fa fa-line-chart"></i>
									주문관리</a></li>
						</ul></li>
					<li class="treeview"><a href="/ent/entAd"> <i
							class="fa fa-newspaper-o"></i> <span>광고 문의</span>
					</a></li>
					<li class="treeview" id="coin"><a href="/ent/coinCharge"> <i
							class="fa fa-money"></i> <span>대나무 페이 충전</span>
					</a></li>
					<li class="treeview" id="talk"><a href="/websocket/chat/${ent_name}"> <i
							class="fa fa-paw"></i> <span>판다톡</span>
					</a></li>
					<li class="treeview"><a href="#"> <i class="fa fa-question-circle"></i>
							<span>고객지원</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="/cs/ownNoticeList"><i
									class="fa fa-bullhorn"></i> 공지사항</a></li>
							<li><a href="/cs/ownFAQList"><i
									class="fa fa-info-circle"></i> FAQ</a></li>
						</ul></li>

				</ul>
			</section>

			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>${name }</h1>
				<ol class="breadcrumb">
					<li><a href="/ent/entMain"><i class="fa fa-home"></i> Home</a></li>
					<li><a href="">${name }</a></li>
				</ol>
			</section>

