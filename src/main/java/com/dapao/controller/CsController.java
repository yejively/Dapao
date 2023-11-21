package com.dapao.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dapao.domain.Criteria;
import com.dapao.domain.CsVO;
import com.dapao.domain.PageVO;
import com.dapao.domain.UserVO;
import com.dapao.service.CsServiceImpl;

@Controller
@RequestMapping(value = "/cs/*")
public class CsController {

	private static final Logger logger = LoggerFactory.getLogger(CsController.class);

	@Autowired
	private CsServiceImpl cService;

	// 회원이보는 공지사항 리스트페이지
	// http://localhost:8088/cs/userNoticeList
	@RequestMapping(value = "/userNoticeList")
	public void userNoticeList(Criteria cri, Model model, HttpSession session) throws Exception {
		logger.debug("userNotice() 호출");
		// 페이징처리(페이지 블럭 처리 객체)

		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(cService.userNoticeCount());

		model.addAttribute("pageVO", pageVO);

		// 페이지이동시 받아온 페이지 번호
		if (cri.getPage() > pageVO.getEndPage()) {
			// 잘못된 페이지 정보를 입력받음. 글이없음.
			cri.setPage(pageVO.getEndPage());
		}
		List<CsVO> noticeList = cService.userNoticeList(cri);
		// 리스트사이즈확인
		logger.debug(" 글개수 : " + noticeList.size());

		// 페이지정보 view페이지전달
		model.addAttribute("noticeList", noticeList);
		session.setAttribute("viewcntck", "on");
	}

	// 회원이 공지사항 클릭시 공지사항상세페이지
	@RequestMapping(value = "/userNotice")
	public String userNotice(@RequestParam("cs_no") Integer cs_no, @RequestParam("page") Integer page, Model model,
			HttpSession session) throws Exception {
		
		// 글 조회수 1증가 메서드 ㅡ
		if (session.getAttribute("viewcntck").equals("on")) {
			int result = cService.notiViewUp(cs_no);
			logger.debug("조회수증가  result : "+result);
			session.setAttribute("viewcntck", "off");
		}

		// 글 본문 내용 
		model.addAttribute("notice", cService.userNotice(cs_no));
		model.addAttribute("page", page);

		return "/cs/userNotice";
	}

	// 회원이보는 FAQ페이지
	// http://localhost:8088/cs/userFAQList
	@RequestMapping(value = "/userFAQList")
	public void userFAQList(Criteria cri, Model model, HttpSession session) throws Exception {
		// 페이징처리(페이지 블럭 처리 객체)

		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(cService.userFAQCount());

		model.addAttribute("pageVO", pageVO);

		// 페이지이동시 받아온 페이지 번호
		if (cri.getPage() > pageVO.getEndPage()) {
			// 잘못된 페이지 정보를 입력받음. 글이없음.
			cri.setPage(pageVO.getEndPage());
		}
		List<CsVO> FAQList = cService.userFAQList(cri);
		// 리스트사이즈확인
		logger.debug(" 글개수 : " + FAQList.size());

		// 페이지정보 view페이지전달
		model.addAttribute("FAQList", FAQList);
		session.setAttribute("viewcntck", "on");
	}
	
	// 사업자가보는 공지사항 리스트페이지
	// http://localhost:8088/cs/ownNoticeList
	@RequestMapping(value = "/ownNoticeList")
	public void ownNoticeList(Criteria cri, Model model, HttpSession session) throws Exception {
		logger.debug("ownNoticeList() 호출");
		
		// 페이징처리(페이지 블럭 처리 객체)
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(cService.ownNoticeCount());
		
		model.addAttribute("pageVO", pageVO);

		// 페이지이동시 받아온 페이지 번호
		if (cri.getPage() > pageVO.getEndPage()) {
			// 잘못된 페이지 정보를 입력받음. 글이없음.
			cri.setPage(pageVO.getEndPage());
		}
		List<CsVO> noticeList = cService.ownNoticeList(cri);
		// 리스트사이즈확인
		logger.debug(" 글개수 : " + noticeList.size());

		// 페이지정보 view페이지전달
		model.addAttribute("noticeList", noticeList);
		session.setAttribute("viewcntck", "on");
	}
	
	// 사업자가 공지사항 클릭시 공지사항상세페이지
	@RequestMapping(value = "/ownNotice")
	public String ownNotice(@RequestParam("cs_no") Integer cs_no, @RequestParam("page") Integer page, Model model,
			HttpSession session) throws Exception {
		
		// 글 조회수 1증가 메서드 
		if (session.getAttribute("viewcntck").equals("on")) {
			int result = cService.notiViewUp(cs_no);
			logger.debug("조회수증가  result : "+result);
			session.setAttribute("viewcntck", "off");
		}
		
		// 글 본문 내용 
		model.addAttribute("notice", cService.userNotice(cs_no));
		model.addAttribute("page", page);

		return "/cs/userNotice";
	}
	
	// 사업자가보는 FAQ페이지
	// http://localhost:8088/cs/ownFAQList
	@RequestMapping(value = "/ownFAQList")
	public void ownFAQList(Criteria cri, Model model, HttpSession session) throws Exception {
		// 페이징처리(페이지 블럭 처리 객체)

		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(cService.ownFAQCount());

		model.addAttribute("pageVO", pageVO);

		// 페이지이동시 받아온 페이지 번호
		if (cri.getPage() > pageVO.getEndPage()) {
			// 잘못된 페이지 정보를 입력받음. 글이없음.
			cri.setPage(pageVO.getEndPage());
		}
		List<CsVO> FAQList = cService.ownFAQList(cri);
		// 리스트사이즈확인
		logger.debug(" 글개수 : " + FAQList.size());

		// 페이지정보 view페이지전달
		model.addAttribute("FAQList", FAQList);
		session.setAttribute("viewcntck", "on");
	}


}
