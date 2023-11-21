<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<style>
.modal-content{
	margin-top: 40%;
}
</style>
<div class="boxList">
	<div class="box-header with-board">
		<p class="pContent"><i class="fa fa-heart"></i>리뷰 관리</p>
		<form action="/admin/reviewList" id="search">
			<input type="text" name="keyword" value="${pageVO.cri.keyword }" id="search2">
			<button id="searchBtn"><i class="fa fa-fw fa-search"></i></button>
		</form>
	</div>
	<div class="box-body">
		<table class="table table-bordered">
			<thead>
				<tr role="row">
					<th>리뷰 번호</th>
					<th>판매자</th>
					<th>구매자</th>
					<th>별점</th>
					<th>등록날짜</th>
					<th>삭제날짜</th>
					<th>리뷰상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${vo }">
					<tr role="row" class="odd">
						<td><a class="rv_no">${vo.rv_no }</a></td>
						<td>
							<c:if test="${!empty vo.rv_own_id}">
	                     			${vo.rv_own_id}
	                  		</c:if>
	                  		<c:if test="${!empty vo.rv_us_id}">
	                     			${vo.rv_us_id}
	                 		 </c:if>
	                  	</td>
						<td>${vo.rv_buy_id}</td>
						<td><c:forEach begin="1" end="${vo.rv_star}">
								<label>⭐</label>
							</c:forEach></td>
						<td>${vo.rv_regdate }</td>
						<td>${vo.rv_outdate }</td>
						<c:choose>
							<c:when test="${vo.rv_state == 0 }">
								<td>정상</td>
							</c:when>
							<c:when test="${vo.rv_state == 1 }">
								<td>삭제</td>
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
				<li><a href="/admin/reviewList?page=${pageVO.startPage-1 } ">←</a></li>
			</c:if>

			<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
				<li ${pageVO.cri.page == i? 'class="active"':'' }><a href="/admin/reviewList?page=${i }">${i }</a></li>
			</c:forEach>

			<c:if test="${pageVO.next }">
				<li><a href="/admin/reviewList?page=${pageVO.endPage+1 }">→</a></li>
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
				<h4 class="modal-title">리뷰관리</h4>
			</div>
			<div class="muserInfo">
				리뷰번호 <input class="form-control" type="text" name="rv_no" id="rv_no" readonly>
			</div>
			<div class="muserInfo">
				판매자 <input class="form-control" type="text" name="rv_id" id="rv_id" readonly>
			</div>
			<div class="muserInfo">
				구매자 <input class="form-control" type="text" name="rv_buy_id" id="rv_buy_id" readonly>
			</div>
			<div class="muserInfo">
				내용 <input class="form-control" type="text" name="rv_content" id="rv_content" readonly>
			</div>
			<div class="modal-footer">
				<button type="button" name="delete" class="btn btn-default delete">삭제</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$('.rv_no')
				.click(
						function() {
							$('#myLargeModal').modal("show");

							$.ajax({
								url : "/admin/reviewInfo",
								data : {
									"rv_no" : $(this).text()
								},
								dataType : "json",
								success : function(data) {
									console.log(data)
									$('input[name=rv_no]').val(data.rv_no)
									if (data.rv_own_id == null
											|| data.rv_own_id == "") {
										$('input[name=rv_id]').val(
												data.rv_us_id)
									}
									if (data.rv_us_id == null
											|| data.rv_us_id == "") {
										$('input[name=rv_id]').val(
												data.rv_own_id)
									}
									$('input[name=rv_buy_id]').val(
											data.rv_buy_id)
									$('#rv_content').val(
											data.rv_content)

								},
								error : function() {
									console.log("오류");
								}
							});// rv_no click ajax

							$('.delete')
									.click(
											function() {
												$
														.ajax({
															url : "/admin/reviewDelete",
															data : {
																"rv_no" : $(
																		'input[name=rv_no]')
																		.val()
															},
															dataType : "json",
															success : function(
																	data) {
																alert("삭제완료");
																location
																		.replace("/admin/reviewList?page=${param.page}");
															},
															error : function() {
																console
																		.log("오류");
															}
														});//delete click ajax
											});//delete click
						});// rv_no click
		$('#searchBtn').click(function() {
			var keyword = $('input[name=keyword]').val();
			console.log(keyword);
			$('#search').submit();
		});
	});//ready
</script>


<%@include file="../include/footer.jsp"%>