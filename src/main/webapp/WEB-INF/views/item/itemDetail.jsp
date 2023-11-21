<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${empty us_id }">
	<%@ include file="../include/userHeader.jsp" %>
</c:if>
<c:if test="${!empty us_id }">
	<%@ include file="../include/userLoginHeader.jsp" %>
</c:if>

<style type="text/css">

#container{

	margin-left: 10%;

}

a {
	color : black;
}

input[type=text]{

	/* border: none; */
	color : black;
	font-size : 15px;
	text-align: center;
	background-color: transparent;
	
}

input:focus{
	border-focus :none;
}

/* 물품 이미지 공간 */
#item_detail_main_img {
	position: relative;
	margin-left : 50px;
	width : 500px;
	height: 500px;
	float: left;
}

#item_detail_main_img input{
	float: left;
}

#item_main_img{
	width : 500px;
	height: 500px;
}

#img_back{ 
	width : 20px;
	height : 20px;
}

#img_next{ 
	width : 20px;
	height : 20px;
}


/* 이미지 +물품 설명 */
#item_contain{

	width : 1300px;
	height: 700px;


}

/* 물품 설명 공간 */
#item_write{
	position: relative;
	width : 600px;
	height: 500px;
	float: left;
	margin-left: 80px;
}

/* 카테고리 */
#item_cate, #cate{
	text-align: left;
	border: none; 
	width : auto;
	font-weight: bold;
	margin-left: 10px;
}

#cate{
	margin-left: 45px;
	
}


#item_cate, #cate : hover{
	
	color : black;
}

/* 제목 */
#item_title{
	text-align: left;
	border: none; 
	font-size: 35px;
	font-weight: bold;
	
}

/* 가격 */
#item_price{
	text-align: left;
	border: none; 
	font-size: 30px;
	font-weight: bold;
	width:250px;
	
}

/* 글상태 */
.item_state{
	border: 1px solid;
	border-radius : 10px;
	width : 100px;
	text-align: left;

}

/* 설명 글자들 */
.item_text{

	border : none;
	width : 100px;
	height : 30px;
	text-align: left;
}

/* 로그인하고 구매하기 */
#login_buy{
	
	border : none;
	background-color : #59DA50;
	width : 500px;
	height : 100px;
	color : white;
	font-weight: bold;
	font-size : 30px;
}

/* 내 판매글 목록보기 */
#my_sell_list{
	
	border : 6px solid green;
	background-color : green;
	width : 503px;
	height : 50px;
	color : white;
	font-weight: bold;
	font-size : 30px;
}

/* 신고하기 */
#it_ac{
	border: none; 
	background-color : #A6A6A6;
	cursor: pointer;
	height:30px;
	text-align : center;
	width : 80px;
	float: left;
	color : white;
	opacity: 0.6;
}

#it_love_text, #it_view_text, #it_regdate_text{
	border: none; 
	width : 50px;
	text-align: left;
}

#your_pro{
	cursor: pointer;
	border-radius: 10px;
}

/* 찜수 */
#item_love{
	border: none; 
	width : 30px;
	text-align: left;
}

/* 조회수 */
#item_view{
	border: none; 
	width : 30px;

}

/* 글 등록일 */
#item_regdate{
	
	border: none; 
	width : 100px;
}

#item_regdate : hover{
	border: none;
}

/* 판매자 */
#item_us_id{
 	text-align : left;
 	width : 100px;
	border: none;
}

/* 물건상태 */
#item_con{
	border: none; 
	width : 50px;
	text-align: left;
}

/* 판매자 주소 */
#item_addr{
 	text-align : left;
	border: none; 
	width: 300px;

}

/* 물건 설명 공간 */
#it_content_div{

	position: relative;
	margin-left : 50px;
	border: 1px solide;
	width : 1000px;
	height: 240px;

}

/* 물건 설명 */
#it_content{
	top : 0px;
	left : 0px;
	text-align:inherit;
	border: 1px solide block;
	width : 1000px;
	height: 200px;
	background-color: transparent;

}

/* 상세내용 */
#it_content_title{
	border-radius : 10px;
	width: 100px;
	font-size: 19px;
	text-align: center;
	
}

