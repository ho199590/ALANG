package com.ic.alang.vo;

import java.util.Date;

public class MyCourseVo {
	
	private int my_course_no;
	private int member_no;
	private int lecture_no;
	private int my_course_purchase_price;
	private Date my_course_date;
	
	public MyCourseVo() {
		
	}

	public MyCourseVo(int my_course_no, int member_no, int lecture_no, int my_course_purchase_price,
			Date my_course_date) {
		super();
		this.my_course_no = my_course_no;
		this.member_no = member_no;
		this.lecture_no = lecture_no;
		this.my_course_purchase_price = my_course_purchase_price;
		this.my_course_date = my_course_date;
	}

	public int getMy_course_no() {
		return my_course_no;
	}

	public void setMy_course_no(int my_course_no) {
		this.my_course_no = my_course_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getLecture_no() {
		return lecture_no;
	}

	public void setLecture_no(int lecture_no) {
		this.lecture_no = lecture_no;
	}

	public int getMy_course_purchase_price() {
		return my_course_purchase_price;
	}

	public void setMy_course_purchase_price(int my_course_purchase_price) {
		this.my_course_purchase_price = my_course_purchase_price;
	}

	public Date getMy_course_date() {
		return my_course_date;
	}

	public void setMy_course_date(Date my_course_date) {
		this.my_course_date = my_course_date;
	}

}
