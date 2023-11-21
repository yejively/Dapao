package com.dapao.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.dapao.domain.AlarmVO;
import com.dapao.domain.ExpVO;
import com.dapao.domain.ExpusVO;
import com.dapao.domain.FileVO;
import com.dapao.domain.ItemVO;
import com.dapao.domain.LoveVO;
import com.dapao.domain.PayVO;
import com.dapao.domain.ReviewVO;
import com.dapao.domain.TotalVO;
import com.dapao.domain.TradeVO;
import com.dapao.domain.UserVO;

@Repository(value = "itemDAO")
public class ItemDAOImpl{

	private static final Logger logger = LoggerFactory.getLogger(ItemDAOImpl.class);
	
	// 디비연결객체 정보를 주입
	@Inject
	private SqlSessionFactory sqlFactory;
	
	@Inject
	private SqlSession sqlSession;
	// => 디비연결정보 있음(연결, 해제 자동)
	
	private static final String NAMESPACE
	= "com.dapao.mapper.ItemMapper";
	
	
	// 조회수 증가 
	public int viewCnt(Integer it_no) {
		logger.debug("DAOImpl : viewCnt(Integer it_no) 호출");
		
		return sqlSession.insert(NAMESPACE + ".viewCnt", it_no);
	}
	
	// 판매글 작성
	public int itemWrite(ItemVO itemVO) {
		logger.debug("DAOImpl : itemWrite(ItemVO itemVO) 호출");
		
		return sqlSession.insert(NAMESPACE + ".itemWrite", itemVO);
	}
	
	//판매글 작성 후 확인
	public int itemWriteCheck(String us_id) {
		logger.debug("DAOImpl : itemWriteCheck(String us_id) 호출");
		
		return sqlSession.selectOne(NAMESPACE + ".itemWriteCheck", us_id);
	}

	// 파일 업로드
	public void insertFile(FileVO fileVO) {
		logger.debug("DAOImpl : insertFile(ItemVO itemVO) 호출");
		
		sqlSession.insert(NAMESPACE + ".insertFile", fileVO);
	}
	
	// 판매자 정보 조회 
	public UserVO sellerInfo(String sellerId) {
		logger.debug("DAOImpl : sellerInfo(String sellerId) 호출");
		return sqlSession.selectOne(NAMESPACE + ".sellerInfo", sellerId);
		
	}
	
	// 판매자 리뷰 조회 
	public List<ReviewVO> sellerRv(ItemVO itemVO) {
		logger.debug("DAOImpl : sellerRv(ItemVO itemVO) 호출");
		return sqlSession.selectList(NAMESPACE + ".sellerRv", itemVO);
		
	}
	
	// 판매물품글 사진 조회 
	public List<FileVO> itemFile(Integer it_no) {
		logger.debug("DAOImpl : itemFile(Integer it_no) 호출");
		return sqlSession.selectList(NAMESPACE + ".itemFile", it_no);
		
	}
	
	// 판매물품글 대표사진 조회 
	public FileVO itemFileMain(Integer it_no) {
		logger.debug("DAOImpl : itemFileMain(Integer it_no) 호출");
		return sqlSession.selectOne(NAMESPACE + ".itemFileMain", it_no);
		
	}
	
	// 판매물품글 대표사진 입력
	public int itemFileMainInsert(FileVO vo) {
		logger.debug("DAOImpl : itemFileMainInsert(FileVO vo) 호출");
		return sqlSession.update(NAMESPACE + ".itemFileMainInsert", vo);
	}
	
	// 판매물품글 조회 
	public ItemVO itemDetail(Integer it_no) {
		logger.debug("DAOImpl : itemDetail(Integer it_no) 호출");
		return sqlSession.selectOne(NAMESPACE + ".itemDetail", it_no);
		
	}

	// 찜 여부 확인
	public int itemLove(ItemVO itemLove) {
		logger.debug("itemLove(ItemVO itemLove) 호출");
		return sqlSession.selectOne(NAMESPACE + ".itemLove", itemLove );
	}
	
	// 찜수 확인
	public Integer loveCount(Integer it_no) {
		logger.debug("DAOImpl : loveCount(Integer it_no) 호출");
		return sqlSession.selectOne(NAMESPACE + ".loveCount", it_no);
		
	}
	
	// 찜 등록
	public int itemLoveInsert(LoveVO loveVO) {
		
		logger.debug("itemLoveInsert(LoveVO loveVO) 호출");
		return sqlSession.insert(NAMESPACE + ".itemLoveInsert", loveVO );
		
	}
	
	// 찜 삭제
	public int itemLoveDelete(LoveVO loveVO) {
		
		logger.debug("itemLoveDelete(LoveVO loveVO) 호출");
		return sqlSession.delete(NAMESPACE + ".itemLoveDelete", loveVO );
		
	}
	
