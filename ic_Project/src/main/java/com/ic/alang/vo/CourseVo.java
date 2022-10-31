package com.ic.alang.vo;

import java.util.Date;


public class CourseVo {
	private int course_no;
	private int member_no;
	private String course_name;
	private String course_tuto;
	private Date course_date;	
	public CourseVo() {}
	public CourseVo(int course_no, int member_no, String course_name, String course_tuto, Date course_date) {
		super();
		this.course_no = course_no;
		this.member_no = member_no;
		this.course_name = course_name;
		this.course_tuto = course_tuto;
		this.course_date = course_date;
	}
	public int getCourse_no() {
		return course_no;
	}
	public void setCourse_no(int course_no) {
		this.course_no = course_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getCourse_tuto() {
		return course_tuto;
	}
	public void setCourse_tuto(String course_tuto) {
		this.course_tuto = course_tuto;
	}
	public Date getCourse_date() {
		return course_date;
	}
	public void setCourse_date(Date course_date) {
		this.course_date = course_date;
	}
	
}
