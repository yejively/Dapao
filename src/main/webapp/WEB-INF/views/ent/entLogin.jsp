<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
	left: 0;
	height: 100%;
	z-index: -1;
}

.container {
	width: 100vw;
	height: 100vh;
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	grid-gap: 7rem;
	padding: 0 2rem;
}

.img {
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

.login-content {
	display: flex;
	justify-content: flex-start;
	align-items: center;
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
	margin: 25px 0;
	padding: 5px 0;
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

	<c:choose>
		<c:when test="${param.result=='fail' }">
			<script>
						window.onload = function() {
							alert("아이디나 비밀번호가 틀렸습니다. 다시 로그인 하세요!")
						};
					</script>
		</c:when>
		<c:when test="${param.result=='1' }">
			<script>
						window.onload = function() {
							alert("정지된 아이디입니다. 고객센터에 문의하세요!")
						};
					</script>
		</c:when>
		<c:when test="${param.result=='2' }">
			<script>
						window.onload = function() {			
							alert("탈퇴하신 아이디입니다!")
						};
					</script>
		</c:when>
		<c:when test="${param.result=='3' }">
			<script>
						window.onload = function() {
							alert("승인대기중인 아이디 입니다. 고객센터에 문의하세요!")
						};
					</script>
		</c:when>
		<c:when test="${param.result=='ok' }">
			<script>
						window.onload = function() {
							alert("비밀번호를 정상적으로 변경하였습니다!")
						};
					</script>
		</c:when>
	</c:choose>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

	<img class="wave"
		src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/wave.png">
	<div class="container">
		<div class="img">
			<img
				src="${pageContext.request.contextPath }/resources/logo/logo.png">
		</div>
		<div class="login-content">


			<form action="" method="post">
				<h2 class="title">Dapao</h2>
				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user"></i>
					</div>
					<div class="div">
						<input type="text" name="own_id" class="input"
							placeholder="UserID" maxlength="12">
					</div>
				</div>
				<div class="input-div pass">
					<div class="i">
						<i class="fas fa-lock"></i>
					</div>
					<div class="div">
						<input type="password" name="own_pw" class="input"
							placeholder="Password">
					</div>
				</div>
				<a href="/ent/mailAuth">Forgot Password?</a> 
				<input type="submit" class="btn" value="sign in"> 
				<input type="button" class="btn" value="sign up" onclick="location.href='/ent/entJoin';">
			</form>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){

		const inputs = document.querySelectorAll(".input");


		function addcl(){
		  let parent = this.parentNode.parentNode;
		  parent.classList.add("focus");
		}

		function remcl(){
		  let parent = this.parentNode.parentNode;
		  if(this.value == ""){
		    parent.classList.remove("focus");
		  }
		}


		inputs.forEach(input => {
		  input.addEventListener("focus", addcl);
		  input.addEventListener("blur", remcl);
		});

		//Source :- https://github.com/sefyudem/Responsive-Login-Form/blob/master/img/avatar.svg
						
	});
</script>

</body>
</html>