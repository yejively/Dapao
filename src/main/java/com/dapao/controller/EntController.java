package com.dapao.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dapao.domain.AdVO;
import com.dapao.domain.Criteria;
import com.dapao.domain.EntVO;
import com.dapao.domain.PageVO;
import com.dapao.domain.PayVO;
import com.dapao.domain.ProdVO;
import com.dapao.domain.ReviewVO;
import com.dapao.domain.TradeVO;
import com.dapao.domain.UserVO;
import com.dapao.service.EntServiceImpl;
import com.dapao.service.ProdServiceImpl;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping(value = "/ent/*")
public class EntController {

	private static final Logger logger = LoggerFactory.getLogger(EntController.class);
	@Autowired
	private ProdServiceImpl pService;
	@Autowired
	private EntServiceImpl eService;
	@Autowired
	private JavaMailSender mailSender;

	// http://localhost:8088/ent/shopMain
	@RequestMapping(value = "/shopMain", method = RequestMethod.GET)
	public void shopMainGET(HttpSession session, ReviewVO rVo, Model model, String ent_id) throws Exception {
		logger.debug(" shopMainGET(EntVO eVO, ProdVO pVO, ReviewVO rVO, Model model) 호출 ");
		String own_id = ent_id;
		if (own_id == null) {
			logger.debug(" @@@@@@@@@@사업자 ");
			own_id = (String) session.getAttribute("own_id");
		}else {
			logger.debug(" @@@@@@@@@@@@@회원 ");
			session.setAttribute("ent_id", own_id);			
		}
		
//		String us_id = (String) session.getAttribute("us_id");
		EntVO eVo = new EntVO();
		eVo.setOwn_id(own_id);
		logger.debug("eService.listEnt(eVo): " + eService.listEnt(eVo));
		List<ProdVO> plist = pService.listProd(eVo);
		logger.debug(" plist : " + plist);
		logger.debug(" plist.size() : " + plist.size());
		model.addAttribute("listSize",plist.size());
		String fileList[] = new String[plist.size()];
		for (int i = 0; i < plist.size(); i++) {
			fileList[i] = plist.get(i).getProd_img().substring(plist.get(i).getProd_img().lastIndexOf("\\") + 1);
//			fileList[i]=plist.get(i).getProd_img();
			logger.debug(" fileList[i] : " + fileList[i].toString());
		}
		

		List<ReviewVO> rlist = eService.entReviewList(own_id);
		logger.debug(" rlist : " + rlist);
		EntVO entList = eService.listEnt(eVo);
		logger.debug("entList : " + entList);
		String name="";
		if(entList != null) {
			if(entList.getEnt_name() == null || entList.getEnt_name().equals("")) {
				name = "없음";
			}
			name = entList.getEnt_name();
		}
		int idx = 1;
		if (entList != null) {
			if (entList.getEnt_img() != null && !entList.getEnt_img().equals("")) {
				idx = entList.getEnt_img().indexOf(",") + 1;
			}
		}
		String[] imgList = new String[idx];
		for (int i = 0; i < idx; i++) {
			imgList[i] = "null";
		}
		if (entList != null) {
			if (entList.getEnt_img() != null && !entList.getEnt_img().equals("")) {
				String img = entList.getEnt_img();
				imgList = img.split(","); // 합쳐진 이미지 ,로 나눠서 저장
				logger.debug(" imgList : " + imgList);
			}
		}
		
		// 체험단 광고 신청했는지
		Integer adResult = eService.entExpAd(own_id);
		logger.debug("adResult : "+adResult);
		
		
		model.addAttribute("adResult", adResult); // 광고유무
		model.addAttribute("imgList", imgList); // 이미지리스트
		model.addAttribute("rlist", rlist); // 리뷰리스트
		model.addAttribute("ent", entList); // 상점
		model.addAttribute("plist", plist); // 물품
		model.addAttribute("name", name); // 화면이름
		
		
		logger.debug(" 연결된 뷰페이지(/views/ent/shopMain.jsp) 출력 ");
	}

