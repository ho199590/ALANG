package com.ic.alang.vo;

public class CourseCategoryVo {
	private	int course_no;
	private int small_category_no;
	
	public CourseCategoryVo() {}

	public CourseCategoryVo(int course_no, int small_category_no) {
		super();
		this.course_no = course_no;
		this.small_category_no = small_category_no;
	}

	public int getCourse_no() {
		return course_no;
	}

	public void setCourse_no(int course_no) {
		this.course_no = course_no;
	}

	public int getSmall_category_no() {
		return small_category_no;
	}

	public void setSmall_category_no(int small_category_no) {
		this.small_category_no = small_category_no;
	}
	
	
	
}
