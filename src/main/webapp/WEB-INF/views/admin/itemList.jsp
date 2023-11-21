<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<style>
.itState{
	border-radius: 0.3em;
    background-color: aliceblue;
    border: none;
    color: green;
}
.itState:hover{
	background-color: green;
	color: white;
}
</style>

<div class="boxList">
	<div class="box-header with-board">
		<p class="pContent"><i class="fa fa-shopping-cart"></i>회원 상품 관리</p>
		<form action="/admin/itemList" id="search">
			<input type="text" name="keyword" value="${pageVO.cri.keyword }" id="search2">
			<button id="searchBtn"><i class="fa fa-fw fa-search"></i></button>
		</form>

	</div>
	<div class="box-body">
		<table class="table table-bordered">
			<thead>
				<tr role="row">
					<th>글 번호</th>
					<th>회원 아이디</th>
					<th>상품 카테고리</th>
					<th>가격</th>
					<th>상품상태</th>
					<th width="7%">판매상태</th>
					<th width="12%">날짜정보</th>
					<th width="7%"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${itemList }">
					<tr role="row" class="odd">
						<td>
						<c:if test="${list.it_state != '3' }">
							<a href="/item/itemDetail?it_no=${list.it_no }" class="it_no">${list.it_no }</a>
						</c:if>
						<c:if test="${list.it_state == '3' }">${list.it_no }</c:if>					
						</td>
						<td>${list.us_id }</td>
						<td>${list.it_cate }</td>
						<td>${list.it_price }</td>
						<td id="con">${list.it_con }</td>
						<c:choose>
							<c:when test="${list.it_state eq '0' }">
								<td>판매중</td>
							</c:when>
							<c:when test="${list.it_state eq '2' }">
								<td>판매완료</td>
							</c:when>
							<c:when test="${list.it_state eq '3' }">
								<td>삭제</td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${list.it_state eq '0' }">
								<td>등록 ${list.it_regdate }</td>
							</c:when>
							<c:when test="${list.it_state eq '2' }">
								<td>판매 ${list.it_outdate }</td>
							</c:when>
							<c:when test="${list.it_state eq '3' }">
								<td>삭제 ${list.it_outdate }</td>
							</c:when>
						</c:choose>
						<c:if test="${list.it_state eq '0' }">
							<td><button type="button" class="itState" value="${list.it_no }">삭제</button></td>
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
				<li><a href="temList?page=${pageVO.startPage-1 } ">←</a></li>
			</c:if>

			<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
				<li ${pageVO.cri.page == i? 'class="active"':'' }><a href="itemList?page=${i }">${i }</a></li>
			</c:forEach>

			<c:if test="${pageVO.next }">
				<li><a href="itemList?page=${pageVO.endPage+1 }">→</a></li>
			</c:if>
		</ul>
	</div>
</div>


<script type="text/javascript">
	$(function() {
		// 삭제버튼 클릭시
		$('.itState').click(function() {
			console.log($(this).val());
			$.ajax({
				url : "/admin/itemDelete",
				data : {
					"it_no" : $(this).val()
				},
				dataType : "json",
				success : function(data) {
					console.log("성공 / 결과 : " + data);
					location.replace("itemList?page=${param.page}");
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