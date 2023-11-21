<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>

<head>
<c:if test="${empty us_id }">
	<%@ include file="../include/userHeader.jsp"%>
</c:if>
<c:if test="${!empty us_id }">
	<%@ include file="../include/userLoginHeader.jsp"%>
</c:if>


<!-- Login css -->

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

.btn1{
  margin-left: 1300px;
}

</style>

<!-- Login css -->


</head>
<!-- // http://localhost:8088/user/userJoin -->

<body>

	<div class="box">
		<!-- <div class="box-header with-border"> -->
			<h3 class="box-title">회원가입</h3>
		<!-- </div> -->


		<form class="form-horizontal" action="" method="post" onsubmit="retrun check()">
			<div class="box-body">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
					<div class="col-sm-10">
						<input class="form-control" type="text" name="us_id" id="us_id" oninput="idCheck()" maxlength="16" required="required">
					    <span id="idConfirm" style="font-size: 12px; visibility: hidden;">아이디를 입력해주세요.</span><br>
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-10">
						<input class="form-control" type="password" name="us_pw" id="us_pw" oninput="pwCheck()" pattern=".{3,}"
								title="비밀번호는 8~12 글자, 영대소문자, 특수문자, 숫자 필수 조건 입니다." maxlength="12" required="required">
						<span id="pwConfirm" style="font-size: 12px; visibility: hidden;">비밀번호를 입력하세요</span><br> 		
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">비밀번호 확인</label>
					<div class="col-sm-10">
						<input class="form-control" type="password" name="us_pw_ch" id="us_pw_ch" oninput="pwCheck()" maxlength="12" required="required">
						<span id="pwConfirm2" style="font-size: 12px; visibility: hidden;">비밀번호확인를 입력하세요</span><br> 
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">이름</label>
					<div class="col-sm-10">
						<input class="form-control" type="text" name="us_name" id="us_name" required="required"><br>
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">닉네임</label>
					<div class="col-sm-10">
						<input class="form-control" type="text" name="us_nickname" id="us_nickname" oninput="nickNameCheck()" maxlength="8" required="required">
						<span id="nickNameConfirm" style="font-size: 12px; visibility: hidden;">닉네님을 입력하세요</span><br> 
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">이메일</label>
					<div class="col-sm-10">
						<input class="form-control" type="text" name="us_email" id="us_email" oninput="emailCheck()" required="required">
						<span id="emailConfirm" style="font-size: 12px; visibility: hidden;">이메일을 입력하세요</span><br> 
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">전화번호</label>
					<div class="col-sm-10">
						<input class="form-control" type="text" name="us_tel" id="us_tel" required="required"><br> 
						
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">주소</label>
					<div class="col-sm-10">
						<input class="form-control" type="text" name="us_addr" id="us_addr" required="required"><br>
						
					</div>
				</div>
				
			</div>

			<div class="box-footer">
			<input type="button" class="btn" value="돌아가기" onclick="location.href='/user/userLogin';">
				<input id="joinBtn" class="btn btn1" type="submit" value="회원가입하기" onclick="check()">
				
			</div>

		</form>
	</div>


	<!--  <h1>/views/user/userJoin</h1> -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		// 아이디 제한 길이 숫자
		let idLength = 16;
		let pwLength = 12;
		let nickNameLength = 8;

		//아이디 체크
		function idCheck() {
			if (!$('#us_id').val()) {
				document.all.idConfirm.style.visibility = "hidden";
			} else if ($("#us_id").val().length < idLength) {
				$('#idConfirm').text('아이디(' + idLength + '자 제한)').css('color',
						'black')
				document.all.idConfirm.style.visibility = "visible";
			} /* else {
			        $('#idConfirm').text('아이디 체크완료').css('color', 'green')
			        document.all.idConfirm.style.visibility="visible";
			     } */
		}

		// 패스워드 체크
		function pwCheck() {
			if (!$('#us_pw').val()) {
				document.all.pwConfirm.style.visibility = "hidden";
			} else if ($("#us_pw").val().length < pwLength) {
				$('#pwConfirm').text('영문,숫자,특수기호 필수조건 입니다').css('color',
						'black')
				document.all.pwConfirm.style.visibility = "visible";
			} /* else {
			        $('#pwConfirm').text('비밀번호 체크완료').css('color', 'green')
			        document.all.pwConfirm.style.visibility="visible";
			     } */

			// us_pw id 값이 빈칸인 경우
			if (!$('#us_pw').val()) {
				document.all.pwConfirm2.style.visibility = "hidden";
				return;
			}

			// us_pw 와 us_pw_ch  값이 같은지 확인 조건
			if ($('#us_pw').val() == $('#us_pw_ch').val()) {
				$('#pwConfirm2').text('비밀번호확인 일치').css('color', 'green')
			} else {
				$('#pwConfirm2').text('비밀번호확인 불일치').css('color', 'red')
			}

			document.all.pwConfirm2.style.visibility = "visible";
		}

		function nickNameCheck() {
			if (!$('#us_nickname').val()) {
				document.all.nickNameConfirm.style.visibility = "hidden";
			} else if ($("#us_nickname").val().length < nickNameLength) {
				$('#nickNameConfirm').text('닉네임(' + nickNameLength + '자 제한)')
						.css('color', 'black')
				document.all.nickNameConfirm.style.visibility = "visible";
			} /* else {
			        $('#nickNameConfirm').text('닉네임 체크완료').css('color', 'green')
			        document.all.nickNameConfirm.style.visibility="visible";
			     } */
		}

		function emailCheck() {
			let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
			let email = $('#us_email').val();

			if (!email) {
				document.all.emailConfirm.style.visibility = "hidden";
			} else if (!regex.test(email)) {
				$('#emailConfirm').text('이메일 형식( @ 필수 )으로 적어주세요').css('color',
						'red')
				document.all.emailConfirm.style.visibility = "visible";
			} else {
				$('#emailConfirm').text('이메일 체크완료').css('color', 'green')
				document.all.emailConfirm.style.visibility = "visible";
			}
		}
	</script>



	<!-- <h1>회원가입</h1> -->


