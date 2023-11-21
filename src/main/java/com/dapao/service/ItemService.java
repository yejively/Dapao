package com.dapao.service;

import java.util.List;

import com.dapao.domain.ItemVO;

// 서비스 : 비지니스 로직을 구현하는 부분
// => 사용자 요구사항에 맞는 동작을 구현 
// => !!컨트롤러와 DAO를 연결하는 다리!!
// => 컨트롤러의 영속성 계층(DAO)의 종속적인 상황을 막아준다.
public interface ItemService {

	
	// 실제로 구현해야 하는 기능 정의
	
	// 판매글 조회
	public ItemVO itemDetail(Integer it_bno);

}
