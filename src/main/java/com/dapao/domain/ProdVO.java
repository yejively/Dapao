package com.dapao.domain;

import java.sql.Date;

import lombok.Data;


@Data
public class ProdVO {
	
	private Integer prod_no;
	private String prod_name;
	private Integer prod_price;
	private String prod_con;
	private String prod_content;
	private String prod_cate;
	private String prod_img;
	private Integer prod_state;
	private Date prod_regdate;
	private Date prod_outdate;
	private String own_id;
}
