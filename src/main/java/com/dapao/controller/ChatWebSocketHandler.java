package com.dapao.controller;


import java.util.ArrayList;
import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
@SessionAttributes
public class ChatWebSocketHandler extends TextWebSocketHandler {
	

	private static final Logger logger = LoggerFactory.getLogger(ChatWebSocketHandler.class);
	//맵에 접속한 유저 정보를 저장하기 위해 문자열과 세션을 저장한다.
	//private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String us_id = (String)session.getAttributes().get("us_id");
		String ent_name = (String)session.getAttributes().get("ent_name");
		logger.debug("us_id"+us_id);
		logger.debug("ent_name"+ent_name);
		if (us_id != null) {
			logger.debug(us_id+"님 접속하셨습니다");
			sessionList.add(session);
			for (WebSocketSession s : sessionList) {
				//s.sendMessage(message);//만든 세션에 메세지를 전달
				s.sendMessage(new TextMessage(us_id+"님이 접속하셨습니다"));//만든 세션에 메세지를 전달
				//log(s.getId() + "에 메시지 발송: " + message.getPayload());//로그 찍기
			}
		}
		if (ent_name != null) {
			logger.debug(ent_name+"님 접속하셨습니다");
			sessionList.add(session);
			for (WebSocketSession s : sessionList) {
				//s.sendMessage(message);//만든 세션에 메세지를 전달
				s.sendMessage(new TextMessage(ent_name+"님이 접속하셨습니다"));//만든 세션에 메세지를 전달
				//log(s.getId() + "에 메시지 발송: " + message.getPayload());//로그 찍기
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String us_id = (String)session.getAttributes().get("us_id");
		String ent_name = (String)session.getAttributes().get("ent_name");
		if (us_id != null) {
			logger.debug(us_id+"님 퇴장하셨습니다");
			sessionList.remove(session);
			for (WebSocketSession s : sessionList) {
				//s.sendMessage(message);//만든 세션에 메세지를 전달
				s.sendMessage(new TextMessage(us_id+"님이 퇴장하셨습니다"));//만든 세션에 메세지를 전달
				//log(s.getId() + "에 메시지 발송: " + message.getPayload());//로그 찍기
			}
		}
		if (ent_name != null) {
			logger.debug(ent_name+"님 퇴장하셨습니다");
			sessionList.remove(session);
			for (WebSocketSession s : sessionList) {
				//s.sendMessage(message);//만든 세션에 메세지를 전달
				s.sendMessage(new TextMessage(ent_name+"님이 퇴장하셨습니다"));//만든 세션에 메세지를 전달
				//log(s.getId() + "에 메시지 발송: " + message.getPayload());//로그 찍기
			}
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String us_id = (String)session.getAttributes().get("us_id");
		String ent_name = (String)session.getAttributes().get("ent_name");
		//log(session.getId() + "로부터 메시지 수신: " + message.getPayload());
		//클라이언트 목록에 보관된 모든 클라이언트에게 메세지를 전달하는 로직
		//맵에 들어있는 값(유저들)을 이용해 세션을 만든다
		
		if (us_id != null) {
			logger.debug("handleTextMessage");
			for (WebSocketSession s : sessionList) {
				//s.sendMessage(message);//만든 세션에 메세지를 전달
				s.sendMessage(new TextMessage(us_id+" : "+message.getPayload()));//만든 세션에 메세지를 전달
				//log(s.getId() + "에 메시지 발송: " + message.getPayload());//로그 찍기
			}
		}
		if (ent_name != null) {
			logger.debug("handleTextMessage");
			for (WebSocketSession s : sessionList) {
				//s.sendMessage(message);//만든 세션에 메세지를 전달
				s.sendMessage(new TextMessage(ent_name+" : "+message.getPayload()));//만든 세션에 메세지를 전달
				//log(s.getId() + "에 메시지 발송: " + message.getPayload());//로그 찍기
			}
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		//log(session.getId() + " 익셉션 발생: " + exception.getMessage());
		logger.debug("Error");
	}
	
}