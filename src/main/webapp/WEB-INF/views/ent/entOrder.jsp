<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/entHeader.jsp"%>
<style>
.cate {
	padding-top: 15px;
}
#content{
	font-size: 25px;
}
html, body{
	height: 100%;
}

.box-success{
	width : 100%;
	height: 100vh;
}
.thead{
	border-bottom-color: green;
}
/* .table-responsive{ */
/* 	margin-right: 10px; */
/* } */

</style>
<!-- <div class="container"> -->
<div class="box box-success">
	<div class="box-header with-border"></div>
	<form action="/ent/entOrder" method="post">
		<%-- 		<input type="hidden" name="own_id" value="${own_id }" > --%>
		<table>

			<tr class="search_container">
				<td colspan="2" class="cate">
					<div class="form-group">
						<select class="form-control" name="search_cate" id="se_cate">
							<option value="prod_name">상품명</option>
							<option value="tr_no">주문번호</option>
						</select>
					</div>
				</td>
				<td>
					<div class="input-group margin">
						<input type="text" class="form-control" name="search" id="search"> <span class="input-group-btn">
							<button type="submit" class="btn btn-success btn-flat">Go!</button>
						</span>
					</div>
				</td>
			</tr>
		</table>
	</form>
	<div class="box-header with-border">
		<h3 class="box-title">
		<c:if test="${search_cate eq 'prod_name'}">
			상품명 조회
		</c:if>
		<c:if test="${search_cate eq 'tr_no'}">
			주문번호 조회	
		</c:if>
		</h3>
		<div class="box-tools pull-right">
			<button type="button" class="btn btn-box-tool" data-widget="collapse">
				<i class="fa fa-minus"></i>
			</button>
		</div>
	</div>

	<div class="box-body">
		<div class="table-responsive">
			<table class="table no-margin" id="content">
				<thead class="thead">
					<tr>
						<th>주문번호</th>
						<th>상품명</th>
						<th>구매자</th>
						<th>가격</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${tlist }" var="tlist">
						<tr>
							<td>${tlist.tr_no }</td>
							<td>${tlist.prodVO.prod_name }</td>
							<td>${tlist.us_id }</td>
							<td>${tlist.prodVO.prod_price }</td>
							<td>
								<c:choose>
								<c:when test="${tlist.tr_sell_state == 1 }">
								<button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-danger" 
								data-tr_no=${tlist.tr_no } data-tr_price=${tlist.tr_price }
								 data-us_id=${tlist.us_id } data-tr_sell_ent=${tlist.tr_sell_ent }>판매완료</button>
								</c:when>
								<c:when test="${tlist.tr_sell_state == 0 }">
									<button type="button" class="btn btn-warning">구매확정 대기중</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-">거래취소</button>
								</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<c:if test="${tlist != null }">
					<div class="box-footer clearfix">
						<ul class="pagination pagination-sm no-margin pull-center">
							<c:if test="${pageVO.prev }">
								<li><a href="/ent/entOrder?search=${search }&search_cate=${search_cate }&cri.page=${pageVO.startPage-1 }">«</a></li>
							</c:if>

							<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
								<li ${pageVO.cri.page == i? 'class="active"':'' }><a href="/ent/entOrder?search=${search }&search_cate=${search_cate }&cri.page=${i }">${i }</a></li>
							</c:forEach>

							<c:if test="${pageVO.next }">
								<li><a href="/ent/entOrder?search=${search }&search_cate=${search_cate }&cri.page=${pageVO.endPage+1 }">»</a></li>
							</c:if>
						</ul>
					</div>
			</c:if>
		</div>

	</div>
</div>
<!-- </div> -->




<!-- modal -->
<div class="modal modal-danger fade" id="modal-danger" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">환불</h4>
			</div>
			<div class="modal-body">
				<p>환불하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-outline" id="refund">환불하기</button>
			</div>
		</div>

	</div>

</div>
<!-- modal -->

<script type="text/javascript">
	$(function() {
		var own_id = "${own_id}";
		$('#modal-danger').on("show.bs.modal", function(e) { // 모달 켜지면
			console.log(e);
			var tr_no = $(e.relatedTarget).data('tr_no') * 1;
			console.log(tr_no);
			$('#refund').click(function() {
				$.ajax({
					url: '/ent/refund',
					type : "get",
					data : {tr_no : tr_no},
					success : function () {
						console.log('성공');
						$('#modal-danger').modal('hide');
						location.href="/ent/entOrder?search=${search }&search_cate=${search_cate }&cri.page=${pageVO.cri.page }";
					}, 
					error : function () {
						console.log('실패');
						$('#modal-danger').modal('hide');
					}
				})
			});
		});
		$('.btn-success').click(function() {
			if(own_id == null){
				alert('로그인 이후 사용해주세요');
				return false;
			}
		});
		$('.pagination li a').hover(function() {
			$(this).css('color', 'red');
			$(this).css("cursor", "pointer");
		},function() {
			$(this).css('color', 'white');
		});

	});
</script>


<%@ include file="../include/entFooter.jsp"%>