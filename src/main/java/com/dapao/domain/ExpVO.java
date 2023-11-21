package com.dapao.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class ExpVO {
	
	private Integer exp_no;
	private String exp_title;
	private String exp_content;
	private Integer exp_psn;
	private Integer exp_psn_ch;
	private String exp_notice;
	private Date exp_regdate;
	private String own_id;
	private Integer exp_state;
	
	private List<EntVO> entList;
}
