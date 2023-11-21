<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- header -->
<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp" %>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
	</c:if>
	<!-- header -->
	

<h1> 아이디 찾기 결과 페이지</h1>
<h2> /user/userFindId2 </h2>


<script>

        var userFindId = '${sessionScope.userFindId}';
        var us_id = '${us_id}';
        if(userFindId == 'success'){
 			 alert("고객님의 ID는 "+us_id+"입니다!");
 			 location.href="/user/userLogin";
      	  }
        if(userFindId == 'fail'){
        	console.log("userFindId : "+userFindId);
			 alert("정보를 다시 입력해주세요");
			location.href="/user/userFindId";
			
     	  }
        
</script>
















	<%@ include file="../include/userFooter.jsp" %>

</body>
</html>