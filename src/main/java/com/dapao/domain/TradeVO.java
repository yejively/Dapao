package com.dapao.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TradeVO {
	
	private Integer tr_no; // 거래 번호
	private String us_id; // 구매자 아이디
	private String tr_sell_ent; // 판매자_사업
	private String tr_sell_us; // 판매자_유저
	private Integer tr_prod; // 상품번호_사업
	private Integer tr_item; // 상품번호_유저
	private Integer tr_price; // 거래 금액
	private Integer tr_buy_state; // 거래여부_구매자
	private Integer tr_sell_state; // 거래여부_판매자
	private Date tr_date; // 거래 일시  
	
	private ProdVO prodVO; // join용
}
