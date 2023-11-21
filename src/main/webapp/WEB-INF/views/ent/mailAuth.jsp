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


	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

	<img class="wave"
		src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/wave.png">
	<div class="container">
		<div class="img">
			<img
				src="${pageContext.request.contextPath }/resources/logo/logo.png">
		</div>
		<div class="login-content">


			<form action="/ent/changePw" method="GET">
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
						<i class="fas fa-envelope"></i>
					</div>
					<div class="div">
						<input type="email" name="own_email" class="input"
							placeholder="email" id="email">
					</div>
				</div>
				<div class="input-div pass">
					<div class="i">
						<i class="fas fa-key"></i>
					</div>
					<div class="div">
						 <input class="form-control" placeholder="인증 코드 6자리를 입력해주세요." maxlength="6" disabled="disabled" name="authCode" id="authCode" type="text" autofocus>
					</div>
				</div>
				<span id="emailAuthWarn"></span>
				<input type="button" class="btn" value="send mail" id="emailAuth"> 
				<input type="submit" class="btn" value="change password" id="cp" disabled="disabled" > 
			</form>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#emailAuth").click(function() {
	    	const email = $("#email").val(); //사용자가 입력한 이메일 값 얻어오기
	    		
	    	//Ajax로 전송
	        $.ajax({
	        	url : './mailAuth',
	        	data : {
	        		email : email
	        	},
	        	type : 'POST',
	        	dataType : 'json',
	        	success : function(result) {
	        		console.log("result : " + result);
	        		$("#authCode").attr("disabled", false);
	        		code = result;
	        		alert("인증 코드가 입력하신 이메일로 전송 되었습니다.");
	       		}
	        }); //End Ajax	        	        
	    });
		
		
		//인증 코드 비교
	    $("#authCode").on("focusout", function() {
	    	const inputCode = $("#authCode").val(); //인증번호 입력 칸에 작성한 내용 가져오기
	    	
	    	console.log("입력코드 : " + inputCode);
	    	console.log("인증코드 : " + code);
	    		
	    	if(Number(inputCode) === code){
	        	$("#emailAuthWarn").html('인증번호가 일치합니다.');
	        	$("#emailAuthWarn").css('color', 'green');
	    		$('#emailAuth').attr('disabled', true);
	    		$('#email').attr('readonly', true);
	    		$("#cp").attr("disabled", false);
	    	}else{
	        	$("#emailAuthWarn").html('인증번호가 불일치 합니다. 다시 확인해주세요!');
	        	$("#emailAuthWarn").css('color', 'red');
	        	$("#cp").attr("disabled", true);
	    	}
	    });
		
						
	});
</script>

</body>
</html>