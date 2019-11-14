package com.hansoin5.artplanet.service;

import java.util.Date;

//Project 테이블 = ProjectDTO
public class ProjectDTO {
	
	private String projectNo; //프로젝트 글번호
	private String title; //프로젝트 제목
	private String content; //프로젝트 내용
	private Date postDate; //프로젝트 작성일
	private Date deadline; //프로젝트 마감일
	private int targetFigure; //프로젝트 목표액
	private String memberNo; //회원번호
	private String id;
	private String tagName;
	private String tagNo;
	private int projectsupportsum;
	private String fileurl;
	private String replyNo;
	private String replyContent;
	private String replyPostdate;
	private String blogNo;
	
	
	
	
	
	public String getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyPostdate() {
		return replyPostdate;
	}
	public void setReplyPostdate(String replyPostdate) {
		this.replyPostdate = replyPostdate;
	}
	public String getBlogNo() {
		return blogNo;
	}
	public void setBlogNo(String blogNo) {
		this.blogNo = blogNo;
	}
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	public String getTagNo() {
		return tagNo;
	}
	public void setTagNo(String tagNo) {
		this.tagNo = tagNo;
	}
	public int getProjectsupportsum() {
		return projectsupportsum;
	}
	public void setProjectsupportsum(int projectsupportsum) {
		this.projectsupportsum = projectsupportsum;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProjectNo() {
		return projectNo;
	}
	
	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPostDate() {
		return postDate;
	}
	void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public int getTargetFigure() {
		return targetFigure;
	}
	public void setTargetFigure(int targetFigure) {
		this.targetFigure = targetFigure;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	

}/////class
