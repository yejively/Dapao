<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>

<div class="boxList">
	<div class="box-header with-board">
		<p class="pContent"><i class="fa fa-user-plus"></i>사업자 관리</p>
		<form action="/admin/ownerList" id="search">
			<input type="text" name="keyword" value="${pageVO.cri.keyword }" id="search2" placeholder="이름 입력">
			<button id="searchBtn"><i class="fa fa-fw fa-search"></i></button>
		</form>
	</div>
	<div class="box-body">
		<table class="table table-bordered">
			<thead>
				<tr role="row">
					<th>사업자 아이디</th>
					<th>사업자 이름</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>신고 누적</th>
					<th>사업자 상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${vo }">
					<tr role="row" class="odd">
						<td><a class="ownInfo">${vo.own_id }</a></td>
						<td>${vo.own_name }</td>
						<td>${vo.ent_addr }</td>
						<td>${vo.own_tel }</td>
						<td>${vo.ent_account }</td>
						<c:choose>
							<c:when test="${vo.own_state == 0 }">
								<td>정상</td>
							</c:when>
							<c:when test="${vo.own_state == 1 }">
								<td>정지</td>
							</c:when>
							<c:when test="${vo.own_state == 2 }">
								<td>탈퇴</td>
							</c:when>
							<c:when test="${vo.own_state == 3 }">
								<td>승인요청</td>
							</c:when>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
			</tfoot>
		</table>
	</div>
	<div class="box-footer clearfix">
		<ul class="pagination pagination-sm no-margin pull-right">

			<c:if test="${pageVO.prev }">
				<li><a href="/admin/ownerList?page=${pageVO.startPage-1 } ">←</a></li>
			</c:if>

			<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
				<li ${pageVO.cri.page == i? 'class="active"':'' }><a href="/admin/ownerList?page=${i }">${i }</a></li>
			</c:forEach>

			<c:if test="${pageVO.next }">
				<li><a href="/admin/ownerList?page=${pageVO.endPage+1 }">→</a></li>
			</c:if>
		</ul>
	</div>
</div>

