<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/entHeader.jsp"%>
<style>
#expForm {
   position: relative;
   border-radius: 3px;
   background: #ffffff;
   box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
   margin: 30px;
   font-size: 20px;
   padding: 3%;
   border: 1px solid #00000047;
   padding-top: 5%;
   height: 830px;
}

#exp_psn {
	width: 150px;
	display: inline;
	margin-left: 15px;
	margin-bottom: 30px;
	font-size: 20px;
	height: 40px
}

#exp_content {
	margin-bottom: 30px;
	font-size: 20px;
	height: 190px;
}

textarea[name=exp_notice]{
	font-size: 20px;
	height: 190px;
}

#exp_title {
	margin-bottom: 30px;
	font-size: 20px;
	height: 40px;
}

#b {
	padding-left: 30px;
	padding-rigth: 15px;
}

#btnExp{
   border-radius: 0.5em;
   background-color: #14571f;
   color: white;
   border-color: #14571f;
}

#exp_price[readonly]{
	border: 1px solid;
    border-color: #d2d6de;
    font-size: 20px;
    height: 40px;
}
label{
	color : green;
}
textarea {
   height: 7em;
    border: none;
    resize: none;
}
.modal-content{
	border-radius: 1em;
    padding-left: 8%;
    margin-top: 30%;
    border: 3px solid green;
    font-weight: 700;
}
.expInfo{
	font-size: 18px;
	display: inline-grid;
	padding-left: 30px;
	padding-bottom: 20px;
	text-align: center;
}
.modal-title{
	margin-left: 37%;
    font-size: larger;
}
</style>

<!-- 사업자아이디(세션제어)/체험단 제목/내용/모집인원/유의사항 -->
<form action="ownExpPOST" method="post" name="expSubit" id="expSubmit">
	<div id="expForm">
		<div class="form-group">
			<label>사업자 아이디 &nbsp;&nbsp; : &nbsp;&nbsp; ${own_id }</label>			
		</div>
		<div class="form-group">
			<label>모집인원</label>
			<select class="form-control" name="exp_psn" id="exp_psn" onchange="chageSelect()">
				<option>3</option>
				<option>5</option>
				<option>10</option>
				<option>15</option>
				<option>20</option>
			</select> 
			<label id="b">가격</label>
			<input type="text" readonly id="exp_price" value="30000">
			<div class="form-group">
				<label>신청 제목</label> <input type="text" class="form-control" name="exp_title" id="exp_title" placeholder="광고에 게시될 제목을 기입해주세요">
			</div>
		</div>
		<div class="form-group">
			<label>신청 내용</label>
			<textarea class="form-control" rows="10" name="exp_content" id="exp_content" placeholder="광고에 게시될 내용을 기입해주세요"></textarea>
		</div>
		<div class="form-group">
			<label>유의사항</label>
			<textarea class="form-control" rows="7" name="exp_notice" placeholder="광고에 게시될 유의사항을 기입해주세요"></textarea>
		</div>
		<input type="button" id="btnExp" value="신청하기">
	</div>
</form>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog sm-3">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<p class="modal-title">체험단 결제</p>
			</div>
			<div class="expInfo">
				사업자 아이디 <input class="form-control" type="text" value="${own_id }" readonly>
			</div>
			<div class="expInfo">
				신청 제목 <input class="form-control" type="text" id="exp_title2" readonly>
			</div>
			<div class="expInfo">
				모집 인원 <input class="form-control" type="text" id="exp_psn2" readonly>
			</div>
			<div class="expInfo">
				결제 가격 <input class="form-control" type="text"  id="exp_price2" readonly>
			</div>
			<div class="modal-footer">
				<input type="button" class="expSubmit" value="결제하기" onclick="requestPay()">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript">
	
	function chageSelect() {
		$('#exp_price').val($('#exp_psn').val()+"0000");
	}

	// 시간
	var today = new Date();
	var hours = today.getHours(); // 시
	var minutes = today.getMinutes(); // 분
	var seconds = today.getSeconds(); // 초
	var milliseconds = today.getMilliseconds();
	var makeMerchantUid = hours + minutes + seconds + milliseconds;

	// 신청하기 눌럿을때 모달 -> 결제창
	$('#btnExp').click(function() {
		if($('#exp_content').val().trim() == ""){
			alert("내용을 입력해주세요");
			return false;
		}
		if($('#exp_title').val().trim() == ""){
			alert("제목을 입력해주세요");
			return false;
		}
		$('#myModal').modal('show');
		$('#exp_title2').val($('#exp_title').val());
		$('#exp_psn2').val($('#exp_psn').val());
		$('#exp_price2').val($('#exp_price').val());
	});

	// 결제연동
	IMP.init('imp73450751');
	function requestPay() {
		var id = "${own_id}";
		console.log(id);

		// 결제 api 실행
		IMP.request_pay({
			pg : "html5_inicis.INIpayTest",
			pay_method : "card",
			merchant_uid : "IMP" + makeMerchantUid,
			name : $('#exp_title').val(),
			amount : $('#exp_price').val()
// 			buyer_tel : "01011111111", // 사업자 전화번호
		}, function(rsp) { // callback
			//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
			if (rsp.success) {
				// 결제하기 눌렀을때 -> 결제창 + submit동작 + 결제테이블 처리
				$.ajax({
					url : "/exp/ownExpSuccess",
					data : {
						imp_uid : rsp.imp_uid,
						pay_uid : rsp.merchant_uid,
						pay_price :	rsp.paid_amount,
						pay_kind : "체험단",
						pay_con : "결제완료",
						pay_pg : "카카오",
						pay_method : rsp.pay_method,
						pay_card : rsp.card_name,
						own_id : id
					},
					dataType : "json",
					success : function(data) {
						console.log(data);
						if (data == 1) {
							document.getElementById('expSubmit').submit();
							alert("결제완료");
							$('#myModal').modal('hide');
						}
					}
				});
			} else {
				alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
				$('#myModal').modal('hide');
			}
		});
	} //requestPay()
</script>


<%@ include file="../include/entFooter.jsp"%>