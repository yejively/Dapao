<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
/* 전체 구역 */
#container{


}


/* 광고 구역  */
#ad_section{
	width : 1350px;
	height : 350px;

}

/* 찜 구역 */
#love_section{
	width : 1350px;
	height : 350px;


}


/* 인기물건 구역  */
#popular_section{
	width : 1350px;

}
.title_text{

	margin-left: 10px;
	margin-top: 3px;
}

.item_section{

 	width : 220px;
	height : 300px;
	float: left; 
	border: none;
	border: 3px solide red;
	padding-left : 10px;
	background-color: white;
	margin-bottom: 20px;
	margin-left: 15px;
}

/* 공통 */

.item_img{
	border: 1px solide black;
	width : 200px;
	height : 200px;
	padding-top: 20px;
}

.it_title{
	border: none;
	width : 200px;
	height : 25px;
	background-color: transparent;
	color:black;
	cursor: pointer;
	text-align: center;
	font-weight: bold;
}

.it_price{
	border: none;
	width : 126px;
	background-color: transparent;
	color:black;
	cursor: pointer;
	font-weight: bold;
	
}

.it_state{
	border: none; 
	width : 70px;
	text-align: right;
	background-color: transparent;
	color:black;
	cursor: pointer;
}

#item_section{

	width : 200px;
	height: 3200px;
	background-color: #FFF;
}

.modal-content {
    width: 450px;
}

.modal-dialog {
    float: left;
}

.modal-title{
	font-size: 24px;
	color: white;
	padding-top: 2%;
}

.modal-header2{
	border-bottom-color: #10571ce0;
    background-color: #14571f;
    box-shadow: -1px 6px 10px 0px #10571ce0;
    height: 60px;
    padding-top: 3px;
    padding-left: 4%;
}

.modal-title2{
	font-size: 20px;
    margin-top: 20px;
    text-align: center;
    width: 420px;
    border-style: none;
    font-weight: bold;
    color: green;
}

.modalBox{
	margin-left: 30px;
	border:2px solid green;
}

.modalText {
    margin-top: 1%;
    margin-bottom: 2%;
    width: 420px;
    font-size: 20px;
    border-style: none;
    text-align: center;
}

.ent_name, .exp_psn_ch{
    height: 40px;
}

.writeBtn{
   border-radius: 0.5em;
   background-color: #14571f;
   color: white;
   border-color: #14571f;
   height: 40px;
   width: 80px;
   border: 0px;
}

.item_ad_section{

	width : 220px;
	height : 250px;
	float: left; 
	border: none;
	border: 3px solide red;
	padding-left : 10px;
	background-color: white;
	margin-bottom: 20px;
	margin-left: 15px;


}

.it_regdate_text{
	border: none;
	width : 70px;
	background-color: transparent;
	color:black;
	cursor: pointer;	
}

.it_regdate{
	border: none;
	width : 130px;
	text-align: right;
	background-color: transparent;
	color:black;
	cursor: pointer;
}

</style>
</head>
<body>

