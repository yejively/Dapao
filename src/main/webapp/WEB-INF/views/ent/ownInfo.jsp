<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/entHeader.jsp"%>

<style>

.btn {
	display: block;
	width: 10%;
	height: 45px;
	border-radius: 25px;
	outline: none;
	border: none;
	background-image: linear-gradient(to right, #32be8f, #38d39f, #32be8f);
	background-size: 200%;
	font-size: 1.5rem ;
	color: #fff;
	font-family: 'Poppins', sans-serif;
	text-transform: uppercase;
	margin: 5px 0;
	cursor: pointer;
	transition: .5s;
}
</style>

	<h1>ownInfo</h1>
	
	<div class="login-content">
	
		<form action="" method="post" enctype="multipart/form-data"> <br>
			<input type="hidden" name="own_pw" value="${entVO.own_pw }" readonly="readonly" > <br>
			
			
			<input type="text" name="own_id" class="input" placeholder="${entVO.own_id }" maxlength="12" readonly="readonly">
			<input type="text" name="own_id" class="input" placeholder="${entVO.own_name }"  readonly="readonly">
			<input type="text" name="own_id" class="input" placeholder="${entVO.own_tel }"  >
			<input type="text" name="own_id" class="input" placeholder="${entVO.own_email }" >
			<input type="text" name="own_id" class="input" placeholder="${entVO.ent_name }"  >
			<input type="text" name="own_id" class="input" placeholder="${entVO.ent_cate} " >
			<input type="text" name="own_id" class="input" placeholder="${entVO.ent_addr }"  >
			<input type="text" name="own_id" class="input" placeholder="${entVO.ent_mo} "  >
			<input type="file" name="ent_file"  readonly="readonly" placeholder="사업자등록증"> <br>
			
			<input type="submit" value="수정하기" class="btn">
			<input type="button" value="회원탈퇴" onclick="location.href ='/ent/ownDelete'" class="btn">
			<input type="button" value="뒤로가기" onclick="location.href='/ent/entMain'" class="btn">
		</form>
	
	</div>
	


<script type="text/javascript">
	
	$(document).ready(function(){
		
	});

</script>

<%@ include file="../include/footer.jsp"%>