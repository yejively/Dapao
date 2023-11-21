<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:if test="${empty us_id }">
	<c:redirect url="../user/userLogin"/>
</c:if>
<c:if test="${!empty us_id }">
	<%@ include file="../include/userLoginHeader.jsp" %>
</c:if>
<!-- iamport.payment.js -->
<script type="text/javascript" src="http://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	
<title>Insert title here</title>

<style type="text/css">

.box{

	background-color: transparent;

}

/* 현재 금액 */
#nowCoinSection{

	width: 800px;
	height: 50px;
	text-align: center;

}

#now_coin{

	border : none;
	font-size:20px;
	width : 120px;
	background-color: transparent;
}

#us_coin{

	border: none;
	font-size: 20px;
	font-weight: bold;
	text-align: right;
	width : 100px;
	background-color: transparent;
	
}

.won{

	font-weight: bold;
	background-color: transparent;
	border: none;
	width: 20px;

}



/* 충전 금액 */
#coinCahrgeText{

	width : 600px;
	background-color: transparent;
	border: none;
	font-size: 20px;
	text-align: left;
}


.ppp{

	border: none;
	font-size: 20px;
	width:150px;
	height:50px;
	text-align: left;
	color:black;
	background-color: transparent;
	

}


.blank{

	background-color: transparent;
	border: none;
	width: 20px;
}


#pay_price{

	background-color: white;

}


/* 환불하기 */
#coin_refund{

	border : none;
	background-color: #A6A6A6;
	width : 200px;
	height : 30px;
	color:white;
	font-size: 20px;
	text-align: center;
	border-radius: 10px;
}

/* 카드로 충전하기 */
#iamport1{
	border : none;
	background-color: #59DA50;
	width : 200px;
	height : 80px;
	color:white;
	font-size: 20px;
	text-align: center;
	border-radius: 10px;
}

/* 카페로 충전하기 */
#iamport2{
	border : none;
	background-color: #FFBB00;
	width : 250px;
	height : 80px;
	color:white;
	font-size: 20px;
	text-align: center;
	border-radius: 10px;
}

/* 뒤로가기 */
#iamport3{
	border : none;
	background-color: #A6A6A6;
	width : 150px;
	height : 80px;
	color:white;
	font-size: 20px;
	text-align: center;
	border-radius: 10px;
}

.box{

	text-align: center;
	border-top: none;
	width: 100%;
	height: 100%;

}

#contain{

	float : center;
	width : 800px;
	height : 800px;
	border: none;
	padding-left : 20%;
}

#coin_charge_form{

	width: 800px;
	height: 600px;
	
}

/* 대나무페이 환불  */
.item_top_title{

	border: none;
	font-size: 30px;
	color: black;
	text-align: left;
	background-color: transparent;
}

hr{

color: black;
}



</style>
</head>
<body>


	
	
<!-- 	<h1>/item/coinharge.jsp</h1>
	<h1> 대나무 페이 충전 </h1>
	 -->
