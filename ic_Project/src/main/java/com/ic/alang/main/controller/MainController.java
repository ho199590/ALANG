package com.ic.alang.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ic.alang.course.mapper.CourseSQLMapper;
import com.ic.alang.course.service.CourseServiceImpl;
import com.ic.alang.vo.BigCategoryVo;
import com.ic.alang.vo.MemberVo;
import com.ic.alang.vo.SmallCategoryVo;

@Controller
@RequestMapping("/main/*")
public class MainController {
	
	@Autowired
	private CourseServiceImpl courseService;
	
	@Autowired
	private CourseSQLMapper courseSQLMapper;
	
	//로그인 전 보여줄 간단한 페이지
	@RequestMapping("index.do")
	public String index(HttpSession session, Model model) {
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		
		if(sessionUser != null) {
			return "redirect:./loggedIn.do";
		}else {
			return "main/index";
		}
	}
	
	//로그인 된 후 실질적인 메인 페이지 (2021-12-01 수정)
	@RequestMapping("loggedIn.do")
	public String loggedIn(HttpSession session, Model model) {
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		
		ArrayList<HashMap<String, Object>> courseList =  courseService.getMainCourse();
		ArrayList<SmallCategoryVo> getSmallCategory = courseService.getSmallCategory();
		ArrayList<BigCategoryVo> getBigCategory = courseService.getBigCategory();
		
		model.addAttribute("courseList", courseList);
		model.addAttribute("getSmallCategory", getSmallCategory);
		model.addAttribute("getBigCategory", getBigCategory);
		
		if(sessionUser != null) {
			return "main/loggedIn";
		}else {
			return "member/loginPage";
		}
	}
	
	//2021-12-01 장한별님
	
	@RequestMapping("loggedIncategoryList.do")
	public String loggedIncategoryList(HttpSession session,int smallcategory_no, Model model) {
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		
		ArrayList<HashMap<String, Object>> getCourseListBySmallCate= courseService.getCourseListBySmallCategory(smallcategory_no);
		ArrayList<SmallCategoryVo> getSmallCategory = courseService.getSmallCategory();
		ArrayList<BigCategoryVo> getBigCategory = courseService.getBigCategory();
		SmallCategoryVo getoneSmallCategory = courseSQLMapper.getSmallCategorybyno(smallcategory_no);
		BigCategoryVo getBigCategorybySmallCate = courseSQLMapper.getBigCategorybySmallCate(smallcategory_no);

		
		model.addAttribute("getCourseListBySmallCate", getCourseListBySmallCate);
		model.addAttribute("getSmallCategory", getSmallCategory);
		model.addAttribute("getBigCategory", getBigCategory);
		model.addAttribute("getoneSmallCategory", getoneSmallCategory);
		model.addAttribute("getBigCategorybySmallCate", getBigCategorybySmallCate);
		System.out.println("getBigCategorybySmallCate : "+getBigCategorybySmallCate);
		
		if(sessionUser != null) {
			return "main/loggedIncategoryList";
		}else {
			return "member/loginPage";
		}
	}
	
	@RequestMapping("loggedInBigcategoryList.do")
	public String loggedInBigcategoryList(HttpSession session,int bigcategory_no, Model model) {
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		
		ArrayList<HashMap<String, Object>> getCourseListBybBigCate= courseService.getCourseListByBigCategory(bigcategory_no);
		ArrayList<SmallCategoryVo> getSmallCategory = courseService.getSmallCategory();
		ArrayList<BigCategoryVo> getBigCategory = courseService.getBigCategory();
		BigCategoryVo getoneBigCategory = courseSQLMapper.getBigCategorybyno(bigcategory_no);
		
		model.addAttribute("getCourseListBybBigCate", getCourseListBybBigCate);
		model.addAttribute("getSmallCategory", getSmallCategory);
		model.addAttribute("getBigCategory", getBigCategory);
		model.addAttribute("getoneBigCategory", getoneBigCategory);
		
		
		if(sessionUser != null) {
			return "main/loggedInBigcategoryList";
		}else {
			return "member/loginPage";
		}
	}
}
