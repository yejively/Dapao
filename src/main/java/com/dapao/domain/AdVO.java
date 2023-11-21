package com.dapao.domain;




import java.util.Date;

import lombok.Data;

@Data
public class AdVO {
	
	private Integer ad_no; // 광고번호
	private String own_id; // 사업자 아이디
	private Integer ad_board; // 광고 종류
	private Integer ad_state; // 등록 상태
	private Integer ad_view; // 조회수 
	private Date ad_regdate; // 게시일
	private Date ad_update; // 수정일
	private Date ad_upload; // 업로드 기간

}