<!-- 	<fieldset>
		<form action="" method="post" onsubmit="return check()">
			아이디<input type="text" name="us_id" id="us_id" oninput="idCheck()" maxlength="16" required="required">
				  <span id="idConfirm" style="font-size: 12px; visibility: hidden;">아이디를 입력해주세요.</span><br>
			 비밀번호<input type="password" name="us_pw" id="us_pw" oninput="pwCheck()" pattern=".{3,}" title="비밀번호는 8~12 글자, 영대소문자, 특수문자, 숫자 필수 조건 입니다." maxlength="12" required="required">
			 		 <span id="pwConfirm" style="font-size: 12px; visibility: hidden;">비밀번호를 입력하세요</span><br> 
			 비밀번호 확인<input type="password" name="us_pw_ch" id="us_pw_ch" oninput="pwCheck()" maxlength="12" required="required">
			 			  <span id="pwConfirm2" style="font-size: 12px; visibility: hidden;">비밀번호확인를 입력하세요</span><br> 
			 이름<input type="text" name="us_name" id="us_name" required="required"><br> 
			 닉네임<input type="text" name="us_nickname" id="us_nickname" oninput="nickNameCheck()" maxlength="8" required="required">
			       <span id="nickNameConfirm" style="font-size: 12px; visibility: hidden;">닉네님을 입력하세요</span><br> 
			 이메일<input type="text" name="us_email" id="us_email" oninput="emailCheck()" required="required">
			       <span id="emailConfirm" style="font-size: 12px; visibility: hidden;">이메일을 입력하세요</span><br> 
			 전화번호<input type="text" name="us_tel" id="us_tel" required="required"><br> 
			 주소<input type="text" name="us_addr" id="us_addr" required="required"><br>
			     <input type="submit" value="회원가입하기" onclick="check()">
		</form>

	</fieldset>
 -->

	<%@ include file="../include/userFooter.jsp"%>
</body>
</html>