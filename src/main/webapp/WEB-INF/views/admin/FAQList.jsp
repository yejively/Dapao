<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>

<div class="boxList">
	<div class="box-header with-board">
		<p class="pContent"><i class="fa fa-list-ul"></i>FAQ 관리</p>
		<form action="/admin/FAQList" id="search">
			<input type="text" name="keyword" value="${pageVO.cri.keyword }" id="search2">
			<button id="searchBtn"><i class="fa fa-fw fa-search"></i></button>
		</form>
	</div>
	<div class="box-body">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>글 번호</th>
					<th>제목</th>
					<th>등록일</th>
					<th>등록형태</th>
					<th>등록상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${vo }">
					<tr role="row" class="odd">
						<td><a class="cs_no">${vo.cs_no }</a></td>
						<td>${vo.cs_title }</td>
						<td>${vo.cs_regdate }</td>
						<c:choose>
							<c:when test="${vo.cs_group eq '0' }">
								<td>회원공지</td>
							</c:when>
							<c:when test="${vo.cs_group eq '1' }">
								<td>사업자공지</td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${vo.cs_state eq '0' }">
								<td>해제</td>
							</c:when>
							<c:when test="${vo.cs_state eq '1' }">
								<td>등록</td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${vo.cs_state eq '0' }">
								<td><button type="button" class="csState" value="${vo.cs_no }">등록</button></td>
							</c:when>
							<c:when test="${vo.cs_state eq '1' }">
								<td><button type="button" class="csState" value="${vo.cs_no }">해제</button></td>
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
				<li><a href="/admin/FAQList?page=${pageVO.startPage-1 } ">←</a></li>
			</c:if>

			<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
				<li ${pageVO.cri.page == i? 'class="active"':'' }><a href="/admin/FAQList?page=${i }">${i }</a></li>
			</c:forEach>

			<c:if test="${pageVO.next }">
				<li><a href="/admin/FAQList?page=${pageVO.endPage+1 }">→</a></li>
			</c:if>
		</ul>
	</div>
</div>

<!-- Modal -->
<div id="myLargeModal" class="modal fade" role="dialog">
	<div class="modal-dialog modal-lg">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">FAQ</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label class="col-sm-2 control-label">글번호</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_no" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_title"><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10">
						<textarea class="form-control" name="cs_content" id="cs_content" rows="10"></textarea>
					</div>
				</div>
				<div class="form-group2">
					<label class="col-sm-2 control-label cs_group">등록형태</label>
					<div class="col-sm-10">
						<input type="text" class="form-control cs_group" name="cs_group" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">등록상태</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_state" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">조회수</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_view" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">게시일</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_regdate" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">수정일</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_update" readonly><br>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" name="update" class="btn btn-default update">수정</button>
				<button type="button" name="update" class="btn btn-default delete">삭제</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	$(function() {
		$('.cs_no').click(function() {
			$('#myLargeModal').modal("show");

			$.ajax({
				url : "/admin/csInfo",
				data : {
					"cs_no" : $(this).text()
				},
				dataType : "json",
				success : function(data) {
					console.log(data)
					$('input[name=cs_no]').val(data.cs_no)
					$('input[name=cs_title]').val(data.cs_title)
					$('#cs_content').val(data.cs_content)
					if (data.cs_group == 0) {
						$('input[name=cs_group]').val("회원공지");
					} else {
						$('input[name=cs_group]').val("사업자공지");
					}
					if (data.cs_state == 0) {
						$('input[name=cs_state]').val("해제")
					} else {
						$('input[name=cs_state]').val("등록")
					}
					$('input[name=cs_view]').val(data.cs_view)
					$('input[name=cs_regdate]').val(data.cs_regdate)
					$('input[name=cs_update]').val(data.cs_update)
				},
				error : function() {
					console.log("오류");
				}
			});// cs_no click ajax

			$('.update').click(function() {
				$.ajax({
					url : "/admin/csInfoUpdate",
					data : {
						"cs_no" : $('input[name=cs_no]').val(),
						"cs_title" : $('input[name=cs_title]').val(),
						"cs_content" : $('input[name=cs_content]').val()
					},
					dataType : "json",
					success : function(data) {
						console.log(data)
						alert("수정완료");
						location.replace("/admin/FAQList?page=${param.page}");
					},
					error : function() {
						console.log("오류");
					}
				});//update click ajax
			});//update click
			$('.upload').click(function() {
				$.ajax({
					url : "/admin/FAQUpload",
					data : {
						"cs_no" : $('input[name=cs_no]').val()
					},
					dataType : "json",
					success : function(data) {
						console.log(data)
						alert("FAQ - 등록완료")
						location.replace("/admin/FAQList?page=${param.page}");
					}
				}); // upload click ajax
			});// upload click
			$('.remove').click(function() {
				$.ajax({
					url : "/admin/FAQRemove",
					data : {
						"cs_no" : $('input[name=cs_no]').val()
					},
					dataType : "json",
					success : function(data) {
						console.log(data)
						alert("FAQ - 등록해제완료")
						location.replace("/admin/FAQList?page=${param.page}");
					}

				});// remove click ajax
			});// remove click
		});// cs_no click

		// FAQ 삭제버튼 클릭시
		$('.delete').click(function() {
			$.ajax({
				url : "/admin/csDelete",
				data : {
					"cs_no" : $('input[name=cs_no]').val()
				},
				dataType : "json",
				success : function(data) {
					console.log(data);
					console.log("성공");
					location.replace("/admin/FAQList?page=${param.page}");
				},
				error : function() {
					console.log("에러");
				}
			});
		});

		// 등록/해제 버튼 클릭시 
		$('.csState').click(function() {
			var state = $(this).text();
			console.log("state : " + state);

			if (state == '등록') {
				alert("등록");
				console.log($(this).val());
				$.ajax({
					url : "/admin/csUpload",
					data : {
						"cs_no" : $(this).val()
					},
					dataType : "json",
					success : function(data) {
						console.log("성공결과 : " + data);
						console.log("성공");
						location.replace("/admin/FAQList?page=${param.page}");
					},
					error : function() {
						console.log("에러");
					}
				});
			}

			if (state == '해제') {
				alert("해제");
				console.log($(this).val());
				$.ajax({
					url : "/admin/csRemove",
					data : {
						"cs_no" : $(this).val()
					},
					dataType : "json",
					success : function(data) {
						console.log("성공결과 : " + data);
						console.log("성공");
						location.replace("/admin/FAQList?page=${param.page}");
					},
					error : function() {
						console.log("에러");
					}
				});
			}

		}) // 등록/해제 버튼 클릭시

		$('#searchBtn').click(function() {
			var keyword = $('input[name=keyword]').val();
			console.log(keyword);
			$('#search').submit();
		});
	});//ready
</script>


<%@include file="../include/footer.jsp"%>