package com.ic.alang.requestboard.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ic.alang.requestboard.service.RequestBoardServiceImpl;
import com.ic.alang.vo.MemberVo;
import com.ic.alang.vo.RequestBoardVo;
import com.ic.alang.vo.RequestReplyVo;

@Controller
@RequestMapping("/requestboard/*")
public class RequestBoardController {
   
   @Autowired
   private RequestBoardServiceImpl requestBoardService;
   
   @RequestMapping("requestMainPage.do")
   public String requestMainPage(Model model) {
      
      ArrayList<HashMap<String, Object>> requestlist = requestBoardService.getRequestList();
      model.addAttribute("requestlist", requestlist);
      
      return "requestboard/requestMainPage";
   }
   
   @RequestMapping("requestBoardWritePage.do")
   public String requestBoardWritePage() {
      
      return "requestboard/requestBoardWritePage";
   }
   
   @RequestMapping("requestBoardWriteProcess.do")
   public String requestBoardWriteProcess(RequestBoardVo param, HttpSession session) {
      
      MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
      int member_no = sessionUser.getMember_no();
      
      param.setMember_no(member_no);
      
      requestBoardService.requestBoardWrite(param);
      
      return "redirect:./requestMainPage.do";
   }
   @RequestMapping("requestReplyWriteProcess.do")
   public String requestReplyWriteProcess(RequestReplyVo param, HttpSession session, RequestBoardVo request) {
      
      MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
      int member_no = sessionUser.getMember_no();
      int request_no = request.getRequest_no();
      param.setRequest_no(request_no);
      param.setMember_no(member_no);
      
      requestBoardService.requestReplyWrite(param);
      
      return "redirect:./requestBoardReadPage.do?request_no="+request_no;
   }

      
   
   @RequestMapping("requestBoardReadPage.do")
   public String requestBoardReadPage(int request_no, Model model) {
      
      HashMap<String, Object> data = requestBoardService.getRequestBoard(request_no);
      ArrayList<HashMap<String, Object>> reply = requestBoardService.getRequestReplyList(request_no);
      model.addAttribute("data", data);
      model.addAttribute("reply", reply);
      
      return "requestboard/requestBoardReadPage";
   }
   
   @RequestMapping("requestBoardDeleteProcess.do")
   public String requestBoardDeleteProcess(int request_no) {
      
      requestBoardService.deleteRequest(request_no);
      
      return "redirect:./requestMainPage.do";
   }
   
   @RequestMapping("requestBoardUpdatePage.do")
   public String requestBoardUpdatePage(int request_no, Model model) {
      
      HashMap<String, Object> data = requestBoardService.getRequestBoard(request_no);
      model.addAttribute("data", data);
      
      return "requestboard/requestBoardUpdatePage";
   }
   @RequestMapping("requestBoardUpdateProcess.do")
   public String requestBoardUpdateProcess(RequestBoardVo vo) {
      
      requestBoardService.updateRequest(vo);
      
      return "redirect:./requestMainPage.do";
   }

   @RequestMapping("deleteRequestReplyProcess.do")
   public String deleteRequestReplyProcess(int request_reply_no) {
      
      
      requestBoardService.deleteRequestReplyByNo(request_reply_no);
   
      return "redirect:./requestMainPage.do";
}
   
}