#addLoveBtn{
	border : none;
	background-color : #E1E1E1;
	width : 100px;
	height : 100px;
	color : white;
	font-weight: bold;
	font-size : 30px;
	cursor: pointer;

	
}

#panda{

	border : none;
	background-color : #FFBB00;
	cursor: pointer;
	width:150px;
	height:100px;
	font-weight: bold;
	font-size : 30px;
	color : white;

}

#purchase{
	border : none;
	background-color : #59DA50;
	cursor: pointer;
	width:300px;
	height:100px;
	font-weight: bold;
	font-size : 30px;
	color : white;
}

/* 판매자의 다른 상품 보기 , 같은 카테고리 상품 보기 <a>글자 */
.item_detail_subtitle{
	font-size: 20px;
	font-weight: bold;
	padding-left: 2%;
	padding-bottom : 10%;
	margin-bottom: 10%;
	
}

.item_detail_subtitle:hover{
	color: black;
	font-weight: bold;
}

/* 글 수정 삭제 */
#item_update{

	border : 3px solid green;
	background-color : #ecf0f5;
	width : 250px;
	height : 50px;
	color : black;
	font-weight: bold;
	font-size : 30px;
	cursor: pointer;

}

#item_delete{
	border : 3px solid green;
	background-color :##ecf0f5;
	width : 250px;
	height : 50px;
	color : black;
	font-weight: bold;
	font-size : 30px;
	cursor: pointer;

}


/* 판매자의 다른물건, 현재 페이지 물건의 같은 카테고리 물품 구역 */
.itemSellsectionDiv{
	margin-left:30px;
	width : 1350px;
	height: 250px;
	margin-top: 100px;
	margin-bottom: 100px;
	
	
}

/* 물건 하나의 공간 */
.sellerItemVOListDiv , .cateItemVOListDiv{
	border: 1px solid gray; 
	
	width : 230px;
	height: 250px;
	float : left;
	text-align: center; 
	position : relative;
	margin-left : 10px;
	border : none;

}


.itemSellsectionDiv input[type=text]{
	
	border :none;
	font-size : 17px;
	cursor: pointer;
	height:30px;
	width:200px;
	text-align: center;
	background-color: transparent;
	
}

.sellerItemVOListDiv img, .cateItemVOListDiv img {

	border : 1px solid;
	height:200px;
	width:200px;
	object-fit : cover;

	
}

.itemSellsectionDiv img{
	cursor: pointer;
}

.sellerItemVOListDiv:hover, .cateItemVOListDiv:hover{
   	opacity: 0.7;
}

/* 구매확정 */
#userPurchaseOK, #sellerPurchaseOK{

	border : none;
	background-color : #59DA50;
	cursor: pointer;
	width:150px;
	height:100px;
	font-weight: bold;
	font-size : 30px;
	color : white;
	
}

/* 취소하기 */
#userCancleOK, #sellerCancleOK{

	border : none;
	background-color : #A6A6A6;
	cursor: pointer;
	width:150px;
	height:100px;
	font-weight: bold;
	font-size : 30px;
	color : white;
	opacity: 0.8;
}

/* 판매완료 */
#item_soldout{

	border : none;
	background-color : #A6A6A6;
	width : 500px;
	height : 50px;
	color : white;
	font-weight: bold;
	font-size : 30px;
	cursor: auto;
}


