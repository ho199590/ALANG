package com.ic.alang.vo;

public class lectureRankVo {
	
	private String course_name;
	private int lecture_no;
	private int count;
	
	public lectureRankVo() {}

	public lectureRankVo(String course_name, int lecture_no, int count) {
		super();
		this.course_name = course_name;
		this.lecture_no = lecture_no;
		this.count = count;
	}

	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	public int getLecture_no() {
		return lecture_no;
	}

	public void setLecture_no(int lecture_no) {
		this.lecture_no = lecture_no;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	

}
