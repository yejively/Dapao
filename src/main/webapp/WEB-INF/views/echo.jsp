<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./include/header.jsp"%>
<title>에코</title>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#sendBtn').click(function() { sendMessage(); });//버튼을 누르면 함수 실행
	});
	
	var wsocket;
	function sendMessage() {
		//HTML5가 제공하는 웹소켓 객체 WebSocket 생성하여 변수에 담기
		//매개변수로 http가 아닌 웹소켓의 줄임말인 ws: 로 시작하면서,
		//스프링 설정 파일에 명시한 엔드포인트로 끝나는 주소를 담아준다.
		wsocket = new WebSocket("wss://localhost:8088");
		wsocket.onmessage = onMessage;//소켓이 보낸 메세지 처리 함수
		wsocket.onclose = onClose;//소켓 종료 처리 함수
		wsocket.onopen = function() {//소켓 오픈 처리 함수
			wsocket.send( $("#message").val() );//메세지 보낼 때 함수
		};
	}
	function onMessage(evt) {//메세지 처리 함수
		var data = evt.data;
		alert("서버에서 데이터 받음: " + data);
		wsocket.close();
	}
	function onClose(evt) {//종료 함수
		alert("연결 끊김");
	}
</script>

    <input type="text" id="message">
    <input type="button" id="sendBtn" value="전송">
<%@include file="./include/footer.jsp"%>