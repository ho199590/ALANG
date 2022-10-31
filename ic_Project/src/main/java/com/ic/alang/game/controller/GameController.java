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

import com.ic.alang.admin.service.AdminServiceimpl;
import com.ic.alang.game.mapper.GameSQLMapper;
import com.ic.alang.game.service.GameServiceImpl;
import com.ic.alang.member.mapper.MemberSQLMapper;
import com.ic.alang.vo.BidVo;
import com.ic.alang.vo.GameVo;
import com.ic.alang.vo.MemberVo;

@Controller
@RequestMapping("/game/*")
public class GameController {
	
	@Autowired
	private GameServiceImpl gameServiceImpl;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private GameSQLMapper gameSQLMapper;
	
	@Autowired
	private AdminServiceimpl adminServiceimpl;


	@RequestMapping("gameMake.do")
	public String gameMake(HttpSession session) {		
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		session.setAttribute("sessionUser", sessionUser);
		MemberVo AdminUser=adminServiceimpl.login(sessionUser);
		
		if(AdminUser !=null) {
			//로그인 성공
								
			return "/game/gameMake";
		}else {
			//로그인 실패
			return "admin/adminLoginFail";
		}
				
	}
	
	@RequestMapping("gameMakeProcess.do")
	public String gameMakeprocess(GameVo param, HttpSession session) {		
				
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		session.setAttribute("sessionUser", sessionUser);
		MemberVo AdminUser=adminServiceimpl.login(sessionUser);
		
		if(AdminUser !=null) {
			gameServiceImpl.gameMake(param);
			
			return "redirect:../admin/adminGameControlPage.do";
		}else {
			//로그인 실패
			return "admin/adminLoginFail";
		}
				
	}
	
	
	
	@RequestMapping("gameMainPage.do")
	public String gameMainPage(Model model) {
		
		ArrayList<HashMap<String, Object>> gamelist = gameServiceImpl.getGameBoardList();
		model.addAttribute("gamelist", gamelist);
		
		return "game/gameMainPage";
	}
	@RequestMapping("showGame.do")
	public String showGame(int game_no, Model model) {
	
		HashMap<String, Object> gamedata = gameServiceImpl.showGame(game_no);
		ArrayList<HashMap<String, Object>> gameresultdata = gameServiceImpl.getSecondWinnerList(game_no);
		GameVo gameVo = gameSQLMapper.showGameByNo(game_no);
		Date endtime = gameVo.getGame_end_time();
		
		//현재 시간과 비교 후 넘기기..!!!
		Date ddd = new Date();
		
		if(ddd.before(endtime)) {
			model.addAttribute("gamedata", gamedata);
			
			return "game/showGame";
		}else {
			model.addAttribute("gamedata", gamedata);
			model.addAttribute("gameresultdata", gameresultdata);			
			return "game/gameResult";
		}
		
		
		
	}
	@RequestMapping("bidDo.do")
	public String bidDo(BidVo param, HttpSession session, GameVo game) {
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		session.setAttribute("sessionUser", sessionUser);
		
		int member_no = sessionUser.getMember_no();
		int game_no = game.getGame_no();
		int bid_point = param.getBid_point();
		param.setMember_no(member_no);
		param.setGame_no(game_no);
		param.setBid_point(bid_point);
		
		gameServiceImpl.bidDo(param);
		gameServiceImpl.usePointBid(param);
		return "redirect:./gameMainPage.do";
		
	}
	
	
}
