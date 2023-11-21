<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/entHeader.jsp"%>

<style>
.ad_container {
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.bg-aqua {
	width: 40%;
}

.bg-yellow {
	width: 40%;
}

.box-container {
	height: 100vh;
}

.box {
	margin: 0px;
}

.box-solid {
	border: 1px solid green;
	background-color: #f4f4f2;
}

.box-header{
	background-color: white;
}
.small-box p{
	font-size: 1.1em;
}
</style>
<div class="box box-success box-container">
	<div class="box-header with-border"></div>
	<div class="ad_container">
		<div class="small-box bg-aqua">
			<div class="inner">
				<h3>홈페이지 광고</h3>
			</div>
			<div class="icon">
				<i class="fa fa-shopping-cart"></i>
			</div>
			<div class="small-box-footer icon-ad" data-toggle="modal"
				data-target="#modal-default">
				신청하기 <i class="fa fa-arrow-circle-right"></i>
			</div>
			<div class="box box-solid ">
				<div class="box-header with-border">
					<i class="fa fa-info-circle"></i>
					<h3 class="box-title">홈페이지 광고 소개</h3>
				</div>

				<div class="box-body">
					<blockquote>
						<p class="text-black">
							매출 성장부터 단골 확보까지 광고로 더 빠르게 시작하세요 <br>
							<br> 월 평균 600만명 이상의 방문자에게 내 비즈니스를 효과적으로 홍보해보세요. <br>
							<br> 간단한 광고 세팅 방식을 통해 판매자가 주도적으로 광고 이용을 할 수 있습니다. <br>
							<br> 구매전환율이 높은 키워드 검색 광고 등을 통해 고객을 만나보세요.
						</p>
					</blockquote>
				</div>

			</div>

		</div>

		<div class="small-box bg-yellow">
			<div class="inner">
				<h3>체험단 신청</h3>
			</div>
			<div class="icon">
				<i class="ion ion-person-add"></i>
			</div>
			<a href="/exp/ownExp" class="small-box-footer"> 신청하기 <i
				class="fa fa-arrow-circle-right"></i>
			</a>

			<div class="box box-solid">
				<div class="box-header with-border">
					<i class="fa fa-info-circle"></i>
					<h3 class="box-title">체험단 소개</h3>
				</div>

				<div class="box-body">
					<blockquote>
						<p class="text-black">
							소상공인을 위한 합리적인 가격 모두의 체험단 <br><br> 
							체험단 마케팅이란? <br><br>
							제품을 직접 사용해본 후 체험후기를 블로그나 카페, SNS에 포스팅해 유포하는
							체험마케팅은 소비자가 가장 원하는 생생한 제품 정보에 대한 컨텐츠를 또 다른 소비자를 통해서 생산하게 함으로써 가장
							높은 신뢰도를 구축할 수 있는 마케팅 방법입니다.
							<br><br>
						</p>
					</blockquote>
				</div>

			</div>

		</div>

	</div>
</div>



<!-- modal -->
<div class="modal modal-default fade" id="modal-default"
	style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">상품 광고 등록</h4>
			</div>
			<div class="modal-body">
				<form action="" method="post">
					<div class="box box-success">
						<div class="box-header with-border"></div>
						<div class="form-group">
							<label>업로드 기한</label> <select class="form-control"
								name="ad_upload" id="period" onchange="chageSelect()">
								<option value="30">30일</option>
								<option value="60">60일</option>
								<option value="90">90일</option>
							</select>
						</div>
						<div class="from-group">
							<label>가격</label>
							<p class="ad_price">300,000원</p>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success pull-left">신청</button>
						<button type="button" class="btn btn-default pull-right"
							data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>



<%@ include file="../include/entFooter.jsp"%>
<script type="text/javascript">
	var ent_coin = '${ent_coin}';
	function chageSelect() { //가격
		$('.ad_price').text($('#period').val()+"0,000원");
	}
	$(function () {
		$('button[type=submit]').click(function () {
			var price = $('#period').val()*1000;
			if(ent_coin < price){
				alert(" 금액이 부족합니다 ");
				location.href="/ent/coinCharge";
				return false;
			}
		});//submit
	});//jquery

</script>
