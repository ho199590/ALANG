package com.ic.alang.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ic.alang.admin.mapper.AdminSQLMapper;
import com.ic.alang.course.service.CourseServiceImpl;
import com.ic.alang.member.mapper.MemberSQLMapper;
import com.ic.alang.member.service.MemberServiceImpl;
import com.ic.alang.vo.CartListVo;
import com.ic.alang.vo.MemberVo;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@Autowired
	private AdminSQLMapper adminSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private CourseServiceImpl courseService;
	
	@RequestMapping("loginPage.do")
	public String loginPage() {
		
		return "member/loginPage";
	}
	@RequestMapping("loginProcess.do")
	public String loginProcess(MemberVo param , HttpSession session) {
		
		MemberVo sessionUser=memberService.login(param);
		int check=0;
			if(sessionUser !=null) {
				int reportmemberno= sessionUser.getMember_no();
				System.out.println(reportmemberno);
				check = adminSQLMapper.checkRestrainDate(reportmemberno);
				System.out.println("check : " +check);
				if(check ==0) {
				//로그인 성공
				session.setAttribute("sessionUser", sessionUser);
				
				return "redirect:../main/loggedIn.do";
		
				} else {
					return "member/reportLoginFail";
				}

				}else {
				//로그인 실패
				return "member/loginFail";

}
		
		/*
		 * //서비스 만들어야댐 MemberVo sessionUser=memberService.login(param);
		 * 
		 * if(sessionUser !=null) { //로그인 성공 session.setAttribute("sessionUser",
		 * sessionUser);
		 * 
		 * return "redirect:../main/loggedIn.do"; }else { //로그인 실패 return
		 * "member/loginFail";
		 * 
		 * }
		 */
	
	}
	@RequestMapping("joinMemberProcess.do")
	public String joinMemberProcess(MemberVo param) {
	
		memberService.JoinMemberProcess(param);
		
		return "member/joinMemberComplete";
}
	
	@RequestMapping("joinMemberPage.do")
	public String joinMemberPage(MemberVo vo) {
		 
		
		return "member/joinMemberPage";
	}
	
	@RequestMapping("logoutProcess.do")
	public String logoutProcess(HttpSession session) {
		session.invalidate();				//세션 완전 소멸(재구성)
	
		return "redirect:../main/index.do";
	}
	
	//2021-11-24 노재하님
	@RequestMapping("mypage.do")
	public String mypage(MemberVo param , HttpSession session, Model model) {
         
         MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
      
         session.setAttribute("sessionUser", sessionUser);
         int member_no = sessionUser.getMember_no();
         
         ArrayList<CartListVo> cartList = courseService.cartList(member_no);
         
         MemberVo memberVo = memberSQLMapper.myPage(member_no);
         model.addAttribute("map", memberVo);
         model.addAttribute("cartList",cartList);
         
         return "member/mypage";
      
   }
	
	//1203이사
	@RequestMapping("test")
 	public String testPage(HttpSession session, Model model) {
 	
 		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
 		int member_no = sessionUser.getMember_no();
 		
 		HashMap<String, Object> statistics = memberService.totalTraffic(member_no);
 		ArrayList<HashMap<String, Object>> totalList = memberService.totalList(member_no); 		
 		
 		model.addAttribute("statistics", statistics);
 		model.addAttribute("totalList", totalList);
 		
 		
 		return "member/testMyPage";
 	}
	
	
	
}
