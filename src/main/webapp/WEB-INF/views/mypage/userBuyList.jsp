<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/mypage/userBuyList</title>
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
					<td>거래번호</td>
					<td>판매자(사업자)</td>
					<td>판매자(회원)</td>
					<td>거래금액</td>
					<td>거래일시</td>
				</tr>
				
			</tbody>
			
			<tbody>
		
	<c:forEach items="${userBuyList }" var="userBuyList">
				<tr>
					<th>${userBuyList.tr_no }</th>
					<th>${userBuyList.tr_sell_ent }</th>
					<th>${userBuyList.tr_sell_us }</th>
					<th>${userBuyList.tr_price }</th>
					<th>${userBuyList.tr_date }</th>
				</tr>
			</c:forEach> 
		</tbody>
		</table>
	</div>





<%-- 	<table border="1">
   <thead>
	<tr>
		<td>거래번호</td>
		<td>판매자(사업자)</td>
		<td>판매자(회원)</td>
		<td>거래금액</td>
		<td>거래일시</td>
	</tr>
	</thead>
	
			<tbody>
		
	<c:forEach items="${userBuyList }" var="userBuyList">
				<tr>
					<th>${userBuyList.tr_no }</th>
					<th>${userBuyList.tr_sell_ent }</th>
					<th>${userBuyList.tr_sell_us }</th>
					<th>${userBuyList.tr_price }</th>
					<th>${userBuyList.tr_date }</th>
				</tr>
			</c:forEach> 
		</tbody>
	
	
</table>
	 --%>
	
	
	
	
	 
	
<%@ include file="../include/userFooter.jsp" %> 
</body>
</html>