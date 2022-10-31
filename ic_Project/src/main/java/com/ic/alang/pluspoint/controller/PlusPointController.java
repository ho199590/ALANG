package com.ic.alang.pluspoint.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ic.alang.pluspoint.service.PlusPointServiceImpl;
import com.ic.alang.vo.MemberVo;
import com.ic.alang.vo.PlusPointVo;

@Controller
@RequestMapping("/pluspoint/*")
public class PlusPointController {
   
   @Autowired
   private PlusPointServiceImpl plusPointServiceImpl;
   
   @RequestMapping("plusPointPage.do")
   public String plusPointPage() {
      return "pluspoint/plusPointPage";
   }
   @RequestMapping("plusPoint.do")
   public String plusPoint(PlusPointVo param, HttpSession session) {
      
      MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
      int member_no = sessionUser.getMember_no(); 
      
      int plus_point = param.getPlus_point();
      param.setMember_no(member_no);
      param.setPlus_point(plus_point);
      plusPointServiceImpl.plusPoint(param);
      plusPointServiceImpl.updatePoint(param);
      return "redirect:../member/mypage.do?member_no="+member_no;      
   }

}