<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<c:if test="${empty us_id }">
	<%@ include file="../include/userHeader.jsp" %>
</c:if>
<c:if test="${!empty us_id }">
	<%@ include file="../include/userLoginHeader.jsp" %>
</c:if>

<style type="text/css">

/* 검색결과 */
#search{
	text-align: left;
	border: none; 
	width : auto;
	color : black;
	margin-left: 10px;
	font-weight: bold;
	
}

#container{

	/* width : 1350px;
	height : 800px; */
	border: none;
	/* height: 1500px; */

}

.item_section{

	width : 220px;
	height : 290px;
	float: left; 
	border: none;
	padding-left : 10px;
	background-color: white;
	margin-bottom: 20px;
	margin-left: 15px;

}

.it_img{

	width : 200px;
	height : 200px;
}

.it_title{
		border: none;
	width : 200px;
	height : 25px;
	background-color: transparent;
	color:black;
	cursor: pointer;
	text-align: center;
	font-weight: bold;

}

.price_state_text{

	width : 200px;
	height : 25px;
	background-color: transparent;
	color:black;
	cursor: pointer;
}

.it_price{

	border: none;
	width : 125px;
	background-color: transparent;
	color:black;
	cursor: pointer;
	font-weight: bold;
	float : left;
}

.it_state{

	border: none; 
	width : 70px;
	text-align: right;
	background-color: transparent;
	color:black;
	cursor: pointer;

}

.it_regdate_text{
	border: none;
	width : 70px;
	background-color: transparent;
	color:black;
	cursor: pointer;	
}

.it_regdate{
	border: none;
	width : 130px;
	text-align: right;
	background-color: transparent;
	color:black;
	cursor: pointer;
}



</style>
	
</head>
<body>

	<!-- <h1>/item/itemSearch.jsp</h1>
	<h1>검색시 나타나는 페이지</h1> -->
	<br>
	<a id="search"> 검색결과</a>
	<hr>
	<div id="container"><!-- 1 container -->
		<c:forEach var="it" items="${searchItemVO}">
			<div class="item_section"> <!-- 2 item_section -->
				<a href="../item/itemDetail?it_no=${it.it_no }">
					<img src="/imgfile/${it.it_img }" class="it_img"> <br>
					<input type="text" value="${it.it_title}" class="it_title"> <br>
					<input type="hidden" value="${it.it_state}" name="it_state"> <br>

					<div class="price_state_text"> <!-- 3 price_state_text -->
						<input type="text" value="${it.it_price}원"  class="it_price">
						<!-- 글 상태 표시 -->
						<c:choose>
							<c:when test="${it.it_state == 0 }">
								<input type="text" value="판매중" class="it_state"> <br>
							</c:when>
							<c:when test="${it.it_state == 1 }">
								<input type="text" value="예약중" class="it_state"> <br>
							</c:when>
							<c:when test="${it.it_state == 2 }">
								<input type="text" value="판매완료" class="it_state"> <br>
							</c:when>
							<c:when test="${it.it_state == 3 }">
								<input type="text" value="삭제됨" class="it_state"> <br>
							</c:when>
							<c:otherwise>
								<input type="text" value="접근이상함" class="it_state"> <br>
							</c:otherwise>
						</c:choose>
					</div> <!-- 3 -->
					<div> <!-- 4 -->
						<input type="text" value="등록날짜  " class="it_regdate_text">
						<input type="text" value="${it.it_regdate}" class="it_regdate"> <br>
					</div> <!-- 4 -->
				</a>
			</div> <!-- 2 -->
		</c:forEach>
	</div> <!-- 1 -->
<%@ include file="../include/userFooter.jsp" %>
	


</body>
</html>