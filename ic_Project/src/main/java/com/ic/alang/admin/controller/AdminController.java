package com.ic.alang.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ic.alang.admin.service.AdminServiceimpl;
import com.ic.alang.game.service.GameServiceImpl;
import com.ic.alang.vo.GameVo;
import com.ic.alang.vo.MemberVo;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminServiceimpl adminServiceimpl;
	
	@Autowired
	private GameServiceImpl gameServiceImpl;
	

	@RequestMapping("adminLoginPage.do")
		public String adminLoginPage() {
		
		return "admin/adminLoginPage";
	}
	
	@RequestMapping("adminLoginProcess.do")
	public String adminLoginProcess(MemberVo param, HttpSession session) {
		//서비스 생성
		MemberVo AdminUser=adminServiceimpl.login(param);
		
		if(AdminUser !=null) {
			//로그인 성공
			session.setAttribute("sessionUser", AdminUser);
			
			return "redirect:./adminMainPage.do";
		}else {
			//로그인 실패
			return "admin/adminLoginFail";
		
		}
		
	}
	
	@RequestMapping("adminMainPage.do")
	public String adminMainPage(HttpSession session, Model model) {
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		session.setAttribute("sessionUser", sessionUser);
		MemberVo AdminUser=adminServiceimpl.login(sessionUser);
		
		if(AdminUser !=null) {
			//로그인 성공
			ArrayList<HashMap<String, Object>> reportList = adminServiceimpl.getreportlist();
			model.addAttribute("reportList", reportList);
					
			return "admin/adminMainPage";
		}else {
			//로그인 실패
			return "admin/adminLoginFail";
		}
	}
	
	@RequestMapping("adminReportDetailPage.do")
	public String adminReportDetailPage(Model model, int reportno) {
		
		HashMap<String, Object> reportDetail = adminServiceimpl.getReportDetailByNo(reportno);				
		
		model.addAttribute("reportDetail", reportDetail);
				
		return "admin/adminReportDetailPage";
	}
	
	@RequestMapping("restrainDay.do")
	public String restrainDay(int reportedMemberNo) {
		adminServiceimpl.restrainDayByMemberNo(reportedMemberNo);
		return "admin/adminCompleteReport";
	}
	@RequestMapping("restrainWeek.do")
	public String restrainWeek(int reportedMemberNo) {
		adminServiceimpl.restrainWeekByMemberNo(reportedMemberNo);
		return "admin/adminCompleteReport";
	}
	@RequestMapping("restrainMonth.do")
	public String restrainMonth(int reportedMemberNo) {
		adminServiceimpl.restrainMonthByMemberNo(reportedMemberNo);
		return "admin/adminCompleteReport";
	}
	@RequestMapping("restrainPermanent.do")
	public String restrainPermanent(int reportedMemberNo) {
		adminServiceimpl.restrainPermanentByMemberNo(reportedMemberNo);
		return "admin/adminCompleteReport";
	}
	
	@RequestMapping("adminGameControlPage.do")
	public String adminGameControlPage(Model model) {
		
		ArrayList<HashMap<String, Object>> gamelist = gameServiceImpl.getGameBoardList();
		model.addAttribute("gamelist", gamelist); 
		
		
		return "admin/adminGameControlPage";
	}
	
	@RequestMapping("adminGameDetailPage.do")
	public String adminGameDetailPage(int game_no, Model model) {
		
		ArrayList<HashMap<String, Object>> gameDetailByno = gameServiceImpl.getGameDetailByGameNo(game_no);
		HashMap<String, Object> gameInfoByno = gameServiceImpl.showGame(game_no);
		
		model.addAttribute("gameDetailByno", gameDetailByno);
		model.addAttribute("gameInfoByno", gameInfoByno);
		
		return "admin/adminGameDetailPage";
	}
	
	
}
