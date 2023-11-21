package com.dapao.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapao.domain.Criteria;
import com.dapao.domain.CsVO;
import com.dapao.persistence.CsDAOImpl;

@Service(value="csService")
public class CsServiceImpl {

	private static final Logger logger = LoggerFactory.getLogger(CsServiceImpl.class);
	
	@Autowired
	private CsDAOImpl cdao;

	// 회원이보는 공지사항리스트 수
	public int userNoticeCount() throws Exception{
		return cdao.userNoticeCount();
	}
		
	// 회원이보는 공지사항리스트
	public List<CsVO> userNoticeList(Criteria cri) throws Exception{
		return cdao.userNoticeList(cri);
	}
	
	// 공지사항 조회수 1증가
	public int notiViewUp(Integer cs_no) throws Exception{
		return cdao.notiViewUp(cs_no);
	}
	
	// 회원이 공지사항 클릭시 공지사항상세페이지
	public CsVO userNotice(Integer cs_no) throws Exception{
		return cdao.userNotice(cs_no);
	}
	
	// 회원이보는 faq리스트 수
	public int userFAQCount() throws Exception{
		return cdao.userFAQCount();
	}
	
	// 회원이보는 faq리스트
	public List<CsVO> userFAQList(Criteria cri) throws Exception{
		return cdao.userFAQList(cri);
	}
	
	// 사업자가보는 공지사항리스트 수
	public int ownNoticeCount() throws Exception{
		return cdao.ownNoticeCount();
	}
		
	// 사업자가보는 공지사항리스트
	public List<CsVO> ownNoticeList(Criteria cri) throws Exception{
		return cdao.ownNoticeList(cri);
	}
	
	// 회원이보는 faq리스트 수
	public int ownFAQCount() throws Exception{
		return cdao.ownFAQCount();
	}
	
	// 회원이보는 faq리스트
	public List<CsVO> ownFAQList(Criteria cri) throws Exception{
		return cdao.ownFAQList(cri);
	}

	

}