</style>
</head>
<body>
<!-- 		<div id ="uploadResult">
			<ul></ul>
		</div>
 -->
 <div id="container">
	<div id="item_contain">
		<form action=""  method="post">
		
		
			<c:if test="${!empty us_id }">
				<input type="hidden" value="${us_id }" id="session_us_id">
				<input type="hidden" value="${us_state }"  id="session_us_state"> <br>
			</c:if>
			<c:if test="${itemVO.it_state == 3 }">
				<c:redirect url="../user/userMain"/>
			</c:if>

			
			
				<input type="hidden" value="${itemVO.it_no }" name="it_no" id="item_it_no"> <br>
				<a id="cate">카테고리 ></a> <input type="text" value="${itemVO.it_cate }" name="it_cate" readonly id="item_cate" disabled="disabled">
				
				<br><hr><br>
				
				
				<div id="item_detail_main_img">
					<img src="/resources/itemIMG/back.png" id="img_back">
		 			<img  src="/imgfile/${itemVO.it_img }" id="item_main_img">
	 				<img src="/resources/itemIMG/forward.png" id="img_next">
 				</div>
			
 				<div id="item_write">
		 			<!-- 글 상태 표시 -->
					<c:choose>
						<c:when test="${itemVO.it_state == 0 }">
							<input type="text" value="판매중" readonly class="item_state" disabled="disabled"> <br>
						</c:when>
						<c:when test="${itemVO.it_state == 1 }">
							<input type="text" value="예약중" readonly class="item_state" disabled="disabled"> <br>
						</c:when>
						<c:when test="${itemVO.it_state == 2 }">
							<input type="text" value="판매완료" readonly class="item_state" disabled="disabled"> <br>
						</c:when>
						<c:otherwise>
							alert("삭제된 글입니다.");
							<c:redirect url="../user/userLogin"/>				
						</c:otherwise>
					</c:choose>
					<input type="text" value="${itemVO.it_title }" name="it_title" readonly id="item_title" disabled="disabled"> <br>
	 				<input type="text" value="${itemVO.it_price }원" name="it_price" readonly id="item_price" disabled="disabled"> <br>
					<c:if test="${!empty us_id && itemVO.us_id != us_id}">
						<input type="button" value="신고하기" onclick="location.href='../admin/acWriteForm?it_no=${itemVO.it_no}&us_id=${itemVO.us_id }';" id="it_ac"> <br>
					</c:if>
		 			<br>
					
					<input type="text" value="찜" id="it_love_text" disabled="disabled">
					<input type="text" value="${itemVO.it_love }" name="it_love" readonly id="item_love" disabled="disabled"> |
					 
					<input type="text" value="조회수" id="it_view_text" disabled="disabled">
					<input type="text" value="${itemVO.it_view }" name="it_view" readonly id="item_view" disabled="disabled">  |
									 
					<input type="text" value="등록일" id="it_regdate_text" disabled="disabled">
					<input type="text" value="${itemVO.it_regdate }" name="it_regdate" readonly id="item_regdate" disabled="disabled"> <br><br>
					
					
					<input type="text" value="▷ 판매자  : " class="item_text" readonly disabled="disabled"> 
					<input type="text" value="${sellerVO.us_nickname }" name="us_id" readonly id="item_us_id" disabled="disabled">
					<a href="/item/yourPage?us_id=${itemVO.us_id }" ><input type="text" value="판매자 프로필 보기" id="your_pro" readonly ></a> <br><br>
					
					&nbsp;&nbsp;&nbsp;<input type="text" value="▷ 상품상태  : " class="item_text" readonly disabled="disabled"> 
					<input type="text" value="${itemVO.it_con }" name="it_con" readonly id="item_con" disabled="disabled">  <br><br>
					
					<input type="text" value="▷ 거주지  : " class="item_text" readonly disabled="disabled"> 
					<input type="text" value="${sellerVO.us_addr }" name="us_addr" readonly id="item_addr" disabled="disabled"> <br><br>
					
					<input type="hidden" value="${itemVO.us_id }" name="us_id"> <br>
					 
					<!-- 로그인을 하지 않았을시 -->
					<c:if test="${empty us_id && itemVO.it_state != 2 }">
						<input type="button" value="로그인하고 구매하기" id="login_buy">
					</c:if>
					<!-- 내 판매글일 경우 -->
					<c:if test="${!empty us_id && us_id.equals(itemVO.us_id) && itemVO.it_state != 2 }">
						<input type="button" value="내 판매글 목록보기" id="my_sell_list"> <br><br>
						<input type="button" value="수정" id="item_update">
						<input type="button" value="삭제" id="item_delete">
					</c:if>
					<!-- 찜 & 판다톡 -->
					<c:if test="${!empty us_id && itemVO.us_id != us_id && itemVO.it_state != 2 }">
						<input type="button" value="찜" id="addLoveBtn"> 
						<input type="hidden" value="${love}" id="love_value"> 
						<input type="button" value="판다톡" id="panda"> 
					</c:if>
					<!-- 구매자도 판매자도 아닐때 -->
					<c:if test="${!empty us_id && itemVO.us_id != us_id && itemVO.it_state != 2 && tradeVO.us_id != us_id}">
						<input type="button" value="구매하기" id="purchase"> 
					</c:if>
					<!-- 구매자가 예약 글에 들어옴 -->
					<c:if test="${!empty us_id && itemVO.us_id != us_id && itemVO.it_state == 1 && tradeVO.us_id.equals(us_id)}">
						<input type="button" value="구매확정" id="userPurchaseOK">
						<input type="button" value="취소" id="userCancleOK"> 
					</c:if>
					<!-- 판매자 본인의 글에 들어옴 -->
					<c:if test="${!empty us_id && itemVO.us_id.equals(us_id) && itemVO.it_state == 1}">
						<input type="button" value="구매확정" id="sellerPurchaseOK"> 
						<input type="button" value="취소" id="sellerCancleOK"> 
					</c:if>
						
					<!-- 예약중인 글에 구매자나 판매가자 들어왔다면 정상적인 값(아니라면  1 3 3 값이다) -->
					<input type="hidden" value="${tradeVO.tr_no }" name="tr_no">
					<input type="hidden" value="${tradeVO.tr_buy_state }" name="tr_buy_state">
					<input type="hidden" value="${tradeVO.tr_sell_state }" name="tr_sell_state">
					
					<!-- 판매가 완료된 글이라면 -->
					<c:if test="${itemVO.it_state == 2  }">
						<input type="button" value="판매 완료" id="item_soldout"> 
					</c:if>
				</div>
		
			</form>
	
		</div>	
	
		
		
		<hr>
		<div id="it_content_div">
			<input type="text" value="상세 내용" id="it_content_title" disabled="disabled"> <br><br>
			<textarea readonly id="it_content" disabled="disabled">${itemVO.it_content}</textarea>
		</div>
	
		
		<hr>
		<div class="itemSellsectionDiv">
			<a class="item_detail_subtitle">판매자의 다른 상품 둘러보기</a><br>
			<div>
				<c:if test="${!empty sellerItemVO}">
					<c:forEach var="si" items="${sellerItemVO}">
						<c:if test="${si.it_state != 3 }">
							<form action="" class="sellerItemVOListDiv">
								<input type="hidden" value="${si.it_no }" name="it_no"> <br>
								<!-- <td  id ="uploadSeller"> -->
								<a href="../item/itemDetail?it_no=${si.it_no }">
									<img src="/imgfile/${si.it_img }" >
									<input type="text" value="${si.it_title }" name="it_title" readonly>
								</a>
							</form>	
						</c:if>
					</c:forEach>
				</c:if>		
			</div>
		</div>
		
		<hr>
		
		<div class="itemSellsectionDiv">
			<a class="item_detail_subtitle">같은 카테고리 상품 둘러보기</a><br>
			<div>
				<c:if test="${!empty sameCateVO}">
					<c:forEach var="sc" items="${sameCateVO}">
						<form action="" class="cateItemVOListDiv">
							<input type="hidden" value="${sc.it_no }" name="it_no"> <br>
							<!-- <td id ="uploadCate"> -->
							<a href="../item/itemDetail?it_no=${sc.it_no }">
								<img src="/imgfile/${sc.it_img }">
								<input type="text" value="${sc.it_title }" name="it_title" readonly>
							</a>
						</form>
					</c:forEach> 
				</c:if>	
			</div>
		</div>
		
		<br><br><br><br>
