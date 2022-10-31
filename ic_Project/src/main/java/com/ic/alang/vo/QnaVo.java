package com.ic.alang.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class QnaVo {
	private int question_no;
	private int course_no;
	private int member_no;
	private String question_name;
	private String question_content;
	private Date question_date;
	public QnaVo() {
		// TODO Auto-generated constructor stub
	}
	public QnaVo(int question_no, int course_no, int member_no, String question_name, String question_content,
			Date question_date) {
		super();
		this.question_no = question_no;
		this.course_no = course_no;
		this.member_no = member_no;
		this.question_name = question_name;
		this.question_content = question_content;
		this.question_date = question_date;
	}
	public int getQuestion_no() {
		return question_no;
	}
	public void setQuestion_no(int question_no) {
		this.question_no = question_no;
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
	public String getQuestion_name() {
		return question_name;
	}
	public void setQuestion_name(String question_name) {
		this.question_name = question_name;
	}
	public String getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
	public Date getQuestion_date() {
		return question_date;
	}
	public void setQuestion_date(Date question_date) {
		this.question_date = question_date;
	}
	
	
	
	
}
