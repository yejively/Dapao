package com.dapao.persistence;

import java.util.List;

import com.dapao.domain.AdVO;
import com.dapao.domain.ItemVO;
import com.dapao.domain.LoveVO;
import com.dapao.domain.UserVO;



public interface UserDAO {

	// 디비서버 시간정보 조회기능
	public String getTime();	
	
	
	// 메인
		// 인기가게 목록
		public AdVO adList();
		
		// 중고거래 목록
		public ItemVO itemList();
		
		// 찜 목록 조회
		public LoveVO loveList(String us_id);
			
			
	// 회원가입 및 로그인	
		// 회원가입기능 
		public void userJoin(UserVO joinVO);
		
		// 로그인 기능
		public UserVO userLogin(UserVO loginVO);
		
	
		
		// 회원정보 조회
		public UserVO userInfo(String sessionUserid);
		
		// 회원정보 수정
		public void  userUpdate(UserVO updateVO);
		
		// 회원 탈퇴
		public int userDelete(UserVO delVO);
		

	
}
