package com.ic.alang.admin.mapper;

import java.util.ArrayList;

import com.ic.alang.vo.MemberVo;
import com.ic.alang.vo.ReportVo;

public interface AdminSQLMapper {
	
	//관리자 페이지 로그인
	public MemberVo getAdminByIdandPwandNo(MemberVo vo);
	
	//신고리스트 불러오기
	public ArrayList<ReportVo> getReportList();
	
	public ReportVo getReportByNo(int no);
	
	//1일 정지
	public void restrainDayByMemberNo(int no);
	
	//7일 정지
	public void restrainWeekByMemberNo(int no);
	
	//30일 정지
	public void restrainMonthByMemberNo(int no);
	
	//영구정지
	public void restrainPermanentByMemberNo(int no);
	
	//로그인 할때 신고된 계정인지 확인
	public int checkRestrainDate(int no);
}
