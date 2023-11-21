package com.dapao.persistence;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

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


@Repository(value = "userDAO")

public class UserDAOImpl  {
   
   

   private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);
   
   @Inject
   private SqlSessionFactory sqlFactroy;
   
   @Inject
   private SqlSession sqlSession;
   
   //==> 디비연결정보 있음(연결 , 해제 자동)
   
   private static final String NAMESPACE
   = "com.dapao.mapper.UserMapper";
   
   
   // 현재시간 

   public String getTime() {
      //디비연결
      SqlSession sqlSession 
           = sqlFactroy.openSession();
      
      //SQL작성 & pstmt객체
      //SQL실행
      String time 
       = sqlSession.selectOne("com.dapao.mapper.userMapper.getTime");
      
      return time;
   }

   
   // 메인
   // 인기가게(광고) 목록
   
   public List<EntVO> adList() {
      logger.debug("adList() 호출");
      
      return sqlSession.selectList(NAMESPACE + ".adList");
   }
   
   // 중고거래 글 목록 
   
   public List<ItemVO> itemList() {
      logger.debug("itemList() 호출");
      
      return sqlSession.selectList(NAMESPACE + ".itemList");
   }
   
   // 찜 목록
   
   public List<TotalVO> loveList(String us_id) {
      logger.debug("loveList(String us_id) 호출");
      
      return sqlSession.selectList(NAMESPACE + ".loveList",us_id);
   }
   
   // 회원가입
   
   public void userJoin(UserVO joinVO) {
      // 디비연결-O      
      // SQL작성(Mapper)-O      
      //SQL실행(Mapper 호출)
      //sqlSession.insert(SQL구문);
      //sqlSession.insert(SQL구문,SQL전달할 정보);
      
      sqlSession.insert(NAMESPACE + ".userJoin", joinVO);
      
      
   }


   
   // 회원 로그인
   
   public UserVO userLogin(UserVO loginVO) {
      System.out.println(" DAOImpl : userLogin() 실행 ");
      System.out.println(" DAOImpl : 해당 SQL구문 실행 ");
      
      UserVO resultVO
         =sqlSession.selectOne(NAMESPACE + ".userLogin",loginVO);   
      
      System.out.println(" DAOImpl : 결과 "+resultVO);
      
      return resultVO;
   }
   


   // 회원 정보 조회(마이페이지)
   
   public UserVO userInfo(String us_id) {
      System.out.println(" DAOImpl : getUser(String sessionUserid) 호출 ");
      
      return sqlSession.selectOne(NAMESPACE + ".userInfo",us_id);
   }

   
   // 회원정보 수정
      
      public void userInfoUpdate(UserVO userInfoUpdateVO) {
         System.out.println(" DAOImpl : userInfoUpdate(UserVO userInfoUpdateVO) 호출");
         
         // SQL구문 호출
         sqlSession.update(NAMESPACE + ".userInfoUpdate", userInfoUpdateVO);
         
         System.out.println(" DAOImpl : 수정완료! ");
         
      }


      // 회원 탈퇴
   
      public int userDelete(UserVO deleteVO) {
         System.out.println(" DAOImpl : 탈퇴 ");
         
         // 정상   -  0  /   정지 -  1   /  탈퇴2  
         // SQL구문 호출      
         return sqlSession.delete(NAMESPACE + ".userDelete",deleteVO);
      }
      
   
   
   // 아이디 중복확인
   
    public UserVO userCheckId(String us_id) {
     System.out.println(" DAOImpl : getUser(String sessionus_id) 호출 "); return
     sqlSession.selectOne(NAMESPACE + ".userCheckId",us_id); }
    
    

   // 마이페이지 내 판매글 조회
      
      public List<ItemVO> userSellList(String us_id) {
         
         return sqlSession.selectList(NAMESPACE+".userSellList",us_id);
      }



      // 마이페이지 내 리뷰 목록 조회
   public List<ReviewVO> userReview(String rv_buy_id){
      logger.debug("us_id"+rv_buy_id);
      return sqlSession.selectList(NAMESPACE+".userReview", rv_buy_id);
      
      
      
   }

    // 아이디 찾기 
   public String userFindId(UserVO vo) {
      System.out.println(" DAOImpl : getuserFindId vo "+ vo);
      
      return sqlSession.selectOne(NAMESPACE + ".userFindId",vo);
   }

      //마이페이지에서 내찜 목록 조회
   public List<LoveVO> userLoveList(String us_id){
      logger.debug("us_id  :  "+us_id);
      return sqlSession.selectList(NAMESPACE+".userLoveList", us_id);
   }
   
   
   // 마이페이지에서 대나무페이 목록 조회
   public List<PayVO> userBuyCoin(String us_id){
	   logger.debug("us_id  : " + us_id);
	   return sqlSession.selectList(NAMESPACE+".userBuyCoin", us_id);
   }
   
   
   //마이페이지에서 내 구매목록 조회
   public List<TradeVO> userBuyList(String us_id){
	   logger.debug("us_id : "+us_id);
	   return sqlSession.selectList(NAMESPACE+".userBuyList", us_id);
   }
   
   // 마이페이지 내 신고목록 조회
   public List<AcVO> userCs(String us_id){
	   logger.debug("us_id  :" + us_id);
	   return sqlSession.selectList(NAMESPACE+".userCs", us_id );
   }
   
   // 비밀번호 찾기
   public String userFindPw(UserVO vo) {
	   System.out.println("DAOImpl : getuserFindPw vo " + vo);
	   
	   return sqlSession.selectOne(NAMESPACE+".userFindPw",vo);
   }
   
   
}