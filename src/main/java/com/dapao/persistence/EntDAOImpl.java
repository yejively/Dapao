package com.dapao.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dapao.domain.AdVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.PageVO;
import com.dapao.domain.PayVO;
import com.dapao.domain.ProdVO;
import com.dapao.domain.ReviewVO;
import com.dapao.domain.TradeVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Repository(value = "entDAO")
public class EntDAOImpl {

	private static final Logger logger = LoggerFactory.getLogger(EntDAOImpl.class);
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.dapao.mapper.EntMapper";

	public void entUpdate(EntVO vo) throws Exception {
		logger.debug(" DAO -> EntUpdate(EntVO vo) 호출 ");
		sqlSession.update(NAMESPACE + ".entUpdate", vo);
	}

	public EntVO listEnt(EntVO vo) throws Exception {
		logger.debug(" DAO listEnt(String own_id) 호출 ");
		return sqlSession.selectOne(NAMESPACE + ".listEnt", vo);
	}

	public List<TradeVO> searchTrade(PageVO vo) throws Exception {
		logger.debug("DAO listTrade(String own_id) 호출 ");
		return sqlSession.selectList(NAMESPACE + ".searchTrade", vo);
	}

	public int searchTradeCount(PageVO vo) throws Exception {
		logger.debug(" DAO searchTradeCount(PageVO vo) 호출 ");
		return sqlSession.selectOne(NAMESPACE + ".searchTradeCount", vo);
	}

	// 구매 환불
	public void refund(TradeVO vo) throws Exception {
		logger.debug(" DAO refund(TradeVO vo) 호출 ");
		sqlSession.delete(NAMESPACE + ".refund", vo);
	}

	// 환불 확정
	public void tradeRefund(TradeVO vo) throws Exception {
		logger.debug(" DAO refund(TradeVO vo) 호출 ");
		sqlSession.delete(NAMESPACE + ".tradeRefund", vo);
	}

	public void entJoin(EntVO vo) throws Exception {
		logger.debug("DAOImpl entJoin() 실행 ");
		sqlSession.insert(NAMESPACE + ".entJoin", vo);

	}

	public EntVO entLogin(EntVO vo) throws Exception {
		logger.debug("DAOImpl entLogin() 실행");

		return sqlSession.selectOne(NAMESPACE + ".entLogin", vo);
	}

	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) throws Exception {
		String api_key = "NCSGDCUBZEFNPZLV";
		String api_secret = "I17GY2WCK9VFSXGOIWUIHIA55VTEHNLS";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", userPhoneNumber); // 수신전화번호
		params.put("from", "010-3186-8926"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "[Dapao] 인증번호는" + "[" + randomNumber + "]" + "입니다."); // 문자 내용 입력
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}

	}

	public Integer checkId(String own_id) throws Exception {

		return sqlSession.selectOne(NAMESPACE + ".checkId", own_id);
	}

	public EntVO ownInfo(String own_id) throws Exception {
		logger.debug("DAOImpl ownInfo() 실행");

		return sqlSession.selectOne(NAMESPACE + ".ownInfo", own_id);
	}

	public List<ReviewVO> entReviewList(String own_id) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".entReviewList", own_id);
	}

	// 제품 구매
	public void purchase(Map map) throws Exception {
		logger.debug(" purchase(ProdVO vo) 실행 ");
		int result = sqlSession.insert(NAMESPACE + ".purchase", map);
		if (result != 1) {
			logger.debug(" 구매 실패 ");
			return;
		}

	}

	// 구매 확정
	public void tradePurchase(String tr_no) throws Exception {
		logger.debug(" tradePurchase(String tr_no) 호출 ");
		sqlSession.update(NAMESPACE + ".tradePurchase", tr_no);

	}

	// 홈페이지 광고 신청
	public void entAd(AdVO vo) throws Exception {
		logger.debug(" entAd(AdVO vo) 호출 ");
		sqlSession.insert(NAMESPACE + ".entAd", vo);
	}

	// 코인충전
	public int coinCharge(PayVO payVO) {
		logger.debug("DAOImpl : coinCharge(PayVO payVO) 호출");
		return sqlSession.update(NAMESPACE + ".coinCharge", payVO);

	}

	// 코인 충전 결제
	public int coinChargePay(PayVO payVO) {
		logger.debug("DAOImpl : coinChargePay(PayVO payVO) 호출");
		return sqlSession.update(NAMESPACE + ".coinChargePay", payVO);

	}
	// 코인 가격 검색
	public int entCoin(String own_id) {
		logger.debug("DAOImpl : entCoin(String own_id) 호출");
		return sqlSession.selectOne(NAMESPACE + ".entCoin", own_id);
		
	}

	
	// 비밀번호 변경
	public Integer changePw(EntVO vo) throws Exception {		
		logger.debug(" changePw(EntVO vo) 호출 ");
		return sqlSession.update(NAMESPACE+".changePw", vo);
	}
	
	
	// 체험단 광고 유무
	public int entExpAd(String own_id) {
		logger.debug("DAOImpl : entExpAd(String own_id)");
		return sqlSession.selectOne(NAMESPACE + ".entExpAd", own_id);
	}

}
