package com.ic.alang.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class QnaAnswerVo {
	private int answer_no;
	private int question_no;
	private int member_no;
	private String answer_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date answer_date;
    
    public QnaAnswerVo() {}

	public QnaAnswerVo(int answer_no, int question_no, int member_no, String answer_content, Date answer_date) {
		super();
		this.answer_no = answer_no;
		this.question_no = question_no;
		this.member_no = member_no;
		this.answer_content = answer_content;
		this.answer_date = answer_date;
	}

	public int getAnswer_no() {
		return answer_no;
	}

	public void setAnswer_no(int answer_no) {
		this.answer_no = answer_no;
	}

	public int getQuestion_no() {
		return question_no;
	}

	public void setQuestion_no(int question_no) {
		this.question_no = question_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getAnswer_content() {
		return answer_content;
	}

	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}

	public Date getAnswer_date() {
		return answer_date;
	}

	public void setAnswer_date(Date answer_date) {
		this.answer_date = answer_date;
	}

	
}