<div class="box">

	<input type="text" value="대나무페이 환불" class="item_top_title" readonly disabled="disabled">
	<hr>
	
	<div id="contain">	 
		<div id="nowCoinSection">
			<input type="text" value="현재 금액  : " id="now_coin" readonly disabled="disabled"> 
			<input type="text" value="${us_coin }" id="us_coin" readonly disabled="disabled">
			<input type="text" value="원" class="won" readonly disabled="disabled">
			<input type="text" value="" class="blank" readonly disabled="disabled">
			<input type="button" value="환불하기 " id="coin_refund">
		</div>
		<br><br>
		<div id="coin_charge_form">
			<form action="" method="post" name="fr">
			 
				<input type="text" value="충전금액" id="coinCahrgeText">   <br>
				<input type="radio" name="charge_price" value="5000" checked class="pp">
				<input type="text" value="5,000원  " class="ppp" readonly disabled="disabled">
				<input type="radio" name="charge_price" value="10000" class="pp">
				<input type="text" value="     10,000원  " class="ppp" readonly disabled="disabled"> <br>
				<input type="radio" name="charge_price" value="20000" class="pp">
				<input type="text" value="20,000원   "class="ppp" readonly>
				<input type="radio" name="charge_price" value="30000" class="pp">
				<input type="text" value="     30,000원  " class="ppp" readonly disabled="disabled"> <br>
				<input type="radio" name="charge_price" value="50000" class="pp">
				<input type="text" value="50,000원  " class="ppp" readonly>
				<input type="radio" name="charge_price" value="100000" class="pp">
				<input type="text" value="     100,000원  " class="ppp" readonly disabled="disabled"> <br>
				<input type="radio" name="charge_price" value="200000" class="pp"> 
				<input type="text" value="200,000원  " class="ppp" readonly disabled="disabled">
				<input type="radio" name="charge_price" value="300000" class="pp">
				<input type="text" value="     300,000원  " class="ppp" readonly disabled="disabled"> <br>
				<input type="radio" name="charge_price" value="0" id="price">
				<input type="text" value="직접입력하기  " class="ppp" readonly disabled="disabled">
				<input type="text" value="" class="blank">
				<input type="number" value="0" name="pay_price" id="pay_price" max="10"> <br>
				<font id="checkP" size="2"></font>
				<br><br>
				<input type="button" value="카드로 충전하기" id="iamport1">
				<input type="button" value="카카오페이로 충전하기" id="iamport2">
				<input type="button" value="뒤로가기" id="iamport3" onclick="back();">
			</form>
			
			<input type="hidden" value="${userVO.us_name }" name="us_name" id="us_name">
			<input type="hidden" value="${userVO.us_email }" name="us_email" id="us_email">
			<input type="hidden" value="${userVO.us_tel }" name="us_tel" id="us_tel">
		</div>
	</div>
</div>	

<!-- 환불하기 버튼 클릭시 Modal -->
<div id="coinRefundModal" class="modal fade" role="dialog">
	<!-- <div class="modal-dialog modal-lg"> -->
	<div class="modal-dialog ">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">환불받을 계좌를 입력해주세요</h4>
				<h4 class="modal-content">은행</h4>
				<input type="text" required="required">
				<h4 class="modal-content">예금주</h4>
				<input type="text"  required="required">
				<h4 class="modal-content">계좌번호</h4>
				<input type="text"  required="required">
				<h4 class="modal-content">환불할 코인</h4>
				<input type="number" id="us_coin_refund"  required="required">
				
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="modalYes">환불하기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
			</div>
		</div>
	</div>
</div>	
	
	<%@ include file="../include/userFooter.jsp" %>
	
