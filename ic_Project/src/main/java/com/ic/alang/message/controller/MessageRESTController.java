package com.ic.alang.message.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ic.alang.member.service.MemberServiceImpl;
import com.ic.alang.message.service.MessageServiceImpl;
import com.ic.alang.vo.MemberVo;

@Controller
@RequestMapping("/message/*")
@ResponseBody

public class MessageRESTController {
	
	@Autowired
	private MemberServiceImpl memberServiceImpl;
	
	@Autowired
	private MessageServiceImpl messageServiceImpl;
	
	@RequestMapping("MessageisExistId.do")
	public HashMap<String, Object> MessageisExistId(String id){
		System.out.println("isExistId.do 호출됨");
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		boolean isExist = memberServiceImpl.isExistId(id);
		
		MemberVo getMemberInfoByID = messageServiceImpl.getMemberInfoByID(id);
		data.put("isExist", isExist);
		data.put("getMemberInfoByID", getMemberInfoByID);
		
		System.out.println("isExist : "+isExist);
		return data;
	}
	
	
//	@RequestMapping("getMemberNoByMemberId.do")
//	public HashMap<String, Object> getMemberNoByMemberId(String id){
//		HashMap<String, Object> data = new HashMap<String, Object>();
//
//		MemberVo getMemberInfoByID = messageServiceImpl.getMemberInfoByID(id);
//			data.put("getMemberInfoByID", getMemberInfoByID);
//			
//			return data;
//	}

}
