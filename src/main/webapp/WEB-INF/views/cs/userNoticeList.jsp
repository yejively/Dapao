<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty us_id }">
	<%@ include file="../include/userHeader.jsp"%>
</c:if>
<c:if test="${!empty us_id }">
	<%@ include file="../include/userLoginHeader.jsp"%>
</c:if>
<style>
.content-wrapper{
	background-color: white;
}
th {
	text-align: center;
}
.box-title {
	font-weight: 600;
	text-align: left;
	font-size: larger;
}

.box-body {
	padding-bottom: 50px;
}

.pbox {
	padding-top: 5%;
}

.box {
	padding: 30px;
	font-size: 20px;
	font-weight: 600;
	text-align: center;
	border-top: 3px solid green;
    border-bottom: 3px solid green;
}

a {
	color: green;
}
</style>
<div class="pbox">
	<div class="box">
		<p class="box-title">공지사항</p>
		<div class="box-body">
			<table class="table table-bordered">
				<thead>
					<tr role="row">
						<th width="1px"></th>
						<th>제목</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${noticeList }">
						<tr role="row" class="odd">
							<td>${list.cs_no }</td>
							<td><a class="noticeList"
								href='/cs/userNotice?page=1&cs_no=${list.cs_no }'>${list.cs_title }</a></td>
							<td>${list.cs_regdate }</td>
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
					<li><a href="/cs/userNoticeList?page=${pageVO.startPage-1 } ">←</a></li>
				</c:if>

				<c:forEach var="i" begin="${pageVO.startPage }"
					end="${pageVO.endPage }" step="1">
					<li ${pageVO.cri.page == i? 'class="active"':'' }><a
						href="/cs/userNoticeList?page=${i }">${i }</a></li>
				</c:forEach>

				<c:if test="${pageVO.next }">
					<li><a href="/cs/userNoticeList?page=${pageVO.endPage+1 }">→</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>



<%@include file="../include/userFooter.jsp"%>