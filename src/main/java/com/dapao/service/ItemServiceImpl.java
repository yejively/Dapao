package com.dapao.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dapao.domain.AlarmVO;
import com.dapao.domain.EntVO;
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
import com.dapao.persistence.ItemDAOImpl;


@Service(value = "itemService")
public class ItemServiceImpl {
	
	

	private static final Logger logger = LoggerFactory.getLogger(ItemServiceImpl.class);
	
	@Inject
	private ItemDAOImpl idao;
	


	
	// 조회수 증가
	public int viewCnt(Integer it_no) {
		logger.debug("viewCnt(Integer it_no) 호출 ");
		return idao.viewCnt(it_no);
	}
	
	// 판매글 등록
	public int itemWrite(ItemVO itemVO) {
		logger.debug("itemWrite(ItemVO itemVO) 호출 ");
		return 	idao.itemWrite(itemVO);
		
	}
	
	// 판매글 등록 확인
	public int itemWriteCheck(String us_id) {
		logger.debug("itemWriteCheck(String us_id) 호출 ");
		return idao.itemWriteCheck(us_id);
	}
	
	// 파일 업로드
	public void insertFile(FileVO fileVO) {
		logger.debug("insertFile(FileVO fileVO) 호출 ");
		idao.insertFile(fileVO);
		
	}

	// 판매자 정보 조회 
	public UserVO sellerInfo(String sellerId) {
		logger.debug("sellerInfo(String sellerId) 호출");
		return idao.sellerInfo(sellerId);
		
	}

	
	// 판매자 리뷰 조회 
	public List<ReviewVO> sellerRv(ItemVO itemVO) {
		logger.debug("sellerRv(ItemVO itemVO) 호출");
		return idao.sellerRv(itemVO);
		
	}

	// 판매물품글 사진 조회 
	public List<FileVO> itemFile(Integer it_no) {
		
		logger.debug("itemFile(Integer it_no) 호출 ");
		return idao.itemFile(it_no);
		
	}
	
	
	// 판매물품글 대표사진 조회 
	public FileVO itemFileMain(Integer it_no) {
		
		logger.debug("itemFileMain(Integer it_no) 호출 ");
		return idao.itemFileMain(it_no);
		
	}
	
	// 판매물품글 대표사진 입력
	public int itemFileMainInsert(FileVO vo) {
		logger.debug("DAOImpl : itemFileMainInsert(FileVO vo) 호출");
		return idao.itemFileMainInsert(vo);
	}
	
	
	// 판매물건글 상세 
	public ItemVO itemDetail(Integer it_no) {
		
		logger.debug("itemDetail(Integer it_no) 호출 ");
		return idao.itemDetail(it_no);
		
	}
	
	// 찜 여부 확인
	public int itemLove(ItemVO itemLove) {
		
		logger.debug("itemLove() 호출");
		return idao.itemLove(itemLove);
	}
	
	// 찜 등록 
	public int itemLoveInsert(LoveVO loveVO) {
		
		logger.debug("itemLoveInsert(LoveVO loveVO) 호출");
		return idao.itemLoveInsert(loveVO);
		
	}

	// 찜수 확인
	public Integer loveCount(Integer it_no) {
		
		logger.debug("loveCount(Integer it_no) 호출");
		return idao.loveCount(it_no);
		
	}
	
	// 찜 삭제
	public int itemLoveDelete(LoveVO loveVO) {
		
		logger.debug("itemLoveDelete(LoveVO loveVO) 호출");
		return idao.itemLoveDelete(loveVO);
		
	}
	
	// 판매물품글 검색 조회 
	public List<ItemVO> itemSearch(String it_title) {
		
		logger.debug("itemSearch(String it_title) 호출");
		return idao.itemSearch(it_title);
		
	}
	
	// 판매물품글 카테고리 조회 
	public List<ItemVO> itemCate(String it_cate) {
		
		logger.debug("itemCate(String it_cate) 호출");
		return idao.itemCate(it_cate);
		
	}

	
	// 판매자 다른 물품
	public List<ItemVO> sellerItem(ItemVO itemVO) {
		logger.debug("sellerItem(ItemVO itemVO) 호출 ");
		return idao.sellerItem(itemVO);
	}

	// 비슷한 물건 조회(같은 카테고리)
	public List<ItemVO> sameCate(ItemVO item) {

		logger.debug("sameCate(ItemVO item) 호출 ");
		
		return idao.sameCate(item);
	}
	
	
	// 판매자 프로필
	public UserVO yourInfo(String us_id) {
		logger.debug("Service : yourInfo(String us_id) 호출");
		return idao.yourInfo(us_id);
	}

	
	// 판매자 판매 물품 목록
	public List<ItemVO> yourItem(String us_id) {
		logger.debug("Service : yourItem(String us_id) 호출");
		return idao.yourItem(us_id);
	}
	
	// 코인충전
	public int coinCharge(PayVO payVO) {
		logger.debug("Service : coinCharge(PayVO payVO) 호출");
		return idao.coinCharge(payVO);
		
	}
	
	// 코인충전 결제 내역
	public int coinChargePay(PayVO payVO) {
		logger.debug("Service : coinChargePay(PayVO payVO) 호출");
		return idao.coinChargePay(payVO);
		
	}
	
	// 코인충전 결제 내역
	public int userCoin(String us_id) {
		logger.debug("Service : userCoin(String us_id) 호출");
		return idao.userCoin(us_id);
	}
	
	
	// 아이템 구매시(코인 - 구매가격)
	public int purchase(UserVO purchaseVO) {
		logger.debug("Service : purchase(UserVO purchaseVO) 호출");
		return idao.purchase(purchaseVO);
		
	}
	
