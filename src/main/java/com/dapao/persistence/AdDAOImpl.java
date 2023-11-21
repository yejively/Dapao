package com.dapao.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.dapao.domain.EntVO;
import com.dapao.domain.ExpVO;

@Repository(value = "AdDAO")
public class AdDAOImpl {
	
	private static final Logger logger = LoggerFactory.getLogger(AdDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.dapao.mapper.AdMapper";
	
	
	public List<ExpVO> modalShow() throws Exception{
		logger.debug("DAO : modalShow() 호출");
		return sqlSession.selectList(NAMESPACE+".modalShow");
	}
}
