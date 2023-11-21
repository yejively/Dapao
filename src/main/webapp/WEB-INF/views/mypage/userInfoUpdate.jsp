<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iews/mypage/userInfoUpdate</title>

      <c:if test="${empty us_id }">
      <%@ include file="../include/userHeader.jsp" %>
   </c:if>
   <c:if test="${!empty us_id }">
      <%@ include file="../include/userLoginHeader.jsp" %>
   </c:if>
   
   <style type="text/css">
   
   	.form-group{
	 	margin-right: 50px;
	}

    .box-title{
     font-size: 50px;
    
    }


#joinBtn{
   background-color: green;
   color: white;
}


.form-control {
   width: 1000px;

}


   </style>
   
   
</head>


<body>

   
 
 
 <div class="box box-info">
	<!-- 	<div class="box-header with-border"> -->
			<h3 class="box-title">내 정보 수정</h3>
	<!-- 	</div> -->


		<form class="form-horizontal" action="" method="post" name="fr">
			<div class="box-body">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
					<div class="col-sm-10">
						<input type="text" name="us_id" class="form-control" id="inputEmail3" value="${vo.us_id }" readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">이름</label>
					<div class="col-sm-10">
						<input type="text" name="us_name" class="form-control" id="inputPassword3" value="${vo.us_name }" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">이메일</label>
					<div class="col-sm-10">
						<input type="text" name="us_email" class="form-control" id="inputEmail3" value="${vo.us_email }" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">닉네임</label>
					<div class="col-sm-10">
						<input type="text" name="us_nickname" class="form-control" id="inputEmail3" value="${vo.us_nickname }">
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">전화번호</label>
					<div class="col-sm-10">
						<input type="text" name="us_tel" class="form-control" id="inputEmail3" value="${vo.us_tel }">
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">주소</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inputEmail3" name="us_addr" value="${vo.us_addr }">
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">프로필이미지 변경</label>
					<div class="col-sm-10">
						<input type="file" class="form-control" id="iprofile" accept="image/png, image/jpeg">
					   
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">새 비밀번호</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputEmail3" name="us_pw" placeholder="새 비밀번호를 입력하세요" >
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">새 비밀번호 확인</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputEmail3" name="us_pw1" placeholder="새 비밀번호를 확인하세요" >
					</div>
				</div>
				
			</div>

			<div class="box-footer">
			<!-- 	<button type="submit" id="updateBtn" class="btn btn1">회원정보 수정하기</button> -->
			  <input type="submit"  id="joinBtn" class="btn btn1" value="수정 완료">
			</div>

		</form>
	</div>
 
 
 
      
      
      <!--  -->
 <!--      <fieldset>
<legend>회원정보수정</legend>
   <form action="" method="post" name="fr"> -->
        
    <%--    닉네임<input type="text" name="us_nickname" value="${vo.us_nickname }"><br> --%>
     <%--   아이디<input type="text" name="us_id" value="${vo.us_id }" readonly><br>   --%>
    <%--   이름 <input type="text" name="us_name" value="${vo.us_name }" readonly><br> --%>
     <%--  이메일 <input type="text" name="us_email" value="${vo.us_email }" readonly><br> --%>
   <%--    전화번호<input type="text" name="us_tel" value="${vo.us_tel }"><br> --%>
 <%--      주소<input type="text" name="us_addr" value="${vo.us_addr }"><br> --%>
    <!--   프로필 이미지<input type="file" id="profile" accept="image/png, image/jpeg"> <br> -->
     <!--  새 비밀번호 <input type="password" name="us_pw" placeholder="새 비밀번호를 입력하세요" ><br> -->
   <!--    새 비밀번호확인<input type="password" name="us_pw1" placeholder="새 비밀번호를 확인하세요" ><br> -->
      
    <!--   <input type="submit" class="btn" value="회원정보 수정"> -->
     
      
  <!--  </form>
</fieldset> -->
</body>
      

      

<%@ include file="../include/userFooter.jsp" %> 

</body>
</html>