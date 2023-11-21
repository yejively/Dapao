<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/mypage/userSellList</title>
	<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp" %>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
	</c:if>
	

	
	<style type="text/css">
	
	</style>
</head>
<body>



	
	
	 <a href="/mypage/userInfo">마이페이지     |</a>
  <a href="/mypage/userSellList">판매 목록     |</a>
   <a href="/mypage/userBuyList">구매목록     |</a>
   <a href="/mypage/userBuyCoin">대나무페이 결제 목록     |</a>
   <a href="/mypage/userReview">내가 쓴 리뷰     |</a>
   <a href="/mypage/userCs">고객센터     |</a>
   <a href="/mypage/userLoveList">찜 목록     |</a>



	<div class="box-body table-responsive no-padding">
		<table class="table table-hover">
			<tbody>
				<tr>
						<th>번호</th>
						<th>제목</th>
						<th>판매상태</th>
						<th>작성일</th>
				</tr>
				
			</tbody>
				<tbody>
		
	<c:forEach items="${userSellList}" var="userSellList">
		<c:if test="${userSellList.it_state != 3}">
				<tr>
					<th>${userSellList.it_no }</th>
					<th><a href="../item/itemDetail?it_no=${userSellList.it_no }">${userSellList.it_title }</a> </th>
					<th>
						<c:choose>
							<c:when test="${userSellList.it_state == 0 }">
								판매중
							</c:when>
							<c:when test="${userSellList.it_state == 1 }">
								예약중
							</c:when>
							<c:when test="${userSellList.it_state == 2 }">
								판매완료
							</c:when>
							<c:otherwise>
								???			
							</c:otherwise>
						</c:choose>
					
					</th>
					<th>${userSellList.it_regdate }</th>
				</tr>
		</c:if>
			</c:forEach> 
		</tbody>
		</table>
	</div>






<%-- 	<table border="1">
		<thead>
			<tr>
			
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
		</thead>
		
		<tbody>
		
	<c:forEach items="${userSellList}" var="userSellList">
				<tr>
					<th>${userSellList.it_no }</th>
					<th>${userSellList.it_title }</th>
					<th>${userSellList.it_regdate }</th>
				</tr>
			</c:forEach> 
		</tbody>
	</table> 

 --%>


 	<%@ include file="../include/userFooter.jsp" %> 

</body>
</html>