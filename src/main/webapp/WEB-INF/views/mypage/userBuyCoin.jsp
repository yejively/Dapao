<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/mypage/userBuyCoin</title>

	<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp" %>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
	</c:if>
	
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
				<td>결제번호</td>
		<td>결제금액</td>
		<td>결제일시</td>
		<td>결제수단</td>
				</tr>
				
			</tbody>
				<tbody>
		
	<c:forEach items="${userBuyCoin}" var="userBuyCoin">
				<tr>
					<th>${userBuyCoin.pay_id }</th>
					<th>${userBuyCoin.pay_price }</th>
					<th>${userBuyCoin.pay_date }</th>
					<th>${userBuyCoin.pay_method }</th>
				</tr>
			</c:forEach> 
		</tbody>
		</table>
	</div>






<%-- <table border="1">
   <thead>
	<tr>
		<td>결제번호</td>
		<td>결제금액</td>
		<td>결제일시</td>
		<td>결제수단</td>
	</tr>
	</thead>
	
			<tbody>
		
	<c:forEach items="${userBuyCoin}" var="userBuyCoin">
				<tr>
					<th>${userBuyCoin.pay_id }</th>
					<th>${userBuyCoin.pay_price }</th>
					<th>${userBuyCoin.pay_date }</th>
					<th>${userBuyCoin.pay_method }</th>
				</tr>
			</c:forEach> 
		</tbody>
	
	
</table>
 --%>
 
<%@ include file="../include/userFooter.jsp" %> 

</body>
</html>