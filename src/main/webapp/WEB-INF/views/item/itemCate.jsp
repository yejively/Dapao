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

body{
	color : black;
	background-color: transparent;
}

#container{

	/* width : 1350px;
	height : 800px; */
	border: none;
	/* height: 1500px; */
	
}

/* 물건 하나의 공간 */
.item_container_text{
 	width : 220px;
	height : 290px;
	float: left; 
	border: none;
	padding-left : 10px;
	background-color: white;
	margin-bottom: 20px;
	margin-left: 15px;
}

.item_container_text : hover{
	opacity: 0.8;
	cursor: pointer;
	
}

.item_container{
 	margin-left: 10%;
	
}

.itemVODivIMG{
	border: 1px solide black;
	width : 200px;
	height : 200px;
	padding-top: 20px;
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

.it_price{
	border: none;
	width : 126px;
	background-color: transparent;
	color:black;
	cursor: pointer;
	font-weight: bold;
	
}

.it_state{
	border: none; 
	width : 70px;
	text-align: right;
	background-color: transparent;
	color:black;
	cursor: pointer;
}

.price_state_text{
	width : 200px;
	height : 25px;
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

/* 카테고리 */
#item_cate, #cate{
	text-align: left;
	border: none; 
	width : auto;
	color : black;
	margin-left: 10px;
	font-weight: bold;
	
}

</style>
	
</head>
<body>

<!-- 	<h1>/item/itemCateSearch.jsp</h1>
	<h1>검색시 나타나는 페이지</h1> -->
	<br>
	<a id="cate"> 카테고리 > ${it_cate_search}</a>
	<hr>
	<br>
	<div id="container"><!-- 1 -->
		<div class="item_container"><!-- 2 -->
			<c:forEach var="it" items="${cateItemVO}">
				<c:if test="${it.it_state != 3 }">
					<div class="item_container_text"><!-- 3 -->
						<a href="../item/itemDetail?it_no=${it.it_no }">
						<img src="/imgfile/${it.it_img }" class="itemVODivIMG"> <br>
							<input type="text" value="${it.it_title}" class="it_title" disabled="disabled"><br>
							<input type="hidden" value="${it.it_state }" name="it_state">

							<div class="price_state_text"> <!-- 4 -->
								<input type="text" value="${it.it_price}원" class="it_price" disabled="disabled">
								<!-- 글 상태 표시 -->
								<c:choose>
									<c:when test="${it.it_state == 0 }">
										<input type="text" value="판매중" class="it_state" disabled="disabled"> <br>
									</c:when>
									<c:when test="${it.it_state == 1 }">
										<input type="text" value="예약중" class="it_state" disabled="disabled"> <br>
									</c:when>
									<c:when test="${it.it_state == 2 }">
										<input type="text" value="판매완료" class="it_state" disabled="disabled"> <br>
									</c:when>
									<c:when test="${it.it_state == 3 }">
										<input type="text" value="삭제됨" class="it_state" disabled="disabled"> <br>
									</c:when>
									<c:otherwise>
										<input type="text" value="접근이상함" class="it_state" disabled="disabled"> <br>
									</c:otherwise>
								</c:choose>
							</div> <!-- 4 -->
							<div>
								<!-- 5 -->
								<input type="text" value="등록날짜  " class="it_regdate_text" disabled="disabled">
								<input type="text" value="${it.it_regdate}" class="it_regdate" disabled="disabled">
							</div> <!-- 5 -->
						</a>
					</div>
					<!-- 3 -->
				</c:if>
			</c:forEach>
		</div>
		<!-- 2 -->
	</div>
	<!-- 1 -->
	<br>
	<%@ include file="../include/userFooter.jsp" %>
	


</body>
</html>