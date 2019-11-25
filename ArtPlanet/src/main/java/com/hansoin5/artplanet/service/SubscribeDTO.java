package com.hansoin5.artplanet.service;

public class SubscribeDTO
{
	private String subscribeNo;
	private java.sql.Date subscribeStartDate;
	private String targetedMemberNo;
	private String memberNo;
	
	
	public String getSubscribeNo()
	{
		return subscribeNo;
	}
	public void setSubscribeNo(String subscribeNo)
	{
		this.subscribeNo = subscribeNo;
	}
	public java.sql.Date getSubscribeStartDate()
	{
		return subscribeStartDate;
	}
	public void setSubscribeStartDate(java.sql.Date subscribeStartDate)
	{
		this.subscribeStartDate = subscribeStartDate;
	}
	public String getTargetedMemberNo()
	{
		return targetedMemberNo;
	}
	public void setTargetedMemberNo(String targetedMemberNo)
	{
		this.targetedMemberNo = targetedMemberNo;
	}
	public String getMemberNo()
	{
		return memberNo;
	}
	public void setMemberNo(String memberNo)
	{
		this.memberNo = memberNo;
	}
	
	
}
