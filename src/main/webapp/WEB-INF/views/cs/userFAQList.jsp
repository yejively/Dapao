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
.content-wrapper {
	background-color: white;
}

* {
	box-sizing: border-box;
}

.que:first-child {
	border-top: 3px solid green;
}

.que {
	position: relative;
	padding: 40px 0;
	cursor: pointer;
	font-size: 22px;
	font-weight: 600;
	border-bottom: 1px solid #dddddd;
}

.que::before {
	display: inline-block;
    content: 'Q';
    font-size: 25px;
    color: #006633;
    margin: 0 10px;
}

.que.on>span {
	font-weight: bold;
	color: #006633;
}

.anw {
	display: none;
	overflow: hidden;
	font-size: 14px;
	background-color: #f4f4f4;
	padding: 30px 0;
}

.anw::before {
	display: inline-block;
	content: 'A';
	font-size: 14px;
	font-weight: bold;
	color: #666;
	margin: 0 5px;
}

.arrow-wrap {
	position: absolute;
	top: 50%;
	right: 10px;
	transform: translate(0, -50%);
}

.que .arrow-top {
	display: none;
}

.que .arrow-bottom {
	display: block;
}

.que.on .arrow-bottom {
	display: none;
}

.que.on .arrow-top {
	display: block;
}

#faq {
	position: relative;
	border-radius: 3px;
	background: #ffffff;
	border-top: 3px solid #d2d6de;
	margin-bottom: 20px;
	width: 100%;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
	padding: 30px;
}

pre {
	border: none;
	background-color: #f4f4f4;
	font-weight: 600;
	font-size: medium;
}
</style>
<body>
	<div id="faq">
		<h1>FAQ</h1>
		<div id="Accordion_wrap">
			<c:forEach var="list" items="${FAQList }">
				<div class="que">
					<span>${list.cs_title }</span>
					<div class="arrow-wrap">
						<span class="arrow-top">↑</span> <span class="arrow-bottom">↓</span>
					</div>
				</div>
				<div class="anw">
					<span><pre>${list.cs_content }</pre></span>
				</div>
			</c:forEach>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(".que").click(function() {
		$(this).next(".anw").stop().slideToggle(300);
		$(this).toggleClass('on').siblings().removeClass('on');
		$(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
	});
</script>

<%@include file="../include/userFooter.jsp"%>