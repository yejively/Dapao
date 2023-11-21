<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
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
    height: 410px;
    font-size: 20px;
}

.writeBtn{
   border-radius: 0.5em;
   background-color: #14571f;
   color: white;
   border-color: #14571f;
}

#selected{
	font-size: 20px;
    height: 40px;
}

#title{
	font-size: 20px;
}

.form-group{
	margin-top: 2%;
}

</style>
<div class="boxList">
	<div class="box-header with-border">
		<h3 class="box-title">FAQ 글쓰기</h3>
	</div>
	<form action="/admin/FAQWrite " method="get" role="form">
		<div class="box-body">
			<div class="form-group" data-select2-id="38">
				<select class="form-control select2 select2-hidden-accessible" id="selected" style="width: 100%;" data-select2-id="1" tabindex="-1" aria-hidden="true" name="cs_group">
					<option selected="selected" data-select2-id="3" data-name="cs_board" value="0">회원</option>
					<option data-select2-id="40" data-name="cs_board"  value="1">사업자</option>
				</select>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">제 목</label> 
				<input type="text" class="form-control" name="cs_title" id="title" placeholder="제목을 작성하시오">
			</div>
			<div class="form-group">
				<label>내 용</label>
				<textarea class="form-control" name="cs_content" rows="3" placeholder="내용을 작성하시오"></textarea>
			</div>

		</div>

		<div class="box-footer">
			<button type="submit" class="writeBtn" >글쓰기</button>
		</div>
	</form>
</div>
<%@include file="../include/footer.jsp" %>