package com.dapao.service;

import java.util.List;

import com.dapao.domain.AdVO;
import com.dapao.domain.ItemVO;
import com.dapao.domain.LoveVO;
import com.dapao.domain.UserVO;


public interface UserService {

		
		// 메인
			// 인기가게 목록
			public AdVO adList();
			
			// 중고거래 목록
			public ItemVO itemList();
			
			// 찜 목록 조회
			public LoveVO loveList(String us_id);
	
		
		// 회원가입 및 로그인
			// 회원가입 동작 실행
			public void userJoin(UserVO joinVO);
			
			// 로그인 체크 동작
			public UserVO userLogin(UserVO loginVO);
			
			// 회원정보 조회 동작 3번
			public UserVO userInfo(String id); 
			
			// 회원정보 수정
		    public void userupdate(UserVO updateVO);
		    
		    // 회원정보 삭제
		    public int userDelete(UserVO deleteVO);


	
	
	
}
