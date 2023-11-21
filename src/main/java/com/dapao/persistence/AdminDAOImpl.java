package com.dapao.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.dapao.domain.AcVO;
import com.dapao.domain.Criteria;
import com.dapao.domain.CsVO;
import com.dapao.domain.EntVO;
import com.dapao.domain.ItemVO;
import com.dapao.domain.ProdVO;
import com.dapao.domain.ExpVO;
import com.dapao.domain.ReviewVO;
import com.dapao.domain.UserVO;

@Repository(value = "AdminDAO")
public class AdminDAOImpl{

	// 디비연결객체 정보를 주입
	private static final Logger logger = LoggerFactory.getLogger(AdminDAOImpl.class);

	@Inject
	private SqlSessionFactory sqlFactory;
	// => 디비연결정보만 가지고 있음(연결 수동)

	@Inject
	private SqlSession sqlSession;
	// => 디비연결정보 있음(연결,해제 자동)

	private static final String NAMESPACE = "com.dapao.mapper.AdminMapper";

	// 회원관리 - 개인유저정보 출력
	public UserVO userInfo(String us_id) throws Exception {
		logger.debug("DAO : userInfo(us_id) 호출");
		return sqlSession.selectOne(NAMESPACE + ".userInfo", us_id);
	}

	// 회원관리 - 회원정지부여
	public int userStop(UserVO vo) throws Exception {
		logger.debug("DAO : userStop(String us_id, String us_stopdate) 호출");
		return sqlSession.update(NAMESPACE + ".userStop", vo);
	}

	// 회원관리 - 회원정지(회원상태변경 0->1)
	public void userStateUpdate(String us_id) throws Exception {
		logger.debug("DAO : userStateUpdate(String us_id) 호출");
		sqlSession.update(NAMESPACE + ".userStateUpdate", us_id);
	}

	// 회원관리 - 회원탈퇴(회원상태변경 0->2)
	public int userDelete(String us_id) throws Exception {
		logger.debug("DAO : userDelete(String us_id) 호출");
		return sqlSession.update(NAMESPACE + ".userDelete", us_id);
	}

