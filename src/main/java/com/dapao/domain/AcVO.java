package com.dapao.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class AcVO {
	
	private Integer ac_no; // 신고번호
	private String us_id; // 신고자 아이디
	private String ac_own_id; // 피신고자_사업자
	private String ac_us_id; // 피신고자_유저
	private String ac_cate; // 신고사유
	private String ac_content; // 신고내용
	private Integer ac_item; // 상품번호
	private Date ac_regdate; // 신고일
	private Integer ac_state; // 신고상태
	private String ac_result; // 처리결과 
	

}
