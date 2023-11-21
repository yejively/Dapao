<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
   
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
              <li class="dropdown notifications-menu" id="alarmClick">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" >
                  <i class="fa fa-bell-o" ></i>
                  <span class="label label-warning">  </span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">My Alarm</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu" id="alarmList">
<!--                       <li>
                          <i class="fa fa-users text-aqua"></i> alarm
                      </li> -->
                    </ul>
                  </li>
                  <li class="footer"><a href="#"></a></li>
                </ul>
              </li>
              
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="${pageContext.request.contextPath }/resources/itemIMG/pro.png" class="user-image"  ="User Image"/>
                  <span class="hidden-xs">${us_nickname }</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    <img src="${pageContext.request.contextPath }/resources/itemIMG/pro.png" class="img-circle" alt="User Image" />
                    <p>
                      ${us_nickname } <br>
                     	${us_id }
                    </p>
                  </li>
                  <!-- Menu Body -->
                  <li class="user-body">
                    <div class="col-xs-4 text-center">
                      <a href="../websocket/chat?us_id=${us_id }">판다톡</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="../item/coinCharge">대나무페이</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="../item/coinCharge">체험단</a>
                    </div>
                  </li>
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="../mypage/userInfo" class="btn btn-default btn-flat">마이페이지</a>
                    </div>
                    <div class="pull-right">
                      <a href="../user/userLogout" class="btn btn-default btn-flat">로그아웃</a>
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
            <a href="../mypage/userInfo"><p>${us_nickname }( ${us_id } )</p></a>

              <a href="../item/coinCharge">대나무 페이 ${us_coin }원</a>
            </div>
          </div>
          <!-- search form -->
          <form action="../item/itemSearch" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="it_title" class="form-control" placeholder="Search"/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
          <!-- /.search form -->
          
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
           <li class="header">메뉴</li>
           <c:if test="${us_id.equals('admin') }">
	            <li class="treeview">
	              <a href="../admin/userList?page=1">
	                <i class="fa fa-edit"></i>
	                <span>관리자페이지</span>
	              </a>
	            </li>
           </c:if>
            <li class="treeview">
              <a href="../item/itemWrite">
                <i class="fa fa-edit"></i>
                <span>상품등록</span>
              </a>
            </li>
            <li class="treeview">
              <a href="../mypage/userInfo">
                <i class="fa fa-user"></i>
                <span>마이페이지</span>
              </a>
            </li>
          </ul>
          <ul class="sidebar-menu">
            <li class="header">카테고리</li>
            
            <li class="treeview">
              <a href="../item/itemCate?it_cate=패션의류">
                <i class="fa fa-star"></i>
                <span>패션의류</span>
              </a>
            </li>
            <li>
              <a href="../item/itemCate?it_cate=뷰티/잡화">
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