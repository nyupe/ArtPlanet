package com.hansoin5.artplanet.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class QnaDTO {
	private String qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private String qnaChecked;
	private String qnaCategory;
	private String id;
	
	//Date 자료형 프로퍼티 위에 @JsonFormat 어노테이션으로 패턴을 정해주면, 이 패턴으로 변환되어 json에 들어간다.
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date qnaPostdate;

	//게터세터
	public String getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(String qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnatitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaChecked() {
		return qnaChecked;
	}
	public void setQnaChecked(String qnaChecked) {
		this.qnaChecked = qnaChecked;
	}
	public String getQnaCategory() {
		return qnaCategory;
	}
	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public java.sql.Date getQnaPostdate() {
		return qnaPostdate;
	}
	public void setQnaPostdate(java.sql.Date qnaPostdate) {
		this.qnaPostdate = qnaPostdate;
	}
	
	
}////

