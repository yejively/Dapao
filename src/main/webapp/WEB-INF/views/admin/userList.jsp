<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>

<div class="boxList">
	<div class="box-header with-border">
		<p class="pContent"><i class="fa fa-user-plus"></i>회원 관리</p>
		<form action="/admin/userList" id="search">
			<input type="text" name="keyword" value="${pageVO.cri.keyword }" id="search2" placeholder="ID입력">
			<button id="searchBtn"><i class="fa fa-fw fa-search"></i></button>
		</form>
	</div>
	<div class="box-body">
		<table class="table table-bordered">
			<tbody id="tbody">
				<tr>
					<th>아이디</th>
					<th>닉네임</th>
					<th>이름</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>신고누적</th>
					<th>회원상태</th>
				</tr>
				<c:forEach var="list" items="${userList }">
					<tr>
						<td><a class="userInfo">${list.us_id }</a></td>
						<td>${list.us_nickname }</td>
						<td>${list.us_name }</td>
						<td>${list.us_addr }</td>
						<td>${list.us_tel }</td>
						<td>${list.us_account }</td>
						<c:choose>
							<c:when test="${list.us_state eq '0'}">
								<td>정상</td>
							</c:when>
							<c:when test="${list.us_state eq '1'}">
								<td>정지</td>
							</c:when>
							<c:when test="${list.us_state eq '2'}">
								<td>탈퇴</td>
							</c:when>
						</c:choose>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="box-footer clearfix">
		<ul class="pagination pagination-sm no-margin pull-right">
			<c:if test="${pageVO.prev == true }">
				<li><a href="userList?page=${pageVO.startPage-1 }">«</a></li>
			</c:if>

			<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
				<li ${pageVO.cri.page == i? 'class="active"':'' }><a href="userList?page=${i }">${i }</a></li>
			</c:forEach>

			<c:if test="${pageVO.next == true }">
				<li><a href="userList?page=${pageVO.endPage+1 }">»</a></li>
			</c:if>
		</ul>
	</div>
</div>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">회원 정보</h4>
			</div>
			<div class="muserInfo">
				아 이 디 <input class="form-control" type="text" id="us_id" readonly>
			</div>
			<div class="muserInfo">
				비밀번호 <input class="form-control" type="text" id="us_pw" readonly>
			</div>
			<div class="muserInfo">
				이 름 <input class="form-control" type="text" id="us_name" readonly>
			</div>
			<div class="muserInfo">
				닉 네 임 <input class="form-control" type="text" id="us_nickname" readonly>
			</div>
			<div class="muserInfo">
				이 미 지 <input class="form-control" type="text" id="us_img" readonly>
			</div>
			<div class="muserInfo">
				전화번호 <input class="form-control" type="text" id="us_tel" readonly>
			</div>
			<div class="muserInfo">
				이 메 일 <input class="form-control" type="text" id="us_email" readonly>
			</div>
			<div class="muserInfo">
				주 소 <input class="form-control" type="text" id="us_addr" readonly>
			</div>
			<div class="muserInfo">
				코 인 <input class="form-control" type="text" id="us_coin" readonly>
			</div>
			<div class="muserInfo">
				블 로 그 <input class="form-control" type="text" id="us_blog" readonly>
			</div>
			<div class="muserInfo">
				인 스 타 <input class="form-control" type="text" id="us_instar" readonly>
			</div>
			<div class="muserInfo">
				가 입 일 <input class="form-control" type="text" id="us_regdate" readonly>
			</div>
			<div class="muserInfo">
				탈 퇴 일 <input class="form-control" type="text" id="us_outdate" readonly>
			</div>
			<div class="muserInfo">
				회원상태 <input class="form-control" type="text" id="us_state" readonly>
			</div>
			<div class="muserInfo">
				정지기간 <input class="form-control" type="text" id="us_stopdate" readonly>
			</div>
			<div class="muserInfo">
				신고횟수 <input class="form-control" type="text" id="us_account" readonly>
			</div>
			<div class="muserInfo">
				정지횟수 <input class="form-control" type="text" id="us_stop" readonly>
			</div>

			<div class="modal-footer">
				<select name="stop" class="btn btn-default" aria-label="Small select example">
					<option selected>정지</option>
					<option value="7">7일</option>
					<option value="30">30일</option>
					<option value="100">100일</option>
				</select>
				<button type="button" class="btn btn-default" id="stop">정지</button>
				<button type="button" class="btn btn-default" id="delete">탈퇴</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		// 아이디 클릭시 개인유저정보 모달띄우기
		$('.userInfo').click(function() {
			$('#myModal').modal("show");

			var userId = $(this).text();
			console.log("us_id : " + userId);
			$.ajax({
				url : "/admin/userInfo",
				data : {
					"us_id" : userId
				},
				dataType : "json",
				success : function(data) {
					console.log("@@@@ : " + data);
					console.log("성공");
					$('#us_id').val(data.us_id)
					$('#us_pw').val(data.us_pw)
					$('#us_name').val(data.us_name)
					$('#us_nickname').val(data.us_nickname)
					$('#us_img').val(data.us_img)
					$('#us_tel').val(data.us_tel)
					$('#us_email').val(data.us_email)
					$('#us_addr').val(data.us_addr)
					$('#us_coin').val(data.us_coin)
					$('#us_blog').val(data.us_blog)
					$('#us_instar').val(data.us_instar)
					$('#us_regdate').val(data.us_regdate)
					$('#us_outdate').val(data.us_outdate)
					if (data.us_state == '0') {
						$('#us_state').val("정상");
					} else if (data.us_state == '1') {
						$('#us_state').val("정지");
					} else {
						$('#us_state').val("탈퇴");
					}
					$('#us_stopdate').val(data.us_stopdate)
					$('#us_account').val(data.us_account)
					$('#us_stop').val(data.us_stop)
				},
				error : function() {
					console.log("오류");
				}
			});
		});

		// 정지클릭했을때 정지기간부여
		$('#stop').click(function() {
			var us_id = $('#us_id').val();
			var us_stopdate = $('select[name=stop]').val();
			$.ajax({
				url : "/admin/userStop",
				data : {
					"us_id" : us_id,
					"us_stopdate" : us_stopdate
				},
				dataType : "json",
				success : function(data) {
					if (data == 1) {
						alert("정상적으로 정지가 부여되었습니다.");
						$('#myModal').modal('hide');
						location.replace("/admin/userList?page=${param.page}");
					}
				},
				error : function(data) {
					console.log("에러");
				}
			});
		});
		// 탈퇴눌렀을때 탈퇴처리
		$('#delete').click(function() {
			var us_id = $('#us_id').val();
			$.ajax({
				url : "/admin/userDelete",
				data : {
					"us_id" : us_id
				},
				dataType : "json",
				success : function(data) {
					if (data == 1) {
						alert("정상적으로 탈퇴처리되었습니다.");
						$('#myModal').modal('hide');
						location.replace("/admin/userList?page=${param.page}");
					}
				},
				error : function() {
					console.log("에러");
				}
			});
		});
		$('#searchBtn').click(function() {
			var keyword = $('input[name=keyword]').val();
			console.log(keyword);
			$('#search').submit();
		});

	}); // jquery 끝
</script>

<%@ include file="../include/footer.jsp"%>