<!-- Modal -->
<div id="myLargeModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">사업자 정보</h4>
			</div>
			<div class="muserInfo">
				아 이 디 <input class="form-control" type="text" name="own_id" readonly>
			</div>
			<div class="muserInfo">
				비밀번호 <input class="form-control" type="text" name="own_pw" readonly>
			</div>
			<div class="muserInfo">
				이 름 <input class="form-control" type="text" name="own_name" readonly>
			</div>
			<div class="muserInfo">
				전화번호<input class="form-control" type="text" name="own_tel" readonly>
			</div>
			<div class="muserInfo">
				이 메 일 <input class="form-control" type="text" name="own_email" readonly>
			</div>
			<div class="muserInfo">
				상 태 <input class="form-control" type="text" name="own_state" readonly>
			</div>
			<div class="muserInfo">
				상 호 명 <input class="form-control" type="text" name="ent_name" readonly>
			</div>
			<div class="muserInfo">
				업 종 <input class="form-control" type="text" name="ent_cate" readonly>
			</div>
			<div class="muserInfo">
				주 소 <input class="form-control" type="text" name="ent_addr" readonly>
			</div>
			<div class="muserInfo">
				통신판매업 <input class="form-control" type="text" name="ent_mo" readonly>
			</div>
			<div class="muserInfo">
				등록파일 <input class="form-control" type="text" name="ent_file" readonly>
			</div>
			<div class="muserInfo">
				기타서류 <input class="form-control" type="text" name="ent_of" readonly>
			</div>
			<div class="muserInfo">
				공지사항 <input class="form-control" type="text" name="ent_notice" readonly>
			</div>
			<div class="muserInfo">
				가게소개 <input class="form-control" type="text" name="ent_info" readonly>
			</div>
			<div class="muserInfo">
				이미지 <input class="form-control" type="text" name="ent_img" readonly>
			</div>
			<div class="muserInfo">
				오픈시간 <input class="form-control" type="text" name="ent_ot" readonly>
			</div>
			<div class="muserInfo">
				마감시간 <input class="form-control" type="text" name="ent_ct" readonly>
			</div>
			<div class="muserInfo">
				정지기간 <input class="form-control" type="text" name="own_stopdate" readonly>
			</div>
			<div class="muserInfo">
				신고횟수 <input class="form-control" type="text" name="ent_account" readonly>
			</div>
			<div class="muserInfo">
				정지횟수 <input class="form-control" type="text" name="ent_stop" readonly>
			</div>
			<div class="muserInfo">
				코인 <input class="form-control" type="text" name="ent_coin" readonly>
			</div>
			<div class="modal-footer">
				<select name="stop" class="btn btn-default" aria-label="Small select example">
					<option selected>정지</option>
					<option value="7">7일</option>
					<option value="30">30일</option>
					<option value="100">100일</option>
				</select>
				<button type="button" class="btn btn-default" id="stop">정지</button>
				<button type="button" name="update" class="btn btn-default update">승인</button>
				<button type="button" name="delete" class="btn btn-default delete">탈퇴</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		$('.ownInfo')
				.click(
						function() {
							$('#myLargeModal').modal("show");

							var ownId = $(this).text();
							$.ajax({
								url : "/admin/ownerInfo",
								data : {
									"own_id" : ownId
								},
								dataType : "json",
								success : function(data) {
									console.log(data)
									$('input[name=own_id]').val(data.own_id)
									$('input[name=own_name]').val(data.own_name)
									$('input[name=own_pw]').val(data.own_pw)
									$('input[name=own_tel]').val(data.own_tel)
									$('input[name=own_email]').val(data.own_email)
									$('input[name=own_state]').val(data.own_state)
									$('input[name=ent_name]').val(data.ent_name)
									$('input[name=ent_cate]').val(data.ent_cate)
									$('input[name=ent_addr]').val(data.ent_addr)
									$('input[name=ent_mo]').val(data.ent_mo)
									$('input[name=ent_file]').val(data.ent_file)
									$('input[name=ent_of]').val(data.ent_of)
									$('input[name=ent_notice]').val(data.ent_notice)
									$('input[name=ent_info]').val(data.ent_info)
									$('input[name=ent_img]').val(data.ent_img)
									$('input[name=ent_ot]').val(data.ent_ot)
									$('input[name=ent_ct]').val(data.ent_ct)
									$('input[name=ent_account]').val(data.ent_account)
									$('input[name=ent_stop]').val(data.ent_stop)
									$('input[name=own_stopdate]').val(data.own_stopdate)
								},
								error : function() {
									console.log("오류");
								}
							});// ownInfo click ajax
							$('#stop').click(
											function() {
												var own_stopdate = $('select[name=stop]').val();
												console.log(own_stopdate);
												$.ajax({
															url : "/admin/ownerStop",
															data : {
																"own_id" : $('input[name=own_id]').val(),
																"own_stopdate" : own_stopdate
															},
															dataType : "json",
															success : function(data) {
																if (data == 1) {
																	alert("정상적으로 정지가 부여되었습니다.");
																	location.replace("/admin/ownerList?page=${param.page}");
																}
															},
															error : function(data) {
																console.log("에러");
															}
														});
											});
							$(".update")
									.click(
											function() {
												$
														.ajax({
															url : "/admin/ownerApprove",
															data : {
																"own_id" : $(
																		'input[name=own_id]')
																		.val()
															},
															dataType : "json",
															success : function(
																	data) {
																alert("승인완료")
																location
																		.replace("/admin/ownerList?page=${param.page}");
															},
															error : function() {
																console
																		.log("오류");
															}
														});//update click ajax
											});//update click
							$(".delete")
									.click(
											function() {
												$
														.ajax({
															url : "/admin/ownerInfoDelete",
															data : {
																"own_id" : $(
																		'input[name=own_id]')
																		.val()
															},
															dataType : "json",
															success : function(
																	data) {
																alert("탈퇴완료")
																location
																		.replace("/admin/ownerList?page=${param.page}");
															},
															error : function() {
																console
																		.log("오류");
															}
														});//delete click ajax
											});// delete click
						});// ownInfo click

		$('#searchBtn').click(function() {
			var keyword = $('input[name=keyword]').val();
			console.log(keyword);
			$('#search').submit();
		});
	});//ready
</script>

<%@include file="../include/footer.jsp"%>