	// 회원관리 - 페이징 처리 후 회원 수 조회
	public List<UserVO> getUserList(Criteria cri) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".userListCri", cri);
	}

	// 회원관리 - 전체회원수 조회
	public int getUserCount(Criteria cri) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".userCount",cri);
	}

	// 사업자 관리 - 사업자정보 리스트
	public List<EntVO> ownerList(Criteria cri) throws Exception {
		logger.debug(" DAO : ownerList() 호출");
		return sqlSession.selectList(NAMESPACE + ".ownerList", cri);
	}

	// 사업자 관리 - 사업자 정보 출력
	public EntVO ownerInfo(String own_id) throws Exception {
		logger.debug("DAO : ownerInfo(String own_id) 호출");
		return sqlSession.selectOne(NAMESPACE + ".ownerInfo", own_id);
	}

	// 사업자 관리 - 사업자 승인
	public int ownerApprove(String own_id) throws Exception {
		logger.debug("DAO : ownerApprove(String own_id) 호출");
		return sqlSession.update(NAMESPACE + ".ownerApprove", own_id);
	}

	// 사업자 관리 - 사업자 탈퇴
	public int ownerInfoDelete(String own_id) throws Exception {
		logger.debug("DAO : ownerInfoDelete(String own_id) 호출");
		return sqlSession.update(NAMESPACE + ".ownerInfoDelete", own_id);
	}
	
	// 사업자 관리 - 사업자 총개수 조회
	public int ownerCount(Criteria cri) throws Exception {
		logger.debug(" DAO : ownerList() 호출");
		return sqlSession.selectOne(NAMESPACE + ".ownerCount",cri);
	}

	// 사업자 관리 - 사업자 정지
	public int ownerStop(EntVO vo) throws Exception {
		logger.debug("DAO : ownerStop(EntVO vo) 호출");
		return sqlSession.update(NAMESPACE + ".ownerStop", vo);
	}

	// FAQ&공지 관리 - notice 총 글개수 조회
	public int noticeCount(Criteria cri) throws Exception {
		logger.debug("DAO : noticeCount() 호출");
		return sqlSession.selectOne(NAMESPACE + ".noticeCount",cri);
	}

	// FAQ&공지 관리 - notice 글 목록 리스트
	public List<CsVO> noticeList(Criteria cri) throws Exception {
		logger.debug("DAO : noticeList() 호출");
		return sqlSession.selectList(NAMESPACE + ".noticeList", cri);
	}

	// FAQ&공지 관리 - notice 글쓰기
	public void noticeWrite(CsVO vo) throws Exception {
		logger.debug("DAO : noticeWrite()  호출");
		sqlSession.insert(NAMESPACE + ".noticeWrite", vo);
	}
	
	// FAQ&공지 관리 - cs 등록
	public int csUpload(Integer cs_no) throws Exception {
		logger.debug("DAO : csUpload(Integer cs_no) 호출");
		return sqlSession.update(NAMESPACE + ".csUpload", cs_no);
	}

	// FAQ&공지 관리 - cs 등록해제
	public int csRemove(Integer cs_no) throws Exception {
		logger.debug("DAO : csRemove(Integer cs_no) 호출");
		return sqlSession.update(NAMESPACE + ".csRemove", cs_no);
	}

	// FAQ&공지 관리 - cs 삭제
	public int csDelete(Integer cs_no) throws Exception {
		logger.debug("DAO : csDelete(Integer cs_no)  호출");
		return sqlSession.delete(NAMESPACE + ".csDelete", cs_no);
	}
	
	// FAQ&공지 관리 - cs 1개정보 출력
	public CsVO csInfo(Integer cs_no) throws Exception {
		logger.debug("DAO : csInfo(Integer cs_no)  호출");
		return sqlSession.selectOne(NAMESPACE + ".csInfo", cs_no);
	}

	// FAQ&공지 관리 - cs 정보 수정
	public int csInfoUpdate(CsVO vo) throws Exception {
		logger.debug("DAO : csInfoUpdate(CsVO vo)  호출");
		return sqlSession.update(NAMESPACE + ".csInfoUpdate", vo);
	}
	
	// FAQ&공지 관리 - FAQ 리스트
	public List<CsVO> FAQList(Criteria cri) throws Exception {
		logger.debug("DAO : FAQList() 호출");
		return sqlSession.selectList(NAMESPACE + ".FAQList", cri);
	}

	// FAQ&공지 관리 - FAQ 글쓰기
	public void FAQWrite(CsVO vo) throws Exception {
		logger.debug("DAO : FAQWrite()  호출");
		sqlSession.insert(NAMESPACE + ".FAQWrite", vo);
	}

	// FAQ&공지 관리 - FAQ 총 글개수 조회
	public int FAQCount(Criteria cri) throws Exception {
		logger.debug("DAO : FAQCount()  호출");
		return sqlSession.selectOne(NAMESPACE + ".FAQCount",cri);
	}

	// 리뷰관리 - 리뷰리스트
	public List<ReviewVO> reviewList(Criteria cri) throws Exception {
		logger.debug("DAO : reviewList(Criteria cri) 호출");
		return sqlSession.selectList(NAMESPACE + ".reviewList", cri);
	}

	// 리뷰관리 - 리뷰 총 글개수 조회
	public int reviewCount(Criteria cri) throws Exception {
		logger.debug("DAO : reviewCount(Integer rv_no) 호출");
		return sqlSession.selectOne(NAMESPACE + ".reviewCount", cri);
	}

	// 리뷰관리 - 리뷰 1개정보 출력
	public ReviewVO reviewInfo(Integer rv_no) throws Exception {
		logger.debug("DAO : reviewInfo(Integer rv_no) 호출");
		return sqlSession.selectOne(NAMESPACE + ".reviewInfo", rv_no);
	}

	// 리뷰관리 - 리뷰 삭제
	public int reviewDelete(Integer rv_no) throws Exception {
		logger.debug("DAO : reviewDelete(Integer rv_no) 호출");
		return sqlSession.update(NAMESPACE + ".reviewDelete", rv_no);
	}
	
	// 회원상품관리 - 총 상품 글개수 조회
	public int itemCount(Criteria cri) throws Exception {
		logger.debug("itemCount() 호출");
		return sqlSession.selectOne(NAMESPACE+".itemCount",cri);
	}
	
	// 회원상품관리  - 회원상품 목록 리스트
	public List<ItemVO> itemList(Criteria cri) throws Exception {
		logger.debug("itemList(Criteria cri) 호출");
		return sqlSession.selectList(NAMESPACE+".itemList", cri);
	}
	
	// 회원상품관리 - 상품삭제(글내리기)
	public int itemDelete(Integer it_no) throws Exception {
		logger.debug("itemDelete(Integer it_no)");
		return sqlSession.update(NAMESPACE+".itemDelete", it_no);
	}
	
	// 사업자상품관리 - 총 상품 글개수 조회
	public int prodCount(Criteria cri) throws Exception {
		logger.debug("prodCount() 호출");
		return sqlSession.selectOne(NAMESPACE+".prodCount",cri);
	}
	
	// 사업자상품관리  - 사업자상품 목록 리스트
	public List<ProdVO> prodList(Criteria cri) throws Exception {
		logger.debug("prodList(Criteria cri) 호출");
		return sqlSession.selectList(NAMESPACE+".prodList", cri);
	}
	
	// 회원상품관리 - 상품삭제(글내리기)
	public int prodDelete(Integer prod_no) throws Exception {
		logger.debug("prodDelete(Integer prod_no)");
		return sqlSession.update(NAMESPACE+".prodDelete", prod_no);
	}
	
	// 신고관리 - 신고 리스트
	public List<AcVO> acList(Criteria cri) throws Exception {
		logger.debug("DAO : acList(Criteria cri) 호출");
		return sqlSession.selectList(NAMESPACE+".acList", cri);
	}
	
	// 신고관리 - 신고 총 개수 조회
	public int acCount(Criteria cri) throws Exception {
		logger.debug("DAO : acCount() 호출");
		return sqlSession.selectOne(NAMESPACE+".acCount", cri);
	}
	
	// 신고관리 - 신고 1개 글 정보
	public AcVO acInfo(Integer ac_no) throws Exception {
		logger.debug("DAO : acInfo(Integer ac_no) 호출");
		return sqlSession.selectOne(NAMESPACE+".acInfo", ac_no);
	}
	
	// 신고관리 - 신고 처리상태 업뎃(user 조회)
	public String acResultSelectUserId(AcVO vo) throws Exception {
		logger.debug("DAO : acResultSelectUserId(AcVO vo) 호출");
		return sqlSession.selectOne(NAMESPACE+".acResultSelectUserId", vo);
	}
	
	// 신고관리 - 신고 처리상태 업뎃(user)
	public int acResultUserUpdate(AcVO acVo,String stop) throws Exception {
		logger.debug("DAO : acResultOwnerUpdate(AcVO acVo,String stop) 호출");
		Map<String, Object> vo = new HashMap<String, Object>();
		vo.put("acVo", acVo);
		vo.put("stop", stop);
		return sqlSession.update(NAMESPACE+".acResultUserUpdate", vo);
	}
	
	//신고관리 - 신고 user 글 쓰기
	public int acUserWrite(AcVO vo) throws Exception {
		logger.debug("DAO :  acUserWrite(AcVO vo) 호출");
		return sqlSession.insert(NAMESPACE+".acUserWrite",vo);
	}
	
	//신고관리 - 신고 owner 글 쓰기
	public int acOwnerWrite(AcVO vo) throws Exception {
		logger.debug("DAO :  acOwnerWrite(AcVO vo) 호출");
		return sqlSession.insert(NAMESPACE+".acOwnerWrite",vo);
	}
	
	// 신고관리 - us_id > us_nickname 출력
	public String getNickname(String us_id) throws Exception{
		logger.debug("DAO : getNickname(String us_id) 호출");
		return sqlSession.selectOne(NAMESPACE+".getNickname", us_id);
	}
	
	// 체험단관리 - 체험단 리스트
	public List<ExpVO> expList(Criteria cri) throws Exception {
		logger.debug("DAO :  expList(Criteria cri) 호출");
		return sqlSession.selectList(NAMESPACE+".expList", cri);
	}
	
	// 체험단관리 - 체험단 글개수 조회
	public int expCount(Criteria cri) throws Exception {
		logger.debug("DAO :  expCount(Integer exp_no) 호출");
		return sqlSession.selectOne(NAMESPACE+".expCount", cri);
	}
	
	// 체험단관리 - 체험단 글 1개 정보
	public ExpVO expInfo(Integer exp_no) throws Exception {
		logger.debug("DAO :  expInfo(Integer exp_no) 호출");
		return sqlSession.selectOne(NAMESPACE+".expInfo", exp_no);
	}
	
	// 체험단관리 - 상태 업데이트
	public void expStateUpdate(Integer exp_no) throws Exception {
		logger.debug("DAO :  expStateUpdate(Integer exp_no) 호출");
		sqlSession.update(NAMESPACE+".expStateUpdate", exp_no);
	}
	
	// 체험단관리 - 광고테이블 insert
	public int expAdInsert(String own_id, String ad_date) throws Exception {
		logger.debug("DAO :  expAdInsert(String own_id, String ad_date)호출"+own_id+ad_date);
		Map<String, Object> vo = new HashMap<String, Object>();
		vo.put("own_id", own_id);
		vo.put("ad_date", ad_date);
		logger.debug("vo"+vo);
		return sqlSession.insert(NAMESPACE+".expAdInsert", vo);
	}
	
	// 체험단관리 - 반려 상태 업뎃
	public int expReturn(ExpVO vo) throws Exception {
		logger.debug("DAO :  expReturn(ExpVO vo) 호출");
		return sqlSession.update(NAMESPACE+".expReturn", vo);
	}
	
	// 신고관리 - 신고취소
	public int acCancel(Integer ac_no) throws Exception{
		logger.debug("acCancel(Integer ac_no) 호출");
		return sqlSession.update(NAMESPACE+".acCancel", ac_no);
	}
}