	// http://localhost:8088/ent/shopMainManage
	@RequestMapping(value = "/shopMainManage", method = RequestMethod.GET)
	public void shopMainManageGET(HttpSession session, Model model) throws Exception {
		logger.debug(" shopMainManageGET(EntVO eVo, Model model) 호출 ");
//		String own_id = "6";
		String own_id = (String) session.getAttribute("own_id");
		String name = "상점 메인페이지 수정";
		EntVO eVo = new EntVO();
		eVo.setOwn_id(own_id);
		logger.debug(" eVO: " + eVo);
		logger.debug("eService.listEnt(eVo): " + eService.listEnt(eVo));
		EntVO entList = eService.listEnt(eVo);
		int idx = 1;
		if (entList != null) {
			if (entList.getEnt_img() != null || !entList.getEnt_img().equals("")) {
				idx = entList.getEnt_img().indexOf(",") + 1;
			}
		}
		String[] imgList = new String[idx];
		for (int i = 0; i < idx; i++) {
			imgList[i] = "null";
		}
		if (entList != null) {
			if (!entList.getEnt_img().equals(null) || !entList.getEnt_img().equals("")) {
				String img = entList.getEnt_img();
				imgList = img.split(","); // 합쳐진 이미지 ,로 나눠서 저장
				logger.debug(" imgList : " + imgList);
			}
		}
		model.addAttribute("imgList", imgList);
		model.addAttribute("ent", eService.listEnt(eVo));
		model.addAttribute("name", name);
//		session.setAttribute("own_id", own_id);
		logger.debug(" 연결된 뷰페이지(/views/ent/shopMain.jsp) 출력 ");
	}

	// http://localhost:8088/ent/shopMainManage
	@RequestMapping(value = "/shopMainManage", method = RequestMethod.POST)
	public void shopMainManagePOST(EntVO eVo, Model model, HttpSession session, MultipartHttpServletRequest mhsr,
			HttpServletResponse response) throws Exception {
		logger.debug(" shopMainManagePOST(EntVO eVo, Model model) 호출 ");
//		String own_id = "6";
		String own_id = (String) session.getAttribute("own_id");
		String name = "상점 메인페이지 수정";
		eVo.setOwn_id(own_id);
		logger.debug(" eVo : " + eVo);
		List<MultipartFile> fileList = mhsr.getFiles("file");
		logger.debug(" fileList : " + fileList);
		ArrayList<String> imgList = new ArrayList<String>();
//		String path = "C:\\upload"; // 경로
		String path = "F:\\upload"; // 경로
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		logger.debug(" path : " + path);
		for (MultipartFile mf : fileList) {
			String genId = UUID.randomUUID().toString(); // 중복 처리
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명

			String saveFile = path + "\\" + genId + "_" + originFileName; // 저장할 위치
			String saveFileName = genId + "_" + originFileName; // 저장할 파일명
			logger.debug(" saveFile : " + saveFile);
			imgList.add(saveFileName);
			logger.debug("imgList : " + imgList);
			mf.transferTo(new File(saveFile));
			logger.debug("mf 됨");
		}
		eVo.setEnt_img(String.join(",", imgList));
		eService.entUpdate(eVo);
		
		logger.debug("eService.listEnt(eVo): " + eService.listEnt(eVo));
		model.addAttribute("ent", eService.listEnt(eVo));
		model.addAttribute("name", name);
		logger.debug(" 연결된 뷰페이지(/views/ent/shopMainManage.jsp) 출력 ");
	}

	// http://localhost:8088/ent/productManage
	@RequestMapping(value = "/productManage", method = RequestMethod.GET)
	public void productManageGET(Criteria cri,HttpSession session, Model model) throws Exception {
		logger.debug(" productManageGET()");
		logger.debug(" 연결된 뷰페이지(/views/ent/productManage.jsp)출력 ");
		String own_id = (String) session.getAttribute("own_id");
//		String own_id = "6";
		Integer modal_cate = 0;
		PageVO vo = new PageVO();
		ProdVO pVo = new ProdVO();
		String name = "상품 조회/수정/등록";
		pVo.setOwn_id(own_id);
		if(cri != null) {
			vo.setP_vo(pVo);
			vo.setCri(cri);
			vo.setTotalCount(pService.getProdList(own_id));
			List<ProdVO> plist = pService.searchProd(vo);
			model.addAttribute("plist", plist);
			model.addAttribute("pageVO", vo);
		}
		logger.debug(" vo : " + vo);

		// 리스트 사이즈 확인

		// Model 객체에 리스트 정보를 저장
		
		session.setAttribute("modal_cate", modal_cate);
//		session.setAttribute("own_id", "6");
		model.addAttribute("name", name);
	}

