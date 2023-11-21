package com.dapao.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
import com.dapao.service.ItemServiceImpl;
import com.dapao.service.UserServiceImpl;

import net.coobird.thumbnailator.Thumbnailator;

//http://localhost:8088/user/userMain

//@RequestMapping(value = "/board/*")
//~.bo 끝나는 주소를 설정한 것처럼
///board/~ 주로소 설정


@Controller
@RequestMapping(value = "/item/*")
public class ItemController {
	
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	@Inject
	private ItemServiceImpl iService;
	
	@Inject
	private UserServiceImpl uService;

	
	
	// http://localhost:8088/item/chat
	// 채팅GET - 미완성 
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public void chatGET() throws Exception {
		logger.debug("chatGET() 호출");
		
		logger.debug("연결된 뷰페이지(views/item/chat.jsp)를 출력");
		
	}
	
	
	// http://localhost:8088/item/itemSearch
	// 판매물품글 검색 조회GET - 판매글 작성 페이지로 이동
	@RequestMapping(value = "/itemSearch", method = RequestMethod.GET)
	public void itemSearchGET(String it_title, Model model, HttpSession session) throws Exception {
		logger.debug("itemSearchGET() 호출");
		
		logger.debug("검색단어 : " + it_title);
		
		// 검색
		List<ItemVO> searchItemVO = iService.itemSearch(it_title);
		// logger.debug("@@검색한 물품 정보 : " + searchItemVO);
		model.addAttribute("searchItemVO", searchItemVO);
		// 조회수 증가를 체크 : on - 1 , off - 2
		session.setAttribute("itemView", "on");
				
		logger.debug("연결된 뷰페이지(views/item/itemSearch.jsp)를 출력");
		
	}
	
	
	// http://localhost:8088/item/itemCate
	// 판매물품글 카테고리 조회GET - 판매글 작성 페이지로 이동
	@RequestMapping(value = "/itemCate", method = RequestMethod.GET)
	public void itemCateGET(String it_cate, Model model, HttpSession session) throws Exception {
		logger.debug("itemCateGET() 호출");
		logger.debug("검색 카테고리 : " + it_cate);
		
		// 검색
		List<ItemVO> cateItemVO = iService.itemCate(it_cate);
		model.addAttribute("cateItemVO", cateItemVO);
		// 조회수 증가를 체크 : on - 1 , off - 2
		session.setAttribute("itemView", "on");
		
		// 어떤 카테고리인지 알려주기
		model.addAttribute("it_cate_search", it_cate);
		
		
		logger.debug("연결된 뷰페이지(views/item/itemCate.jsp)를 출력");
		
	}
	
	
	
	// http://localhost:8088/item/itemWrite
	// 판매글 작성GET - 판매글 작성 페이지로 이동
	@RequestMapping(value = "/itemWrite", method = RequestMethod.GET)
	public void itemWriteGET() throws Exception {
		logger.debug("itemWriteGET() 호출");
		
		logger.debug("연결된 뷰페이지(views/item/itemWrite.jsp)를 출력");
		
	}
	
	
	// 판매글 작성POST - 작성한 판매글 등록
	@RequestMapping(value = "/itemWrite", method = RequestMethod.POST)
	public String itemWritePOST(HttpSession session, ItemVO itemVO ) throws Exception {
		logger.debug("itemWritePOST() 호출");
		int itno=0;
		// 세션 - 아이디
		String us_id = (String) session.getAttribute("us_id");
		double it_latitude = (double) session.getAttribute("latitude");
		double it_longitude = (double) session.getAttribute("longitude");

		itemVO.setUs_id(us_id);
		itemVO.setIt_latitude(it_latitude);
		itemVO.setIt_longitude(it_longitude);
		logger.debug("@@판매글 정보 : " + itemVO);
		
		// 서비스 -> DAO 호출 : 판매글  작성 등록
		int result = iService.itemWrite(itemVO);
		if(result == 1) { // 성공적으로 글 등록시
			
			// 등록한 글번호 받아오기
			itno = iService.itemWriteCheck(us_id);
			logger.debug("itno : " + itno);
		}
		
		
		if(result != 1) {
			logger.debug("판매글 등록 실패");
			return "redirect:/user/userMain";
		}
		
		logger.debug("판매글 등록 성공");

		
		final int it_no = itno;
		// 파일 저장 
		itemVO.getFileList().forEach(fileList->{
			
			fileList.setIt_no(it_no);
			iService.insertFile(fileList);
		});
		logger.debug("이미지 등록 완료");

		// 대표이미지 
		logger.debug("@@itemVO.getFileList() : " + itemVO.getFileList().get(0));
		
		FileVO vo = new FileVO();
		vo.setIt_no(itemVO.getFileList().get(0).getIt_no());
		vo.setUploadPath(itemVO.getFileList().get(0).getUploadPath());
		vo.setUuid(itemVO.getFileList().get(0).getUuid());
		vo.setFileName(itemVO.getFileList().get(0).getFileName());

		logger.debug("@@@vo@@@ : " + vo);
		
		int item_file_main = iService.itemFileMainInsert(vo);
		logger.debug("대표 이미지 등록 완료 item_file_main : " + item_file_main);
		
		

		logger.debug("연결된 뷰페이지(views/item/itemDetail.jsp)를 출력");
		
		 session.setAttribute("itemView", "off");
		//return "redirect:/mypage/userSellList";

		return "redirect:/item/itemDetail?it_no="+it_no;
		
	}
	
	
	
	
	// 날짜 폴더 만들기 위한 매서드( uploadAjaxAction 매서드보다 위에 선언하기 )
	private String getFolder() {
		
		// 현재 날짜 : Wed Aug 24 09:23:12 KST 2022
		Date date = new Date();
		
		// System.out.println("No format현재날짜 :   "+ date);
		// 간단 날짜 형식 : Wed Aug 24 09:23:12 KST 2022 -> 2022-08-24
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		// 현재날짜 date와 간단날짜형식 sdf연결 : 2022-08-24
		String str = sdf.format(date);
		
		// System.out.println("format 적용 현재날짜 : " + str);
		// 문자 찾아 바꾸기 : 2022-08-24 -> 2022\08\24
		return str.replace("-", "\\");
		
	}
	
