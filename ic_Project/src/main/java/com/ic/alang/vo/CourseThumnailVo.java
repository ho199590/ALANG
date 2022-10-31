package com.ic.alang.vo;

public class CourseThumnailVo {

    private int image_no ;
    private int course_no;
    private String thumnail_File;
    private String  filelink;

	public CourseThumnailVo() {}

	public CourseThumnailVo(int image_no, int course_no, String thumnail_File, String filelink) {
		super();
		this.image_no = image_no;
		this.course_no = course_no;
		this.thumnail_File = thumnail_File;
		this.filelink = filelink;
	}

	public int getImage_no() {
		return image_no;
	}

	public void setImage_no(int image_no) {
		this.image_no = image_no;
	}

	public int getCourse_no() {
		return course_no;
	}

	public void setCourse_no(int course_no) {
		this.course_no = course_no;
	}

	public String getThumnail_File() {
		return thumnail_File;
	}

	public void setThumnail_File(String thumnail_File) {
		this.thumnail_File = thumnail_File;
	}

	public String getFilelink() {
		return filelink;
	}

	public void setFilelink(String filelink) {
		this.filelink = filelink;
	}
	
}
