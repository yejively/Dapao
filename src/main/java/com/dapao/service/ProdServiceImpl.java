package com.dapao.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapao.domain.EntVO;
import com.dapao.domain.PageVO;
import com.dapao.domain.ProdVO;
import com.dapao.persistence.ProdDAOImpl;

@Service
public class ProdServiceImpl implements ProdService{
	
	private static final Logger logger = LoggerFactory.getLogger(ProdServiceImpl.class);
	@Autowired
	private ProdDAOImpl pdao;
	public List<ProdVO> searchProd(PageVO vo) throws Exception{
		logger.debug(" service searchProd(PageVO vo) 호출 ");
		return pdao.searchProd(vo);
	}
	
	public List<ProdVO> listProd(EntVO vo) {
		logger.debug(" service listProd(EntVO vo) 호출 ");
		return pdao.listProd(vo);
	}

	public void updateProd(ProdVO vo) throws Exception {
		logger.debug(" updateProd(ProdVO vo) 호출 ");
		pdao.updateProd(vo);
	}
	public void insertProd(ProdVO vo) throws Exception {
		logger.debug(" insertPord(ProdVO vo) 호출 ");
		pdao.insertProd(vo);
	}

	public int getProdList(String own_id) throws Exception {
		logger.debug(" getProdList(String own_id) 호출 ");
		return pdao.getProdList(own_id);
	}

	public List<ProdVO> getListPage(PageVO vo) throws Exception {
		logger.debug("  getListPage(ProdVO vo) 호출 ");
		return pdao.getListPage(vo);
	}
	
}
