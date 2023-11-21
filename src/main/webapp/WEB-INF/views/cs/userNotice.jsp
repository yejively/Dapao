<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/userLoginHeader.jsp"%>
<div id="pnotice">
<div class="notice">
	<div class="title">
		<span id="title">${notice.cs_title }</span> <span id="view">조회수 : ${notice.cs_view }</span>
	</div>
	<div class="content"><pre>${notice.cs_content }</pre></div>
	<button type="button" id="listBtn" onclick="location.href='/cs/userNoticeList?page=${page}'">목록가기</button>
</div>
</div>

<style>
.content-wrapper{
	background-color: white;
}
#pnotice{
	background-color: white;
	width: 100%
}

.content-header{
	position: relative;
    padding: 30px 30px
}

.notice {
	width: 100%;
	background-color: white;
}
#listBtn{
    margin-left: 70%;
    border-radius: 0.5em;
    background-color: green;
    color: white;
    font-weight: bolder;
    width: 80px;
    height: 35px;
    border: none;
    margin-bottom: 5%;
}

.title {
	padding: 5%;
}

#title {
	font-size: 30px;
	font-weight: 400;
}

#view {
	padding-left: 50px;
	font-size: 17px;
}

.content {
	padding-left: 5%;
	font-weight: bolder;
}
pre{
	border: none;
	background-color: white;
	font-size: medium;
}
</style>


<%@include file="../include/userFooter.jsp"%>