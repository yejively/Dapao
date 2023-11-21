<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>

<div class="boxList">
	<div class="box-header with-board">
		<p class="pContent">
			<i class="fa fa-twitch"></i>체험단 관리
		</p>
		<form action="/admin/expList" id="search">
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
					<th>체험단 번호</th>
					<th>사업자 아이디</th>
					<th>체험단 제목</th>
					<th>체험단 내용</th>
					<th>모집 인원</th>
					<th>체험단 신청일자</th>
					<th>체험단 상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${vo }">
					<tr role="row" class="odd">
						<td><a class="exp_no">${vo.exp_no}</a></td>
						<td>${vo.own_id }</td>
						<td>${vo.exp_title }</td>
						<td>${vo.exp_content }</td>
						<td>${vo.exp_psn }</td>
						<td>${vo.exp_regdate }</td>
						<c:choose>
							<c:when test="${vo.exp_state == 0 }">
								<td>접수</td>
							</c:when>
							<c:when test="${vo.exp_state == 1 }">
								<td>승인</td>
							</c:when>
							<c:when test="${vo.exp_state == 2 }">
								<td>반려</td>
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
				<li><a href="/admin/expList?page=${pageVO.startPage-1 } ">←</a></li>
			</c:if>

			<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
				<li ${pageVO.cri.page == i? 'class="active"':'' }><a href="/admin/expList?page=${i }">${i }</a></li>
			</c:forEach>

			<c:if test="${pageVO.next }">
				<li><a href="/admin/expList?page=${pageVO.endPage+1 }">→</a></li>
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
				<h4 class="modal-title">체험단 관리</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label class="col-sm-2 control-label">체험단 번호</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="exp_no" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">사업자 아이디</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="own_id" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="exp_title" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label cs_group">내용</label>
					<div class="col-sm-10">
						<textarea class="form-control" name="exp_content" id="exp_content" rows="5" readonly></textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">모집 인원</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="exp_psn" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">신청 인원</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="exp_psn_ch" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">유의사항</label>
					<div class="col-sm-10">
						<textarea class="form-control" name="exp_notice" id="exp_notice" rows="5" readonly></textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">상태</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="exp_state" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">신청일자</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="exp_regdate" readonly><br>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" name="update" class="btn btn-default update">승인</button>
				<button type="button" name="delete" class="btn btn-default delete">반려</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		$('.exp_no').click(function() {
			$('#myLargeModal').modal("show");

			$.ajax({
				url : "/admin/expInfo",
				data : {
					"exp_no" : $(this).text()
				},
				dataType : "json",
				success : function(data) {
					console.log(data)
					$('input[name=exp_no]').val(data.exp_no)
					$('input[name=own_id]').val(data.own_id)
					$('input[name=exp_title]').val(data.exp_title)
					$('#exp_content').val(data.exp_content)
					$('input[name=exp_psn]').val(data.exp_psn)
					$('input[name=exp_psn_ch]').val(data.exp_psn_ch)
					$('#exp_notice').val(data.exp_notice)
					$('input[name=exp_state]').val(data.exp_state)
					$('input[name=exp_regdate]').val(data.exp_regdate)
				},
				error : function() {
					console.log("오류");
				}
			});// exp_no click ajax
			$('.update').click(function() {
				var ad_date = $('select[name=update]').val();
				console.log("ad_date : " + ad_date);
				$.ajax({
					url : "/admin/expAdInsert",
					data : {
						"exp_no" : $('input[name=exp_no]').val(),
						"ad_date" : ad_date,
						"own_id" : $('input[name=own_id]').val()
					},
					dataType : "json",
					success : function(data) {
						alert("정상적으로 광고 승인되었습니다.");
						location.replace("/admin/expList");

					},
					error : function(data) {
						console.log("에러");
					}
				}); // 승인 ajax
			});// 승인 click
			$('.delete').click(function() {
				$.ajax({
					url : "/admin/expReturn",
					data : {
						"exp_no" : $('input[name=exp_no]').val(),
						"exp_state" : $('input[name=exp_state]').val()
					},
					dataType : "json",
					success : function(data) {
						alert("반려되었습니다.")
						location.replace("/admin/expList");
					}
				})// 반려 ajax
			})// 반려 click
		});// exp_no click

		$('#searchBtn').click(function() {
			var keyword = $('input[name=keyword]').val();
			console.log(keyword);
			$('#search').submit();
		});
	});//ready
</script>


<%@include file="../include/footer.jsp"%>