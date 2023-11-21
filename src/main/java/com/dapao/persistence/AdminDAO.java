package com.dapao.persistence;

import java.util.List;

import com.dapao.domain.EntVO;
import com.dapao.domain.UserVO;

public interface AdminDAO {
	
	// 사업자 정보 리스트
	public List<EntVO> ownerList() throws  Exception;
	
	// 회원관리 - 모든유저정보 출력
	public List<UserVO> getAllUser() throws Exception;
	
	// 회원관리 - 개인유저정보 출력
	public UserVO userInfo(String us_id) throws Exception;
	
	// 회원정보수정
	public int userInfoUpdate(UserVO vo) throws Exception;
}