<div id="container"><!-- 1 -->

	<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp" %>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
		<input type="hidden" value="${us_id }" name="login"> 
	</c:if>
	<c:if test="${us_id eq 'admin' }">
		<c:redirect url="/admin/userList?page=1"></c:redirect>
	</c:if>
	

	<div id="ad_section"> <!-- 2 -->
		<h2 class="title_text"> 인기 가게 둘러보기(광고) </h2>
		<c:forEach var="ad" items="${adList}">
			<div class="item_ad_section">
				<a href="../ent/shopMain?ent_id=${ad.own_id }">
					<img src="/imgfile/${ad.ent_img }" name="ent_img" class="item_img"> <br><br>
					<input type="text" value="${ad.ent_name }" name="ent_name" class="it_title" disabled="disabled">
				</a>
			</div>
		</c:forEach> 
	</div><!-- 2 ad_section -->
	<br>
 	<c:if test="${!empty us_id }">
		<div id="love_section"> <!-- 3 -->
			<h2 class="title_text"> 나의 찜 목록 </h2>
	 		<c:forEach var="love" items="${loveList}">
				<div class="item_section"> <!-- 4 -->
					<a href="../item/itemDetail?it_no=${love.it_no }">
						<img src="/imgfile/${love.it_img }" name="it_img" class="item_img"> <br>
						<input type="text" value="${love.it_title }" name="it_title" class="it_title" disabled="disabled"> <br>
						<input type="text" value="${love.it_price }" name="it_price" class="it_price" disabled="disabled">
						<input type="hidden" value="${love.it_state }" name="it_state" >
						<!-- 글 상태 표시 -->
						<c:choose>
							<c:when test="${love.it_state == 0 }">
								<input type="text" value="판매중" class="it_state" disabled="disabled"> <br>
							</c:when>
							<c:when test="${love.it_state == 1 }">
								<input type="text" value="예약중" class="it_state" disabled="disabled"> <br>
							</c:when>
							<c:when test="${love.it_state == 2 }">
								<input type="text" value="판매완료" class="it_state" disabled="disabled"> <br>
							</c:when>
							<c:when test="${love.it_state == 3 }">
								<input type="text" value="삭제됨" class="it_state" disabled="disabled"> <br>
							</c:when>
							<c:otherwise>
								<input type="text" value="접근이상함" class="it_state" disabled="disabled"> <br>			
							</c:otherwise>
						</c:choose>
						<div>
							<input type="text" value="등록날짜  " class="it_regdate_text" disabled="disabled">
							<input type="text" value="${love.it_regdate}" class="it_regdate" disabled="disabled">
						</div>
					</a>
				</div> <!-- 4 -->
			</c:forEach> 
		</div><!-- 3 love_section -->
	</c:if>
	<br>
	<br>
	<div id="popular_section"> <!-- 5 -->
		<h2 class="title_text"> 인기 물건 둘러보기 </h2>
		<!-- 로그인 하지 않았을 때 -->
		<c:if test="${empty us_id }">
		 	<c:forEach var="item" items="${itemList}">
		 		<c:if test="${item.it_state != 2 && item.it_state != 3  }">
		 			<div class="item_section"> <!-- 6 -->
						<a href="../item/itemDetail?it_no=${item.it_no }">
							<img src="/imgfile/${item.it_img }" name="it_img"  class="item_img"> <br>
							<input type="text" value="${item.it_title }" name="it_title" class="it_title" disabled="disabled"> <br>
							<input type="text" value="${item.it_price }원" name="it_price" class="it_price" disabled="disabled">
							<input type="hidden" value="${item.it_state }" name="it_state">
							<!-- 글 상태 표시 -->
							<c:choose>
								<c:when test="${item.it_state == 0 }">
									<input type="text" value="판매중" class="it_state" disabled="disabled"> <br>
								</c:when>
								<c:when test="${item.it_state == 1 }">
									<input type="text" value="예약중" class="it_state" disabled="disabled"> <br>
								</c:when>
								<c:when test="${item.it_state == 2 }">
									<input type="text" value="판매완료" class="it_state" disabled="disabled"> <br>
								</c:when>
								<c:when test="${item.it_state == 3 }">
									<input type="text" value="삭제됨" class="it_state" disabled="disabled"> <br>
								</c:when>
								<c:otherwise>
									<input type="text" value="접근이상함" class="it_state" disabled="disabled"> <br>			
								</c:otherwise>
							</c:choose>
							<div>
								<input type="text" value="등록날짜  " class="it_regdate_text" disabled="disabled">
								<input type="text" value="${item.it_regdate}" class="it_regdate" disabled="disabled">
							</div>
						</a>
					</div>
				</c:if>
			</c:forEach>
		</c:if>	 
		<!-- 로그인 했을 때 -->
		<c:if test="${!empty us_id }">
		 	<c:forEach var="item" items="${itemList}">
		 		<c:if test="${item.it_state != 2 && item.it_state != 3 &&  us_id != item.us_id }">
		 			<div class="item_section"> <!-- 4 -->
						<a href="../item/itemDetail?it_no=${item.it_no }">
							<img src="/imgfile/${item.it_img }" name="it_img" class="item_img" > <br>
							<input type="text" value="${item.it_title }" name="it_title" class="it_title" disabled="disabled"> <br>
							<input type="text" value="${item.it_price }" name="it_price" class="it_price" disabled="disabled">
							<input type="hidden" value="${item.it_state }" name="it_state">
							<!-- 글 상태 표시 -->
							<c:choose>
								<c:when test="${item.it_state == 0 }">
									<input type="text" value="판매중" class="it_state" > <br>
								</c:when>
								<c:when test="${item.it_state == 1 }">
									<input type="text" value="예약중" class="it_state" > <br>
								</c:when>
								<c:when test="${item.it_state == 2 }">
									<input type="text" value="판매완료" class="it_state" > <br>
								</c:when>
								<c:when test="${item.it_state == 3 }">
									<input type="text" value="삭제됨" class="it_state" > <br>
								</c:when>
								<c:otherwise>
									<input type="text" value="접근이상함" class="it_state" > <br>			
								</c:otherwise>
							</c:choose>
							<div>
								<input type="text" value="등록날짜  " class="it_regdate_text" >
								<input type="text" value="${item.it_regdate}" class="it_regdate" >
							</div>
						</a>
					</div>	 
				</c:if>

			</c:forEach> 
		</c:if>	
	</div>
