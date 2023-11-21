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
	
	
<!-- 	<h1> 비밀번호 찾기 결과 페이지</h1>
<h2>  // http://localhost:8088/user/userFindPw2 </h2>
 -->

<script>

        var userFindPw = '${sessionScope.userFindPw}';
        var us_pw = '${us_pw}';
        console.log(us_pw);
        if(userFindPw == 'success'){
 			 alert("고객님의 비밀번호는 "+us_pw+"입니다!");
 			 location.href="/user/userLogin";
      	  }
        if(userFindPw == 'fail'){
        	console.log("userFindPw : "+userFindPw);
			 alert("정보를 다시 입력해주세요");
			location.href="/user/userFindPw";
			
     	  }
        
</script>

<%@ include file="../include/userFooter.jsp" %>

</body>
</html>