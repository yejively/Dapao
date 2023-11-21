package com.dapao.controller;

import java.io.PrintWriter;
import java.security.Provider.Service;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dapao.domain.AcVO;
import com.dapao.domain.ItemVO;
import com.dapao.domain.LoveVO;
import com.dapao.domain.PayVO;
import com.dapao.domain.ReviewVO;
import com.dapao.domain.TradeVO;
import com.dapao.domain.UserVO;
import com.dapao.service.UserServiceImpl;



/**
 *    1. 공통URI (~.me 대신 폴더명) / 각 기능별 URI 설정
 *  2. 각 URI별 호출방식을 결정(GET/POST)
 *     GET : 정보 조회 / 정보 입력(view)
 *     POST : 정보 처리(DB)
 *  3. 처리결과와 리다이렉트 페이지 결정
 *  4. 예외처리
 *  
 * 
 * */

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
   
   
      private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
      
      
      
      @Inject
      private UserServiceImpl uService;
      
      //http://localhost:8088/user/userMain
      
      //http://localhost:8088/mypage/userInfo
      
   
      
  
   
         
      //http://localhost:8088/mypage/userInfo
      // 회원정보조회
      // 세션에서 아이디 정보 가져옴
      @RequestMapping(value = "/userInfo",method = RequestMethod.GET)
      public String infoGET(HttpSession session, Model model)throws Exception {
         logger.debug(" userInfoGET() 호출 ");
         
         // 사용자의 아이디정보 => 세션에 있는 정보 가져오기  1.infoGET( HttpSession session)
         String us_id = (String) session.getAttribute("us_id"); // 2.
         logger.debug(" us_id userInfo : " +us_id);
         
         UserVO resultVO =   uService.userInfo(us_id);
         logger.debug("resultVO userInfo123:"+ resultVO.getUs_pw());
         logger.debug("resultVO userInfo1234:"+ resultVO.getUs_name());
         model.addAttribute("infoVO", resultVO);
         
         return "/mypage/userInfo";
      }
         
         
    //회원정보 수정 GET방식 =--> update뷰페이지에 기존에 있던 데이터 보여주는것  1. get메서드 만들기 public String updateGET()  + 매핑 
      @RequestMapping(value = "/userInfoUpdate",method = RequestMethod.GET)
      public String updateGET(HttpSession session, Model model) {
         logger.debug(" userUpdateGET() 호출 ");
         
         // 2. 로그인한 회원 아이디 조회
         String us_id = (String) session.getAttribute("us_id");
         // 3. 그걸 바탕으로 서비스 ---> DAO 접근 --> DAO안에 회원정보 조회 동작 호출---> 그 정보를 뷰페이지로 전달하기위해 모델객체사용
         UserVO resultVO =  uService.userInfo(us_id); // --> 다음에 모델객체사용
         
         logger.debug(" resultVO!!!@@@@@@@@@@@@@@@@ : "+resultVO);
         model.addAttribute("vo", resultVO);
         
         // model.addAttribute(uService.userInfo(id));
         // => 이름 : userVO (리턴타입의 클래스 첫글자를 소문자로 변경)
   
         return "/mypage/userInfoUpdate";
      }
         
         
         
         
      // 회원정보 수정 POST 방식
      @RequestMapping(value = "/userInfoUpdate",method = RequestMethod.POST)
      public String userInfoUpdatePOST(UserVO userInfoUpdatevo, @RequestParam("us_pw1") String us_pw1, Model model ) {
         logger.debug(" userInfoUpdatePOST() 호출");
         
         // 수정할 정보를 저장(파라메터) public String updatePOST(UserVO vo)
         logger.debug("vo "+userInfoUpdatevo);
         logger.debug("us_pw 1@@@@@@@@@@@@@@@@@@@@@@@"+ us_pw1);
         logger.debug(userInfoUpdatevo.getUs_pw());
         //새 비밀번호 입력 입력확인
         if(userInfoUpdatevo.getUs_pw().equals(us_pw1)) {
        	 uService.userInfoUpdate(userInfoUpdatevo);
        	 // 메인페이지로 이동  	 
        	 return "redirect:/mypage/userInfo";
         }
         
         
         return "redirect:/mypage/userInfoUpdate";
         
         //서비스 -> DAO 회원정보 수정
      }
      
      
      //회원정보 탈퇴 아이디 패스워드 입력받고 확실한 경우에만 삭제 가능 GET
      @RequestMapping(value = "/userDelete",method=RequestMethod.GET)
      public String userDeleteGET() {
         logger.debug("userDeleteGET() 호출");
         //로그인제어 (생략)
         
         
         
         return "/mypage/userDelete";
      }
      
      
      // 회원정보 탈퇴 POST
      @RequestMapping(value = "/userDelete",method=RequestMethod.POST)
      public String userDeletePOST(UserVO userDeletevo, HttpSession session) {
         logger.debug("userDeletePOST() 호출");
         //로그인제어 (생략)
         // 전달정보를 저장하자(아이디, 비밀번호)
         String us_id = (String)session.getAttribute("us_id");
         userDeletevo.setUs_id(us_id);
         
         logger.debug("vo : "+userDeletevo);
         
         // 서비스 --> DAO 회원정보 탈퇴 메서드
      int result =    uService.userDelete(userDeletevo);
         
         // 페이지 이동(결과에 따른 이동)
         if(result == 1) { //삭제성공 --> 로그링ㄴ세션도 같이 제거 해야함
         session.invalidate();
            return "redirect:/user/userMain";
         }
         // 삭제 실패(result == 0)
         return "redirect:/mypage/userDelete";
      }
     
      
      
      // 1102 추가
      //http://localhost:8088/mypage/userSellList
      // 마이페이지 내 판매글 보기
      @RequestMapping(value = "/userSellList", method = RequestMethod.GET)
      public void userSellList(HttpSession session, Model model) throws Exception{
      
          // 세션 아이디 확인
         String us_id = (String)session.getAttribute("us_id");
         logger.debug(" us_id : " +us_id);
         
           List<ItemVO> resultVO =   uService.userSellList(us_id);
         logger.debug("resultVO"+resultVO);
   
         model.addAttribute("userSellList", resultVO);
         
         /*
       * List<ItemVO> userSellList = null; userSellList =
       * uService.userSellList(us_id); model.addAttribute("userSellList",
       * userSellList);
       */
      
      }
      
      
      //마이페이지 내가 쓴 리뷰 목록
      @RequestMapping(value = "/userReview",method = RequestMethod.GET)
      public void userReview(HttpSession session, Model model)throws Exception{
         
         String rv_buy_id = (String)session.getAttribute("us_id");
         logger.debug(" us_id  : " + rv_buy_id);
         
         List<ReviewVO> resultVO = uService.userReview(rv_buy_id);
         logger.debug("resultVO" + resultVO);
         
         model.addAttribute("userReview", resultVO);
         
      }
      
      //마이페이지 내가 찜한 목록
     //http://localhost:8088/mypage/userLoveList
      @RequestMapping(value = "/userLoveList",method = RequestMethod.GET)
      public void userLoveList(HttpSession session,Model model) throws Exception{
         
         String us_id = (String)session.getAttribute("us_id");
         logger.debug(" us_id  : "+us_id);
         List<LoveVO> resultVO = uService.userLoveList(us_id);
         logger.debug(" resultVO  : "+resultVO);
         model.addAttribute("userLoveList", resultVO);
      }
      
      
      //마이페이지 대나무페이 충전목록
      // http://localhost:8088/mypage/userBuyCoin
      @RequestMapping(value = "/userBuyCoin",method = RequestMethod.GET)
      public void userBuyCoin(HttpSession session, Model model)throws Exception {
    	  
    	  String us_id = (String)session.getAttribute("us_id");
    	  logger.debug("us_id  : "+us_id);
    	  List<PayVO> resultVO = uService.userBuyCoin(us_id); 
    	  logger.debug("resultVO  :" + resultVO);
    	  model.addAttribute("userBuyCoin", resultVO);
    	  
      }
      
      // 마이페이지 내 구매목록
      // http://localhost:8088/mypage/userBuyList
      @RequestMapping(value = "/userBuyList", method = RequestMethod.GET)
      public void userBuyList(HttpSession session, Model model) throws Exception{
    	  
    	  String us_id = (String)session.getAttribute("us_id");
    	  logger.debug("us_id   :" +us_id);
    	  List<TradeVO> resultVO = uService.userBuyList(us_id);
    	  logger.debug("result VO : " + resultVO);
    	  model.addAttribute("userBuyList", resultVO);
    	  
      }
      
      //마이페이지 내 신고목록
      // http://localhost:8088/mypage/userCs
      @RequestMapping(value = "/userCs",method = RequestMethod.GET)
      public void userCs(HttpSession session, Model model) throws Exception{
    	  
    	  String us_id = (String)session.getAttribute("us_id");
    	  logger.debug("us_id  : " +us_id);
    	  List<AcVO> resultVO = uService.userCs(us_id);
    	  logger.debug("resultVO : " + resultVO);
    	  model.addAttribute("userCs", resultVO);
      }
      
      
      
 }
      
      
      
      
      
      
      
      
      