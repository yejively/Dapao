package com.dapao.domain;

import java.sql.Date;
import lombok.Data;


@Data
public class AlarmVO { /* itemDTO */
	
	private Integer al_no; //  알람글 번호 
	private String us_id; // 회원 아이디
	private String al_reciver_id; // 알람을 받을 회원 아이디
	private String al_content; // 알람 내용
	private String al_con; // 글 상태(읽음 안읽음)
	private Date al_regdate; // 글 등록시간
	

}
