package com.dapao.persistence;

import com.dapao.domain.ItemVO;

public interface ItemDAO {
	
	// 판매글 조회 기능
	public ItemVO itemDetail(Integer it_bno);

}
