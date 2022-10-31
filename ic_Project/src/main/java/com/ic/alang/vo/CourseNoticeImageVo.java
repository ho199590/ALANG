package com.ic.alang.vo;

public class CourseNoticeImageVo {
	private int image_no;
	private int notice_no;
	private String image_link;
	private String image_filename;
	public CourseNoticeImageVo() {}
	public CourseNoticeImageVo(int image_no, int notice_no, String image_link, String image_filename) {
		super();
		this.image_no = image_no;
		this.notice_no = notice_no;
		this.image_link = image_link;
		this.image_filename = image_filename;
	}
	public int getImage_no() {
		return image_no;
	}
	public void setImage_no(int image_no) {
		this.image_no = image_no;
	}
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getImage_link() {
		return image_link;
	}
	public void setImage_link(String image_link) {
		this.image_link = image_link;
	}
	public String getImage_filename() {
		return image_filename;
	}
	public void setImage_filename(String image_filename) {
		this.image_filename = image_filename;
	}
	
	
}
