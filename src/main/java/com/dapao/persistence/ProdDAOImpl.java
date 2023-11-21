package com.dapao.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dapao.domain.EntVO;
import com.dapao.domain.PageVO;
import com.dapao.domain.ProdVO;

@Repository
public class ProdDAOImpl{
	
	private static final Logger logger = LoggerFactory.getLogger(ProdDAOImpl.class);
	
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.dapao.mapper.ProdMapper";
	public List<ProdVO> searchProd(PageVO vo) {
		logger.debug(" DAO->searchProd(ProdVO vo)호출 ");
		logger.debug(" sqlsession : "+sqlSession.selectList(NAMESPACE+".searchProd", vo));
		return sqlSession.selectList(NAMESPACE+".searchProd", vo);
	}
	
	public List<ProdVO> listProd(EntVO vo) {
		logger.debug(" DAO -> listProd(EntVO vo) 호출 ");
		return sqlSession.selectList(NAMESPACE+".listProd", vo);
	}

	public void updateProd(ProdVO vo) {
		logger.debug(" DAO -> updateProd(ProdVO vo) 호출 ");
		sqlSession.update(NAMESPACE+".updateProd", vo);
	}
	public void insertProd(ProdVO vo) {
		logger.debug(" DAO -> insertProd(ProdVO vo) 호출 ");
		sqlSession.insert(NAMESPACE+".insertProd", vo);
	}

	public int getProdList(String own_id) {
		logger.debug(" DAO -> getProdList() 호출 ");
		return sqlSession.selectOne(NAMESPACE+".getProdList",own_id);
	}

	public List<ProdVO> getListPage(PageVO vo) {
		logger.debug(" DAO -> getListPage(PageVO vo) 호출 ");
		
		return sqlSession.selectList(NAMESPACE+".listPage", vo);
	}
	
	
}
