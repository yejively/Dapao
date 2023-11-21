package com.dapao.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j;

// http://localhost:8088/echo
// http://localhost:8088/echo
@RequestMapping(value = "/echo")
public class EchoHandler extends TextWebSocketHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	
	// 채팅을 위해 해당 챗에 들어오면 클라이언트가 연결된 후 해당 클라이언트의 세션을 sessionList에 add한다
	// 웹소켓이 연결되면 호출되는 메서드 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		//super.afterConnectionEstablished(session);
		
		sessionList.add(session);
		logger.debug(session.getId() + "님이 입장하셨습니다.(연결됨)");
		
	}

	// 웹 소켓 서버로 메세지를 전송했을 때 이 메서드가 호출된다
	// 현재 웹 소켓 서버에 접속한 Session 모두에게 메세지를 전달해야 하므로 loop를 돌며 메세지를 전송한다
	// 클라이언트가 메세지 전송 시 호출되는 메서드 
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		// super.handleTextMessage(session, message);
		
		logger.debug(session.getId() + " 님의 메세지 : " + message.getPayload());
		
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(message.getPayload()));
		}
		
	}

	
	// 클라이언트와 연결이 끊어진 경우(채팅방을 나간 경우) remove로 해당 세션을 제거한다 
	// 웹소켓 연결이 해제되면 호출되는 메서드 
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		// super.afterConnectionClosed(session, status);
		
		sessionList.remove(session);
		logger.debug(session.getId() + "님이 퇴장하셨습니다.(연결 종료)");
	}
}
