package com.ic.alang.course.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ic.alang.course.service.CourseServiceImpl;
import com.ic.alang.member.service.MemberServiceImpl;
import com.ic.alang.vo.CartVo;
import com.ic.alang.vo.LectureVo;
import com.ic.alang.vo.MemberVo;
import com.ic.alang.vo.QnaAnswerVo;

@Controller
@RequestMapping("/course/*")
@ResponseBody
public class CourseRESTController {
	
	@Autowired
	private CourseServiceImpl courseService;
	
	@Autowired
	private MemberServiceImpl memberService;
		
	//강의 구매
	@RequestMapping("lecturePurchase.do")
	public HashMap<String, Object> lecturePurchase(int lecture_no, HttpSession session) {
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		
		Map<String, Object> sendMap = new HashMap<String, Object>();
		sendMap.put("lecture_no", lecture_no);
		sendMap.put("member_no", member_no);
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		LectureVo lecture = courseService.getLectureByNo(sendMap);
		MemberVo memberVo = memberService.getMemberByNo(member_no);
				
		data.put("lectureVo", lecture);
		data.put("memberVo", memberVo);
		
		return data;
	}
	
	@RequestMapping("getCourseNoticeList.do")
	public HashMap<String, Object> getCourseNoticeList(int course_no){
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		ArrayList<HashMap<String, Object>> noticeList =
				courseService.getNoticeList(course_no);
			
		data.put("noticeList", noticeList);
		
		return data;
	}
	
	@RequestMapping("getCourseLectureList.do")
	public HashMap<String, Object> getCourseLectureList(int course_no){
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		ArrayList<LectureVo> lectureList =
				courseService.getLectureListManage(course_no);
			
		data.put("lectureList", lectureList);
		
		return data;
	}
		
	@RequestMapping("getCourseReviewList.do")
	public HashMap<String, Object> getCourseReviewList(int course_no){
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		ArrayList<HashMap<String, Object>> reviewList =
				courseService.getReviewList(course_no, 1);
			
		data.put("reviewList", reviewList);
		
		return data;
	}
	
	@RequestMapping("getCoursQuestionList.do")
	public HashMap<String, Object> getCoursQuestionList(int course_no){
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		ArrayList<HashMap<String, Object>> questionList =
				courseService.getQuestionList(course_no, 1);
					
		data.put("questionList", questionList);
		
		
		return data;
	}
	
	@RequestMapping("writeAnswerProcess.do")
	public HashMap<String, Object> writeAnswerProcess(QnaAnswerVo param , HttpSession session) {
		HashMap<String, Object> data = new HashMap<String, Object>(); 

		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		param.setMember_no(member_no);		
		
		

		
		courseService.writeAnswer(param);	
		
		return data;
	}
	
	
	@RequestMapping("getTeacherAnswerList.do")
	public HashMap<String, Object> getTeacherAnswerList(int course_no){
		HashMap<String, Object> data = new HashMap<String, Object>(); 
		
		ArrayList<HashMap<String, Object>> teacherAnswerList =
				courseService.getTeacherAnswerList(course_no, 1);
					
		data.put("teacherAnswerList", teacherAnswerList);
		
		
		return data;
	}
	
	@RequestMapping("getAnswerList.do")
	public HashMap<String, Object> getAnswerList(int question_no){
		HashMap<String, Object> data = new HashMap<String, Object>(); 
		
		ArrayList<HashMap<String, Object>> answerList =
				courseService.getAnswerList(question_no);
					
		data.put("answerList", answerList);
		
		
		return data;
	}

	
	@RequestMapping("getCourseParam.do")
	public HashMap<String, Object> getCourseParam(int course_no){
		
		HashMap<String, Object> course= courseService.getCourse(course_no);
		
		return course;
	}
	
	@RequestMapping("getCourseParamrororo.do")
	public HashMap<String, Object> getCourseParamDump(int course_no){
		
		HashMap<String, Object> course= courseService.getCourse(course_no);		
		
		return course;
	}
	
	@RequestMapping("getLatestReview.do")
	public HashMap<String, Object> getLatestReview(int course_no){
		HashMap<String, Object> data = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> reviewList = 
				courseService.getReviewAtLast(course_no);
		
		data.put("reviewList", reviewList);
		
		return data;
	}
	
	//사라짐?
	@RequestMapping("getStudentProcess.do")
	public HashMap<String, Object> getStudent(int course_no){
		
		HashMap<String, Object> studentData = new HashMap<String, Object>(); 
		ArrayList<HashMap<String, Object>> studentlist = courseService.getStudent(course_no); 
			
		studentData.put("studentList", studentlist);
		
		return studentData;
	}
	
	//2021-11-28 노진호님 추가본
	// 강좌 번호로 그 강좌가 팔린 횟수 불러오는 것
	@RequestMapping("getSaleList.do")
	public HashMap<String, Object> getSaleList(int course_no){
		
		HashMap<String, Object> studentData = new HashMap<String, Object>(); 
		ArrayList<HashMap<String, Object>> studentlist = courseService.getStudentJoin(course_no); 
			
		studentData.put("studentList", studentlist);
		return studentData;
	}

	//강좌 번호로 학생 목록 불러오기용
	@RequestMapping("getStudentList.do")
	public HashMap<String, Object> getStudentList(int course_no){
		
		HashMap<String, Object> studentData = new HashMap<String, Object>(); 
		ArrayList<HashMap<String, Object>> studentlist = courseService.getStudentList(course_no);
		
			
		studentData.put("studentList", studentlist);
		return studentData;
	}
	
	//장바구니 담기
	@RequestMapping("addCart.do")
	public HashMap<String, Object> addCart(int lecture_no, HttpSession session){
		
		HashMap<String, Object> addCartMap = new HashMap<String, Object>();
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("lecture_no", lecture_no);
		map.put("member_no", member_no);
		
		LectureVo lectureVo = courseService.getLectureByNo(map);
		
		int course_no = lectureVo.getCourse_no();
		
		CartVo cartVo = new CartVo();
		cartVo.setLecture_no(lecture_no);
		cartVo.setMember_no(member_no);
		cartVo.setCourse_no(course_no);
		
		courseService.addCart(cartVo);
		
		addCartMap.put("cartVo", cartVo);
		addCartMap.put("lectureVo", lectureVo);
		addCartMap.put("course_no", course_no);
		addCartMap.put("member_no", member_no);
		
		return addCartMap;
		
	}
	
	//2021-12-01 노진호님
	@RequestMapping("deleteNoticeProcess.do")
	public void deleteNoticeProcess(int notice_no) {
		courseService.deleteNotice(notice_no);
	}
	
	@RequestMapping("courseRateAVG.do")
	public float courseRateAVG(int course_no){				
		HashMap<String, Object> rateData = new HashMap<String, Object>(); 

		float rate = courseService.getCourseAvg(course_no);
		rateData.put("rate", rate);		
		
		return rate;
	}
	
	@RequestMapping("upChart.do")
	public HashMap<String, Object> test(int course_no) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();		
		data.put("chart" , courseService.getCourseStatistics(course_no));
		
		return data;
	}
	
}