</div>
	
	<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content modalBox">
			<div class="modal-header2">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">체험단을 모집합니다<img src="/resources/logo/logo.png" width="40px" height="40px"></h4>
			</div>
			<div class="modal-body">
				<input type="text" class="modal-title2" value="가게상호명"><br>
				<input type="text" class="ent_name modalText" readonly><br>
				<input type="text" class="modal-title2" value="체험단 내용"><br>
				<textarea class="exp_content modalText" readonly style="resize: none;"></textarea><br>
				<input type="text" class="modal-title2" value="체험단 유의 사항"><br>
				<textarea class="exp_notice modalText" readonly style="resize: none;"></textarea><br>
				<input type="text" class="modal-title2" value="신청인원/체험단모집인원"><br>
				<input type="text" class="exp_psn_ch exp_psn modalText" readonly><br>
			</div>
			<div class="modal-footer">
				<button type="button" class="writeBtn" data-dismiss="modal" onclick="location.href='../ent/shopMain';">신청하기</button>
				<button type="button" class="writeBtn" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div> 

<script type="text/javascript">
$(function(){
	
	  var login = $("input[name='login']").val(); ;
      console.log(login);

      if(login == 'success'){
          alert('로그인 성공');
      }
      
      // 위치파악 
      var latitude = 0.0;
   	  var longitude = 0.0;
      
       function showPosition(pos){

      	latitude = pos.coords.latitude;
      	longitude = pos.coords.longitude;

        
		 $.ajax({
	 			type : "post",
	 			url : "/item/location",
	 			data : {"latitude" : latitude , "longitude" : longitude} ,
	 			dataType : "JSON",
	 			error: function(){
	 				alert("위치 파악 실패");
	 			},
	 			success : function(){
 					console.log(${latitude}+"#333");
 					console.log(${longitude}+"#333");
	 				
	 			} // success 끝	
	 		}); // ajax 끝
       }
      

   	
     if(navigator.geolocation){

         navigator.geolocation.getCurrentPosition(showPosition);
         

     }else{
         alert("브라우저가 Geolocation을 지원하지 않습니다.");

     } 
     
     $.ajax({
    	url : "/ad/modalShow",
 		dataType : "json",
 		success : function(data){
 			console.log(data);
 			if(data != null){
	 			$.each(data,function(index,exp){
	 				if(exp.exp_psn_ch != exp.exp_psn){
		 				$('#myModal').modal("show");
		 				
	 					$.each(exp.entList,function(idx,ent){
	 						$('.ent_name').val(ent.ent_name);
	 					});
	 					$('.exp_content').append(exp.exp_content);
	 					$('.exp_notice').append(exp.exp_notice);
	 					$('.exp_psn_ch').val(exp.exp_psn_ch+"/"+exp.exp_psn);
	 				}
 				}); 
	 		}// if data
 		},// success
 		error : function(){
 			alert("@@@@@@@@@@@");
 		}
	});//ajax
 });//ready
</script>
	
	<%@ include file="../include/userFooter.jsp" %>
	
</div><!-- 1 container -->	
</body>
</html>