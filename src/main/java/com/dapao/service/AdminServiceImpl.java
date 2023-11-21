package com.dapao.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dapao.domain.AcVO;
import com.dapao.domain.Criteria;
import com.dapao.domain.CsVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.ItemVO;
import com.dapao.domain.ProdVO;
import com.dapao.domain.ExpVO;
import com.dapao.domain.ReviewVO;
import com.dapao.domain.UserVO;
import com.dapao.persistence.AdminDAOImpl;

@Service(value = "AdminService")
public class AdminServiceImpl{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Inject
	private AdminDAOImpl adao;
	
	// 회원관리 - 개인유저정보 출력
	public UserVO userInfo(String us_id) throws Exception {
		logger.debug("service : userInfo(String us_id) 호출 ");
		return adao.userInfo(us_id);
	}
	
	// 회원관리 - 회원정지부여
	public int userStop(UserVO vo) throws Exception {
		logger.debug("service : userStop(UserVO vo) 호출 ");
		return adao.userStop(vo);
	}
	
	// 회원관리 - 회원정지(회원상태변경 0->1)
	public void userStateUpdate(String us_id) throws Exception {
		logger.debug("service : userStateUpdate(String us_id) 호출");
		adao.userStateUpdate(us_id);
	}
	
	// 회원관리 - 회원탈퇴(회원상태변경 0->2)
	public int userDelete(String us_id) throws Exception {
		logger.debug("service : userDelete(String us_id) 호출");
		return adao.userDelete(us_id);
	}
	
	// 회원관리 - 페이징처리 후 리스트조회
	public List<UserVO> getUserList(Criteria cri) throws Exception {
		return adao.getUserList(cri);
	}
	
	// 회원관리 - 전체회원수조회
	public int getUserCount(Criteria cri) throws Exception {
		return adao.getUserCount(cri);
	}
	
	// 사업자 관리 - 사업자정보 리스트
	public List<EntVO> ownerList(Criteria cri) throws Exception{
		logger.debug("service : ownerList() 호출");
		return adao.ownerList(cri);
	}
	
	// 사업자 관리 - 사업자 총개수 조회
	public int ownerCount(Criteria cri) throws Exception {
		logger.debug("service : ownerCount() 호출 ");
		return adao.ownerCount(cri);
	}
	
	// 사업자 관리 - 사업자 정보 출력
	public EntVO ownerInfo(String own_id) throws Exception {
		logger.debug("service : ownerInfo(String own_id) 호출 ");
		return adao.ownerInfo(own_id);
	}
  
	// 사업자 관리 - 사업자 정지
  	public int ownerStop(EntVO vo) throws Exception {
  		logger.debug("service : ownerStop(EntVO vo) 호출 ");
  		return adao.ownerStop(vo);
  	}
	
  	// 사업자 관리 - 사업자 승인
	public int ownerApprove(String own_id) throws Exception {
		logger.debug("service : ownerApprove(String own_id) 호출");
		return adao.ownerApprove(own_id);
	}
	
	// 사업자 관리 - 사업자 탈퇴
	public int ownerInfoDelete(String own_id) throws Exception {
		logger.debug("service : ownerInfoDelete(String own_id) 호출");
		return adao.ownerInfoDelete(own_id);
	}
	
	// FAQ&공지 관리 - cs 1개정보 출력
	public CsVO csInfo(Integer cs_no) throws Exception {
		logger.debug("service : csInfo(Integer cs_no) 호출");
		return adao.csInfo(cs_no);
	}
	
	// FAQ&공지 관리 - cs 정보 수정
	public int csInfoUpdate(CsVO vo) throws Exception {
		logger.debug("service : csInfoUpdate(CsVO vo) 호출");
		return adao.csInfoUpdate(vo);
	}
	
	// FAQ&공지 관리 - cs 등록
	public int csUpload(Integer cs_no) throws Exception {
		logger.debug("service : csUpload(Integer cs_no) 호출");
		return adao.csUpload(cs_no);
	}
	