</div>	
<!-- 구매하기 버튼 클릭시 Modal -->
<div id="purchaseModal" class="modal fade" role="dialog">
	<!-- <div class="modal-dialog modal-lg"> -->
	<div class="modal-dialog ">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">구매하시겠습니까?</h4>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="modalYes">네</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
			</div>
		</div>
	</div>
</div>

<!-- user구매확정하기 버튼 클릭시 Modal -->
<div id="userPurchaseOKModal" class="modal fade" role="dialog">
	<!-- <div class="modal-dialog modal-lg"> -->
	<div class="modal-dialog ">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">구매확정 하시겠습니까?(취소가 불가능하므로 신중하게 눌러주세요.)</h4>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="userPurchaseOKModalYes">네</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
			</div>
		</div>
	</div>
</div>

<!-- seller구매확정하기 버튼 클릭시 Modal -->
<div id="sellerPurchaseOKModal" class="modal fade" role="dialog">
	<!-- <div class="modal-dialog modal-lg"> -->
	<div class="modal-dialog ">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">구매확정 하시겠습니까?(취소가 불가능하므로 신중하게 눌러주세요.)</h4>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="sellerPurchaseOKModalYes">네</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
			</div>
		</div>
	</div>
</div>

<!-- user취소하기 버튼 클릭시 Modal -->
<div id="userCancleOKModal" class="modal fade" role="dialog">
	<!-- <div class="modal-dialog modal-lg"> -->
	<div class="modal-dialog ">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">취소 하시겠습니까?(취소가 불가능하므로 신중하게 눌러주세요.)</h4>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="userCancleOKModalYes">네</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
			</div>
		</div>
	</div>
