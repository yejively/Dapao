package com.dapao.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	private Integer rv_no; // 리뷰번호
	private String rv_own_id; // 판매자_사업자
	private String rv_us_id; // 판매자_유저
	private String rv_buy_id; // 구매자
	private String rv_content; // 리뷰 내용
	private Integer rv_star; // 별점
	private Integer rv_state; // 리뷰상태
	private Date rv_regdate; // 등록 날짜
	private Date rv_outdate; // 삭제 날짜

}
