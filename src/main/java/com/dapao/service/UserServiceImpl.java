package com.dapao.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dapao.domain.AcVO;
import com.dapao.domain.AdVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.ItemVO;
import com.dapao.domain.LoveVO;
import com.dapao.domain.PayVO;
import com.dapao.domain.ReviewVO;
import com.dapao.domain.TotalVO;
import com.dapao.domain.TradeVO;
import com.dapao.domain.UserVO;

import com.dapao.persistence.UserDAOImpl;




@Service(value = "userService")

public class UserServiceImpl {

      private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
   // BoardDAO 객체 주입
   @Inject
   private UserDAOImpl udao;
   
// 메인 시작      
   // 인기가게(광고) 목록
   
   public List<EntVO> adList() {
      logger.debug("adList() 호출");
      
      return udao.adList();
   }
   
   // 중고물품 글 목록
   
   public List<ItemVO> itemList() {
      logger.debug("itemList() 호출");
      
      return udao.itemList();
   }
   
   // 찜 목록
   
   public List<TotalVO> loveList(String us_id) {
      logger.debug("loveList(String us_id) 호출");
      
      return udao.loveList(us_id);
   }
// 메인 끝   
   
   
   public UserVO userLogin(UserVO loginVO) {
      logger.debug("컨트롤러 호출로 DAO 메서드를 호출하겠다.");
      UserVO resultVO = udao.userLogin(loginVO);
      
      logger.debug("DAO의 처리 결과를 컨트롤러로 전달하겠다.");      
      return resultVO;
   }

   // 회원 정보 조회
   
   public UserVO userInfo(String us_id) {
      logger.debug("userInfo(String id)  호출");   //4번
      //디비동착 (DAO)에서 회원정보 조회
      udao.userInfo(us_id); // 위에서 받은 정보를 여기로 전달 5번
         
      return udao.userInfo(us_id);
      
   }

   
   // 회원정보 수정
   public void userInfoUpdate(UserVO userInfoUpdateVO) {
      logger.debug("userInfoUpdate(userInfoUpdateVo) 호출");
      
      udao.userInfoUpdate(userInfoUpdateVO);
      
   }


   // 회원탈퇴
   
      public int userDelete(UserVO deleteVO) {
         logger.debug("userDelete(deleteVO) 호출");
         int result =    udao.userDelete(deleteVO);
         
         return result;
      }
      
      
      
      
   // 회원가입
   public void userJoin(UserVO joinVO) {
      logger.debug("userJoin(joinVO) 호출"); 
      
      udao.userJoin(joinVO);
      
   }

   
   
   public UserVO userCheckId(String us_id) {
      logger.debug("userCheckId(String id)  호출");
      
      UserVO resultVO =   udao.userCheckId(us_id); 
      return resultVO;
   }
   
   
   
   
   // 마이페이지 내 판매글 조회
   
   public List<ItemVO> userSellList(String us_id) {
logger.debug("sellList(String us_id) 호출");
      
      return udao.userSellList(us_id);
      
   }
   
   //마이페이지 내 리뷰 목록 조회
   public List<ReviewVO> userReview(String rv_buy_id){
      logger.debug("rv_buy_id  :  "+ rv_buy_id);
      return udao.userReview(rv_buy_id);
   }
   
   
   // 아이디 찾기 
   public String userFindId(UserVO vo) {
      logger.debug("userFindId(String us_id) 호출");   //4번
      //디비동착 (DAO)에서 회원정보 조회
      udao.userFindId(vo); // 위에서 받은 정보를 여기로 전달 5번
         
      return udao.userFindId(vo);
      
   }

   // 마이페이지 내찜 목록 조회
   public List<LoveVO> userLoveList(String us_id){
      logger.debug("us_id  : "+us_id);
      return udao.userLoveList(us_id);
   }
   
   // 마이페이지 대나무페이 결제 목록
   public List<PayVO> userBuyCoin(String us_id){
	   logger.debug("pay_id  :" +us_id);
	   return udao.userBuyCoin(us_id);
   }
  
   //마이페이지 내 구매목록
   public List<TradeVO> userBuyList(String us_id){
	   logger.debug("us _id : "+us_id);
	   return udao.userBuyList(us_id);
   }
   
   // 마이페이지 내 신고목록
   public List<AcVO> userCs(String us_id){
	   logger.debug("us_id  :" + us_id);
	   return udao.userCs(us_id);
   }
   
   //비밀번호 찾기
   public String userFindPw(UserVO vo) {
	   logger.debug("userFindPw(String us_pw)  호출");
	   
	   return udao.userFindPw(vo);
   }
   
   
}