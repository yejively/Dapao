package com.dapao.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class TotalVO {
	
	private Integer ac_no; // 신고번호
	//private Integer us_id; // 신고자 아이디
	private String ac_own_id; // 피신고자_사업자
	private String ac_us_id; // 피신고자_유저
	private String ac_cate; // 신고사유
	private String ac_content; // 신고내용
	private Integer ac_item; // 상품번호
	private Date ac_regdate; // 신고일
	private Integer ac_state; // 신고상태
	private String ac_result; // 처리결과 
	
	
	private Integer ad_no; // 광고번호
	//private String own_id; // 사업자 아이디
	private Integer ad_board; // 광고 종류
	private Integer ad_state; // 등록 상태
	private Integer ad_view; // 조회수 
	private Date ad_regdate; // 게시일
	private Date ad_update; // 수정일
	private Date ad_upload; // 업로드 기간
	
	private Integer cs_no;
	private String cs_title;
	private String cs_content;
	private Integer cs_group;
	private Integer cs_board;
	private Integer cs_state;
	private Integer cs_view;
	private Date cs_regdate;
	private Date cs_update;
	
	private String own_id; // 아이디
	private String own_name; // 이름
	private String own_pw; // 비밀번호
	private String own_tel; //전화번호
	private String own_email; //이메일
	private Integer own_state; // 사업자 상태 
	private String ent_name; // 가게 상호명
	private String ent_cate; // 가게 업종
	private String ent_addr; // 가게 주소
	private String ent_mo; // 통신판매업
	private String ent_file; // 사업자등록증
	private String ent_of; // 기타서류
	private String ent_notice; // 공지사항
	private String ent_info; // 가게소개
	private String ent_img; // 가게 이미지
	private String ent_time; // 가게 운영시간
	private Integer ent_account; // 신고 누적 횟수
	private Integer ent_stop; // 정지 횟수
	
	
	private Integer exp_list_no;
	private Integer exp_no;
	//private String own_id;
	//private String us_id;
	private String exp_blog;
	private String exp_instar;
	private Date exp_regdate;
	
	//private Integer exp_no;
	private String exp_title;
	private String exp_content;
	private Integer exp_psn;
	private Integer exp_psn_ch;
	private String exp_notice;
	private Date ent_regdate;
	//private String own_id;
	
	//private Integer it_no; //  판매글 번호 : 가지고 다니기 때문에 Integer 추천
	//private String us_id; // 회원 아이디
	
	private String it_title; // 글 제목
	private Integer it_price; // 상품 가격
	private String it_content; // 상품 설명
	private Integer it_view; // 글 조회수
	private String it_con; // 상품 상태
	private String it_cate; // 상품 카테고리
	private Integer it_state; // 글 상태
	private Date it_regdate; // 글 등록시간
	private Date it_outdate; // 글 삭제시간
	private Integer it_love; // 상품 찜수
	private String it_img; // 상품 사진
	
	private Integer lo_no; // 찜 번호
	private Integer it_no; // 판매글 번호
	//private String us_id; // 구매자 아이디 
	
	private Integer prod_no;
	private String prod_name;
	private String prod_price;
	private String prod_con;
	private String prod_content;
	private String prod_cate;
	private String prod_img;
	//private String own_id;
	
	
	private Integer rv_no; // 리뷰번호
	private String rv_own_id; // 판매자_사업자
	private String rv_us_id; // 판매자_유저
	private String rv_buy_id; // 구매자
	private String rv_content; // 리뷰 내용
	private Integer rv_star; // 별점
	private Integer rv_state; // 리뷰상태
	private Date rv_regdate; // 등록 날짜
	private Date rv_outdate; // 삭제 날짜
	
	private Integer tr_no;
	private String tr_sell_ent;
	private String tr_sell_us;
	private String tr_buy;
	private Integer tr_prod;
	private Integer tr_item;
	private Integer tr_price;

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

}
