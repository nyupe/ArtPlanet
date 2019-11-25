package com.hansoin5.artplanet.service;

import java.util.Date;

public class BlogPostDTO
{
	private String blogNo; //글번호
	private String title; //글제목
	private String content; //글내용
	private Date postDate; //작성일
	private int viewCount; //조회수
	private String categorie; // 카테고리
	private String accessRight; //열람권한
	private String memberNo; //(작성자)회원번호
	
	public String getBlogNo()
	{
		return blogNo;
	}
	public void setBlogNo(String blogNo)
	{
		this.blogNo = blogNo;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public Date getPostDate()
	{
		return postDate;
	}
	public void setPostDate(Date postDate)
	{
		this.postDate = postDate;
	}
	public int getViewCount()
	{
		return viewCount;
	}
	public void setViewCount(int viewCount)
	{
		this.viewCount = viewCount;
	}
	public String getMemberNo()
	{
		return memberNo;
	}
	public void setMemberNo(String memberNo)
	{
		this.memberNo = memberNo;
	}
	public String getCategorie()
	{
		return categorie;
	}
	public void setCategorie(String categorie)
	{
		this.categorie = categorie;
	}
	public String getAccessRight()
	{
		return accessRight;
	}
	public void setAccessRight(String accessRight)
	{
		this.accessRight = accessRight;
	}
	
}
