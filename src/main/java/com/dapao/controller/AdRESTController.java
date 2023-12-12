package com.dapao.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dapao.domain.EntVO;
import com.dapao.domain.ExpVO;
import com.dapao.service.AdServiceImpl;

@RestController
@RequestMapping("/ad")
public class AdRESTController {

	private static final Logger logger = LoggerFactory.getLogger(AdRESTController.class);
	
	@Inject
	private AdServiceImpl adService;
	
	// 메인체험단 공고 - 출력문
	@RequestMapping("/modalShow")
	public List<ExpVO> modalShow() throws Exception{
		List<ExpVO> exp = new ArrayList<ExpVO>();
		logger.debug("exp : "+exp);
		return adService.modalShow();
	}
	
	
	
}
