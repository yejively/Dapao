package com.dapao.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dapao.domain.Criteria;
import com.dapao.domain.CsVO;

@Repository(value="csDAO")
public class CsDAOImpl {
	
	private static final Logger logger = LoggerFactory.getLogger(CsDAOImpl.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.dapao.mapper.CsMapper";
	
	// 회원이보는 공지사항리스트 수
	public int userNoticeCount() throws Exception{
		logger.debug("userNticeCount() 호출");
		return sqlSession.selectOne(NAMESPACE+".userNoticeCount");
	}
		
	// 회원이보는 공지사항리스트
	public List<CsVO> userNoticeList(Criteria cri) throws Exception{
		logger.debug("userNoticeList() 호출");
		return sqlSession.selectList(NAMESPACE+".userNoticeList", cri);
	}
	
	// 공지사항 조회수 1증가
	public int notiViewUp(Integer cs_no) throws Exception{
		return sqlSession.update(NAMESPACE+".notiViewUp", cs_no);
	}
	
	// 회원이 공지사항 클릭시 공지사항상세페이지
	public CsVO userNotice(Integer cs_no) throws Exception{
		return sqlSession.selectOne(NAMESPACE+".userNotice", cs_no);
	}
	
	// 회원이보는 faq리스트 수
	public int userFAQCount() throws Exception{
		logger.debug("userFAQCount() 호출");
		return sqlSession.selectOne(NAMESPACE+".userFAQCount");
	}
	
	// 회원이보는 faq리스트
	public List<CsVO> userFAQList(Criteria cri) throws Exception{
		logger.debug("userFAQList() 호출");
		return sqlSession.selectList(NAMESPACE+".userFAQList", cri);
	}
	
	// 사업자가보는 공지사항리스트 수
	public int ownNoticeCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE+".ownNoticeCount");
	}
		
	// 사업자가보는 공지사항리스트
	public List<CsVO> ownNoticeList(Criteria cri) throws Exception{
		return sqlSession.selectList(NAMESPACE+".ownNoticeList", cri);
	}
	
	// 사업자가보는 faq리스트 수
	public int ownFAQCount() throws Exception{
		logger.debug("ownFAQCount() 호출");
		return sqlSession.selectOne(NAMESPACE+".ownFAQCount");
	}
	
	// 사업자가보는 faq리스트
	public List<CsVO> ownFAQList(Criteria cri) throws Exception{
		logger.debug("ownFAQList() 호출");
		return sqlSession.selectList(NAMESPACE+".ownFAQList", cri);
	}

	
}
