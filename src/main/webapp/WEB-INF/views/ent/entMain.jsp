<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/entHeader.jsp"%>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>

.btns {
	display: block;
	width: 30%;
	height: 50px;
	border-radius: 25px;
	outline: none;
	border: none;
	background-image: linear-gradient(to right, #32be8f, #38d39f, #32be8f);
	background-size: 200%;
	font-size: 2rem ;
	color: #fff;
	font-family: 'Poppins', sans-serif;
	text-transform: uppercase;
	margin: 3rem 45rem;
	cursor: pointer;
	transition: .5s;
}
</style>	
	
	<c:if test="${empty sessionScope.own_id }">
		<input type="button" value="로그인" onclick="location.href='/ent/entLogin';" class="btns">		
		<input type="button" value="회원가입" onclick="location.href='/ent/entJoin';" class="btns">
	</c:if>

	<c:if test="${!empty sessionScope.own_id }">
		<h2>${sessionScope.own_id }님 환영합니다.</h2>
		
		<hr>
		<input type="button" value="로그아웃" onclick="location.href='/ent/entLogout';" class="btns">
		<input type="button" value="정보조회" onclick="location.href='/ent/ownInfo';" class="btns">
		
		
		
	</c:if>

<%@ include file="../include/footer.jsp"%>