	// http://localhost:8088/ent/productManage
	@RequestMapping(value = "/productManage", method = RequestMethod.POST)
	public String productManagePOST(ProdVO vo, Model model, Criteria cri, HttpSession session) throws Exception {
		logger.debug(" productManagerPOST() ");
		String name = "상품 조회/수정/등록";
		String own_id = (String) session.getAttribute("own_id");
		logger.debug("own_id : "+own_id);
//		String own_id = "6";
		logger.debug(" vo : " + vo);
		PageVO pVo = new PageVO();
		pVo.setCri(cri);
		vo.setOwn_id(own_id);
		pVo.setP_vo(vo);
		int prod_num = pService.getProdList(vo.getOwn_id());
		logger.debug("prod_num : " + prod_num);
		pVo.setTotalCount(prod_num);
		logger.debug(" @@@@@@@@@@@pVo.getpageStart: " + pVo.getCri().getPageStart());
		logger.debug(" @@@@@@@@@@@pVo.getpageSize: " + pVo.getCri().getPageSize());
		List<ProdVO> plist = pService.searchProd(pVo);
		Integer modal_cate = 0;
		model.addAttribute("plist", plist);
		model.addAttribute("modal_cate", modal_cate);
		model.addAttribute("pageVO", pVo);
		model.addAttribute("name", name);
		logger.debug(" 연결된 뷰페이지(/views/ent/productManage.jsp)출력 ");
		
		return "redirect:/ent/productManage";
	}

	// http://localhost:8088/ent/entOrder
	@RequestMapping(value = "/entOrder", method = RequestMethod.GET)
	public void entOrderGET(HttpSession session, Model model,PageVO vo,
			String search_cate, String search) throws Exception {
		logger.debug(" entOrderGET() ");
		String own_id = (String) session.getAttribute("own_id");
		String name = "주문관리";
		ProdVO pVo = new ProdVO();
		TradeVO tVo = new TradeVO();
		logger.debug(" vo : "+vo);
		pVo.setOwn_id(own_id);
		List<TradeVO> tlist;
		if(vo.getCri() != null) {
			if (search_cate.contains("prod")) {
				// 검색조건이 상품명일경우
				logger.debug("상품명 주문조회");
				pVo.setProd_name(search);
				Integer tr_no = null; // 안넣으면 비교를 못함
				tVo.setTr_no(tr_no);
				vo.setT_vo(tVo);
				vo.setP_vo(pVo);
				vo.setTotalCount(eService.searchTradeCount(vo));
				logger.debug(" pageVo " + vo);
				
				// trade게시판 own_id이 가지고 있는 검색한 상품명을 검색
				tlist = eService.searchTrade(vo);
				logger.debug(" tlist : " + tlist);
				model.addAttribute("tlist", tlist);

			} else if (search_cate.contains("tr_no")) {
				logger.debug("주문번호 주문조회");
				// 검색조건이 주문번호일 경우
				if(search == null || search.equals("")) {
					model.addAttribute("name", name);
					return;
				}
				Integer tr_no = Integer.parseInt(search);
				
				
				tVo.setTr_no(tr_no);
				vo.setP_vo(pVo);
				vo.setT_vo(tVo);
				vo.setTotalCount(eService.searchTradeCount(vo));
				logger.debug(" pageVo " + vo);
 				// own_id이 받은 검색한 주문번호에 해당하는 것을 검색
				tlist = eService.searchTrade(vo);
				model.addAttribute("tlist", tlist);
			}
		}
		model.addAttribute("search_cate", search_cate);
		model.addAttribute("search", search);
		model.addAttribute("pageVO", vo);
		model.addAttribute("name", name);
		logger.debug(" 연결된 뷰페이지(/views/entOrder.jsp)출력 ");
	}