	// 글상태 변경 (판매중(0) -> 예약중(1))
	public int itStateChange(ItemVO itemVO) {
		logger.debug("Service : itStateChange(ItemVO itemVO) 호출");
		return idao.itStateChange(itemVO);
		
	}
	
	// 알람보내기 
	public int alarmSend(AlarmVO alarmVO) {
		logger.debug("Service : alarmSend(AlarmVO alarmVO) 호출");
		return idao.alarmSend(alarmVO);
		
	}
	
	// 알람리스트 출력 
	public List<AlarmVO> alarmList(String us_id) {
		logger.debug("Service : alarmList(String us_id) 호출");
		return idao.alarmList(us_id);
		
	}
	
	// 구매여부 확인 
	public TradeVO checkPur(Integer tr_no) {
		logger.debug("Service : checkPur(Integer tr_no) 호출");
		return idao.checkPur(tr_no);
		
	}
	// insert된 trade 테이블의 가장 최신 tr_no 조회
	public Integer getTr_no() {
		logger.debug("Service : getTr_no() 호출");
		return idao.getTr_no();
		
	}
	
	// 안전결제 후 거래 테이블에 입력
	public int itemTrade(TradeVO tradeVO) {
		logger.debug("Service : itemTrade(TradeVO tradeVO) 호출");
		return idao.itemTrade(tradeVO);
		
	}

	// 구매자가 취소버튼 클릭하는 경우
	public int userPurchaseCancle(Integer tr_no) {
		logger.debug("Service : userPurchaseCancle(Integer tr_no) 호출");
		return idao.userPurchaseCancle(tr_no);
		
	}
	
	// 판매자가 취소버튼 클릭하는 경우
	public int sellerPurchaseCancle(Integer tr_no) {
		logger.debug("Service : sellerPurchaseCancle(Integer tr_no) 호출");
		return idao.sellerPurchaseCancle(tr_no);
		
	}
	
	// 구매자가 취소버튼 클릭하는 경우 - 예약했지만 취소하는 경우이므로 판매자의 버튼 상태 알아오기
	public Integer sellerState(Integer tr_no) {
		logger.debug("Service : sellerState(Integer tr_no) 호출");
		return idao.sellerState(tr_no);
		
	}
	
	// 판매자가 취소버튼 클릭하는 경우 - 예약했지만 취소하는 경우이므로 구매자의 버튼 상태 알아오기
	public Integer buyerState(Integer tr_no) {
		logger.debug("Service : buyerState(Integer tr_no) 호출");
		return idao.buyerState(tr_no);
		
	}
	
	// 구매자가 구매확정하기 버튼을 클릭하는 경우
	public Integer userPurchase(Integer tr_no) {
		logger.debug("Service : userPurchase(Integer tr_no) 호출");
		return idao.userPurchase(tr_no);
		
	}
	
	// 판매자가 구매확정하기 버튼을 클릭하는 경우
	public Integer sellerPurchase(Integer tr_no) {
		logger.debug("Service : sellerPurchase(Integer tr_no) 호출");
		return idao.sellerPurchase(tr_no);
		
	}
	
	// 둘다 취소해서 돈을 돌려줌  or 둘다 구매확정해서 돈을 입금해줌
	public int itemCoinTo(UserVO userVO) {
		logger.debug("Service : itemCoinTo(UserVO userVO) 호출");
		return idao.itemCoinTo(userVO);
		
	}
	
	// 글상태 변경 (예약중 -> 판매중, 현재거래번호 -> 0)
	public int itemResellState(ItemVO itemVO) {
		logger.debug("Service : itemResellState(ItemVO itemVO) 호출");
		return idao.itemResellState(itemVO);
		
	}
	
	// 글상태 변경 (예약중 -> 판매완료)
	public int itemSoldoutState(ItemVO itemVO) {
		logger.debug("Service : itemSoldoutState(ItemVO itemVO) 호출");
		return idao.itemSoldoutState(itemVO);
		
	}

	// 예약이 취소되어 취소 Date를 Update
	public int tradeDateUpdate(Integer tr_no) {
		logger.debug("Service : tradeDateUpdate(Integer tr_no) 호출");
		return idao.tradeDateUpdate(tr_no);
		
	}
	
	// 판매자가 취소버튼을 눌러서 구매자의 정보 조회
	public UserVO buyerInfo(Integer tr_no) {
		logger.debug("Service : buyerInfo(Integer tr_no) 호출");
		return idao.buyerInfo(tr_no);
		
	}
	
	// 체험단 정보 조회
	public int getExpInfo(String own_id) {
		logger.debug("Service : getExpInfo(String own_id) 호출");
		return idao.getExpInfo(own_id);
		
	}

	// 체험단리스트에 목록 추가
	public int expApply(ExpusVO expusVO) {
		logger.debug("Service : expApply(ExpusVO expusVO) 호출");
		return idao.expApply(expusVO);
		
	}

	// 체험단 신청 인원 +1
	public int expCountUp(Integer exp_no) {
		logger.debug("Service : expCountUp(Integer exp_no) 호출");
		return idao.expCountUp(exp_no);
		
	}
	
	// 코인 환불
	public int coinRefund(UserVO refundVO) {
		logger.debug("Service : coinRefund(UserVO refundVO) 호출");
		return idao.coinRefund(refundVO);
		
	}
	
	// 상대방 리뷰
	public List<TotalVO> yourReview(String us_id) {
		logger.debug("Service : yourReview(String us_id) 호출");
		return idao.yourReview(us_id);
		
	}
	
	// 글 삭제
	public int itemDelete(Integer it_no) {
		logger.debug("Service : itemDelete(Integer it_no) 호출");
		return idao.itemDelete(it_no);
		
	}

	
}
