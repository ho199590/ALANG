package com.ic.alang.vo;

import java.util.Date;

public class ReviewVo {
	private int review_no;
	private int course_no;
	private int member_no;
	private String review_title;
	private String review_content;
	private long review_rate;
	private Date review_date;
	
	public ReviewVo() {
		// TODO Auto-generated constructor stub
	}

	public ReviewVo(int review_no, int course_no, int member_no, String review_title, String review_content,
			long review_rate, Date review_date) {
		super();
		this.review_no = review_no;
		this.course_no = course_no;
		this.member_no = member_no;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_rate = review_rate;
		this.review_date = review_date;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
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

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public long getReview_rate() {
		return review_rate;
	}

	public void setReview_rate(long review_rate) {
		this.review_rate = review_rate;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	
	
}
