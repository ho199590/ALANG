package com.ic.alang.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ic.alang.admin.mapper.AdminSQLMapper;
import com.ic.alang.course.mapper.CourseSQLMapper;
import com.ic.alang.member.mapper.MemberSQLMapper;
import com.ic.alang.vo.CourseVo;
import com.ic.alang.vo.MemberVo;
import com.ic.alang.vo.ReportVo;

@Service
public class AdminServiceimpl {
	
	@Autowired
	private AdminSQLMapper adminSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private CourseSQLMapper courseSQLMapper;
	
	public MemberVo login(MemberVo vo) {
		MemberVo result = adminSQLMapper.getAdminByIdandPwandNo(vo);
		return result;
	}
	
	//신고한 강의의 멤버정보 신고글 정보 불러오기
	public ArrayList<HashMap<String, Object>> getreportlist(){
		
		ArrayList<HashMap<String, Object>> reportlist = 
				new ArrayList<HashMap<String, Object>>();
		
		ArrayList<ReportVo> reportboardlist = adminSQLMapper.getReportList();
				
		for(ReportVo reportVo : reportboardlist) {
			int member_no=reportVo.getMember_no();
			int course_no=reportVo.getCourse_no();
			
			MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
			CourseVo courseVo = courseSQLMapper.getCourseByNo(course_no);
			HashMap<String, Object> reportmap = new HashMap<String, Object>();
			reportmap.put("memberVo", memberVo);
			reportmap.put("courseVo", courseVo);
			reportmap.put("reportVo", reportVo);
			reportlist.add(reportmap);
		}
		return reportlist;
		
	}
	
	public HashMap<String, Object> getReportDetailByNo(int reportno){
						
		HashMap<String,Object> map = new HashMap<String, Object>();
		ReportVo reportVo = adminSQLMapper.getReportByNo(reportno);
		int member_no = reportVo.getMember_no();
		reportno = reportVo.getCourse_no();
		CourseVo courseVo = courseSQLMapper.getCourseByNo(reportno);
		MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
		MemberVo opencoursememberVo = courseSQLMapper.getMemberByCourseNo(reportno);
		
		map.put("reportVo", reportVo);
		map.put("courseVo", courseVo);
		map.put("memberVo", memberVo);
		map.put("opencoursememberVo",opencoursememberVo);
		
		return map;
	}
	
	public void restrainDayByMemberNo(int reportCourseOpenMember){
		adminSQLMapper.restrainDayByMemberNo(reportCourseOpenMember);
	}
	public void restrainWeekByMemberNo(int reportCourseOpenMember){
		adminSQLMapper.restrainWeekByMemberNo(reportCourseOpenMember);
	}
	public void restrainMonthByMemberNo(int reportCourseOpenMember){
		adminSQLMapper.restrainMonthByMemberNo(reportCourseOpenMember);
	}
	public void restrainPermanentByMemberNo(int reportCourseOpenMember){
		adminSQLMapper.restrainPermanentByMemberNo(reportCourseOpenMember);
	}
}