</div>

<!-- seller취소하기 버튼 클릭시 Modal -->
<div id="sellerCancleOKModal" class="modal fade" role="dialog">
	<!-- <div class="modal-dialog modal-lg"> -->
	<div class="modal-dialog ">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">취소 하시겠습니까?(취소가 불가능하므로 신중하게 눌러주세요.)</h4>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="sellerCancleOKModalYes">네</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
			</div>
		</div>
	</div>
</div>
<!-- 글 삭제하기 버튼 클릭시 Modal -->
<div id="itemDeleteModal" class="modal fade" role="dialog">
	<!-- <div class="modal-dialog modal-lg"> -->
	<div class="modal-dialog ">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">글을 삭제 하시겠습니까?</h4>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="itemDeleteModalYes">네</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
			</div>
		</div>
	</div>
</div>
	

	
	<%@ include file="../include/userFooter.jsp" %>
	

<script type="text/javascript">


$(document).ready(function(){
	
	//var path = "F:\\upload" + ${si.it_img };
	//console.log(path);
	//$("#img src").html(path);
	
	var str="";
	var love = ${love};
	console.log("love : " + love);
	
	// 처음 찜 여부 확인 
	if(love == 0){
		$('#addLoveBtn').css("background-color","#E1E1E1");
	}else{
		$('#addLoveBtn').css("background-color","#FFB2D9");
	}
	
	// 처음 예약중인 글일때 구매&취소 버튼 클릭여부 확인
	// 예약글인지 확인
	var it_state = ${itemVO.it_state };
	
	if(it_state == 1){
		
		// 구매자
		var buyer_state = ${tradeVO.tr_buy_state };
		
		if(buyer_state == 1){ // 구매확정을 이미 누름
			$('#userPurchaseOK').attr("value","확정완료");
			$('#userPurchaseOK').attr("disabled","disabled");
			$('#userCancleOK').attr("disabled","disabled");
		}else if(buyer_state == 2){ // 취소버튼을 이미 누름
			$('#userCancleOK').attr("value","취소완료");
			$('#userPurchaseOK').attr("disabled","disabled");
			$('#userCancleOK').attr("disabled","disabled");
		}
		
		// 판매자
		var seller_state = ${tradeVO.tr_sell_state }
		
		if(seller_state == 1){ // 구매확정을 이미 누름
			$('#sellerPurchaseOK').attr("value","확정완료");
			$('#sellerPurchaseOK').attr("disabled","disabled");
			$('#sellerCancleOK').attr("disabled","disabled");
		}else if(seller_state == 2){ // 취소버튼을 이미 누름

			$('#sellerCancleOK').attr("value","취소완료");
			$('#sellerPurchaseOK').attr("disabled","disabled");
			$('#sellerCancleOK').attr("disabled","disabled");
		}
		
	}
	
	// 구매확정하기 or 취소하기 버튼 클릭시
	
	// 구매자가 구매확정 버튼클릭(1)
	$('#userPurchaseOK').click(function(){
		$('#userPurchaseOKModal').modal("show");
	});
	
	$('#userPurchaseOKModalYes').click(function(){
		var it_no = ${itemVO.it_no };
		var tr_no = ${tradeVO.tr_no };
		var tr_sell_state = ${tradeVO.tr_sell_state };
		
		if(tr_sell_state == 2){
			alert('판매자가 취소버튼을 눌러 구매확정이 불가능합니다.');
		}else{
			$.ajax({
				type : "post",
				url : "/item/userPurchaseOk",
				data : {"it_no" : it_no }, 
				dataType : "JSON",
				error: function(){
					alert("구매확정하기 실패");
				},
				success : function(){
						alert("구매확정하기 완료");
						location.reload();
						
					
				} // success 끝	
			}); // ajax 끝
		}
	});
		
	
	// 구매자가 취소하기 버튼클릭(2)
	$('#userCancleOK').click(function(){
		$('#userCancleOKModal').modal("show");
	});
	
	$('#userCancleOKModalYes').click(function(){
		
		var it_no = ${itemVO.it_no };
		var tr_no = ${tradeVO.tr_no };
		var tr_sell_state = ${tradeVO.tr_sell_state };
		
		if(tr_sell_state ==1){
			alert('판매자가 구매확정버튼을 눌러 취소가 불가능합니다.');
		}else{
			$.ajax({
				type : "post",
				url : "/item/userPurchaseCancle",
				data : {"it_no" : it_no, "tr_no" : tr_no} ,
				dataType : "JSON",
				error: function(){
					alert("취소실패");
				},
				success : function(){
						alert("취소완료");
						
						location.reload();
						
				} // success 끝	
			}); // ajax 끝
		}
	});


	// 판매자가 구매확정 버튼클릭(3)
		$('#sellerPurchaseOK').click(function(){
			$('#sellerPurchaseOKModal').modal("show");
	});
	

	$('#sellerPurchaseOKModalYes').click(function(){
		
		var it_no = ${itemVO.it_no };
		var tr_no = ${tradeVO.tr_no };
		var tr_buy_state = ${tradeVO.tr_buy_state };
		
		if(tr_buy_state ==2){
			alert('구매자가 취소버튼을 눌러 구매확정이 불가능합니다.');
		}else{
			$.ajax({
				type : "post",
				url : "/item/sellerPurchaseOk",
				data : {"it_no" : it_no },
				dataType : "JSON",
				error: function(){
					alert("구매확정하기 실패");
				},
				success : function(){
						alert("구매확정하기 완료");
						location.reload();
						
					
				} // success 끝	
			}); // ajax 끝
		}
	});
	
	// 판매자가 취소하기 버튼클릭(4)
	$('#sellerCancleOK').click(function(){
		$('#sellerCancleOKModal').modal("show");
	});
	
	
	$('#sellerCancleOKModalYes').click(function(){
		
		var it_no = ${itemVO.it_no };
		var tr_no = ${tradeVO.tr_no };
		var tr_buy_state = ${tradeVO.tr_buy_state };
		
		if(tr_buy_state == 1){
			alert('구매자가 구매확정 버튼을 눌러서 취소가 불가능합니다.');
		}else{
			$.ajax({
				type : "post",
				url : "/item/sellerPurchaseCancle",
				data : {"it_no" : it_no, "tr_no" : tr_no} ,
				dataType : "JSON",
				error: function(){
					alert("취소하기 실패");
				},
				success : function(){
						alert("취소하기 완료");
						location.reload();
						
					
				} // success 끝	
			}); // ajax 끝
		}
	});
	
	// 파일 확인
	
	var it_no=$("input[name='it_no']").val();


	// 찜버튼 클릭 
	$('#addLoveBtn').on("click", function(){
		//alert("찜버튼클릭");
		
		var love_value = $("input[id='love_value']").val();
		var it_no = $("input[name='it_no']").val();
		
		$.ajax({
			type : "get",
			url : "/item/itemLove",
			data : {"love_value" : love_value, "it_no" : it_no},
			dataType : "JSON",
			error: function(){
				alert("찜실패");
			},
			success : function(result){
				console.log(result)
				if(result == 1){
					if( love_value == 0){ // 찜하기 
						
						console.log(result);
						$('#love_value').attr("value",1);
						$('#addLoveBtn').css("background-color","#FFA7A7");
						alert("찜완료");
						console.log(love_value);
						location.reload();
						
					}else{ // 찜취소
								
						console.log(result);
						$('#love_value').attr("value",0);
						$('#addLoveBtn').css("background-color","#E1E1E1");
						alert("찜취소");
						console.log(love_value);
						location.reload();
					} //else
				}
			} // success 끝	
		}); // ajax 끝

	});
	
	// 로그인하고 구매하기 버튼클릭
	$('#login_buy').click(function(){
		location.href='../user/userLogin';			
	});
	
	
	
	// 판다톡 버튼클릭
	$('#panda').click(function(){
		var session_us_id = $('#session_us_id').val();
		if( session_us_id != null){
			console.log(session_us_id);
			var us_state = $('#session_us_state').val();
			console.log(us_state);
			
			if(us_state == 1){ // 정지
				alert('정지기간에는 판다톡 이용할 수 없습니다.');
			}else if(us_state == 0){ // 정상
				
				$.ajax({
					type : "get",
					url : "/websocket/chat",
					data : {"us_id" : session_us_id},
					error: function(){
						alert("채팅 연결 실패");
					},
					success : function(result){
							console.log("success");
							alert("채팅 연결 성공");
								
					} // success 끝	
				}); // ajax 끝
				
			}else{// 탈퇴
				alert('탈퇴한 회원은 채팅이 불가합니다.');
			}		
		}
	});
	
	// 구매하기 버튼클릭
	$('#purchase').click(function(){
		
		var us_state = $('#session_us_state').val();
		console.log(us_state);
		var it_state = ${itemVO.it_state};
		
		if(us_state == 1){ // 정지
			alert('정지기간에는 예약할 수 없습니다.');
		}else if(us_state == 0){ // 정상
			
			if(it_state == 0){
				$('#purchaseModal').modal("show");
			}else if(it_state == 1){
				alert('이미 예약된 상품입니다.');
			}else if(it_state == 2){
				alert('이미 판매된 상품입니다.');
			}else{
				alert('다시 시도해주세요');
			}
			
		}else{// 탈퇴
			alert('탈퇴한 회원은 구매할 수 없습니다.');
		}	
		
	});
	
	// 삭제하기 버튼클릭
	$('#item_delete').click(function(){
		$('#itemDeleteModal').modal("show");
	});
	
	$('#itemDeleteModalYes').click(function(){
		
		var it_no = $('#item_it_no').val();
		
		$.ajax({
			type : "post",
			url : "/item/itemDelete",
			data : {"it_no" : it_no},
			error: function(){
				alert("글삭제 실패");
			},
			success : function(result){
				console.log("success");
				if(result == 0){
					alert("삭제성공");
					location.href="../user/userMain";
					
				}else{
						alert("글삭제 실패");
				} //else
			} // success 끝	
		}); // ajax 끝
	}); // modalYes
	
	
	$('#modalYes').click(function(){
		
		$.ajax({
			type : "post",
			url : "/item/purchase",
			data : {"it_no" : it_no},
			error: function(){
				alert("결제 시도 실패");
			},
			success : function(result){
				console.log("success");
				if(result == 0){
					alert("코인이 부족합니다.");
					
				}else{ // 구매성공
						alert("결제성공. 거래가 끝나면 '구매확인' 버튼을 눌러주세요.");
						location.reload();
				} //else
			} // success 끝	
		}); // ajax 끝
	}); // modalYes
	
	
	var img_num = 0;
	var img_max_num = 0;
 	var img_min_num = 0;
	
	$('#img_back').css("display", "none");	
	// 이미지 총개수
	$.ajax({
		type : "post",
		url : "/item/itemFile",
		data : {"it_no" : it_no},
		error: function(){
			alert("파일 불러오기 실패");
		},
		success : function(result){
			console.log("파일 불러오기 성공");
			if(img_num == 0 ){
				/* $('#img_back').attr("disabled", "disabled"); */
				$('#img_back').css("display", "none");	
			}
			$(result).each(function(idx,item){
				img_max_num = idx;
				console.log("이미지최대개수");
				console.log(img_max_num);
				
			}); // each
			
			if(img_max_num == 0){
				/* $('#img_next').attr("disabled", "disabled"); */
				$('#img_next').css("display", "none");
			}
			
		} // success 끝	
	}); // ajax 끝

	
	// 다음 이미지 버튼 클릭
	$('#img_next').click(function(){
		
		$.ajax({
			type : "post",
			url : "/item/itemFile",
			data : {"it_no" : it_no},
			error: function(){
				alert("파일 불러오기 실패");
			},
			success : function(result){
				console.log("파일 불러오기 성공");
				
				$(result).each(function(idx,item){
					console.log(idx);
					console.log(item);
					
					if(img_num < img_max_num){
						if(idx == (img_num+1)){
							$('#item_main_img').attr("src","/imgfile/"+item.uploadPath+"/"+item.uuid+"_"+item.fileName);
							$('#item_main_img').attr("width","500px");
							$('#item_main_img').attr("height","500px");
 							/* $('#img_back').removeAttr("disabled"); */ 
							$('#img_back').css("display", "block");	
							
						}else{
							
						}
					}else{ 
						alert('버튼이 있으면 안된다.');
						img_num = img_num-1;
					}
				}); // each
				
				img_num = img_num+1;
				console.log("현재 이미지 순번");
				console.log(img_num);
				
				if(img_num == img_max_num){
					/* $('#img_next').attr("disabled", "disabled"); */
					$('#img_next').css("display", "none");
				}
				
				
			} // success 끝	
		}); // ajax 끝
		
	}); // img_next
	
	
	// 이전 이미지 버튼 클릭
	$('#img_back').click(function(){
		
		$.ajax({
			type : "post",
			url : "/item/itemFile",
			data : {"it_no" : it_no},
			error: function(){
				alert("파일 불러오기 실패");
			},
			success : function(result){
				console.log("파일 불러오기 성공");
				
				$(result).each(function(idx,item){
					console.log(idx);
					console.log(item);
					
					if(img_num > img_min_num){
						if(idx == (img_num-1)){
							$('#item_main_img').attr("src","/imgfile/"+item.uploadPath+"/"+item.uuid+"_"+item.fileName);
							$('#item_main_img').attr("width","500px");
							$('#item_main_img').attr("height","500px");
						/* 	$('#img_next').removeAttr("disabled");  */
							$('#img_next').css("display", "block");	
						}else{
							
						}
					}else{ 
						alert('첫번째 사진입니다.');
						img_num = img_num+1;
						
					}
				}); // each
				
				img_num = img_num-1;
				console.log("현재 이미지 순번");
				console.log(img_num);
				
				if(img_num == img_min_num){
					/* $('#img_back').attr("disabled", "disabled"); */
					$('#img_back').css("display", "none");
				}
				
				
			} // success 끝	
		}); // ajax 끝
		
	}); // img_next
	
	
	
	// 처음 이미지 입력
	var img_fir_count = 1;
	
	$.ajax({
		type : "post",
		url : "/item/itemFile",
		data : {"it_no" : it_no},
		error: function(){
			alert("파일 불러오기 실패");
		},
		success : function(result){
			console.log("파일 불러오기 성공");
			
			$(result).each(function(idx,item){
				console.log(idx);
				console.log(item);
				
				
				if(img_fir_count == 1){
					$('#item_main_img').attr("src","/imgfile/"+item.uploadPath+"/"+item.uuid+"_"+item.fileName);
					$('#item_main_img').attr("width","500px");
					$('#item_main_img').attr("height","500px");
				/* 	$('#img_next').removeAttr("disabled");  */
					$('#img_next').css("display", "block");	
					img_fir_count = 0;
				}else{ 
					
				}
			}); // each
			
		} // success 끝	
	}); // ajax 끝
	
	
	
});


</script>	
	
	

</body>
</html>