<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/mypage/userCs</title>

<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp" %>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
	</c:if>
	
</head>
<body>






	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){	
	/* 	 
		<c:choose>
          <c:when test="${acVO.ac_state == 0 }">
              <input type="text" value="접수" readonly class="a" > <br>
          </c:when>
          <c:when test="${acVO.ac_state == 1 }">
              <input type="text" value="처리" readonly class="a" > <br>
          </c:when>
         
      </c:choose> */
		
		
	});
</script>
	
	
	

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
				<td>신고번호</td>
		<td>피신고자(사업자)</td>
		<td>피신고자(회원)</td>
		<td>신고사유</td>
		<td>신고일</td>
	    <td>신고상태</td>
	    <td>처리결과</td>
				</tr>
				
			</tbody>
				<tbody>
		
	<c:forEach items="${userCs }" var="userCs">
				<tr>
					<th>${userCs.ac_no }</th>
					<th>${userCs.ac_own_id }</th>
					<th>${userCs.ac_us_id }</th>
					<th>${userCs.ac_cate }</th>
					<th>${userCs.ac_regdate }</th>
					<th>
						<c:choose>
          <c:when test="${userCs.ac_state == 0 }">
              <input type="text" value="접수" readonly class="ac_state"> <br>
          </c:when>
          <c:when test="${userCs.ac_state == 1 }">
              <input type="text" value="처리" readonly class="ac_state"> <br>
          </c:when>
         
      </c:choose>
					
					</th>
					<th>${userCs.ac_result }</th>
				</tr>
			</c:forEach> 
		</tbody>
		</table>
	</div>

  
  




<%-- 	<table border="1">
   <thead>
	<tr>
		<td>신고번호</td>
		<td>피신고자(사업자)</td>
		<td>피신고자(회원)</td>
		<td>신고사유</td>
		<td>신고일</td>
	    <td>신고상태</td>
	    <td>처리결과</td>
	</tr>
	</thead>
	
			<tbody>
		
	<c:forEach items="${userCs }" var="userCs">
				<tr>
					<th>${userCs.ac_no }</th>
					<th>${userCs.ac_own_id }</th>
					<th>${userCs.ac_us_id }</th>
					<th>${userCs.ac_cate }</th>
					<th>${userCs.ac_regdate }</th>
					<th>
						<c:choose>
          <c:when test="${userCs.ac_state == 0 }">
              <input type="text" value="접수" readonly class="ac_state"> <br>
          </c:when>
          <c:when test="${userCs.ac_state == 1 }">
              <input type="text" value="처리" readonly class="ac_state"> <br>
          </c:when>
         
      </c:choose>
					
					</th>
					<th>${userCs.ac_result }</th>
				</tr>
			</c:forEach> 
		</tbody>
	
	
</table>
 --%>







<%@ include file="../include/userFooter.jsp" %> 

</body>
</html>