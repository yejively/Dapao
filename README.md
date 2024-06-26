# Dapao

> 핀테크기반 p2p 중고 거래 사이트<br>
> 사용자가 쉽고 편리하게 중고 거래를 할 수 있게 구현하고, 현존하는 p2p 중고 거래 사이트에 차별성을 이용한 수익 창출을 목적으로 체험단을 구현해 개발한 SpringMVC 프로젝트.

- 프로젝트 기간 : 2023.10.20 ~ 2023.11.20
- 개발 인원 : 6명(팀프로젝트)
- 맡은 역할 : 관리자페이지, 체험단 결제, 메인 팝업
- 개발환경 : SpringFramework, SpringMVC
- 사용 기술

  <table border = 1>
     <tr>
        <td>백엔드 </td>
        <td> Spring / Java  </td>
     </tr>
     <tr>
        <td>프론트엔드 </td>
        <td> HTML / CSS / JavaScript / JQuery / Ajax / JSON  </td>
     </tr>
     <tr>
        <td>DB </td>
        <td> MySQL  </td>
     </tr>
     <tr>
        <td>서버 </td>
        <td> Tomcat </td>
     </tr>
     <tr>
        <td>API </td>
        <td> KaKaoMap API / PortOne 결제 API / websoket </td>
     </tr>
     <tr>
        <td>협업 도구 </td>
        <td> Git / Github / Notion / Discord  </td>
     </tr>
  </table>

---
## 프로젝트 자료
- [프로젝트 ppt](https://drive.google.com/file/d/1hqNQ1ZEXY04hTep0C-xsdzY2LfjHdqh7/view?usp=drive_link)
- [요구사항 명세서](https://docs.google.com/spreadsheets/d/1FFA3qOzB21SzG6Uqjx2orvPzGaxBtz3uDJz-5e2Ld9Q/edit?usp=sharing)
- [ERD](https://drive.google.com/file/d/1LWLzUtz9KWl1qnz44q4ikGdRB20Zfci_/view?usp=drive_link)
---
## 프로젝트 시연 - 담당한 기능(Front + Back)
#### 관리자페이지 구현
<img src="https://github.com/yejively/Dapao/assets/143873963/ff917605-86ac-4439-8426-737689c08acf.gif" width="800">

💡 회원, 사업자 관리 페이지
- Dapao 모든 회원, 사업자 내역을 페이징처리 구현
- 회원, 사업자 아이디 클릭 시 Ajax 비동기 처리 개인 상세정보 모달 구현
- 회원, 사업자 정지 구현<br>
<details>
	<summary>정지 구현 Ajax 비동기 처리 코드</summary>
	
```JavaScript
	// 정지클릭했을때 정지기간부여
	$('#stop').click(function() {
		var us_id = $('#us_id').val();
		var us_stopdate = $('select[name=stop]').val(); // 7, 30, 100
		$.ajax({
			url : "/admin/userStop",
			data : {
				"us_id" : us_id,
				"us_stopdate" : us_stopdate
			},
			dataType : "json",
			success : function(data) {
				if (data == 1) {
					alert("정상적으로 정지가 부여되었습니다.");
					$('#myModal').modal('hide');
						location.replace("/admin/userList?page=${param.page}");
					}
				},
			});
		});
```
```Java
	// 회원관리 - 회원정지부여
	@ResponseBody
	@RequestMapping(value = "/userStop")
	public int userStop(@RequestParam("us_id") String us_id, @RequestParam("us_stopdate") String us_stopdate)
			throws Exception {
		UserVO vo = new UserVO();
		vo.setUs_id(us_id);
		vo.setUs_stopdate(us_stopdate);

		aService.userStateUpdate(us_id);

		return aService.userStop(vo);
	}
```
```Java
	<!-- 회원관리 - 회원정지부여 -->
	<update id="userStop">
		update us set us_stopdate=date_add(now(), interval
		#{us_stopdate} day) where us_id=#{us_id};
	</update>
```
</details>

---

#### 체험단 관리 페이지 / 메인페이지 팝업 구현
<img src="https://github.com/yejively/Dapao/assets/143873963/4b53c5f9-363c-4f80-96fa-9ac5fdb07b3c.gif" width="800">

💡 체험단 신청 관리 페이지
- Dapao 사업자가 체험단 신청 시 -> 체험단 관리 페이지에 신청정보를 페이징 처리 구현
- 체험단 신청번호 클릭 시 Ajax 비동기 처리 상세정보 모달 구현
- default 접수 상태 -> 관리자의 승인, 반려 기능 구현

💡 메인페이지 팝업(모달) 구현
<details>
	<summary>팝업 구현 코드</summary>
	
```JavaScript
	 $.ajax({
    		url : "/ad/modalShow",
 		dataType : "json",
 		success : function(data){
 			console.log(data);
 			if(data != null){
	 			$.each(data,function(index,exp){
	 				if(exp.exp_psn_ch != exp.exp_psn){
		 				$('#myModal').modal("show");
		 				
	 					$.each(exp.entList,function(idx,ent){
	 						$('.ent_name').val(ent.ent_name);
	 					});
	 					$('.exp_content').append(exp.exp_content);
	 					$('.exp_notice').append(exp.exp_notice);
	 					$('.exp_psn_ch').val(exp.exp_psn_ch+"/"+exp.exp_psn);
	 				}
 				}); 
	 		}
 		},
	});
```
```Java
	// 메인체험단 공고 - 출력문
	@RequestMapping("/modalShow")
	public List<ExpVO> modalShow() throws Exception{
		List<ExpVO> exp = new ArrayList<ExpVO>();
		return adService.modalShow();
	}
```
```Java
	<!-- 팝업 구현(체험단 상태 확인) -->
	<select id="modalShow" resultMap="expMap">
		select ent.ent_name,exp.* from exp join ent 
		on exp.own_id = ent.own_id 
		where exp.exp_state=1 
		order by rand()
	</select>
```
</details>

---

## 성장한 부분
- Spring Framework를 사용하면서 기존의 개발방식에서 벗어나 더 편리하고, 다양한 모듈과 기능을 사용해<br>
프로젝트를 끝내면서 한 단계 더 성장할 수 있었습니다.
- 1차 프로젝트 때와는 다르게 형상 관리 Git을 사용해 팀원들과 소스 코드를 관리하며 진행하였습니다.<br>
Git에 대해 많이 알게 되고, 앞으로 Git을 유용하게 사용할 것입니다.



