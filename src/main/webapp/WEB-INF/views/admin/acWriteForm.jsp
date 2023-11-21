<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty us_id }">
	<%@ include file="../include/userHeader.jsp" %>
</c:if>
<c:if test="${!empty us_id && us_id != 'admin'}">
	<%@ include file="../include/userLoginHeader.jsp" %>
	<input type="hidden" value="${us_id }" name="login"> 
</c:if>
<c:if test="${us_id == 'admin'}">
	<%@include file="../include/header.jsp"%>
</c:if>

<style>
.boxList {
   position: relative;
   border-radius: 3px;
   background: #ffffff;
   margin-bottom: 20px;
   box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
   margin: 30px;
   font-size: 20px;
   border: 1px solid #00000047;
}

.box-body{
	height: 700px;
}

.box-header .box-title{
   font-size: 24px;
   margin : 1%;
}

textarea.form-control {
    height: 270px;
    font-size: 20px;
}

.writeBtn{
   border-radius: 0.5em;
   background-color: #14571f;
   color: white;
   border-color: #14571f;
}

.form-control[readonly]{
	background: #ffffff;
	font-size: 20px
}

.form-group {
	margin-top: 2%;
}

.col-lg-6 {
    margin-top: 2%;
}

#selected{
	font-size: 20px;
    height: 40px;
}

</style>
<div class="boxList">
	<div class="box-header with-border">
		<h3 class="box-title">신고 글쓰기</h3>
	</div>
	<form action="/admin/acWrite " method="post" role="form">
		<div class="box-body">
			<div class="row">
				<div class="col-lg-6">
					<label>신고자</label> <input type="text" class="form-control color" name="us_id" value="${us_id }" readonly>
				</div>
				<div class="col-lg-6">
					<label>피신고자</label> 
					<c:if test="${!empty us_nickname }">
						<input type="text" class="form-control color" value="${us_nickname }" readonly> <input type="hidden" name="id" value="${item.us_id }" >
					</c:if>
					<c:if test="${!empty prod.own_id }">
						<input type="text" class="form-control color" value="${prod.own_id }" readonly> <input type="hidden" name="id" value="${prod.own_id }" >
					</c:if>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<label>상품번호</label> <input type="text" class="form-control color" name="ac_item" value="${item.it_no }" readonly>
				</div>
				<div class="col-lg-6">
					<label>신고일</label> <input type="text" class="form-control color" name="ac_regdate" readonly>
				</div>
			</div>
			<div class="form-group">
				<label>신고사유</label> <select class="form-control select2 select2-hidden-accessible" id="selected" style="width: 100%;" data-select2-id="1" tabindex="-1" aria-hidden="true" name="ac_cate">
					<option selected="selected" data-select2-id="3" value="0">신고사유를 선택해주세요.</option>
					<option data-select2-id="40" value="사기행위">사기행위</option>
					<option data-select2-id="40" value="모조품판매">모조품판매</option>
					<option data-select2-id="40" value="거래금지품목 판매">거래금지품목 판매</option>
					<option data-select2-id="40" value="게시물 내 욕설,비방">게시물 내 욕설,비방</option>
					<option data-select2-id="40" value="기타사유">기타사유</option>
				</select>
			</div>
			<div class="form-group">
				<label>내 용</label>
				<textarea class="form-control" id="cs_content" name="cs_content" rows="3" placeholder="내용을 작성하시오"></textarea>
			</div>
		</div>
		<div class="box-footer">
			<button type="submit" class="writeBtn" id="write">신고하기</button>
		</div>
	</form>
</div>

<script type="text/javascript">
	$(function() {
		var today = new Date();
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		var date = year + '-' + month + '-' + day;
		$('input[name=ac_regdate]').val(date);

		$('#write').click(
				function() {
					if ($('select[name=ac_cate]').val() == 0) {
						alert("신고사유를 선택해주세요");
						return false;
					}
					else if ($('select[name=ac_cate]').val() == "기타사유") {
							$('#cs_content').attr("required" , true);
							alert("내용을 작성해주세요")
							return false;
					}else{
							$('#cs_content').attr("required" , false);
							$('#write').submit();
					}
						
				});

	});//ready
</script>

<c:if test="${empty us_id }">
	<%@ include file="../include/userFooter.jsp" %>
</c:if>
<c:if test="${!empty us_id }">
	<%@ include file="../include/userFooter.jsp" %>
	<input type="hidden" value="${us_id }" name="login"> 
</c:if>
<c:if test="${us_id == 'admin'}">
	<%@include file="../include/footer.jsp"%>
</c:if>