<script type="text/javascript">

	$(document).ready(function(){

		var pv = 5000; // 라디오 버튼 값
		var pay; // 카드 or 카카오 
		
		
		// 직접 입력하기 활성화 / 비활성화
		$("#pay_price").attr('disabled','disabled');
		$("#price").on("click",function(){
			
			// alert('dd');
			pv = $(this).val();
			$("#pay_price").removeAttr("disabled");
			$("#pay_price").val(0);
			
		});
		
		$(".pp").on("click",function(){
			
			// alert('dd');
			pv = $(this).val();
			$("#pay_price").val(0);
			$("#pay_price").attr('disabled','disabled');
			$("#checkP").text(" ");
		});
		
		// 최소 금액 1000원
		$("#pay_price").keyup(function(){
			
			var price = $("#pay_price").val();
			if(price != null){
				if(price < 1000){
					
					$("#checkP").html('최소 충전금액은 1000원입니다.');
					$("#checkP").attr('color','red');
					document.fr.pay_price.focus();
				}
				if(price >= 1000){
					
					$("#checkP").html(' ');
				}
			}
		});
		
	
		
//	});
	console.log($('#us_email').val());
	var data;
	// 결제하기 버튼 클릭
	// 카드
	$("#iamport1").on("click",function(){
		
		data='카드';
		payment(data);
	});
	$("#iamport2").on("click",function(){
		
		data='카카오';
		payment(data);
	});
	
	function payment(data){
		
		console.log(data);
		
		pay = data;
		
		if(pay == '카카오'){
			pay = 'kakaopay';
		}
		else if(pay == '카드'){
			pay = 'html5_inicis';
		}
		
		
		if(pv == 0 ){
			pv = $("#pay_price").val();
			console.log(pv);
		}else{
			console.log(pv);
		}
	
		requestPay();
	
		function requestPay(){
			
			var IMP = window.IMP;
			IMP.init('imp68622473'); // 가맹점 식별코드
			
			// 시간
			var today = new Date();
	        var hours = today.getHours(); // 시
	        var minutes = today.getMinutes();  // 분
	        var seconds = today.getSeconds();  // 초
	        var milliseconds = today.getMilliseconds();
	        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
	        
	     	// 필요한 정보들
	        var us_email = $("#us_email").val(); //회원이메일
	        var us_name = $("#us_name").val(); //회원이름
	        var us_tel = $("#us_tel").val(); //회원전화번호
	        
		IMP.request_pay(
			{ // param
				pg : pay, //pg사명 or pg사명.CID (잘못 입력할 경우 기본PG사가 띄워짐)
				pay_method : "card", // 지불방법
				merchant_uid : "IMP" + makeMerchantUid, // 가맹점 주문번호
				name : "대나무페이", // 결제창에 노출될 상품명
				amount : pv, // 결제금액
				buyer_email : us_email,
				buyer_name : us_name,
				buyer_tel : us_tel
			
			}, // param
			function(rsp){ // callback
				if(rsp.success){
					console.log(rsp);
					var msg = "충전완료";
					var result={
							
						"imp_uid" : rsp.imp_uid, //결제 고유번호 (결제 확인하기 위해서 필요함)
                         "pay_uid" : rsp.merchant_uid, // 주문번호
                         "pay_kind" : rsp.name,    // 결제창에 노출 될 상품명(대나무페이)
                         "pay_price" : rsp.paid_amount,    // 결제금액
                         "us_email" : rsp.buyer_email,	
                         "us_name" : rsp.buyer_name, //유저 이름
                         "us_tel" : rsp.buyer_tel , // 유저 전화번호
                         "card_num" : rsp.card_number, //카드승인번호(card_num)
                         "pay_card" : rsp.card_name, //카드사
						 "pay_method" : rsp.pay_method, // 결제방법 (카드/현금)
						 "pay_pg" : data
					}
					console.log("result");
					console.log(result);
					
					$.ajax({
                        url : "/item/coinCharge",
                        type: "POST",
                        data : result,
                        success : function(){
						
                            alert('결제성공');
                            location.href = "${contextPath}/user/userMain";
                         }
                });
					
				}else{
					alert('결제취소');
				} 
			}  //function(rsp)
		); //IMP.request_pay
	} // requestPay 
	} // payment
	
	var us_coin = 0;
	var us_coin_refund = 0;
	
	$("#coin_refund").on("click",function(){
		us_coin = $("#us_coin").val();
		
		
		console.log(us_coin);
		console.log(us_coin_refund);
		
		if(us_coin == 0){
			alert('환불가능한 코인이 없습니다.');
		}
		else{
			$('#coinRefundModal').modal("show");
		}
		
		
	});
	
	$('#modalYes').click(function(){
		
		us_coin_refund = $("#us_coin_refund").val();
		
		if(us_coin_refund == 0){
			alert('다시 입력해주세요');
			console.log(us_coin);
			console.log(us_coin_refund);
		}
		else if(us_coin < us_coin_refund){
			alert('코인이 부족합니다.');
			console.log(us_coin);
			console.log(us_coin_refund);
		}
		else{
			
			console.log(us_coin);
			console.log(us_coin_refund);
			
			$.ajax({
				type : "get",
				url : "/item/coinRefund",
				data : {"us_coin" : us_coin_refund},
				error: function(){
					alert("환불 실패");
				},
				success : function(result){
						alert("환불 완료");
						location.reload();
					
				} // success 끝	
			}); // ajax 끝
		}
	}); // modalYes
	
	
	function back(){
		history.back();
		
	}
}); //document




</script>	
	
	
</body>
</html>