package com.dapao.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapao.domain.AdVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.PageVO;
import com.dapao.domain.PayVO;
import com.dapao.domain.ProdVO;
import com.dapao.domain.ReviewVO;
import com.dapao.domain.TradeVO;
import com.dapao.persistence.EntDAOImpl;

@Service(value = "entService")
public class EntServiceImpl {

	private static final Logger logger = LoggerFactory.getLogger(EntServiceImpl.class);
	@Autowired
	private EntDAOImpl edao;

	public void entUpdate(EntVO vo) throws Exception {
		logger.debug(" service -> entUpdate(EntVO vo) 호출 ");
		edao.entUpdate(vo);

	}

	public EntVO listEnt(EntVO vo) throws Exception {
		logger.debug(" service listEnt() 호출 ");
		return edao.listEnt(vo);
	}

	public List<TradeVO> searchTrade(PageVO vo) throws Exception {
		logger.debug(" service listTrade(String own_id) 호출 ");
		return edao.searchTrade(vo);
	}

	public int searchTradeCount(PageVO vo) throws Exception {
		logger.debug(" service searchTradeCount(PageVO vo) 호출 ");
		return edao.searchTradeCount(vo);
	}

	public void refund(TradeVO vo) throws Exception {
		logger.debug(" service refund(TradeVO vo) 호출 ");
		edao.refund(vo);
	}

	public void tradeRefund(TradeVO vo) throws Exception {
		logger.debug(" service tradeRefund(TradeVO vo) 호출 ");
		edao.tradeRefund(vo);
	}

	public void entJoin(EntVO vo) throws Exception {
		logger.debug("컨트롤러 -> entJoin()서비스 호출");
		edao.entJoin(vo);

	}

	public EntVO entLogin(EntVO vo) throws Exception {
		logger.debug("컨트롤러 -> entLogin()서비스 호출");

		return edao.entLogin(vo);
	}

	// 휴대폰 인증
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) throws Exception {
		edao.certifiedPhoneNumber(userPhoneNumber, randomNumber);

	}

	// 아이디 중복확인
	public Integer checkId(String own_id) throws Exception {

		return edao.checkId(own_id);
	}

	// 정보조회
	public EntVO ownInfo(String own_id) throws Exception {
		logger.debug("컨트롤러 -> ownInfo()서비스 호출");
		return edao.ownInfo(own_id);
	}

	public List<ReviewVO> entReviewList(String own_id) throws Exception {
		logger.debug(" service -> entReviewList(String own_id) 호출 ");
		return edao.entReviewList(own_id);
	}

	public void purchase(Map map) throws Exception {
		logger.debug("service purchase(ProdVO vo) 호출 ");
		edao.purchase(map);
	}

	public void tradePurchase(String tr_no) throws Exception {
		logger.debug("service tradePurchase(String tr_no) 호출 ");
		edao.tradePurchase(tr_no);
	}
	
	// 비밀번호 변경
	public Integer changePw(EntVO vo) throws Exception {		
		logger.debug(" changePw(EntVO vo) 호출 ");
		return edao.changePw(vo);
	}

	// 홈페이지 광고 신청
	public void entAd(AdVO vo) throws Exception {
		logger.debug(" service  entAd(AdVO vo)");
		edao.entAd(vo);
	}

	// 코인충전
	public int coinCharge(PayVO payVO) {
		logger.debug("Service : coinCharge(PayVO payVO) 호출");
		return edao.coinCharge(payVO);

	}

	// 코인충전 결제
	public int coinChargePay(PayVO payVO) {
		logger.debug("Service : coinChargePay(PayVO payVO) 호출");
		return edao.coinChargePay(payVO);

	}

	// 코인충전 결제 내역
	public int entCoin(String own_id) {
		logger.debug("Service : entCoin(String us_id) 호출");
		return edao.entCoin(own_id);
	}	
	// 체험단 광고 유무
	public int entExpAd(String own_id) {
		logger.debug("service : entExpAd(String own_id) 호출 ");
		return edao.entExpAd(own_id);
	}
}
