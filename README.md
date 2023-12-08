# Dapao

> 핀테크기반 p2p중고거래 사이트<br>
> 사용자가 쉽고 편리하게 중고거래를 할 수 있게 구현하고, 현존하는 p2p중고거래 사이트에 차별성을 이용한 수익 창출을 목적으로 체험단을 구현해 개발한 SpringMVC 프로젝트

- 프로젝트 기간 : 2023.10.20 ~ 2023.11.20
- 개발 인원 : 6명(팀프로젝트)
- 역할 : 관리자페이지, 체험단 결제, 메인 팝업
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
        <td> 이메일 인증 / KaKaoMap API / PortOne 결제 API / websoket </td>
     </tr>
     <tr>
        <td>협업 도구 </td>
        <td> Git / Github / Notion / Discord  </td>
     </tr>
  </table>

---
### 프로젝트 자료
- [프로젝트 ppt](https://drive.google.com/file/d/1hqNQ1ZEXY04hTep0C-xsdzY2LfjHdqh7/view?usp=drive_link)
- [요구사항 명세서](https://docs.google.com/spreadsheets/d/1FFA3qOzB21SzG6Uqjx2orvPzGaxBtz3uDJz-5e2Ld9Q/edit?usp=sharing)
- [ERD](https://drive.google.com/file/d/1LWLzUtz9KWl1qnz44q4ikGdRB20Zfci_/view?usp=drive_link)
---
### 프로젝트 시연
✔️ **관리자페이지 구현**
---
<img src="https://github.com/yejively/Dapao/assets/143873963/ff917605-86ac-4439-8426-737689c08acf.gif" width="800">

💡 회원, 사업자 관리 페이지
- Dapao 모든 회원, 사업자 내역을 페이징처리 구현
- 회원, 사업자 아이디 클릭시 Ajax비동기처리 개인 상세정보 모달 구현
- 회원, 사업자 정지 구현<br>
정지부여 기간(select값), 아이디의 값으로 Ajax비동기처리 정지구현
<img src="https://github.com/yejively/Dapao/assets/143873963/b3ce9cf2-1345-4677-8467-dd6262ecb4fc.gif" width="500" height="500">

---

✔️ **메인페이지 팝업 구현**
---
<img src="https://github.com/yejively/Dapao/assets/143873963/4b53c5f9-363c-4f80-96fa-9ac5fdb07b3c.gif" width="800">

---
✔️ **정지 구현**


