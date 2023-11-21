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
html{
	height: 100%;
	
}

body {
	font-family: 'Poppins', sans-serif;
	overflow: visible;
	overflow: scroll;
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
	justify-content: flex-start;
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
	display: inline;
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
		
		<form action="" method="post" enctype="multipart/form-data"> <br>
			<h2 class="title">Dapao</h2>
			
						
				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user"></i>
					</div>
					<div class="div">
						<input type="text" name="own_id" required oninput = "checkId()"  maxlength="12" id="own_id" placeholder="사업자번호(-)포함 입력하세요!" > <br>
					</div>
				</div>
						<span class="id_ok" style="color:green; display: none;">사용 가능한 아이디입니다.</span>
						<span class="id_no" style="color:red; display: none;">중복된 아이디입니다!</span>
						<span class="id_ck" style="color:red; display: none;">사업자번호 (-)포함 입력하세요! </span>
				
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
				
				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user"></i>
					</div>
					<div class="div">							
						<input type="text" name="own_name" required="required" id="own_name" placeholder="이름">
					</div>
				</div>
				
				<div class="input-div one">
					<div class="i">
						<i class="fas fa-phone"></i>
					</div>
					<div class="div">							
						<input id="phone" type="text" name="own_tel" placeholder="전화번호" required/>
					</div>
				</div>
						<button id="phoneChk" class="doubleChk btn btn-default" type="button">
								<i class="fa fa-user">인증번호보내기</i>
						</button>	
				
				<div class="input-div one">
					<div class="i">
						<i class="fas fa-key"></i>
					</div>
					<div class="div">							
						<input id="phone2" type="text" name="phone2" placeholder="인증번호 입력" disabled required/>
					</div>
				</div>
						<button id="phoneChk2" class="doubleChk btn btn-default" type="button">
								<i class="fa fa-user">인증</i>
						</button>
				<span id="successPhoneChk"></span>
				
				<div class="input-div one">
					<div class="i">
						<i class="fas fa-envelope"></i>
					</div>
					<div class="div">							
						<input type="text" name="own_email" required="required" id="own_email" placeholder="이메일">
					</div>
				</div>
				
				
				<div class="input-div one">
					<div class="i">
						<i class="fas fa-shopping-cart"></i>
					</div>
					<div class="div">							
						<input type="text" name="ent_name" required="required" id="ent_name" placeholder="가게이름">
					</div>
				</div>
				
				
				<div class="input-div one">
					<div class="i">
						<i class="fas fa-cog"></i>
					</div>
					<div class="div">							
						<input type="text" name="ent_cate" required="required" id="ent_cate" placeholder="업종">
					</div>
				</div>

				
				<button class="btn btn-default" type="button" onclick="goPopup();">
					<i class="fa fa-search">주소검색</i>
				</button>				
				<div class="input-div one">
					<div class="i">
						<i class="fas fa-map"></i>
					</div>
					<div class="div">							
						<input type="text" class="form-control" name="post" required="required" id="zipNo" placeholder="우편번호">
					</div>
				</div>
				
				
				<div class="input-div one">
					<div class="i">
						<i class="fas fa-map"></i>
					</div>
					<div class="div">							
						<input type="text" class="form-control" name="ent_addr" required="required" id="roadFullAddr" placeholder="상세주소">
					</div>
				</div>
				
				
				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user"></i>
					</div>
					<div class="div">							
						<input type="text" name="ent_mo" required="required" id="ent_mo" placeholder="통신판매허가증번호">
					</div>
				</div>
				
				
				<div class="input-div one">
					<div class="i">
						<i class="fas fa-file"></i>
					</div>
					<div class="div">
						<input type="file" name="file" required="required" id="ent_file" placeholder="사업자등록증첨부">							
					</div>
				</div>
			
			<div id="buttonContainer">
				<button id="phoneChk2" class="doubleChk btn btn-default" type="submit">
					<i class="fa fa-user">가입</i>
				</button>
				
				<button id="phoneChk2" class="doubleChk btn btn-default" type="button" onclick="location.href='/ent/entMain'">
						<i class="fa fa-user">취소</i>
				</button>
			</div>	
			
		</form>
	</div>
	</div>
	
	
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>	
	
<script	type="text/javascript">
	$(document).ready(function(){
		var code2 = "";
		$("#phoneChk").click(function(){
			alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
			var phone = $("#phone").val();
			$.ajax({
		        type:"GET",
		        url:"entPhoneCk?phone=" + phone,
		        cache : false,
		        success:function(data){
		        	if(data == "error"){
		        		alert("휴대폰 번호가 올바르지 않습니다.")
						$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
						$(".successPhoneChk").css("color","red");
						$("#phone").attr("autofocus",true);
		        	}else{	        		
		        		$("#phone2").attr("disabled",false);
		        		$("#phoneChk2").css("display","inline-block");
		        		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
		        		$(".successPhoneChk").css("color","green");
		        		$("#phone").attr("readonly",true);
		        		code2 = data;
		        	}
		        }
		    });
		});
		
		$("#phoneChk2").click(function(){
			if($("#phone2").val() == code2){
				$(".successPhoneChk").text("인증번호가 일치합니다.");
				$(".successPhoneChk").css("color","green");
				$("#phoneDoubleChk").val("true");
				$("#phone2").attr("disabled",true);
			}else{
				$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
				$(".successPhoneChk").css("color","red");
				$("#phoneDoubleChk").val("false");
				$(this).attr("autofocus",true);
			}
		});
	
	
	
	
	});
	
	function goPopup(){
		//경로는 시스템에 맞게 수정하여 사용
		//호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를
		//호출하게 됩니다.
		var pop = window.open("/ent/jusoPopup","pop","width=570,height=350, scrollbars=yes, resizable=yes");
		//** 2017년 5월 모바일용 팝업 API 기능 추가제공 **/
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서
		// 실제 주소검색 URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		// var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
		}
		
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd,
		rnMgtSn, bdMgtSn , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm,
		buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
		 // 2017년 2월 제공항목이 추가되었습니다. 원하시는 항목을 추가하여 사용하시면 됩니다.
		 var address1 = document.querySelector("#zipNo");
		 address1.value = zipNo;
		 
		 var address2 = document.querySelector("#roadFullAddr");
		 address2.value = roadFullAddr;
		 
		}
	
	function checkId(){
		var own_id = $('#own_id').val();
		
		$.ajax({
			url:'/ent/entCheckId',
			type:'post',
			data:{own_id:own_id},
			success:function(cnt){
				if(cnt != 1 && own_id.length == 12){
					$('.id_ok').css("display","inline-block");
					$('.id_no').css("display","none");
					$('.id_ck').css("display","none");
				}else if(cnt == 1 && own_id.length == 12){
					$('.id_ok').css("display","none");
					$('.id_no').css("display","inline-block");
					$('.id_ck').css("display","none");
					$("#own_id").focus();
				}else if(own_id.length != 12){
					$('.id_ok').css("display","none");
					$('.id_no').css("display","none");
					$('.id_ck').css("display","inline-block");
					$("#own_id").focus();	
				}else{
					$('.id_ok').css("display","none");
					$('.id_no').css("display","none");
					$('.id_ck').css("display","none");
				}
			}
		})
		
	}
	
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
	
	
	
	

