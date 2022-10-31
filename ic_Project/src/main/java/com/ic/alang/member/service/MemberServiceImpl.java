package com.ic.alang.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ic.alang.course.mapper.CourseSQLMapper;
import com.ic.alang.member.mapper.MemberSQLMapper;
import com.ic.alang.vo.CourseThumnailVo;
import com.ic.alang.vo.CourseVo;
import com.ic.alang.vo.MemberVo;
import com.ic.alang.vo.QnaAnswerVo;
import com.ic.alang.vo.QnaVo;
import com.ic.alang.vo.ReviewVo;
import com.ic.alang.vo.lectureRankVo;

@Service
public class MemberServiceImpl {
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private CourseSQLMapper courseSQLMapper;
	
	public void JoinMemberProcess(MemberVo vo) {
		memberSQLMapper.register(vo);
	}
	public MemberVo login(MemberVo vo) {
		MemberVo result=memberSQLMapper.getMemberByIdandPw(vo);
		return result;
	}
	
	public MemberVo getMemberByNo(int member_no) {
		MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
		
		return memberVo;
	}
	
	//2021-11-24 장한별님
	
	public boolean isExistId(String id) {
		int count = memberSQLMapper.getCountByMemberId(id);
		
		if(count > 0) {
			return true;
		}else {
			return false;
		}
		
	}
	
	//2021-12-01 노진호님
	//마이페이지 통계
	public HashMap<String, Object> totalTraffic(int member_no){
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		int totalCourseNum = memberSQLMapper.totalCourseNum(member_no);
		int totalStudentNum = memberSQLMapper.totalStudentNum(member_no);
		int totalAnswerNum = memberSQLMapper.totalAnswerNum(member_no);
		int totalPointNum = memberSQLMapper.totalPointNum(member_no);
		float totalRate = memberSQLMapper.totalCourseRate(member_no);
				
		data.put("courseNum", totalCourseNum);
		data.put("studentNum", totalStudentNum);
		data.put("answerNum", totalAnswerNum);
		data.put("pointNum", totalPointNum);
		data.put("totalRate", totalRate);
		
		return data;
	}

	
	public ArrayList<HashMap<String, Object>> totalList(int member_no){
		ArrayList<HashMap<String, Object>> list = 
				new ArrayList<HashMap<String,Object>>();
		
		
		ArrayList<QnaVo> questionList = memberSQLMapper.getMyQuestionList(member_no); 
		
		for(QnaVo questionVo : questionList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			int course_no = questionVo.getCourse_no();
			int dd = questionVo.getMember_no();
			CourseVo courseVo = courseSQLMapper.getCourseByNo(course_no);
			MemberVo memberVo = memberSQLMapper.getMemberByNo(dd);
						
			map.put("questionVo", questionVo);
			map.put("courseVo", courseVo);
			map.put("memberVo", memberVo);
			
			list.add(map);
		}
		
		return list;
	}
	
	public ArrayList<HashMap<String, Object>> getMyCourseList(int member_no){
		
		ArrayList<HashMap<String, Object>> list = 
				new ArrayList<HashMap<String,Object>>();
		
		ArrayList<CourseVo> courseList = memberSQLMapper.getMyCourseList(member_no);
		
		for(CourseVo courseVo : courseList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			int course_no = courseVo.getCourse_no();
			
			System.out.println("courseNo" + course_no);
			
			int countSutdent = courseSQLMapper.courseStudentNum(course_no);
			int countLecture =  memberSQLMapper.getLectureNum(course_no);
			int courseSales = courseSQLMapper.courseSales(course_no);
		
//			CourseThumnailVo thumnailVo = courseSQLMapper.getCourseThumnailByCourseNo(course_no);
//			System.out.println("thumnailVo" + thumnailVo.getFilelink());
			//코스정보
			map.put("courseVo", courseVo);
			map.put("countSutdent", countSutdent);
			map.put("countLecture", countLecture);
			map.put("courseSales", courseSales);
//			map.put("thumnailVo", thumnailVo);
			
			list.add(map);
		}
		
		return list;

	}
	

	public ArrayList<HashMap<String, Object>> getMyQuestionList(int member_no){
		
		ArrayList<HashMap<String, Object>> list = 
				new ArrayList<HashMap<String,Object>>();
		
		
		ArrayList<QnaAnswerVo> answerList = courseSQLMapper.getAnswerByMemberNo(member_no);
		ArrayList<QnaVo> questionList = memberSQLMapper.getMyQuestionList(member_no);
		ArrayList<ReviewVo> reviewList = memberSQLMapper.getMyCourseReview(member_no);
		
		for(QnaVo questionVo : questionList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			int course_no = questionVo.getCourse_no();
			CourseVo courseVo = courseSQLMapper.getCourseByNo(course_no);
			
			map.put("questionVo", questionVo);
			map.put("courseVo", courseVo);
			
			list.add(map);
		}
		
		
		
		return list;
	}
	
	public ArrayList<HashMap<String, Object>> getMyAnswerList(int member_no){
		
		ArrayList<HashMap<String, Object>> list = 
				new ArrayList<HashMap<String,Object>>();
		ArrayList<QnaAnswerVo> answerList = courseSQLMapper.getAnswerByMemberNo(member_no);
		
		for(QnaAnswerVo answerVo : answerList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			int question_no = answerVo.getQuestion_no();
					
			QnaVo questionVo = courseSQLMapper.getQnaByNo(question_no); 
			
			map.put("questionVo", questionVo);
			map.put("answerVo", answerVo);
			
			list.add(map);
		}
		return list;
	}
	
	public ArrayList<HashMap<String, Object>> getMyReviewList(int member_no){
	
		ArrayList<HashMap<String, Object>> list = 
				new ArrayList<HashMap<String,Object>>();
		
		
		ArrayList<ReviewVo> reviewList = memberSQLMapper.getMyCourseReview(member_no);
		
		for(ReviewVo reviewVo : reviewList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			int course_no = reviewVo.getCourse_no();
			CourseVo courseVo = courseSQLMapper.getCourseByNo(course_no);

			map.put("reviewVo", reviewVo);
			map.put("courseVo", courseVo);			
			
			list.add(map);
		}
		
		return list;
	}
	public HashMap<String, Object> getGraphData(int member_no){
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		ArrayList<lectureRankVo> saleGraphList = memberSQLMapper.getMyCourseSales(member_no);
		ArrayList<lectureRankVo> categoryGraph = memberSQLMapper.getMyCourseCategoryList(member_no);
		ArrayList<lectureRankVo> studentGraph = memberSQLMapper.getMyStudentMonth(member_no);
		
		data.put("saleGraphList", saleGraphList);
		data.put("categoryGraph", categoryGraph);
		data.put("studentGraph", studentGraph);

		return data;

	}	
}
