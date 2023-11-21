package com.dapao.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class PayVO {
	
	private Integer pay_id; // 결제 번호 (AI)
	private String imp_uid; // 결제 고유번호
	private String pay_uid; // 주문번호
	private Integer pay_price; // 결제금액 
	private String pay_kind; // 결제종류(대나무페이/체험단/인출)
	private Date pay_date; // 결제일시
	private String pay_con; // 결제상태
	
	private String pay_pg; // pg사 
	private String pay_method; // 결제수단
	private String card_num; // 카드 승인 번호
	private String pay_card; // 카드사
	private String own_id; // 사업자 아이디
	private String us_id; // 유저 아이디
	private String pay_tell; // 결제자 전화번호
	

}
