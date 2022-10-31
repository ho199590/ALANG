package com.ic.alang.member.mapper;

import java.util.ArrayList;

import com.ic.alang.vo.CourseVo;
import com.ic.alang.vo.MemberVo;
import com.ic.alang.vo.QnaVo;
import com.ic.alang.vo.ReviewVo;
import com.ic.alang.vo.lectureRankVo;

public interface MemberSQLMapper {

	public void register(MemberVo vo);
	
	public MemberVo getMemberByIdandPw(MemberVo vo);
	
	public MemberVo getMemberByNo(int no);
	
	public MemberVo myPage(int no);
	
	public int getCountByMemberId(String id);
	
	// 2021-11-26한별 추가
	public MemberVo getMemberByID(String id);
	
	//2021-12-01 노진호님
	// 마이 페이지 통계 목록들
	public int totalCourseNum(int member_no);
	public int totalStudentNum(int member_no);
	public int totalPointNum(int member_no);
	public int totalAnswerNum(int member_no);
	
	public ArrayList<ReviewVo> getMyCourseReview(int member_no);
	public ArrayList<QnaVo> getMyQuestionList(int member_no);
	public ArrayList<lectureRankVo> getMyCourseSales(int member_no);
	public ArrayList<lectureRankVo> getMyCourseCategoryList(int member_no);
	public ArrayList<lectureRankVo> getMyStudentMonth(int member_no);
	
	public float totalCourseRate(int member_no);
	
	
	public ArrayList<CourseVo> getMyCourseList(int member_no);
	public int getLectureNum(int course_no);
	
	
	
}
