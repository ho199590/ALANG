package com.ic.alang.vo;

import java.util.Date;

public class ReportVo {
	
	private int report_no;
	private int member_no;
	private int course_no;
	private String report_reason;
	private Date report_date;
	public ReportVo() {
		super();
	}
	public ReportVo(int report_no, int member_no, int course_no, String report_reason, Date report_date) {
		super();
		this.report_no = report_no;
		this.member_no = member_no;
		this.course_no = course_no;
		this.report_reason = report_reason;
		this.report_date = report_date;
	}
	public int getReport_no() {
		return report_no;
	}
	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getCourse_no() {
		return course_no;
	}
	public void setCourse_no(int course_no) {
		this.course_no = course_no;
	}
	public String getReport_reason() {
		return report_reason;
	}
	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}
	public Date getReport_date() {
		return report_date;
	}
	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
		
}