	// 파일 업로드 ajax 
		@RequestMapping(value="/uploadAjaxAction" ,method = RequestMethod.POST)
		public ResponseEntity<ArrayList<FileVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile ){
			logger.debug("uploadAjaxActionPOST() 호출");
			logger.debug("uploadcontroller");
			logger.debug("update ajax post.....");
			
			// AttachFileVO 클래스 포함 관계로 만들어줌, 다중선택 : 배열
			ArrayList<FileVO> list = new ArrayList<>();
			
			// 폴더 경로 
			String uploadFolder = "F:\\upload";
			
			// 서버 업로드 경로와 getFolder메서드의 날짜 문자열을 결합해 하나의 폴더 생성
			File uploadPath = new File(uploadFolder, getFolder());
			
			// 폴더 생성 (F:\\upload현재날짜)
			if(uploadPath.exists()==false) { // uploadPath가 존재하지 않으면
				uploadPath.mkdirs();
			}
			
			
			for(MultipartFile multipartFile : uploadFile) {
				logger.debug("@@@@-----------------------------------------------");
				logger.debug("Upload File Name : " + multipartFile.getOriginalFilename());
				logger.debug("Upload File Size : " + multipartFile.getSize());
				
				// AttachFileVO클래스의 새로운 주소를 반복적으로 생성하여
				// ArrayList에 저장
				FileVO attachvo = new FileVO();
				
				// 파일 저장
				// 실제 파일명(multipartFile.getOriginalFilename())
				// UUID 적용 (UUID_multipartFile.getOriginalFilename())
				UUID uuid = UUID.randomUUID();
				logger.debug("uuid : " + uuid.toString());
				
				
				
				
				// AttachFileVO의 uploadPath 변수에 저장() : getFolder호출
				attachvo.setUploadPath(getFolder());
				
				// AttachFileVO의 fileName 변수에 저장() : 실제 파일 이름
				attachvo.setFileName(multipartFile.getOriginalFilename());
				
				// AttachFileVO의 uuid 변수에 저장()
				attachvo.setUuid(uuid.toString());
				
				
				String uploadFileName = uuid.toString() + "_" + multipartFile.getOriginalFilename();
				
				// IE has file path
				// uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
				logger.debug("only file name : " + uploadFileName);
				
				
				// 파일저장 
				File saveFile = new File(uploadPath, uploadFileName);
				logger.debug("saveFile : " + saveFile);
				
				// F:\\upload 에 파일을 전송하는 매서드(transferTo)
				
					try {
						multipartFile.transferTo(saveFile); // 서버로 원본 파일 전송
						logger.debug("transgerTo 동작함");
						
						// 서버에 올리고자 하는 파일이 이미지이면
						if(checkImageType(saveFile)) {
							
							//AttachFileVO의 image변수에 저장()
							attachvo.setImage(true);
							
							// 파일 생성
							FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName ));
							// 썸네일 생성
							Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,150,150);
							
							thumbnail.close();
							
						}// checkImageType
						
						// AttachFileVO에 저장된 데이터를 배열에 추가 (add 매서드)
						list.add(attachvo);
						
					} catch (Exception e) {
						logger.debug(e.getMessage());
						logger.debug("transgerTo 문제생김");
					}
				
			}// for
			
			return new ResponseEntity<>(list, HttpStatus.OK);
		}// uploadAjaxPost 
	
	
	// 파일 썸네일 나오게 해주는 매서드 
	@RequestMapping(value="/display", method=RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(String fileName){
		
		logger.debug("fileName@@ : " + fileName);
		
		File file = new File("F:\\upload/"+fileName);
		
		ResponseEntity<byte[]> result = null;
		// header가 content-type 파악할 수 있다
		HttpHeaders headers = new HttpHeaders();
		
		try {
			
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),
						headers, HttpStatus.OK);	
			
			logger.debug("result : " + result);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 다운로드 주소 생성
		@RequestMapping(value = "/download", method = RequestMethod.GET)
		public ResponseEntity<Resource> downloadFile(String fileName){
			
			Resource resource = new FileSystemResource("F:\\upload/" + fileName);
			
			// 다운로드 시 파일의 이름을 처리
			String resourceName = resource.getFilename();
			
			HttpHeaders headers = new HttpHeaders();
			
			try {
				
				// 다운로드 파일이름이 한글일 때, 깨지지 않게 하기 위한 설정
				headers.add("Content-Disposition", "attachment;filename=" + new String(resourceName.getBytes("utf-8"), "ISO-8859-1"));
						
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return new ResponseEntity<>(resource, headers, HttpStatus.OK);
		}

	// 업로드 파일이 이미지 파일인지 아닌지 구분하는 메소드 선언
	// 반환타입 메소드명  타입  변수명
	private boolean checkImageType(File file) {
		
		// probeContentType(파일 경로) : 파일 경로에 있는 파일 타입을 알아내는 메소드
		try {
			String contentType = Files.probeContentType(file.toPath());
			System.out.println("contentType=" + contentType);
			// 파일 타입이 image이면 true, 그 외에는 false
			return contentType.startsWith("image"); // startWith는 boolean 타입임 
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	// http://localhost:8088/item/itemDetail
	// 판매물건상세 GET - 글 정보를 불러오기 
	@RequestMapping(value = "/itemDetail", method = RequestMethod.GET)
	public String itemDetailGET(Integer it_no, Model model, HttpSession session) throws Exception {
		logger.debug("itemDetailGET() 호출");
		
		// 내가 구매한건지 확인
		TradeVO tradeVO = new TradeVO();
		tradeVO.setTr_no(1);
		tradeVO.setTr_buy_state(3);
		tradeVO.setTr_sell_state(3);
		int item_state = 0;
		
		// 찜
		int love = 0;
		
		// 파라메터 자동수집
		logger.debug("@@판매글 번호 : " + it_no);
		
		// 세션 - 아이디
		String us_id = (String) session.getAttribute("us_id");
		logger.debug("세션 아이디 us_id : " + us_id);
		if(us_id == null) { // 찜했는지 확인x
			
		}else {// 찜했는지 확인0
			ItemVO itemLove = new ItemVO();
			itemLove.setUs_id(us_id);
			itemLove.setIt_no(it_no);
			love = iService.itemLove(itemLove);
		}

		// 0 - 찜 안함,  1 -찜함 
		model.addAttribute("love",love);

		// 판매글 조회
		ItemVO itemVO = iService.itemDetail(it_no);
		itemVO.setIt_love(iService.loveCount(it_no));
		logger.debug("@@판매글 정보 : " + itemVO);
		model.addAttribute("itemVO", itemVO);
		
		List<FileVO> itemFileVO = iService.itemFile(itemVO.getIt_no());
		model.addAttribute("itemFileVO",itemFileVO);
		
		
		// 판매자 정보 조회
		UserVO sellerVO = iService.sellerInfo(itemVO.getUs_id());
		logger.debug("@@판매자 정보 : " + sellerVO);
		model.addAttribute("sellerVO", sellerVO);

		
		// 판매자 다른 물품
		List<ItemVO> sellerItemVO = iService.sellerItem(itemVO);
		logger.debug("@@판매자 다른물품 : " + sellerItemVO);
		model.addAttribute("sellerItemVO", sellerItemVO);

		// 비슷한 상품 조회(같은 카테고리)
		List<ItemVO> sameCateVO = iService.sameCate(itemVO);
		logger.debug("@@비슷한 상품(같은카테): " + sameCateVO);
		model.addAttribute("sameCateVO", sameCateVO);
		

		// 조회수 증가를 체크 : on - 1 , off - 2
        if(session.getAttribute("itemView").equals("on")) {
             int viewcnt= iService.viewCnt(it_no);
             logger.debug("조회수 증가 체크 viewcnt : " + viewcnt);
            session.setAttribute("itemView", "off");
        }
        
        // 예약중인 물건일때 내가 구매한건지 확인
        // trade 테이블에 it_no이 존재하고, 아직 예약중일때 버튼 활성화
       item_state = itemVO.getIt_state();
       logger.debug("글상태 item_state : " + item_state);
        if(item_state == 1 ) { //예약중인 물건일때 
        	logger.debug("예약중인 글이다.");
        	
        	// 거래글정보 가져오기
        	tradeVO = iService.checkPur(itemVO.getTr_no());
        	logger.debug("거래글 정보 tradeVO : " + tradeVO);
        	
        	if(us_id == null) {
        		
        		logger.debug("예약중인 글이지만 로그인을 한 상태가아니다");
        		tradeVO.setTr_no(1);
        		tradeVO.setTr_buy_state(3);
        		tradeVO.setTr_sell_state(3);
        		model.addAttribute("tradeVO", tradeVO);

        	}else {
        		
        		logger.debug("아이디가 존재한다");
        		// 거래 구매자 아이디
        		String tr_id_buyer = tradeVO.getUs_id();
        		// 거래 판매자 아이디
        		String tr_id_seller = tradeVO.getTr_sell_us();
        		
        		// 거래 구매자의 아이디와 내 아이디가 같으면
        		if(us_id.equals(tr_id_buyer)) {
        			logger.debug("거래 구매자의 아이디와 내 아이디가 같다");
        		}else {
        			logger.debug("거래 구매자의 아이디와 내 아이디가 다르다");
        			
        			// 거래 판매자의 아이디와 내 아이디가 같으면
            		if(us_id.equals(tr_id_seller)) {
            			logger.debug("거래 판매자의 아이디와 내 아이디가 같다");
            			
            		}else {
            			logger.debug("거래 판매자의 아이디와 내 아이디가 다르다");
            			tradeVO.setTr_no(1);
                		tradeVO.setTr_buy_state(3);
                		tradeVO.setTr_sell_state(3);
            		}
        			
        		}
        		
        		model.addAttribute("tradeVO", tradeVO);
        	}
        	
        }else { // 예약중인 글이 아닐때
        	logger.debug("예약중인 글이 아니다");
        	tradeVO.setTr_no(1);
        	tradeVO.setTr_buy_state(3);
        	tradeVO.setTr_sell_state(3);
        	model.addAttribute("tradeVO", tradeVO);
        	
        }
		
		logger.debug("연결된 뷰페이지(views/item/itemDetail.jsp)를 출력");
		return "/item/itemDetail";
		
	}
	
	// 사진 출력 
	@ResponseBody
	@RequestMapping(value="/itemFile", method = RequestMethod.GET)
	public ResponseEntity<List<FileVO>> itemFile(int it_no){
		// 통신상태 정상이면 select 된 결과를 uploadAjaxPost로 보내라 
		logger.debug("itemFile(int it_no) 실행)");
		return new ResponseEntity<>(iService.itemFile(it_no),HttpStatus.OK);
	}	


	// 찜기능 GET - 찜 목록에 등록/삭제
	@ResponseBody
	@RequestMapping(value = "/itemLove", method = RequestMethod.GET)
	public int itemLoveGET(Integer love_value, Integer it_no, HttpSession session) throws Exception {
		logger.debug("itemLoveGet() 호출");
		
		// 파라메터 자동수집
		logger.debug("@@판매글 번호 : " + it_no);
		logger.debug("@@love_value : " + love_value);
		
		// 세션 - 아이디
		String us_id = (String) session.getAttribute("us_id");

		LoveVO loveVO = new LoveVO();
		loveVO.setUs_id(us_id);
		loveVO.setIt_no(it_no);
		
		if(love_value == 0) {
			// 찜하기 (insert)
			
			return iService.itemLoveInsert(loveVO);
		}
		
		// love_value == 1
		// 찜취소  (delete)
			
		return iService.itemLoveDelete(loveVO);
	}
	
	
	// http://localhost:8088/item/yourPage
	// 상대방 프로필 GET
	@RequestMapping(value = "/yourPage", method = RequestMethod.GET)
	public void yourPageGET(String us_id, Model model) throws Exception {
		logger.debug("yourPageGET() 호출");
		
		UserVO yourVO = iService.yourInfo(us_id);
		logger.debug("yourVO : " + yourVO );
		List<ItemVO> itemVO = iService.yourItem(us_id);
		logger.debug("@@itemVO : " + itemVO );
		
		List<TotalVO> reviewVO = iService.yourReview(us_id);
		logger.debug("reviewVO : " + reviewVO);
		
		model.addAttribute("yourInfo", yourVO);
		model.addAttribute("yourItemVO", itemVO);
		model.addAttribute("reviewVO",reviewVO);
		
		
		
		
	}
	
	// http://localhost:8088/item/itemFile
	// itemDetail 페이지에서 파일 바꾸기 
	@ResponseBody
	@RequestMapping(value = "/itemFile", method = RequestMethod.POST)
	public List<FileVO> itemFilePOST(Integer it_no, Model model) throws Exception {
		logger.debug("itemFilePOST() 호출");
		
		
		List<FileVO> itemFileVO = iService.itemFile(it_no);
		return itemFileVO;
		
		
		
		
	}
	
	
	// http://localhost:8088/item/coinCharge
	// 대나무페이 충전 GET - 충전페이지로 이동 
	@RequestMapping(value = "/coinCharge", method = RequestMethod.GET)
	public void coinChargeGET(HttpSession session, Model model) throws Exception {
		logger.debug("coinChargeGET() 호출");
		
		// 세션 아이디
		String us_id = (String)session.getAttribute("us_id");
		UserVO userVO = uService.userInfo(us_id);
		model.addAttribute("userVO", userVO);
		
		
	}

	// 대나무페이 충전 POST - 충전금액 입력
	@ResponseBody
	@RequestMapping(value = "/coinCharge", method = RequestMethod.POST)
	public void coinChargePOST(HttpSession session, Model model, PayVO payVO) throws Exception {
		logger.debug("coinChargePOST() 호출");
		
		// 세션 아이디, 코인 금액, url
		String us_id = (String)session.getAttribute("us_id");
		Integer us_coin = (Integer)session.getAttribute("us_coin");
		//String url = (String)session.getAttribute("URL");
		logger.debug("회원 아이디 확인 : " + us_id);
		logger.debug("충전전 코인금액 확인 : " + us_coin);
		
		logger.debug("@@payVO : " + payVO );
		payVO.setUs_id(us_id);
		payVO.setPay_kind("대나무페이");
		payVO.setPay_con("결제완료");
		logger.debug("@@@@@payVO : " + payVO );
		
		// 코인충전
		int us_result = iService.coinCharge(payVO);
		logger.debug(" us_result(성공시 1) : " + us_result);
		
		// 코인값 저장
		us_coin = iService.userCoin(us_id);
		session.setAttribute("us_coin", us_coin);
		logger.debug("충전후 코인금액 확인 : " + us_coin);
		
		
		// 결제 정보 입력
		int pay_result = iService.coinChargePay(payVO);
		logger.debug(" us_result : " + pay_result);
		logger.debug("결제 리스트나 이전 uri로 이동");
	
	
	}
	
	// 구매하기 버튼 클릭시 
	@ResponseBody
	@RequestMapping(value = "/purchase", method = RequestMethod.POST)
	public int purchasePOST(HttpSession session, Model model, Integer it_no) throws Exception {
		logger.debug("coinChargePOST() 호출");
		
		// 세션 아이디, 코인 금액
		String us_id = (String)session.getAttribute("us_id");
		Integer us_coin = (Integer)session.getAttribute("us_coin");
		logger.debug("회원 아이디 확인 : " + us_id);
		logger.debug("충전전 코인금액 확인 : " + us_coin);
		int coinResult=0;
		int itResult=0;
		int alResult=0;
		
		// it_no로 정보 조회
		ItemVO itemVO = iService.itemDetail(it_no);
		
		// 코인 비교 
		if(us_coin >= itemVO.getIt_price()) { // 코인이 충분하면
			
			// 코인 차감
			UserVO PurchaseVO = new UserVO();
			PurchaseVO.setUs_id(us_id);
			PurchaseVO.setUs_coin(itemVO.getIt_price()); // 아이템 가격입력 
			coinResult = iService.purchase(PurchaseVO);
			logger.debug("코인차감 결과 coinResult : " + coinResult);
			
			// 코인값 저장
			us_coin = iService.userCoin(us_id);
			session.setAttribute("us_coin", us_coin);
			logger.debug("구매후 코인금액 확인 : " + us_coin);
			
			// 거래 테이블에 기록(insert )
			TradeVO tradeVO = new TradeVO();
			tradeVO.setUs_id(us_id);
			tradeVO.setTr_sell_us(itemVO.getUs_id());
			tradeVO.setTr_item(itemVO.getIt_no());
			tradeVO.setTr_buy_state(0);
			tradeVO.setTr_sell_state(0);
			tradeVO.setTr_price(itemVO.getIt_price());
			iService.itemTrade(tradeVO);
			
			// insert된 글의 tr_no 가져오기 
			itemVO.setTr_no(iService.getTr_no());
			
			// 글 상태 변경 (판매중 -> 예약중 , 현재 거래 번호 업데이트)
			itResult = iService.itStateChange(itemVO);
			logger.debug("글상태변경 결과 itResult : " + itResult);
			
			
			// 판매자에게 알람 보내기
			AlarmVO alarmVO = new AlarmVO();
			alarmVO.setUs_id(us_id);
			alarmVO.setAl_reciver_id(itemVO.getUs_id());
			alarmVO.setAl_content(itemVO.getIt_title()+"을 예약했습니다.");
			alarmVO.setAl_con("안읽음");
			
			
			alResult = iService.alarmSend(alarmVO);
			logger.debug("알람보내기 결과 alResult : " + alResult);
			
		}else { // 코인이 충분하지 않으면
			return 0;
		}
		
		return coinResult+itResult+alResult;
	
	}
	
	
	// 알람 클릭시 
	@ResponseBody
	@RequestMapping(value = "/alarmList", method = RequestMethod.POST)
	public List<AlarmVO> alarmList(HttpSession session) throws Exception {
		logger.debug("/item/alarmList() 호출");
		
		// 세션 아이디
		String us_id = (String)session.getAttribute("us_id");
		
		// 알람 조회
		return iService.alarmList(us_id);
		
	}
	
	// 구매자 유저가 취소버튼 클릭시 (1)
	@ResponseBody
	@RequestMapping(value = "/userPurchaseCancle", method = RequestMethod.POST)
	public int purchaseCancle(HttpSession session, Integer it_no) throws Exception {
		logger.debug("/item/purchaseCancle() 호출");
		
		// 세션 아이디
		String us_id = (String)session.getAttribute("us_id");

		// 아이템 글정보 가져오기 
		ItemVO itemVO = new ItemVO();
		itemVO = iService.itemDetail(it_no);
		
		// 취소시 판매자(상대방)에게 알람
		AlarmVO alarmVO = new AlarmVO();
		alarmVO.setUs_id(us_id);
		alarmVO.setAl_reciver_id(itemVO.getUs_id());
		alarmVO.setAl_content(itemVO.getIt_title()+"을 취소했습니다.");
		alarmVO.setAl_con("안읽음");
		int alarmResult = iService.alarmSend(alarmVO);
		logger.debug("alarmResult : " + alarmResult);
		
		// tr_buy_state 를 2(취소하기버튼)으로 변경
		int buyStateResult = iService.userPurchaseCancle(itemVO.getTr_no());
		logger.debug("buyStateResult : " + buyStateResult);
		// tr_sell_state 상태확인 
		int sellerState = iService.sellerState(itemVO.getTr_no());
		logger.debug("sellerState : " + sellerState);
		
		// 만약 둘다 상태가 2라면 둘다 취소 버튼을 눌렀다는 뜻
		if(sellerState == 2) {
			
			// 구매자한테 돈 돌려주기 
			UserVO userVO = new UserVO();
			userVO.setUs_id(us_id);
			userVO.setUs_coin(itemVO.getIt_price());
			int itemCoinResult = iService.itemCoinTo(userVO);
			logger.debug("itemCoinResult : "+ itemCoinResult);
			
			// 돈 돌려받기
			int us_coin = (Integer)session.getAttribute("us_coin");
			us_coin = us_coin + itemVO.getIt_price();
			session.setAttribute("us_coin", us_coin);
			
			// 글 상태 바꾸기 (예약중 -> 판매중, 거래글번호 -> 1)
			int itemResell = iService.itemResellState(itemVO);
			logger.debug(" itemResell : " + itemResell);
			
			// 취소 처리된 날짜 입력
			int DateUpdate = iService.tradeDateUpdate(itemVO.getTr_no());
			logger.debug(" DateUpdate : " + DateUpdate);
			
		}
		
		return sellerState;
		
	}
	
	// 판매자 유저가 취소버튼 클릭시 (2)
	@ResponseBody
	@RequestMapping(value = "/sellerPurchaseCancle", method = RequestMethod.POST)
	public int sellerPurchaseCancle(HttpSession session, Integer it_no, Integer tr_no) throws Exception {
		logger.debug("/item/purchaseCancle() 호출");
		
		// 세션 아이디(판매자 아이디)
		String us_id = (String)session.getAttribute("us_id");
		logger.debug("us_id : " + us_id);
		logger.debug("it_no : " + it_no);
		logger.debug("tr_no : " + tr_no);
		
		ItemVO itemVO = new ItemVO();
		itemVO = iService.itemDetail(it_no);
		logger.debug("itemVO : " + itemVO);
		
		// 구매자 정보 불러오기
		UserVO buyerVO = iService.buyerInfo(tr_no);
		
		// 취소시 구매자(상대방)에게 알람
		AlarmVO alarmVO = new AlarmVO();
		alarmVO.setUs_id(us_id);
		alarmVO.setAl_reciver_id(buyerVO.getUs_id());
		alarmVO.setAl_content(itemVO.getIt_title()+"을 취소했습니다.");
		alarmVO.setAl_con("안읽음");
		int alarmResult = iService.alarmSend(alarmVO);
		logger.debug("alarmResult : " + alarmResult);
		
		// tr_sell_state 를 2(취소하기버튼)으로 변경
		int sellerStateResult = iService.sellerPurchaseCancle(tr_no);
		logger.debug("sellerStateResult : " + sellerStateResult);
		// tr_buy_state 상태확인 
		int buyerState = iService.buyerState(tr_no);
		logger.debug("buyerState : " + buyerState);
		
		// 만약 둘다 상태가 2라면 둘다 취소 버튼을 눌렀다는 뜻
		if(buyerState == 2) {
			
			// 구매자한테 돈 돌려주기 
			UserVO userVO = new UserVO();
			userVO.setUs_id(buyerVO.getUs_id());
			userVO.setUs_coin(itemVO.getIt_price());
			int itemCoinResult = iService.itemCoinTo(userVO);
			logger.debug("itemCoinResult : "+ itemCoinResult);
			
			// 글 상태 바꾸기 (예약중 -> 판매중, 현재 거래번호 -> 1)
			int itemResell = iService.itemResellState(itemVO);
			logger.debug(" itemResell : " + itemResell);
			
			// 취소 처리된 날짜 입력
			int DateUpdate = iService.tradeDateUpdate(tr_no);
			logger.debug(" DateUpdate : " + DateUpdate);
			
		}
		
		return buyerState;
		
	}
	
	// 구매자 유저가 구매확정하기 버튼 클릭시 (3)
	@ResponseBody
	@RequestMapping(value = "/userPurchaseOk", method = RequestMethod.POST)
	public int userPurchaseOk(HttpSession session, Integer it_no) throws Exception {
		logger.debug("/item/userPurchaseOk() 호출");
		
		// 세션 아이디(구매자 아이디)
		String us_id = (String)session.getAttribute("us_id");
		
		ItemVO itemVO = new ItemVO();
		itemVO = iService.itemDetail(it_no);
		
		// 구매확정시 판매자(상대방)에게 알람
		AlarmVO alarmVO = new AlarmVO();
		alarmVO.setUs_id(us_id);
		alarmVO.setAl_reciver_id(itemVO.getUs_id());
		alarmVO.setAl_content(itemVO.getIt_title()+"을 구매확정했습니다.");
		alarmVO.setAl_con("안읽음");
		int alarmResult = iService.alarmSend(alarmVO);
		logger.debug("alarmResult : " + alarmResult);
		
		// tr_buy_state 를 1(구매확정하기버튼)로 변경
		int buyStateResult = iService.userPurchase(itemVO.getTr_no());
		logger.debug("buyStateResult : " + buyStateResult);
		// tr_sell_state 상태확인 
		int sellerState = iService.sellerState(itemVO.getTr_no());
		logger.debug("sellerState : " + sellerState);
		
		// 만약 둘다 상태가 1이라면 둘다 구매확정하기 버튼을 눌렀다는 뜻
		if(sellerState == 1) {
			
			// 판매자한테 돈 입금하기 
			UserVO userVO = new UserVO();
			userVO.setUs_id(itemVO.getUs_id());
			userVO.setUs_coin(itemVO.getIt_price());
			int itemCoinResult = iService.itemCoinTo(userVO);
			logger.debug("itemCoinResult : "+ itemCoinResult);
			
			
			
			// 글 상태 바꾸기 (예약중 -> 판매완료)
			int itemResell = iService.itemSoldoutState(itemVO);
			logger.debug(" itemResell : " + itemResell);
			
			// 판매 완료된 날짜 입력
			int DateUpdate = iService.tradeDateUpdate(itemVO.getTr_no());
			logger.debug(" DateUpdate : " + DateUpdate);
			
		}
		
		return sellerState;
	}
	
	// 판매자 유저가 구매확정하기 버튼 클릭시 (4)
	@ResponseBody
	@RequestMapping(value = "/sellerPurchaseOk", method = RequestMethod.POST)
	public int sellerPurchaseOk(HttpSession session, Integer it_no) throws Exception {
		logger.debug("/item/sellerPurchaseOk() 호출");
		
		// 세션 아이디(판매자 아이디)
		String us_id = (String)session.getAttribute("us_id");
		ItemVO itemVO = new ItemVO();
		itemVO = iService.itemDetail(it_no);
		logger.debug("판매글 정보 itemVO : " +itemVO);
		
		
		// 구매자 정보 불러오기
		UserVO buyerVO = iService.buyerInfo(itemVO.getTr_no());
		logger.debug("구매자 정보 buyerVO : " +buyerVO);
		
		// 구매확정시 구매자(상대방)에게 알람
		AlarmVO alarmVO = new AlarmVO();
		alarmVO.setUs_id(us_id);
		alarmVO.setAl_reciver_id(buyerVO.getUs_id());
		alarmVO.setAl_content(itemVO.getIt_title()+"을 구매확정했습니다.");
		alarmVO.setAl_con("안읽음");
		int alarmResult = iService.alarmSend(alarmVO);
		logger.debug("alarmResult : " + alarmResult);
		
		// tr_sell_state 를 1(구매확정하기버튼)로 변경
		int sellerStateResult = iService.sellerPurchase(itemVO.getTr_no());
		logger.debug("sellerStateResult : " + sellerStateResult);
		// tr_buy_state 상태확인 
		int buyerState = iService.buyerState(itemVO.getTr_no());
		logger.debug("buyerState : " + buyerState);
		
		// 만약 둘다 상태가 1이라면 둘다 구매확정 버튼을 눌렀다는 뜻
		if(buyerState == 1) {
			
			// 판매자한테 돈 입금하기 
			UserVO userVO = new UserVO();
			userVO.setUs_id(us_id);
			userVO.setUs_coin(itemVO.getIt_price());
			int itemCoinResult = iService.itemCoinTo(userVO);
			logger.debug("itemCoinResult : "+ itemCoinResult);
			
			 int us_coin = (Integer)session.getAttribute("us_coin");
			 us_coin = us_coin + itemVO.getIt_price();
			 session.setAttribute("us_coin", us_coin);
			
			// 글 상태 바꾸기 (예약중 -> 판매완료)
			int itemResell = iService.itemSoldoutState(itemVO);
			logger.debug(" itemResell : " + itemResell);
			
			// 판매 완료된 날짜 입력
			int DateUpdate = iService.tradeDateUpdate(itemVO.getTr_no());
			logger.debug(" DateUpdate : " + DateUpdate);
			
		}
		
		return buyerState;
	}
	
	// 유저가 체험단 신청시 버튼 클릭시
	@ResponseBody
	@RequestMapping(value = "/userExpApply", method = RequestMethod.POST)
	public int userExpApply(HttpSession session, String ent_id) throws Exception {
		logger.debug("/item/userExpApply() 호출");
		
		// 아이디(체험단 신청하는 유저 아이디)
		String us_id = (String)session.getAttribute("us_id");
		logger.debug("us_id : " + us_id);
		// 체험단 받는 기업
		logger.debug("ent_id : " + ent_id);
		
		// 체험단 모집 정보 조회
		int exp_no = iService.getExpInfo(ent_id);
		logger.debug("exp_no : " + exp_no);
		
		
		// expus 테이블에 목록 추가
		ExpusVO expusVO = new ExpusVO();
		expusVO.setExp_no(exp_no);
		expusVO.setUs_id(us_id);
		expusVO.setOwn_id(ent_id);
		int expApplyResult = iService.expApply(expusVO);
		logger.debug("expApplyResult : " + expApplyResult);
		
		// exp 테이블에 신청인원 +1
		int expCountUpResult = iService.expCountUp(exp_no);
		logger.debug("expCountUpResult : " + expCountUpResult);
		
		
		return 0;
	}
	
	
	// 메인페이지에 왔을때 세션에 위도경도값 저장
	@ResponseBody
	@RequestMapping(value = "/location", method = {RequestMethod.GET,RequestMethod.POST})
	public int location(HttpSession session, @RequestParam("latitude") double latitude , @RequestParam("longitude") double longitude) throws Exception {
		logger.debug("/item/location() 호출");
		
		logger.debug("latitude : "+ latitude);
		logger.debug("longitude : "+ latitude);
		
		// 위도
		session.setAttribute("latitude", latitude);
		// 경도 
		session.setAttribute("longitude", longitude);
	
		return 1;
	}
	
	// 환불하기 
	@ResponseBody
	@RequestMapping(value = "/coinRefund", method = RequestMethod.GET)
	public int coinRefund(HttpSession session, Integer us_coin) throws Exception {
		logger.debug("/item/coinRefund() 호출");
		
		String us_id = (String)session.getAttribute("us_id");
		
		UserVO refundVO = new UserVO();
		refundVO.setUs_id(us_id);
		refundVO.setUs_coin(us_coin);
		logger.debug("us_id : " + us_id);
		logger.debug("us_coin : " + us_coin);
		
		int result = iService.coinRefund(refundVO);
		logger.debug("환불 결과 : " + result);
		
		int us_coin_re = (Integer)session.getAttribute("us_coin");
		us_coin_re = us_coin_re - us_coin;
		session.setAttribute("us_coin", us_coin_re);
		
		return result;
	}
	
	// 글 삭제하기
	@ResponseBody
	@RequestMapping(value = "/itemDelete", method = RequestMethod.POST)
	public int itemDelete(Integer it_no) throws Exception {
		logger.debug("/item/itemDelete() 호출");
		
		int result = iService.itemDelete(it_no);
		logger.debug("삭제 결과 : " + result);
		
		return result;
	}
	
	
	
}