	// FAQ&공지 관리 - cs 등록해제
	public int csRemove(Integer cs_no) throws Exception {
		logger.debug("service : csRemove(Integer cs_no) 호출");
		return adao.csRemove(cs_no);
	}
	
	// FAQ&공지 관리 - cs 삭제
	public int csDelete(Integer cs_no) throws Exception {
		logger.debug("service : csDelete(Integer cs_no) 호출");
		return adao.csDelete(cs_no);
	}
	
	// FAQ&공지 관리 - FAQ 리스트
	public List<CsVO> FAQList(Criteria cri) throws Exception {
		logger.debug("service : FAQList() 호출");
		return adao.FAQList(cri);
	}
	
	// FAQ&공지 관리 - FAQ 글쓰기
	public void FAQWrite(CsVO vo) throws Exception {
		logger.debug("service : FAQWrite() 호출");
		adao.FAQWrite(vo);
	}
	
	// FAQ&공지 관리 - FAQ 총 글개수 조회
	public int FAQCount(Criteria cri) throws Exception {
		logger.debug("service : FAQCount() 호출");
		return adao.FAQCount(cri);
	}
	
	//  FAQ&공지 관리 - notice 총 글개수 조회
	public int noticeCount(Criteria cri) throws Exception {
		logger.debug("service : noticeCount() 호출");
		return adao.noticeCount(cri);
	}
	
	//  FAQ&공지 관리 - notice 글 목록 리스트
	public List<CsVO> noticeList(Criteria cri) throws Exception {
		logger.debug("service : noticeList() 호출");
		return adao.noticeList(cri);
	}
	
	//  FAQ&공지 관리 - notice 글쓰기	
	public void noticeWrite(CsVO vo) throws Exception {
		logger.debug("service : noticeWrite(CsVO vo) 호출");
		adao.noticeWrite(vo);
	}
	
	// 리뷰관리 - 리뷰리스트
	public List<ReviewVO> reviewList(Criteria cri) throws Exception {
		logger.debug("service : reviewList(Criteria cri) 호출");
		return adao.reviewList(cri);
	}
	
	// 리뷰관리 - 리뷰 총 글개수 조회
	public int reviewCount(Criteria cri) throws Exception {
		logger.debug("service : reviewCount(Integer rv_no) 호출");
		return adao.reviewCount(cri);
	}
	
	// 리뷰관리 - 리뷰 1개정보 출력
	public ReviewVO reviewInfo(Integer rv_no) throws Exception {
		logger.debug("service : reviewInfo(Integer rv_no)호출");
		return adao.reviewInfo(rv_no);
	}
	
	// 리뷰관리 - 리뷰 삭제
	public int reviewDelete(Integer rv_no) throws Exception {
		logger.debug("service : reviewDelete(Integer rv_no)호출");
		return adao.reviewDelete(rv_no);
	}
  
	// 회원상품관리 - 총 상품 글개수 조회
	public int itemCount(Criteria cri) throws Exception {
		logger.debug("service : itemCount() 호출");
		return adao.itemCount(cri);
	}
	
	// 회원상품관리  - 회원상품 목록 리스트
	public List<ItemVO> itemList(Criteria cri) throws Exception {
		logger.debug("service : itemList(Criteria cri) 호출");
		return adao.itemList(cri);
	}
	
	// 회원상품관리 - 상품삭제(글내리기)
	public int itemDelete(Integer it_no) throws Exception {
		logger.debug("itemDelete(Integer it_no) 호출");
		return adao.itemDelete(it_no);
	}
	
	// 사업자상품관리 - 총 상품 글개수 조회
	public int prodCount(Criteria cri) throws Exception {
		logger.debug("service : prodCount() 호출");
		return adao.prodCount(cri);
	}
	
