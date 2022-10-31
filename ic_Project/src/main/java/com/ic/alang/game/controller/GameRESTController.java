package com.ic.alang.game.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ic.alang.game.mapper.GameSQLMapper;
import com.ic.alang.game.service.GameServiceImpl;
import com.ic.alang.member.mapper.MemberSQLMapper;
import com.ic.alang.vo.BidVo;
import com.ic.alang.vo.GameVo;
import com.ic.alang.vo.MemberVo;

@Controller
@RequestMapping("/game/*")
@ResponseBody
public class GameRESTController {
	
	@Autowired
	private GameServiceImpl gameServiceImpl;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	
	@RequestMapping("checkPoint.do")
	public HashMap<String, Object> checkPoint(HttpSession session) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		
        MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
        int member_no = sessionUser.getMember_no();
        
        MemberVo UserInfo = memberSQLMapper.getMemberByNo(member_no);
        
        data.put("UserInfo", UserInfo);

		return data;
	}
	
	
	
}
