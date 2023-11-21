package com.dapao.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ExpusVO {
	
	private Integer exp_us_no; // 체험단 글 번호
	private Integer exp_no; // 체험단 번호
	private String own_id; // 사업자 아이디
	private String us_id; // 유저 아이디
	private String exp_blog; // 유저 블로그 글
	private String exp_instar; // 유저 인스타 글 
	private Date exp_regdate; // 글 등록 일자 

}
