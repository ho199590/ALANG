package com.ic.alang.vo;

public class CartListVo {
	private int cart_no;
	private String course_name;
	private String lecture_name;
	private int course_price;
	
	public CartListVo() {
		
	}

	public CartListVo(int cart_no, String course_name, String lecture_name, int course_price) {
		this.cart_no = cart_no;
		this.course_name = course_name;
		this.lecture_name = lecture_name;
		this.course_price = course_price;
	}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	public String getLecture_name() {
		return lecture_name;
	}

	public void setLecture_name(String lecture_name) {
		this.lecture_name = lecture_name;
	}

	public int getCourse_price() {
		return course_price;
	}

	public void setCourse_price(int course_price) {
		this.course_price = course_price;
	}
	
}
