package com.ic.alang.vo;

import java.util.Date;

//강홍 2021-11-11 VO 새로 생성

public class LectureVo extends PurchaseVo{
	private int lecture_no;
	private int course_no;
	private String course_name;
	private String course_tuto;
	private int course_price;
	private String course_file;
	private String course_link;
	private Date course_register_date;
	
	public LectureVo() {
		
	}

	public LectureVo(int lecture_no, int course_no, String course_name, String course_tuto, int course_price,
			String course_file, String course_link, Date course_register_date) {
		super();
		this.lecture_no = lecture_no;
		this.course_no = course_no;
		this.course_name = course_name;
		this.course_tuto = course_tuto;
		this.course_price = course_price;
		this.course_file = course_file;
		this.course_link = course_link;
		this.course_register_date = course_register_date;
	}

	public int getLecture_no() {
		return lecture_no;
	}

	public void setLecture_no(int lecture_no) {
		this.lecture_no = lecture_no;
	}

	public int getCourse_no() {
		return course_no;
	}

	public void setCourse_no(int course_no) {
		this.course_no = course_no;
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

	public int getCourse_price() {
		return course_price;
	}

	public void setCourse_price(int course_price) {
		this.course_price = course_price;
	}

	public String getCourse_file() {
		return course_file;
	}

	public void setCourse_file(String course_file) {
		this.course_file = course_file;
	}

	public String getCourse_link() {
		return course_link;
	}

	public void setCourse_link(String course_link) {
		this.course_link = course_link;
	}

	public Date getCourse_register_date() {
		return course_register_date;
	}

	public void setCourse_register_date(Date course_register_date) {
		this.course_register_date = course_register_date;
	}

}
