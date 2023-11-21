<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/entHeader.jsp"%>

<style>
tr {
	border-bottom: 1px solid green;
}
.box-success {
    width: 100%;
    height: 100vh;
}
td{
	font-size: 1.3em;
}
th{
	font-size: 1.3em;
}
</style>
<div class="box box-success">
	<div class="box-header with-border"></div>
	<div class="container">
		<div class="search_container">
			<button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-default" data-modal_cate=0>상품등록</button>
			<form action="" method="post">
				<table class="table table-hover">
					<tr>
						<td>상품명</td>
						<td colspan="2"><input type="search" name="prod_name" id="search_name" class="form-control" value=""></td>
						<td>
					</tr>

					<tr>
						<td>카테고리</td>
						<td><select name="prod_cate" class="form-control">
								<option value="">선택</option>
								<option value="패션의류">패션의류</option>
								<option value="뷰티잡화">뷰티잡화</option>
								<option value="유아용품">유아용품</option>
								<option value="가구/생활">가구/생활</option>
								<option value="취미">취미</option>
								<option value="전자기기">전자기기</option>
								<option value="스포츠/레저">스포츠/레저</option>
								<option value="자동차">자동차</option>
								<option value="도서">도서</option>
						</select></td>
						<td>상품상태</td>
						<td colspan="2"><input type="radio" name="prod_con" value="중고" id="radio1"><label for="radio1">중고</label> <input type="radio" name="prod_con" value="새상품" id="radio2"><label for="radio2">새상품</label></td>

					</tr>

				</table>
				<button type="submit" class="btn btn-success">조회하기</button>
			</form>
		</div>

		<div class="box">
			<div class="box-body table-responsive no-padding">
				<table class="table table-hover">
					<tbody>
						<tr>
							<th>제품번호</th>
							<th>상품명</th>
							<th>제품중고여부</th>
							<th>가격</th>
							<th>제품상태
							<th>수정</th>
						</tr>
						<c:if test="${!empty plist }">
							<c:forEach items="${plist }" var="list">
								<tr>
									<td>${list.prod_no }</td>
									<td class="name_value">${list.prod_name }</td>
									<td class="con_value">${list.prod_con }</td>
									<td class="price_value">${list.prod_price }</td>
									<td class="state_value"><c:choose>
											<c:when test="${list.prod_state == 0}">
											등록
										</c:when>
											<c:when test="${list.prod_state == 1}">
											매진
										</c:when>
											<c:otherwise>
											삭제
										</c:otherwise>
										</c:choose></td>
									<td>
										<button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-default" 
										data-prod_no="${list.prod_no }" data-prod_name="${list.prod_name }" data-prod_con="${list.prod_con }" 
										data-prod_price="${list.prod_price }" data-prod_content="${list.prod_content }" 
										data-prod_cate="${list.prod_cate }" data-prod_img="${list.prod_img }" 
										data-own_id="${list.own_id }" data-modal_cate=1>수정</button>
									</td>
								</tr>
							</c:forEach>
						</c:if>

					</tbody>
				</table>
				<c:if test="${plist != null }">
					<div class="box-footer clearfix">
						<ul class="pagination pagination-sm no-margin pull-center">
							<c:if test="${pageVO.prev }">
								<li><a href="/ent/productManage?page=${pageVO.startPage-1 }">«</a></li>
							</c:if>

							<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
								<li ${pageVO.cri.page == i? 'class="active"':'' }><a href="/ent/productManage?page=${i }">${i }</a></li>
							</c:forEach>

							<c:if test="${pageVO.next }">
								<li><a href="/ent/productManage?page=${pageVO.endPage+1 }">»</a></li>
							</c:if>
						</ul>
					</div>
				</c:if>
			</div>

		</div>

	</div>
