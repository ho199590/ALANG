package com.ic.alang.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ic.alang.member.service.MemberServiceImpl;


@Controller
@RequestMapping("/member/*")
@ResponseBody
public class MemberRESTController {
	
	@Autowired
	private MemberServiceImpl memberServiceImpl;
	
	@RequestMapping("isExistId.do")
	public HashMap<String, Object> isExistId(String id){
		System.out.println("isExistId.do 호출됨");
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		boolean isExist = memberServiceImpl.isExistId(id);
		
		data.put("result", isExist);
		System.out.println(isExist);
		return data;
	}
	
	@RequestMapping("getCourseList.do")
	public HashMap<String, Object> getCourseList(int member_no){
		
		HashMap<String, Object> data = new HashMap<String, Object>();

		ArrayList<HashMap<String, Object>> courseList = memberServiceImpl.getMyCourseList(member_no);

		data.put("courseList", courseList);		
	
		return data;
	}
	
	
	@RequestMapping("getTableListData.do")
	public HashMap<String, Object> getQuestionList(int member_no){
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		ArrayList<HashMap<String, Object>> getMyReviewList = memberServiceImpl.getMyReviewList(member_no);
		ArrayList<HashMap<String, Object>> getMyAnswerList = memberServiceImpl.getMyAnswerList(member_no);
		ArrayList<HashMap<String, Object>> getMyQuestionList = memberServiceImpl.getMyQuestionList(member_no);
		
		data.put("getMyReviewList", getMyReviewList);
		data.put("getMyAnswerList", getMyAnswerList);
		data.put("getMyQuestionList", getMyQuestionList);
	
		return data;
	}
	
	
	@RequestMapping("getGraphyData.do")
	public HashMap<String, Object> getGraphyData(int member_no){
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		HashMap<String, Object> getMyCourseSales = memberServiceImpl.getGraphData(member_no);
		
		data.put("getMyCourseSales", getMyCourseSales);
	
		return data;
	}
	
	
	
}
