<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>UserFindPw Form</title>

 <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/a81368914c.js"></script>
  
    <meta name="viewport" content="width=device-width, initial-scale=1">



<!-- FindPw css -->


<style>
	*{
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}

body{
    font-family: 'Poppins', sans-serif;
    overflow: hidden;
}

.wave{
  position: fixed;
  bottom: 0;
  left: 0;
  height: 100%;
  z-index: -1;
}

.container{
    width: 100vw;
    height: 100vh;
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-gap :7rem;
    padding: 0 2rem;
}

.img{
  display: flex;
  justify-content: flex-end;
  align-items: center;
}

.login-content{
  display: flex;
  justify-content: flex-start;
  align-items: center;
  text-align: center;
}

.img img{
  width: 500px;
}

form{
  width: 360px;
}

.login-content img{
    height: 100px;
}

.login-content h2{
  margin: 15px 0;
  color: #333;
  text-transform: uppercase;
  font-size: 2.9rem;
}

.login-content .input-div{
  position: relative;
    display: grid;
    grid-template-columns: 7% 93%;
    margin: 25px 0;
    padding: 5px 0;
    border-bottom: 2px solid #d9d9d9;
}

.login-content .input-div.one{
  margin-top: 0;
}

.i{
  color: #d9d9d9;
  display: flex;
  justify-content: center;
  align-items: center;
}

.i i{
  transition: .3s;
}

.input-div > div{
    position: relative;
  height: 45px;
}

.input-div > div > h5{
  position: absolute;
  left: 10px;
  top: 50%;
  transform: translateY(-50%);
  color: #999;
  font-size: 18px;
  transition: .3s;
}

.input-div:before, .input-div:after{
  content: '';
  position: absolute;
  bottom: -2px;
  width: 0%;
  height: 2px;
  background-color: #38d39f;
  transition: .4s;
}

.input-div:before{
  right: 50%;
}

.input-div:after{
  left: 50%;
}

.input-div.focus:before, .input-div.focus:after{
  width: 50%;
}

.input-div.focus > div > h5{
  top: -5px;
  font-size: 15px;
}

.input-div.focus > .i > i{
  color: #38d39f;
}

.input-div > div > input{
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

.input-div.pass{
  margin-bottom: 4px;
}

a{
  display: block;
  text-align: right;
  text-decoration: none;
  color: #999;
  font-size: 0.9rem;
  transition: .3s;
}

a:hover{
  color: #38d39f;
}



 /* 비밀번호찾기 버튼 */
.btn{
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


 /* 뒤로가기 버튼 */
.btn1{
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



.btn:hover{
  background-position: right;
}


@media screen and (max-width: 1050px){
  .container{
    grid-gap: 5rem;
  }
}

@media screen and (max-width: 1000px){
  form{
    width: 290px;
  }

  .login-content h2{
        font-size: 2.4rem;
        margin: 8px 0;
  }

  .img img{
    width: 400px;
  }
}

@media screen and (max-width: 900px){
  .container{
    grid-template-columns: 1fr;
  }

  .img{
    display: none;
  }

  .wave{
    display: none;
  }

  .login-content{
    justify-content: center;
  }
}


</style>

<!-- FindPw css -->



<!-- //http://localhost:8088/user/userFindPw -->
</head>

<body>



<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

	<img class="wave"
		src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/wave.png">
	<div class="container">
		<div class="img">
			<img src="https://media.discordapp.net/attachments/1165836337723740250/1174271016395083776/logo.png?ex=6566fc1b&is=6554871b&hm=2acf8a32ea29a2e148fbfd07d2f685a1bca0122e2210c64d4fd56ebe046a5fd7&=&width=466&height=466">
		</div>
		<div class="login-content">
		
			
				<form action="" method="post">
				<h2 class="title">Dapao</h2>
				<div class="input-div one">
                 <div class="i">
                    <i class="fas fa-user"></i>
                 </div>
                 <div class="div">
					<input type="text" name="us_id" class="input" placeholder="ID" required="required" >  
					</div>
              </div>
              <div class="input-div pass">
                 <div class="i"> 
                    <i class="fas fa-lock"></i>
                 </div>
                 <div class="div">
					<input type="text" name="us_email" class="input" required="required" placeholder="E-mail">  
					 </div>
              </div>
					<input type="submit" class="btn" value="비밀번호찾기">
					<input type="button" class="btn1" value="돌아가기" onclick="location.href='/user/userLogin';">
					
				</form>
		</div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
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


		inputs.forEach(input -> {
		  input.addEventListener("focus", addcl);
		  input.addEventListener("blur", remcl);
		});

		//Source :- https://github.com/sefyudem/Responsive-Login-Form/blob/master/img/avatar.svg
			
	
			

	
</script>



</body>
</html>


 <!-- 	
	<form class="form" action="" method="post" id="userFindPw">
	<h5>비밀번호 찾기</h5> <br>
			<div class="input-box">
				 <input type="text" name="us_id" required="required">
				 <label for="us_id">아이디</label>
			</div>
			<div class="input-box">
				 <input type="text" name="us_email" placeholder="이메일 형식으로 입력해주세요" required="required"><br>
			     <label for="us_email">이메일</label>
			</div>
			<div class="3">
				<input class="a" type="submit" value="비밀번호찾기">
			</div>
			<div class="4">
				 <input class="b" type="button" value="돌아가기" onclick="location.href='/user/userLogin';">
			</div>
	</form>
	
	
	 -->






	<!-- 
	
	<form action="" method="post" id="userFindPw">
			이메일 <input type="text" name="us_email" placeholder="이메일 형식으로 입력해주세요">
			<button id="sendEmail">이메일 인증번호 보내기</button>
			인증번호 <input type="text" name="checkNum"><br>
			<input type="submit" value="비밀번호찾기">
		</form>
			 <button onclick="back()">뒤로가기</button>
	
	
	
	 -->
	
	
	
	<!-- 
	
	이메일인증 버튼 클릭
	<script type="text/javascript">
		$("#sendEmail").click(function(){
			const email = $("#us_id").val
			console.log("회원 이메일 확인 : " + email);// console에서 확인 
			const checkInput = $("#checkNum"); // 인증번호 입력하는 곳 
			
			$.ajax({
				type : "get",
				url : "/user/userFindPw",
				success : function(data){
					console.log("data : " + data);
					checkInput.attr("disabled",false);
					code = data; 
					alert("인증번호가 전송되었습니다");
				},
				error : function(){
					alert("인증번호 전송에 실패했습니다.");
				}
			});// mail ajax
		});// sendEmail. click 
		
		$("#checkNum").blur(function(){
			var inputCode = $(this).val();
			var resultMsg = $("#mail_check_msg");
			
			if(inputCode == code){
				resultMsg.html("인증번호가 일치합니다.");
				resultMsg.css("color","green");
				$("#sendEmail").attr("disabled",true);
				$("#email").attr("readonly",true);
			}else{
				resultMsg.html("인증번호가 일치하지 않습니다. 다시 입력해 주세요.");
				resultMag.css("color","red");
			}
			
		});
	
	</script>
	
	
	 -->
	
	