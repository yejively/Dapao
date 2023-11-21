<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<style>
.modal-content {
	margin-top: 30%;
}
</style>
<div class="boxList">
	<div class="box-header with-board">
		<p class="pContent">
			<i class="fa  fa-exclamation-circle"></i>신고 관리
		</p>
		<form action="/admin/acList" id="search">
			<input type="text" name="keyword" value="${pageVO.cri.keyword }" id="search2">
			<button id="searchBtn">
				<i class="fa fa-fw fa-search"></i>
			</button>
		</form>
	</div>
	<div class="box-body">
		<table class="table table-bordered">
			<thead>
				<tr role="row">
					<th>신고번호</th>
					<th>신고자</th>
					<th>피신고자</th>
					<th>신고사유</th>
					<th>상품번호</th>
					<th>신고일</th>
					<th>신고상태</th>
					<th>처리결과</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${vo }">
					<tr role="row" class="odd">
						<td>${vo.ac_no }</td>
						<td>${vo.us_id }</td>
						<td><c:if test="${!empty vo.ac_own_id}">
	                     			${vo.ac_own_id}
	                  		</c:if> <c:if test="${!empty vo.ac_us_id}">
	                     			${vo.ac_us_id}
	                 		 </c:if></td>
						<td>${vo.ac_cate }</td>
						<td>${vo.ac_item }</td>
						<td>${vo.ac_regdate}</td>
						<c:choose>
							<c:when test="${vo.ac_state eq '0' }">
								<td><button type="button" class="acState" value="${vo.ac_no }">접수</button></td>
							</c:when>
							<c:when test="${vo.ac_state eq '1' }">
								<td><button type="button" class="acState" value="${vo.ac_no }">처리</button></td>
							</c:when>
						</c:choose>
						<td>${vo.ac_result}</td>
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
				<li><a href="/admin/acList?page=${pageVO.startPage-1 } ">←</a></li>
			</c:if>

			<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
				<li ${pageVO.cri.page == i? 'class="active"':'' }><a href="/admin/acList?page=${i }">${i }</a></li>
			</c:forEach>

			<c:if test="${pageVO.next }">
				<li><a href="/admin/acList?page=${pageVO.endPage+1 }">→</a></li>
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
				<h4 class="modal-title">신고</h4>
			</div>
			<div class="muserInfo">
				신고번호 <input class="form-control" type="text" name="ac_no" id="ac_no" readonly>
			</div>
			<div class="muserInfo">
				신고자 <input class="form-control" type="text" name="us_id" id="us_id" readonly>
			</div>
			<div class="muserInfo">
				피신고자 <input class="form-control" type="text" name="id" id="id" readonly>
			</div>
			<div class="muserInfo">
				상품번호 <input class="form-control" type="text" name="ac_item" id="ac_item" readonly>
			</div>
			<div class="muserInfo">
				신고사유 <input class="form-control" type="text" name="ac_cate" id="ac_cate" readonly>
			</div>
			<div class="muserInfo">
				신고내용
				<textarea class="form-control" name="ac_content" id="ac_content" rows="5" cols="54" readonly></textarea>
			</div>
			<div class="modal-footer">
				<select name="acStop" class="btn btn-default" aria-label="Small select example">
					<option selected value="0">정지기간</option>
					<option value="7">정지7일</option>
					<option value="30">정지30일</option>
					<option value="100">정지100일</option>
					<option value="영구정지">영구정지</option>
				</select>
				<button type="button" class="btn btn-default" id="ac_result">정지</button>
				<button type="button" class="btn btn-default" id="ac_cancel">취소</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	$(function() {
		// 접수 버튼 클릭시 
		$('.acState').click(function() {
			$('#myLargeModal').modal("show");
			$.ajax({
				url : "/admin/acInfo",
				data : {
					"ac_no" : $(this).val()
				},
				dataType : "json",
				success : function(data) {
					console.log(data)
					$('input[name=ac_no]').val(data.ac_no)
					$('input[name=us_id]').val(data.us_id)
					if (data.ac_own_id == null || data.ac_own_id == "") {
						$('input[name=id]').val(data.ac_us_id)
					}
					if (data.ac_us_id == null || data.ac_us_id == "") {
						$('input[name=id]').val(data.ac_own_id)
					}
					$('input[name=ac_item]').val(data.ac_item)
					$('input[name=ac_cate]').val(data.ac_cate)
					$('#ac_content').val(data.ac_content)
				},
				error : function() {
					console.log("오류");
				}
			});// acState click ajax

		}) // 접수 버튼 클릭시

		// 정지 버튼 클릭시
		$('#ac_result').click(function() {
			console.log("acStop : " + $('select[name=acStop]').val());
			console.log("ac_no : " + $('input[name=ac_no]').val());
			console.log("id : " + $('input[name=id]').val());
			console.log("text : " + $('selected').text());

			var us_stopdate = $('select[name=acStop]').val();
			var own_stopdate = $('select[name=acStop]').val();

			if ($('select[name=acStop]').val() == 0) {
				alert("정지기간을 선택해주세요");
				return false;
			}
			if ($('select[name=acStop]').val() == 7) {
				var ac_result = "정지7일";
			}
			if ($('select[name=acStop]').val() == 30) {
				var ac_result = "정지30일";
			}
			if ($('select[name=acStop]').val() == 100) {
				var ac_result = "정지100일";
			}
			$.ajax({
				url : "/admin/acResultUpdate",
				data : {
					"ac_no" : $('input[name=ac_no]').val(),
					"stop" : $('select[name=acStop]').val(),
					"ac_result" : ac_result,
					"id" : $('input[name=id]').val()
				},
				dataType : "json",
				success : function(data) {
					console.log(data)
					alert("정상적으로 정지가 부여되었습니다.");
					location.replace("/admin/acList?page=${param.page}");
				},
				error : function(data) {
					console.log("에러");
				}
			}); // ac_result click us ajax
		}); // ac_result click

		// 신고취소버튼 클릭시
		$('#ac_cancel').click(function() {
			$.ajax({
				url : "/admin/acResultUpdate",
				data : {
					"ac_no" : $('input[name=ac_no]').val()
				},
				dataType : "json",
				success : function(data) {
					console.log(data);
					alert("신고 접수 취소");
					location.replace("/admin/acList?page=${param.page}");
				}
			});
		});

		// 검색
		$('#searchBtn').click(function() {
			var keyword = $('input[name=keyword]').val();
			console.log(keyword);
			$('#search').submit();
		});
	});//ready
</script>


<%@include file="../include/footer.jsp"%>