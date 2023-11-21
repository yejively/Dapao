<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>AdminLTE 2 | Dashboard</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="${pageContext.request.contextPath }/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="${pageContext.request.contextPath }/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>
      <!-- jQuery 2.1.4 -->
    <script src="${pageContext.request.contextPath }/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
  <body class="skin-green-light sidebar-mini">
    <div class="wrapper">
      
      <header class="main-header">
        <!-- Logo -->
        <a href="../user/userMain" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><img src="/resources/logo/logo.png" width="50" height="50"></span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><img src="/resources/logo/logo.png" width="50" height="50">Dapao</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->

              <!-- Notifications: style can be found in dropdown.less -->
              <li class="dropdown notifications-menu">

              
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="/user/userLogin" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="${pageContext.request.contextPath }/resources/itemIMG/pro.png" class="user-image" alt="User Image"/>
                  <span class="hidden-xs">Guest</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    <img src="${pageContext.request.contextPath }/resources/itemIMG/pro.png" class="img-circle" alt="User Image" />
                    <p>
                      Guest
                      <small>환영합니다!</small>
                    </p>
                  </li>
                  <!-- Menu Body -->

                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="../user/userLogin" class="btn btn-default btn-flat">로그인</a>
                    </div>
                    <div class="pull-right">
                      <a href="../user/userJoin" class="btn btn-default btn-flat">회원가입</a>
                    </div>
                  </li>
                </ul>
              </li>
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
              <img src="${pageContext.request.contextPath }/resources/itemIMG/pro.png" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
              <p>Guest</p>
              <a href="../user/userLogin"> 로그인</a>
               | &nbsp; 
              <a href="../user/userJoin"> 회원가입</a>
            </div>
          </div>
          <!-- search form -->
          <form action="../item/itemSearch" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="it_title" class="form-control" placeholder="Search"/>
<!--               <input type="text" name="q" class="form-control" placeholder="Search"/> -->
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
          <!-- /.search form -->
          
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">메뉴</li>
            <li class="treeview">
              <a href="../user/userLogin">
                <i class="fa fa-edit"></i>
                <span>상품등록</span>
              </a>
            </li>
            <li class="treeview">
              <a href="../user/userLogin">
                <i class="fa fa-user"></i>
                <span>마이페이지</span>
              </a>
            </li>
          </ul>
          <ul class="sidebar-menu">
            <li class="header"><span>카테고리</span></li>
            <li class="treeview">
              <a href="../item/itemCate?it_cate=패션의류">
                <i class="fa fa-star"></i>
                <span>패션의류</span>
              </a>
            </li>
            <li>
              <a href="../item/itemCate?it_cate=뷰티잡화">
                <i class="fa fa-shopping-cart"></i>
                <span>뷰티/잡화</span>
              </a>
            </li>
            <li class="treeview">
              <a href="../item/itemCate?it_cate=유아용품">
                <i class="fa fa-github-alt"></i>
                <span>유아용품</span>
              </a>
            </li>
            <li class="treeview">
              <a href="../item/itemCate?it_cate=가구생활">
                <i class="fa fa-laptop"></i>
                <span>가구/생활</span>
              </a>
            </li>
            <!-- <li class="treeview active"> -->
            <li class="treeview">
              <a href="../item/itemCate?it_cate=취미">
                <i class="fa fa-users"></i>
                <span>취미</span>
              </a>
            </li>
            <li class="treeview">
              <a href="../item/itemCate?it_cate=전자기기">
                <i class="fa fa-laptop"></i>
                <span>전자기기</span>
              </a>
            </li>
            <li>
              <a href="../item/itemCate?it_cate=스포츠레저">
                <i class="fa fa-soccer-ball-o"></i>
                <span>스포츠/레저</span>
              </a>
            </li>
            <li>
              <a href="../item/itemCate?it_cate=자동차">
                <i class="fa fa-car"></i>
                <span>자동차</span>
              </a>
            </li>
            <li>
            	<a href="../item/itemCate?it_cate=도서">
		          <i class="fa fa-book"></i>
		          <span>도서</span>
            	</a>
            </li>
            
            <li class="header">기타</li>
            <li><a href="../cs/userNoticeList"><i class="fa fa-circle-o text-red"></i> <span>공지사항</span></a></li>
            <li><a href="../cs/userFAQList"><i class="fa fa-circle-o text-yellow"></i> <span>FAQ</span></a></li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
        <!-- 이 공간 없애면 위에 검은색 줄이 뜸  -->
        </section>