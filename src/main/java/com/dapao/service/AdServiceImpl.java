package com.dapao.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dapao.domain.EntVO;
import com.dapao.domain.ExpVO;
import com.dapao.persistence.AdDAOImpl;

@Service(value = "AdService")
public class AdServiceImpl {
	
	private static final Logger logger = LoggerFactory.getLogger(AdServiceImpl.class);
	
	@Inject
	private AdDAOImpl addao;

	public List<ExpVO> modalShow() throws Exception{
		logger.debug("service : modalShow() 호출");
		return addao.modalShow();
	}
}
