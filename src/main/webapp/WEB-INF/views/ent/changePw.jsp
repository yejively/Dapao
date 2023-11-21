<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Animated Login Form</title>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Poppins', sans-serif;
	overflow: hidden;
}

.wave {
	position: fixed;
	bottom: 0;
	right: 0;
	height: 100%;
	z-index: -1;
	transform: rotate(180deg);
}

.container {
	width: 100vw;
	height: 100vh;
	display: flex;
	grid-gap: 0rem;
	padding: 0 13rem;
	flex-wrap: wrap;
	flex-direction: row-reverse;
	justify-content: space-evenly;
}

.img {
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

.login-content {
	display: flex;
	justify-content: center;
	flex-direction: column;
	align-items: baseline;
	text-align: center;
}

.img img {
	width: 500px;
}

form {
	width: 360px;
}

.login-content img {
	height: 100px;
}

.login-content h2 {
	margin: 15px 0;
	color: #333;
	text-transform: uppercase;
	font-size: 2.9rem;
}

.login-content .input-div {
	position: relative;
	display: grid;
	grid-template-columns: 7% 93%;
/* 	margin: 25px 0; */
/* 	padding: 5px 0; */
	border-bottom: 2px solid #d9d9d9;
}

.login-content .input-div.one {
	margin-top: 0;
}

.i {
	color: #d9d9d9;
	display: flex;
	justify-content: center;
	align-items: center;
}

.i i {
	transition: .3s;
}

.input-div>div {
	position: relative;
	height: 45px;
}

.input-div>div>h5 {
	position: absolute;
	left: 10px;
	top: 50%;
	transform: translateY(-50%);
	color: #999;
	font-size: 18px;
	transition: .3s;
}


.input-div:before, .input-div:after {
	content: '';
	position: absolute;
	bottom: -2px;
	width: 0%;
	height: 2px;
	background-color: #38d39f;
	transition: .4s;
}

.input-div:before {
	right: 50%;
}

.input-div:after {
	left: 50%;
}

.input-div.focus:before, .input-div.focus:after {
	width: 50%;
}

.input-div.focus>div>h5 {
	top: -5px;
	font-size: 15px;
}

.input-div.focus>.i>i {
	color: #38d39f;
}

.input-div>div>input {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	border: none;
	outline: none;
	background: none;
	padding: 0.5rem 0.7rem;
	font-size: 1.2rem;
	color: #555;
	font-family: 'poppins', sans-serif;
}

.input-div.pass {
	margin-bottom: 4px;
}

a {
	display: block;
	text-align: right;
	text-decoration: none;
	color: #999;
	font-size: 0.9rem;
	transition: .3s;
}

a:hover {
	color: #38d39f;
}

.btn {
	display: block;
	width: 100%;
	height: 50px;
	border-radius: 25px;
	outline: none;
	border: none;
	background-image: linear-gradient(to right, #32be8f, #38d39f, #32be8f);
	background-size: 200%;
	font-size: 1.2rem;
	color: #fff;
	font-family: 'Poppins', sans-serif;
	text-transform: uppercase;
	margin: 1rem 0;
	cursor: pointer;
	transition: .5s;
}

.div input[type="file"]::file-selector-button{
	display: block;
	width: 45%;
	height: 30px;
	border-radius: 25px;
	outline: none;
	border: none;
	background-image: linear-gradient(to right, #32be8f, #38d39f, #32be8f);
	background-size: 200%;
	font-size: 1rem;
	color: #fff;
	font-family: 'Poppins', sans-serif;
	text-transform: uppercase;
	margin: 5px;
	cursor: pointer;
	transition: .5s;
}

.btn:hover {
	background-position: right;
}

@media screen and (max-width: 1050px) {
	.container {
		grid-gap: 5rem;
	}
}

@media screen and (max-width: 1000px) {
	form {
		width: 290px;
	}
	.login-content h2 {
		font-size: 2.4rem;
		margin: 8px 0;
	}
	.img img {
		width: 400px;
	}
}

@media screen and (max-width: 900px) {
	.container {
		grid-template-columns: 1fr;
	}
	.img {
		display: none;
	}
	.wave {
		display: none;
	}
	.login-content {
		justify-content: center;
	}
}
</style>
</head>
<body>

	<img class="wave"
		src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/wave.png">
	<div class="container">
		<div class="img">
			<img src="${pageContext.request.contextPath }/resources/logo/join.png">
		</div>
	<div class="login-content">
		
		<form action="" method="post"> <br>
			<h2 class="title">Dapao</h2>
				
				<input type="hidden" value="${param.own_id }">
				<input type="hidden" value="${param.own_email }">
	
				<div class="input-div pass">
					<div class="i">
						<i class="fas fa-lock"></i>
					</div>
					<div class="div">							
						<input type="password" name="own_pw" required="required" id="own_pw" min="8" maxlength="16" placeholder="비밀번호">
					</div>
				</div>
						<span id="pwc1"></span>
				
				<div class="input-div pass">
					<div class="i">
						<i class="fas fa-lock"></i>
					</div>
					<div class="div">							
						<input type="password" name="own_pwC" required="required" id="own_pwC" min="8" maxlength="16" placeholder="비밀번호확인">
					</div>
				</div>
						<span id="pwc2"></span>
				
			
			<input type="submit" class="btn" value="change password" id="cp" disabled="disabled" > 
			
		</form>
	</div>
	</div>
	
	
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>	
	
<script	type="text/javascript">

	
	$("#own_pw").blur(function() {
	 	let pwdCheck= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	 	
	 	if ($("#own_pw").val() == "") {
	         $("#pwc1").css("color", "red");
	         $("#pwc1").text("비밀번호를 입력하세요!");
	         password = false;
	      }	
	      else if (!pwdCheck.test($("#own_pw").val())) {
		  	 $("#pwc1").css("color", "red");
		     $("#pwc1").text("비밀번호는 영문+숫자+특수문자 조합하여 8~16자리를 사용해야 합니다");
		     password = false;
	      }else {
	    	  $("#pwc1").css("color", "green");
			  $("#pwc1").text("안전한 비밀번호 입니다.");
			  password = true;
	      }	 	
	 
	 });
	
	/////비밀번호 확인//////
	$("#own_pwC").blur(function() {
		if($("#own_pwC").val() == "") {
			$("#pwc2").css("color", "red");
	        $("#pwc2").text("비밀번호 확인해주세요!");
	        password_check = false;
		}
		else if(password == true && $("#own_pw").val() == $("#own_pwC").val()) {
			$("#pwc2").css("color", "green");
			$("#pwc2").text("비밀번호가 일치합니다!");
			$("#cp").attr("disabled", false);
			password_check = true;
		}else {
			$("#pwc2").css("color", "red");
			$("#pwc2").text("비밀번호를 다시 확인해주세요");
			password_check = false;
		}
	}); // pw

	
</script>
	
	
</body>
</html>