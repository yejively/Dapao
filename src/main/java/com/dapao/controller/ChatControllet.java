package com.dapao.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/websocket/*")
@SessionAttributes
public class ChatControllet {

	private static final Logger logger = LoggerFactory.getLogger(ChatControllet.class);
	
	@RequestMapping("/chat")
	public String chat(HttpSession session) throws Exception{
//		logger.debug("dffdfdd");
//		logger.debug("dfssdfsdfy3535"+(String)session.getAttribute("us_id"));
		String us_id = (String)session.getAttribute("us_id");
		String ent_name = (String)session.getAttribute("ent_name");
		logger.debug("session"+us_id);
		if(us_id != null){
			logger.debug("us_id : "+us_id);
           return "redirect:/websocket/chat/"+us_id;
        }  
		
		if(ent_name != null){
			logger.debug("ent_name : "+ent_name);
			return "redirect:/websocket/chat/"+ent_name;
		}  
		
		return "로그인이 필요합니다";
		
	}
	
	// http://localhost:8088/websocket/chat
	// http://localhost:8088/chat
	@RequestMapping("/chat/{id}")
	 public String userChattingRoom(@PathVariable("id") String us_id,
			 						@PathVariable("id") String ent_name,
								 HttpSession session,
								 Model model) throws Exception{
		
	        if(us_id != null){
	            model.addAttribute("us_id", us_id);
	        }else{
	            return "로그인이 필요합니다";
	        }
	        
	        if(ent_name != null){
	        	model.addAttribute("ent_name", ent_name);
	        }else{
	        	return "로그인이 필요합니다";
	        }
	        
	        return "chat";
	    }

}