	// http://localhost:8088/ent/entOrder
	@RequestMapping(value = "/entOrder", method = RequestMethod.POST)
	public void entOrderPOST(String search_cate, String search,
			HttpSession session, Model model, Criteria cri)
			throws Exception {
		logger.debug(" entOrderPOST(PageVO vo, String search, Model model) 호출 ");
		String own_id = (String) session.getAttribute("own_id");
		PageVO vo = new PageVO();
		vo.setCri(cri);
		ProdVO pVo = new ProdVO();
		TradeVO tVo = new TradeVO();
		String name = "주문관리";
		logger.debug(" pageVo " + vo);
		logger.debug(" own_id : " + own_id);
		pVo.setOwn_id(own_id);

		List<TradeVO> tlist;
		if (search_cate.contains("prod")) {
			// 검색조건이 상품명일경우
			logger.debug("상품명 주문조회");
			pVo.setProd_name(search);
			Integer tr_no = null; // 안넣으면 비교를 못함
			tVo.setTr_no(tr_no);
			vo.setT_vo(tVo);
			vo.setP_vo(pVo);
			vo.setTotalCount(eService.searchTradeCount(vo));
			logger.debug(" pageVo " + vo);
			
			// trade게시판 own_id이 가지고 있는 검색한 상품명을 검색
			tlist = eService.searchTrade(vo);
			logger.debug(" tlist : " + tlist);
			model.addAttribute("tlist", tlist);

		} else if (search_cate.contains("tr_no")) {
			logger.debug("주문번호 주문조회");
			// 검색조건이 주문번호일 경우
			if(search == null || search.equals("")) {
				logger.debug("검색 내용 없음");
				model.addAttribute("name", name);
				return;
			}
			Integer tr_no = Integer.parseInt(search);
			logger.debug(" tr_no : "+tr_no);
			
			tVo.setTr_no(tr_no);
			vo.setP_vo(pVo);
			vo.setT_vo(tVo);
			vo.setTotalCount(eService.searchTradeCount(vo));
			logger.debug(" pageVo " + vo);
			logger.debug(" p_vo : "+vo.getP_vo());
			// own_id이 받은 검색한 주문번호에 해당하는 것을 검색
			tlist = eService.searchTrade(vo);
			logger.debug("tlist : "+tlist);
			model.addAttribute("tlist", tlist);
		}
		model.addAttribute("search_cate", search_cate);
		model.addAttribute("search", search);
		model.addAttribute("name", name);
		model.addAttribute("pageVO", vo);

		logger.debug(" 연결된 뷰페이지(/views/entOrder.jsp)출력 ");
	}

	@RequestMapping(value = "/productUpdate", method = RequestMethod.POST)
	public String productUpdatePOST(ProdVO vo,  HttpSession session, Integer modal_cate, 
			Model model, final MultipartHttpServletRequest mhsr,
			HttpServletResponse response) throws Exception {
		logger.debug(" productUpdatePOST() 호출 ");
		logger.debug(" vo : " + vo);
		logger.debug(" modal_cate : " + modal_cate);
		String name = "상품 조회/수정/등록";
		String own_id = (String) session.getAttribute("own_id");
		vo.setOwn_id(own_id);
		List<MultipartFile> fileList = mhsr.getFiles("file");
		ArrayList<String> imgList = new ArrayList<String>();
//		String path = mhsr.getServletContext().getRealPath("\\upload"); // 경로
//		String path = "C:\\upload"; // 경로
		String path = "F:\\upload"; // 경로
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		logger.debug(" path : " + path);
		for (MultipartFile mf : fileList) {
			String genId = UUID.randomUUID().toString(); // 중복 처리
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명

			String saveFile = path + "\\" + genId + "_" + originFileName; // 저장할 경로
			String saveFileName = genId + "_" + originFileName; // 저장할 파일명
			logger.debug(" saveFile : " + saveFile);
			imgList.add(saveFileName);
			logger.debug("imgList : " + imgList);
			mf.transferTo(new File(saveFile));
			logger.debug("이미지 생성됨");
		}
		logger.debug("@@@@@@@@@@@String.join(\",\", imgList) :" + String.join(",", imgList));
		vo.setProd_img(String.join(",", imgList));
		logger.debug("vo : " + vo);

		if (modal_cate == 1) {
			pService.updateProd(vo);
			logger.debug(" update ");
		} else {

			pService.insertProd(vo);
			logger.debug(" insert ");
		}
		model.addAttribute("name", name);
		return "redirect:/ent/productManage";
	}