	// 판매물품글 검색 조회 
	public List<ItemVO> itemSearch(String it_title) {
		logger.debug("DAOImpl : itemSearch(String search) 호출");
		return sqlSession.selectList(NAMESPACE + ".itemSearch", it_title);
		
	}
	
	// 판매물품글 카테고리 조회 
	public List<ItemVO> itemCate(String it_cate) {
		logger.debug("DAOImpl : itemCate(String it_cate) 호출");
		return sqlSession.selectList(NAMESPACE + ".itemCate", it_cate);
		
	}
	

	
	// 판매자 다른 물품
	public List<ItemVO> sellerItem(ItemVO itemVO) {
		logger.debug("DAOImpl : sellerItem(ItemVO itemVO) 호출");
		return sqlSession.selectList(NAMESPACE + ".sellerItem", itemVO);
	}

	// 비슷한 물품 조회(같은 카테고리)
	public List<ItemVO> sameCate(ItemVO itemVO) {
		logger.debug("DAOImpl : sameCate(ItemVO itemVO) 호출");
		return sqlSession.selectList(NAMESPACE + ".sameCate", itemVO);
	}
	
	// 판매자 프로필
	public UserVO yourInfo(String us_id) {
		logger.debug("DAOImpl : yourInfo(String us_id) 호출");
		return sqlSession.selectOne(NAMESPACE + ".yourInfo", us_id);
	}

	
	// 판매자 판매 물품 목록
	public List<ItemVO> yourItem(String us_id) {
		logger.debug("DAOImpl : yourItem(String us_id) 호출");
		return sqlSession.selectList(NAMESPACE + ".yourItem", us_id);
	}
	
	// 코인충전
	public int coinCharge(PayVO payVO) {
		logger.debug("DAOImpl : coinCharge(PayVO payVO) 호출");
		return sqlSession.update(NAMESPACE + ".coinCharge", payVO);
		
	}
	
	// 코인 충전 결제 내역
	public int coinChargePay(PayVO payVO) {
		logger.debug("DAOImpl : coinChargePay(PayVO payVO) 호출");
		return sqlSession.update(NAMESPACE + ".coinChargePay", payVO);
		
	}

	// 코인 가격 불러오기
	public int userCoin(String us_id) {
		logger.debug("DAOImpl : userCoin(String us_id) 호출");
		return sqlSession.selectOne(NAMESPACE + ".userCoin", us_id);
		
	}
	
	// 아이템 구매시(코인 - 구매가격)
	public int purchase(UserVO purchaseVO) {
		logger.debug("DAOImpl : purchase(UserVO purchaseVO) 호출");
		return sqlSession.update(NAMESPACE + ".purchase", purchaseVO);
		
	}
	
	// 글상태 변경 (판매중(0) -> 예약중(1), 현재 거래 번호 업데이트)
	public int itStateChange(ItemVO itemVO) {
		logger.debug("DAOImpl : itStateChange(ItemVO itemVO) 호출");
		return sqlSession.update(NAMESPACE + ".itStateChange", itemVO);
		
	}
	
	// 알람보내기 
	public int alarmSend(AlarmVO alarmVO) {
		logger.debug("DAOImpl : alarmSend(AlarmVO alarmVO) 호출");
		return sqlSession.insert(NAMESPACE + ".alarmSend", alarmVO);
		
	}
	
	// 알람리스트 출력
	public List<AlarmVO> alarmList(String us_id) {
		logger.debug("DAOImpl : alarmList(String us_id) 호출");
		return sqlSession.selectList(NAMESPACE + ".alarmList", us_id);
		
	}
	
	// 구매여부 확인(trade에서 한개의 글 정보 불러오기)
	public TradeVO checkPur(Integer tr_no) {
		logger.debug("DAOImpl : checkPur(Integer tr_no) 호출");
		return sqlSession.selectOne(NAMESPACE + ".checkPur", tr_no);
		
	}
	
	// insert된 trade 테이블의 가장 최신 tr_no 조회
	public Integer getTr_no() {
		logger.debug("DAOImpl : getTr_no() 호출");
		return sqlSession.selectOne(NAMESPACE + ".getTr_no");
		
	}
	
	// 안전결제 후 거래 테이블에 입력
	public int itemTrade(TradeVO tradeVO) {
		logger.debug("DAOImpl : itemTrade(TradeVO tradeVO) 호출");
		return sqlSession.insert(NAMESPACE + ".itemTrade", tradeVO);
		
	}

	// 구매자가 취소하기 버튼을 클릭하는 경우
	public int userPurchaseCancle(Integer tr_no) {
		logger.debug("DAOImpl : userPurchaseCancle(Integer tr_no) 호출");
		return sqlSession.update(NAMESPACE + ".userPurchaseCancle", tr_no);
		
	}
	