	// 사업자상품관리 - 사업자상품 목록 리스트
	public List<ProdVO> prodList(Criteria cri) throws Exception {
		logger.debug("service : prodList(Criteria cri) 호출");
		return adao.prodList(cri);
	}
	
	// 사업자상품관리 - 상품삭제(글내리기)
	public int prodDelete(Integer prod_no) throws Exception {
		logger.debug("service : prodDelete(Integer prod_no) 호출");
		return adao.prodDelete(prod_no);
	}

	// 신고관리 - 신고 리스트
	public List<AcVO> acList(Criteria cri) throws Exception {
		logger.debug("service : acList(Criteria cri) 호출");
		return adao.acList(cri);
	}
	
	// 신고관리 - 신고 총 개수 조회
	public int acCount(Criteria cri) throws Exception {
		logger.debug("service : acCount() 호출");
		return adao.acCount(cri);
	}
	
	// 신고관리 - 신고 1개 글 정보
	public AcVO acInfo(Integer ac_no) throws Exception {
		logger.debug("service : acInfo(Integer ac_no) 호출");
		return adao.acInfo(ac_no);
	}
	
	// 신고관리 - 신고 처리상태 업뎃(user 조회)
	public String acResultSelectUserId(AcVO vo) throws Exception {
		logger.debug("service : acResultSelectUserId(AcVO vo) 호출");
		return adao.acResultSelectUserId(vo);
	}
	
	// 신고관리 - 신고 처리상태 업뎃(user)
	public int acResultUserUpdate(AcVO acVo,String stop) throws Exception {
		logger.debug("service : acResultUserUpdate(AcVO acVo,String stop) 호출");
		return adao.acResultUserUpdate(acVo, stop);
	}
	
	//신고관리 - 신고 user 글 쓰기
	public int acUserWrite(AcVO vo) throws Exception {
		logger.debug("service : acUserWrite(AcVO vo) 호출");
		return adao.acUserWrite(vo);
	}
	
	//신고관리 - 신고 user 글 쓰기
	public int acOwnerWrite(AcVO vo) throws Exception {
		logger.debug("service : acOwnerWrite(AcVO vo) 호출");
		return adao.acOwnerWrite(vo);
	}
	
	// 신고관리 - us_id > us_nickname 조회
	public String getNickname(String us_id) throws Exception{
		logger.debug("service : getNickname(String us_id) 호출");
		return adao.getNickname(us_id);
	}
	
	// 체험단관리 - 체험단 리스트
	public List<ExpVO> expList(Criteria cri) throws Exception {
		logger.debug("service : expList(Criteria cri) 호출");
		return adao.expList(cri);
	}
	
	// 체험단관리 - 체험단 글개수 조회
	public int expCount(Criteria cri) throws Exception {
		logger.debug("service : expCount() 호출");
		return adao.expCount(cri);
	}
	
	// 체험단관리 - 체험단 글 1개 정보
	public ExpVO expInfo(Integer exp_no) throws Exception {
		logger.debug("service : expInfo(Integer exp_no)호출");
		return adao.expInfo(exp_no);
	}
	
	// 체험단관리 - 상태 업데이트
	public void expStateUpdate(Integer exp_no) throws Exception {
		logger.debug("service : expStateUpdate(Integer exp_no) 호출");
		adao.expStateUpdate(exp_no);
	}
	
	// 체험단관리 - 광고테이블 insert
	public int expAdInsert(String own_id, String ad_date) throws Exception {
		logger.debug("service : expAdInsert(String own_id, String ad_date) 호출");
		return adao.expAdInsert(own_id, ad_date);
	}
	
	// 체험단관리 - 반려 상태 업뎃
	public int expReturn(ExpVO vo) throws Exception {
		logger.debug("service : expReturn(Integer exp_no) 호출");
		return adao.expReturn(vo);
	}
	
	// 신고관리 - 신고취소
	public int acCancel(Integer ac_no) throws Exception{
		logger.debug("acCancel(Integer ac_no) 호출");
		return adao.acCancel(ac_no);
	}
}