	@RequestMapping(value = "/refund", method = RequestMethod.GET)
	public String refundGET(TradeVO vo) throws Exception {
		logger.debug(" refundGET(TradeVO vo) 호출 ");
		logger.debug(" vo : "+vo);
//		eService.refund(vo); // 코인환불
//		logger.debug(" 환불 성공 ");
		eService.tradeRefund(vo); // 환불확정 상태로 업데이트
		logger.debug(" 환불 확정 ");
		return "redirect:/ent/entOrder";
	}

	@RequestMapping(value = "/download")
	public void download(@RequestParam("imageFileName") String imageFileName, HttpServletResponse response,
			HttpServletRequest req) throws Exception {
		// String downFile = CURR_IMAGE_REPO_PATH + "\\" + imageFileName;
//		String downFile = req.getRealPath("/upload") + "\\" + imageFileName;
//		String downFile = "C:\\upload" + "\\" + imageFileName;
		String downFile = "F:\\upload" + "\\" + imageFileName;
		logger.debug(" downFile : " + downFile);
		File file = new File(downFile);

		// 한글 파일의 경우 인코딩문제로 인하여 다운로드 문제 발생(파일이름 오류)
		imageFileName = URLEncoder.encode(imageFileName, "UTF-8");

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
		OutputStream out = response.getOutputStream();
		FileInputStream in = new FileInputStream(file);

		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer);
			if (count == -1)
				break;
			out.write(buffer, 0, count);
		}
		out.close();
		in.close();
	}

	// 파일 썸네일 다운로드 처리
	@RequestMapping(value = "/thumbDownload", method = RequestMethod.GET)
	public void fileThumbDownloadGET(@RequestParam("fileName") String fileName, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.debug(" fileThumbDownloadGET(@RequestParam(\"fileName\") 호출 ");
		String path = "F:\\upload";
		// 다운로드할 폴더 (= 업로드한 폴더)에 있는 파일정보
//				String downFile = request.getRealPath("\\upload")+"\\"+fileName;
		String downFile = path + "\\" + fileName;
		logger.debug(" 다운로드할 파일 : " + downFile);

		// 다운로드할 파일을 준비
		File file = new File(downFile);
		// 업로드 했던(다운로드할) 파일의 확장자 확인
		// "itwill.jpg"
//		int lastIdx = fileName.lastIndexOf(".");
//		// 파일의 확장자를 제외한 이름을 저장
//
//		String thumbName = fileName.substring(0, lastIdx);
//		// 파일명이 한글일때 인코딩문제 해결
//		thumbName = URLEncoder.encode(fileName, "UTF-8");
//		File thumbNail = new File(path + "\\thumbnail\\" + thumbName + ".png");
		// 출력객체
		OutputStream out = response.getOutputStream();

		if (file.exists()) {
			// 썸네일 파일을 생성X 바로 화면에 출력
			Thumbnails.of(file).size(50, 50).outputFormat("png").toOutputStream(out);
		}

		// 다운로드 정보를 응답설정
		// => 모든 파일이 일반적인 다운로드형태로 표시
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + fileName);
		// 자원해제
		out.close();

	}

	// 휴대폰 본인인증
	@RequestMapping(value = "/entPhoneCk", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) throws Exception { // 휴대폰 문자보내기
		int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);// 난수 생성

		eService.certifiedPhoneNumber(userPhoneNumber, randomNumber);

		return Integer.toString(randomNumber);
	}

	// 아이디 중복체크
	@RequestMapping(value = "/entCheckId", method = RequestMethod.POST)
	@ResponseBody
	public int checkId(@RequestParam("own_id") String own_id) throws Exception {
		int cnt = eService.checkId(own_id);
		return cnt;
	}

	// http://localhost:8088/ent/entJoin
	@RequestMapping(value = "/entJoin", method = RequestMethod.GET)
	public void entJoinGET() {
		logger.debug("GET() 호출");

		logger.debug("연결된 view 페이지 호출 (/views/ent/entJoin.jsp)");

	}

	@RequestMapping(value = "/entJoin", method = RequestMethod.POST)
	public String entJoinPOST(EntVO vo, MultipartHttpServletRequest mhsr) throws Exception {
		logger.debug("entJoinPOST() 호출");
		// 전달정보 저장(회원가입 정보)
		logger.debug("vo : " + vo);
		List<MultipartFile> fileList = mhsr.getFiles("file");
		ArrayList<String> imgList = new ArrayList<String>();
		
		String path = "C:\\upload"; // 경로
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		logger.debug(" path : " + path);
		for (MultipartFile mf : fileList) {
			String genId = UUID.randomUUID().toString(); // 중복 처리
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명

			String saveFile = path + "\\" + genId + "_" + originFileName; // 저장할 경로
			String saveFileName = genId + "_" + originFileName; // 저장할 파일명
			logger.debug(" saveFile : " + saveFile);
			imgList.add(saveFileName);
			logger.debug("imgList : " + imgList);
			mf.transferTo(new File(saveFile));
			logger.debug("이미지 생성됨");
		}
		logger.debug("@@@@@@@@@@@String.join(\",\", imgList) :" + String.join(",", imgList));
		vo.setEnt_file(String.join(",", imgList));
		logger.debug("vo : " + vo);
		
		
		// DAOImpl -> DB에 정보 저장
		// mdao.insertMember(vo);
		eService.entJoin(vo);

		logger.debug("회원가입 완료!");

		// 로그인 페이지로 이동(redirect)
		return "redirect:/ent/entLogin";
	}

	// 주소검색,입력
	@RequestMapping(value = "/jusoPopup", method = RequestMethod.GET)
	public void entMapGET() throws Exception {

	}

	@RequestMapping(value = "/jusoPopup", method = RequestMethod.POST)
	public void entMapPOST() throws Exception {

	}
	// 주소검색,입력

	// http://localhost:8088/ent/entLogin
	@RequestMapping(value = "/entLogin", method = RequestMethod.GET)
	public void entLoginGET() throws Exception {
		logger.debug("entLoginGET() 호출");
		logger.debug("연결된 view 페이지 호출 (/views/etn/entLogin.jsp)");
	}

	@RequestMapping(value = "/entLogin", method = RequestMethod.POST)
	public String entLoginPOST(EntVO vo, HttpSession session, RedirectAttributes rAttr) throws Exception {
		logger.debug("entLoginPOST() 호출");
		logger.debug("vo : " + vo);

		EntVO resultVO = eService.entLogin(vo);
		logger.debug("resultVO : " + resultVO);

		// 로그인 실패
		if (resultVO == null) {
			rAttr.addAttribute("result", "fail");
			return "redirect:/ent/entLogin";
		}

		if (resultVO != null) {

			if (resultVO.getOwn_state() == 1) {
				rAttr.addAttribute("result", "1");
				return "redirect:/ent/entLogin";
			} else if (resultVO.getOwn_state() == 2) {
				rAttr.addAttribute("result", "2");
				return "redirect:/ent/entLogin";
			} else if (resultVO.getOwn_state() == 3) {
				rAttr.addAttribute("result", "3");
				return "redirect:/ent/entLogin";
			} else {
				// 로그인 성공 아이디 세션에 저장
				session.setAttribute("own_id", resultVO.getOwn_id());
				session.setAttribute("ent_name", resultVO.getEnt_name());
				session.setAttribute("ent_coin", resultVO.getEnt_coin());
			}

		}

		return "redirect:/ent/shopMain";
	}

	// http://localhost:8088/ent/entMain
	@RequestMapping(value = "/entMain", method = RequestMethod.GET)
	public void entMainGET(HttpSession session) throws Exception {
		logger.debug("entMainGET() 호출");
		logger.debug("연결된 view 페이지 호출 (/views/etn/entMain.jsp)");
	}

	@RequestMapping(value = "/entLogout", method = { RequestMethod.GET, RequestMethod.POST })
	public String entLogoutGET(HttpSession session) {
		logger.debug("logoutGET() 호출");

		// 로그아웃 처리 => 세션정보 초기화
		session.invalidate();
		// 메인페이지로 이동

		return "redirect:/ent/entMain";
	}

	// http://localhost:8088/ent/entMain
	@RequestMapping(value = "/ownInfo", method = RequestMethod.GET)
	public void ownInfoGET(HttpSession session, Model model) throws Exception {
		logger.debug("ownInfoGET() 호출");

		// 사용자 아이디 정보 저장
		logger.debug(session.getAttribute("own_id") + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		String own_id = (String) session.getAttribute("own_id");

		model.addAttribute(eService.ownInfo(own_id));

	}

	@RequestMapping(value = "/ownDelete", method = RequestMethod.GET)
	public void ownDelete() {

	}
	//광고페이지
	@RequestMapping(value = "/entAd", method = RequestMethod.GET)
	public void entAdGET(HttpSession session, Model model)throws Exception {
		logger.debug(" entOrderGET() ");
//		String own_id = (String) session.getAttribute("own_id");
		String name = "광고문의/소개";
		model.addAttribute("name", name);
		logger.debug(" 연결된 뷰페이지(/views/entOrder.jsp)출력 ");
	}
	//광고페이지
	@RequestMapping(value = "/entAd", method = RequestMethod.POST)
	public void entAdPOST(HttpSession session, int ad_upload, Model model) throws Exception {
		logger.debug(" entOrderPOST() ");
		String own_id = (String) session.getAttribute("own_id");
		String name = "광고문의/소개";
		logger.debug(" ad_upload : "+ad_upload);
		AdVO vo = new AdVO();
		vo.setOwn_id(own_id);
	      // 현재 날짜 구하기
        Date currentDate = new Date(System.currentTimeMillis());

        // 30일 더하기
        Calendar cal = Calendar.getInstance();
        cal.setTime(currentDate);
        cal.add(Calendar.DATE, ad_upload);
        logger.debug(" cal : "+cal);
        Date addedDate = new Date(cal.getTimeInMillis());

        // 패턴 변환
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = sdf.format(addedDate);
        Date date =sdf.parse(formattedDate);
        vo.setAd_upload(date);
		logger.debug("vo : "+vo);
		eService.entAd(vo);
		model.addAttribute("name", name);
		logger.debug(" 연결된 뷰페이지(/views/entOrder.jsp)출력 ");
	}
	
	// 손님이 가게 상품결제
	@RequestMapping(value = "/purchase", method = RequestMethod.GET)
	public void purchaseGET(HttpSession session, ProdVO vo) throws Exception {
		logger.debug(" purchaseGET 호출 ");
		logger.debug(" vo : "+vo);
		Map<String,Object>map = new HashMap<String,Object>();
		
		String us_id = (String) session.getAttribute("us_id");
//		String us_id = "test1";
		logger.debug("us_id : "+us_id);
		String own_id = (String) session.getAttribute("own_id");
		logger.debug("own_id : "+own_id);
		Integer prod_no = vo.getProd_no();
		Integer prod_price = vo.getProd_price();

		map.put("us_id", us_id);
		map.put("own_id", own_id);
		map.put("prod_no", prod_no);
		map.put("prod_price", prod_price);
		logger.debug(" map : "+map);
		eService.purchase(map);
		logger.debug(" 결제 완료 ");
//		eService.tradePurchase(tr_no);
	}
	
	
	@RequestMapping(value = "/mailAuth", method = RequestMethod.GET)
	public void mailAuth() throws Exception {
		
	}
	// http://localhost:8088/ent/entMain
	// 이메일인증
	@RequestMapping(value = "/mailAuth", method = RequestMethod.POST)
	@ResponseBody
	public int mailAuth(String email) throws Exception {
		
		logger.debug("전달 받은 이메일 주소 : " + email);
		
		//난수의 범위 111111 ~ 999999 (6자리 난수)
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111;
		
		//이메일 보낼 양식
		//String setFrom = "(ID@naver.com)"; //2단계 인증 x, 메일 설정에서 POP/IMAP 사용 설정에서 POP/SMTP 사용함으로 설정o
		String toMail = email;
		String title = "본인인증 이메일 입니다.";
		String content = "인증 코드는 " + checkNum + " 입니다." +
						 "<br>" +
						 "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";
		
		new Thread(new Runnable() {
			
			@Override
			public void run() {
				
				try {
					MimeMessage message = mailSender.createMimeMessage(); //Spring에서 제공하는 mail API
					MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
					//helper.setFrom(setFrom);
					helper.setTo(toMail);
					helper.setSubject(title);
					helper.setText(content, true);
					mailSender.send(message);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
		}).start();
		
		
		logger.debug("랜덤숫자 : " + checkNum);
		return checkNum;
	}
	
	// 비밀번호 변경
	@RequestMapping(value = "/changePw", method = RequestMethod.GET)
	public void changePw() throws Exception {
		
	}
	
	@RequestMapping(value = "/changePw", method = RequestMethod.POST )
	public String changePwPOST(EntVO vo, RedirectAttributes ra) throws Exception {
		
		logger.debug("vo : " + vo);
		String own_pw = BCrypt.hashpw(vo.getOwn_pw(), BCrypt.gensalt());

		vo.setOwn_pw(own_pw);
		
		int result = eService.changePw(vo);
		
		if(result == 1) {
			ra.addAttribute("result", "ok");
		}
	
		return "redirect:/ent/entLogin";
	}
  
	// http://localhost:8088/ent/coinCharge
		// 대나무페이 충전 GET - 충전페이지로 이동 
		@RequestMapping(value = "/coinCharge", method = RequestMethod.GET)
		public void coinChargeGET(HttpSession session, Model model) throws Exception {
			logger.debug("coinChargeGET() 호출");
			
			// 세션 아이디
			String own_id = (String)session.getAttribute("own_id");
			EntVO vo = new EntVO();
			vo.setOwn_id(own_id);
			// 상점 검색
			vo = eService.listEnt(vo);
			String name = "대나무페이";
			
			model.addAttribute("ent", vo);
			model.addAttribute("name", name);
		}
	// 대나무페이 충전 POST - 충전금액 입력
		@ResponseBody
		@RequestMapping(value = "/coinCharge", method = RequestMethod.POST)
		public void coinChargePOST(HttpSession session, Model model, PayVO payVO) throws Exception {
			logger.debug("coinChargePOST() 호출");
			
			// 세션 아이디, 코인 금액, url
			String own_id = (String)session.getAttribute("own_id");
			Integer ent_coin = (Integer)session.getAttribute("ent_coin");
			//String url = (String)session.getAttribute("URL");
			logger.debug("회원 아이디 확인 : " + own_id);
//			logger.debug("충전전 코인금액 확인 : " + ent_coin);
			
			logger.debug("@@payVO : " + payVO );
			payVO.setOwn_id(own_id);
			payVO.setPay_kind("대나무페이");
			payVO.setPay_con("결제완료");
			logger.debug("@@@@@payVO : " + payVO );
			
			// 코인충전
			int ent_result = eService.coinCharge(payVO);
			logger.debug(" ent_result(성공시 1) : " +ent_result);
			
			
			// 코인값 저장
			ent_coin = eService.entCoin(own_id);
			session.setAttribute("ent_coin", ent_coin);
			logger.debug("충전후 코인금액 확인 : " + ent_coin);
			// 결제 정보 입력
			int pay_result = eService.coinChargePay(payVO);
			logger.debug(" ent_result : " + pay_result);
			logger.debug("결제 리스트나 이전 uri로 이동");
		
		
		}
	

}
