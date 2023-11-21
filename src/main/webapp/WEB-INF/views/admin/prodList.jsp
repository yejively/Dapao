<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<style>
.prodState{
	border-radius: 0.3em;
    background-color: aliceblue;
    border: none;
    color: green;
}
.prodState:hover{
	background-color: green;
	color: white;
}
</style>
<div class="boxList">
	<div class="box-header with-board">
		<p class="pContent"><i class="fa fa-shopping-cart"></i>사업자 상품 관리</p>
		<form action="/admin/prodList" id="search">
			<input type="text" name="keyword" value="${pageVO.cri.keyword }" id="search2">
			<button id="searchBtn"><i class="fa fa-fw fa-search"></i></button>
		</form>
	</div>
	<div class="box-body">
		<table class="table table-bordered">
			<thead>
				<tr role="row">
					<th>상품 번호</th>
					<th>사업자 아이디</th>
					<th>상품 카테고리</th>
					<th>가격</th>
					<th>상품 상태</th>
					<th>판매 상태</th>
					<th>날짜 정보</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${prodList }">
					<tr role="row" class="odd">
						<td>${list.prod_no }</td>
						<td><a href="/ent/shopMain?ent_id=${list.own_id }" class="prod_no">${list.own_id }</a></td>
						<td>${list.prod_cate }</td>
						<td>${list.prod_price }</td>
						<td>${list.prod_con }</td>
						<c:choose>
							<c:when test="${list.prod_state eq '0' }">
								<td>판매중</td>
							</c:when>
							<c:when test="${list.prod_state eq '1' }">
								<td>판매완료</td>
							</c:when>
							<c:when test="${list.prod_state eq '2' }">
								<td>삭제</td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${list.prod_state eq '0' }">
								<td>등록 ${list.prod_regdate }</td>
							</c:when>
							<c:when test="${list.prod_state eq '1' }">
								<td>판매 ${list.prod_outdate }</td>
							</c:when>
							<c:when test="${list.prod_state eq '2' }">
								<td>삭제 ${list.prod_outdate }</td>
							</c:when>
						</c:choose>
						<c:if test="${list.prod_state eq '0' }">
							<td><button type="button" class="prodState" value="${list.prod_no }">삭제</button></td>
						</c:if>
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
				<li><a href="/admin/prodList?page=${pageVO.startPage-1 } ">←</a></li>
			</c:if>

			<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
				<li ${pageVO.cri.page == i? 'class="active"':'' }><a href="/admin/prodList?page=${i }">${i }</a></li>
			</c:forEach>

			<c:if test="${pageVO.next }">
				<li><a href="/admin/prodList?page=${pageVO.endPage+1 }">→</a></li>
			</c:if>
		</ul>
	</div>
</div>


<script type="text/javascript">
	$(function() {
		var query = window.location.search; // http://localhost:8080/notice?id=1&name=하나
		var param = new URLSearchParams(query); // ?id=1&name=하나
		var page = param.get("page")
		console.log(param.get("page"));
		// 삭제버튼 클릭시
		$('.prodState').click(function() {
			alert("Ddd");
			console.log($(this).val());
			$.ajax({
				url : "/admin/prodDelete",
				data : {
					"prod_no" : $(this).val()
				},
				dataType : "json",
				success : function(data) {
					console.log("성공 / 결과 : " + data);
					location.replace("/admin/prodList?page=${param.page}");
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
	});
</script>


<%@include file="../include/footer.jsp"%>