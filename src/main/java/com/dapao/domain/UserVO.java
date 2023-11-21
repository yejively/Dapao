package com.dapao.domain;



import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import lombok.Data;
@Data
public class UserVO {/*UserDTO*/

	    
	//  user 회원
	
	private String us_id; // 아이디(16자 제한)
	private String us_pw; // 비밀번호(20자 제한)
	private String us_name; // 이름(실명)
	private String us_nickname; // 닉네임(8자 제한)
	private String us_img; // 프로필 사진
	private String us_tel; // 전화번호
	private String us_email; // 이메일
	private String us_addr; // 주소
	private Integer us_coin; // 페이금액(기본값 0)
	private String us_blog; // 블로그 주소
	private String us_instar; // 인스타 주소
	private Date us_regdate; // 가입일    
	private Date us_outdate; // 탈퇴일
	private Integer us_state; // 회원 상태 (0-정상 / 1-정지 / 2-탈퇴)
	private String us_stopdate; // 정지 기간(해당 기간 동안 기능 사용x)
	private Integer us_account; // 신고 누적 횟수(기본값 0)
	private Integer us_stop; // 정지 횟수(기본값 0)

//	private ItemVO itemvo; // itemvo
//	private List<ReviewVO> reviewList; // List<ReviewVO>
	
}