</div>
<!-- modal -->
<div class="modal modal-default fade" id="modal-default" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">상품 등록/수정하기</h4>
			</div>
			<div class="modal-body">
				<div class="box box-success">
					<div class="box-header with-border"></div>


					<form role="form" action="/ent/productUpdate" enctype="multipart/form-data" method="post">
						<input type="hidden" name="own_id" id="own_id"> <input type="hidden" name="modal_cate" id="modal_cate">
						<div class="prod_noDiv"></div>
						<div class="box-body">
							<div class="form-group">
								<label for="prod_name">상품명</label> <input type="text" class="form-control" id="prod_name" name="prod_name">
							</div>
							<div class="form-group">
								<label for="prod_price">가격</label> <input type="text" class="form-control" name="prod_price" id="prod_price">
							</div>
							<div class="form-group">
								<label>제품상태</label> <input type="radio" name="prod_con" value="중고" id="p_radio1"> <label for="p_radio1">중고</label> <input type="radio" name="prod_con" value="새상품" id="p_radio2"> <label for="p_radio2">새상품</label>
							</div>
							<div class="form-group">
								<label>상품설명</label>
								<textarea class="form-control" rows="3" id="prod_content" name="prod_content"></textarea>
							</div>
							<div class="form-group">
								<label>Select</label> <select class="form-control" id="prod_cate" name="prod_cate">
									<option value="패션의류">패션의류</option>
									<option value="뷰티잡화">뷰티잡화</option>
									<option value="유아용품">유아용품</option>
									<option value="가구/생활">가구/생활</option>
									<option value="취미">취미</option>
									<option value="전자기기">전자기기</option>
									<option value="스포츠/레저">스포츠/레저</option>
									<option value="자동차">자동차</option>
									<option value="도서">도서</option>
								</select>
							</div>
							<div class="form-group">
								<label for="prod_img">상품이미지</label> <input type="file" id="prod_img" name="file" multiple="multiple">
								<button type="button" class="btn_new_file">추가</button>
								<div class="file_area"></div>
							</div>
						</div>

						<div class="box-footer">
							<button type="submit" class="btn btn-success">Submit</button>
							<button type="button" class="btn btn-default pull-right" data-dismiss="modal">Close</button>
						</div>
						
					</form>
				</div>
			</div>
				
		</div>

	</div>
</div>


<script type="text/javascript">
	$(function() {
		$('#modal-default').on("show.bs.modal",function(e) { //모달켜지면
			$('.box-title').remove();
			$('#prod_no').remove();
			console.log(e.relatedTarget);
			var prod_no = $(e.relatedTarget).data('prod_no') * 1;
			var prod_name = $(e.relatedTarget).data('prod_name');
			var prod_con = $(e.relatedTarget).data('prod_con');
			var prod_price = $(e.relatedTarget).data('prod_price');
			var prod_content = $(e.relatedTarget).data('prod_content');
			var prod_cate = $(e.relatedTarget).data('prod_cate');
			var prod_img = $(e.relatedTarget).data('prod_img');
			var own_id = $(e.relatedTarget).data('own_id') * 1;
			var modal_cate = $(e.relatedTarget).data('modal_cate') * 1;
// 			var img = prod_img.substring(prod_img.lastIndexOf("/")+1);
			console.log(prod_no);
			console.log(own_id);
			console.log(prod_img);
							
			if (prod_con == '새상품') {
				$('#p_radio2').attr("checked", true);
			} else {
				$('#p_radio1').attr("checked", true);
			}

			$('#prod_name').val(prod_name);
			$('#prod_price').val(prod_price);
			$('#prod_content').val(prod_content);
			$('#prod_cate').val(prod_cate).prop("selected",true);
// 			$('#prod_img').val(img);
			$('#own_id').val(own_id);
			$('#modal_cate').val(modal_cate);

			if (modal_cate == 1) {
				$('.box-header').append('<h3 class="box-title">상품 수정하기</h3>');
				$('.prod_noDiv').append('<input type="hidden" name="prod_no" id="prod_no" value="">');
				$('#prod_no').val(prod_no);
			} else {
				$('.box-header').append('<h3 class="box-title">상품 등록하기</h3>');
			}

		});//modal on
		$('.pagination li a').hover(function() {
			$(this).css('color', 'red');
			$(this).css("cursor", "pointer");
		},function() {
			$(this).css('color', 'white');
		});
		
	});
</script>
<%@ include file="../include/entFooter.jsp"%>