	// 판매자가 취소하기 버튼을 클릭하는 경우
	public int sellerPurchaseCancle(Integer tr_no) {
		logger.debug("DAOImpl : sellerPurchaseCancle(Integer tr_no) 호출");
		return sqlSession.update(NAMESPACE + ".sellerPurchaseCancle", tr_no);
		
	}
	
	// 구매자가 구매확정하기 버튼을 클릭하는 경우
	public int userPurchase(Integer tr_no) {
		logger.debug("DAOImpl : userPurchase(Integer tr_no) 호출");
		return sqlSession.update(NAMESPACE + ".userPurchase", tr_no);
		
	}
	
	// 판매자가 구매확정하기 버튼을 클릭하는 경우
	public int sellerPurchase(Integer tr_no) {
		logger.debug("DAOImpl : sellerPurchase(Integer tr_no) 호출");
		return sqlSession.update(NAMESPACE + ".sellerPurchase", tr_no);
		
	}
	
	// 구매자가 취소버튼 클릭하는 경우 - 예약했지만 취소하는 경우이므로 판매자의 버튼 상태 알아오기
	public Integer sellerState(Integer tr_no) {
		logger.debug("DAOImpl : sellerState(Integer tr_no) 호출");
		return sqlSession.selectOne(NAMESPACE + ".sellerState", tr_no);
		
	}
	
	// 판매자가 취소버튼 클릭하는 경우 - 예약했지만 취소하는 경우이므로 구매자의 버튼 상태 알아오기
	public Integer buyerState(Integer tr_no) {
		logger.debug("DAOImpl : buyerState(Integer tr_no) 호출");
		return sqlSession.selectOne(NAMESPACE + ".buyerState", tr_no);
		
	}
	
	// 둘다 취소해서 돈을 돌려줌 or 둘다 구매확정해서 돈을 입금해줌
	public int itemCoinTo(UserVO userVO) {
		logger.debug("DAOImpl : itemCoinTo(UserVO userVO) 호출");
		return sqlSession.update(NAMESPACE + ".itemCoinTo", userVO);
		
	}

	// 글상태 변경 (예약중 -> 판매중, 현재 거래번호 -> 0)
	public int itemResellState(ItemVO itemVO) {
		logger.debug("DAOImpl : itemResellState(ItemVO itemVO) 호출");
		return sqlSession.update(NAMESPACE + ".itemResellState", itemVO);
		
	}
	
	// 글상태 변경 (예약중 -> 판매완료 )
	public int itemSoldoutState(ItemVO itemVO) {
		logger.debug("DAOImpl : itemSoldoutState(ItemVO itemVO) 호출");
		return sqlSession.update(NAMESPACE + ".itemSoldoutState", itemVO);
		
	}
	
	// 예약이 취소되어 취소 Date를 Update
	public int tradeDateUpdate(Integer tr_no) {
		logger.debug("DAOImpl : tradeDateUpdate(Integer tr_no) 호출");
		return sqlSession.update(NAMESPACE + ".tradeDateUpdate", tr_no);
		
	}
	
	// 판매자가 취소버튼을 눌러서 구매자의 정보 조회
	public UserVO buyerInfo(Integer tr_no) {
		logger.debug("DAOImpl : buyerInfo(Integer tr_no) 호출");
		return sqlSession.selectOne(NAMESPACE + ".buyerInfo", tr_no);
		
	}
	
	// 체험단 정보 조회
	public int getExpInfo(String own_id) {
		logger.debug("DAOImpl : getExpInfo(String own_id) 호출");
		return sqlSession.selectOne(NAMESPACE + ".getExpInfo", own_id);
		
	}
	
	
	// 체험단리스트에 목록 추가
	public int expApply(ExpusVO expusVO) {
		logger.debug("DAOImpl : expApply(ExpusVO expusVO) 호출");
		return sqlSession.insert(NAMESPACE + ".expApply", expusVO);
		
	}
	
	// 체험단 신청 인원 +1
	public int expCountUp(Integer exp_no) {
		logger.debug("DAOImpl : expCountUp(Integer exp_no) 호출");
		return sqlSession.update(NAMESPACE + ".expCountUp", exp_no);
		
	}
	
	// 코인 환불
	public int coinRefund(UserVO refundVO) {
		logger.debug("DAOImpl : coinRefund(UserVO refundVO) 호출");
		return sqlSession.update(NAMESPACE + ".coinRefund", refundVO);
		
	}
	
	// 상대방 리뷰
	public List<TotalVO> yourReview(String us_id) {
		logger.debug("DAOImpl : yourReview(String us_id) 호출");
		return sqlSession.selectList(NAMESPACE + ".yourReview", us_id);
		
	}
	
	// 글 삭제
	public int itemDelete(Integer it_no) {
		logger.debug("DAOImpl : itemDelete(Integer it_no) 호출");
		return sqlSession.update(NAMESPACE + ".itemDelete", it_no);
		
	}
	
	
	
	

}
