package com.dapao.controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Configuration
@EnableWebSocket
public class WebSoketConfig implements WebSocketConfigurer{
	
	private final ChatWebSocketHandler webSocketHandler = new ChatWebSocketHandler();
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(webSocketHandler, "/chat")
				.setAllowedOrigins("*")
				.withSockJS()
				.setClientLibraryUrl("http://localhost:8088/chat")
				.setClientLibraryUrl("http://c6d2305t1.itwillbs.com/chat");
	}
}
