package com.ic.alang.message.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ic.alang.member.mapper.MemberSQLMapper;
import com.ic.alang.message.service.MessageServiceImpl;
import com.ic.alang.vo.MemberVo;
import com.ic.alang.vo.MessageVo;

@Controller
@RequestMapping("/message/*")
public class MessageController {
	
	
	
	@Autowired
	private MessageServiceImpl messageService;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@RequestMapping("recvMessageList.do")
	public String MessageList(HttpSession session , Model model ,MessageVo param) {
		
		//메세지 리스트
		ArrayList<HashMap<String, Object>> msg = messageService.getRecvMessageList();
		model.addAttribute("msg" , msg);
		
		
//		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
//		int message_recv = sessionUser.getMember_no();
//		param.setMessage_recv(message_recv);
				
		return "message/recvMessageList";
	}
//	@RequestMapping("recvMessageList.do")
//	public String recvMessageList(MessageVo param) {
//		
//		int message_send = param.getMessage_send();
//		messageService.sendMessageByNo(message_send);
//		
//		param.setMessage_send(message_send);
//		
//		return "message/recvMessageList.do";
//	}
	@RequestMapping("messageWritePage.do")
	public String MessageWritePage(HttpSession session) {
		
		return "message/messageWritePage";
	}
	@RequestMapping("messageWirteProcess.do")
	public String messageWirteProcess(MessageVo param, HttpSession session) {
			
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser"); 
		
		int message_send = sessionUser.getMember_no();
		
		param.setMessage_send(message_send);
		
		messageService.writeMessage(param);
	
		return "redirect:./sendMessageList.do";
	}
	@RequestMapping("messageReadPage.do")
	public String messageReadPage(int message_no , Model model) {
		
		HashMap<String, Object> data = messageService.getMessage(message_no);
			
		model.addAttribute("data",data);
				
		return "message/messageReadPage";
	}
	public String deleteMessageProcess(int message_no) {
		messageService.deleteMessageByNo(message_no);
		return "redirect:./sendMessageList.do";
	}
}
