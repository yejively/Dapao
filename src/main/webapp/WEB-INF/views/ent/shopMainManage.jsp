<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/entHeader.jsp"%>
<link href="${pageContext.request.contextPath }/resources/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/resources/plugins/timepicker/bootstrap-timepicker.min.js"></script>

<style>
.bootstrap-timepicker{
	width: 200px;
}

label{
	font-size: 30px;
	color: green;
}
.box-body{
	fon-size : 20px;
	padding-left: 100px;
}
.box-footer{
	padding-left: 100px;
}
textarea {
    height: 7em;
    border: none;
    resize: none;
}
.form-control{
	width: 50%;

}
textarea.form-control{
	height: 6.25em;
}
.time{
	border: 1px solid green;
}
.input-group-addon {
	border: 1px solid green;
}
</style>
<div class="box box-success">
	<div class="box-header with-border"></div>


	<form role="form" action="" method="post" enctype="multipart/form-data">

		<div class="box-body">
			<div class="form-group">
				<label>가게 소개글</label>
				<div class="form-group">
					<textarea class="form-control" rows="3" name="ent_info">${ent.ent_info}</textarea>
				</div>
			</div>
			<div class="form-group">
				<label>공지사항</label>
				<div class="form-group">
					<textarea class="form-control" rows="3" name="ent_notice">${ent.ent_notice}</textarea>
				</div>
			</div>
			<div class="bootstrap-timepicker">
				<div class="form-group">
					<label>가게 운영시간</label>
					<div class="input-group time">
						<div class="input-group-addon">
							<i class="fa fa-clock-o"></i>
						</div>
						<input type="text" class="form-control timepicker" name="ent_ot" value="${ent.ent_ot }">
					</div>
				</div>
				<div class="bootstrap-timepicker">
					<div class="form-group">
						<div class="input-group time">
							<div class="input-group-addon">
								<i class="fa fa-clock-o"></i>
							</div>
							<input type="text" class="form-control timepicker" name="ent_ct"
								value="${ent.ent_ct }">
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="form-group">
				<label>가게 사진</label>
				<div class="input-group">
				<c:if test="${imgList[0] != null} ">
				<c:forEach items="${imgList }" var="img">
					<img src="${pageContext.request.contextPath }/ent/download?imageFileName=${img}" width="200px" height="200px">
				</c:forEach>
				</c:if>
				<hr>
				<button class="btn_new_file btn btn-success" type="button">이미지 변경/추가</button>
				<ul class="file_area">

				</ul>
				</div>
				</div>
			</div>
		</div>

		<div class="box-footer">
			<button type="submit" class="btn btn-success">변경하기</button>
		</div>
	</form>
</div>
<script>
	$(function() {
		var cnt=0;
		//Timepicker
		$('.timepicker').timepicker({
			showInputs : false
		});
		
		//첨부파일 추가,삭제
		$('.btn_new_file').click(function() {
			cnt++;
			if(cnt<4){
				$('.file_area').append(
					  '<div class="form-inline">'
					+ '<input type="file" name="file" class="form-control">'
					+ ' <button type="button" class="btn_delete btn btn-sm">삭제</button>'
					+ '</div>');
			}
			});
		$('.file_area').on('click', '.btn_delete',function() {
			$(this).closest('div').remove();
		});
		
	});
</script>
<%@ include file="../include/entFooter.jsp"%>