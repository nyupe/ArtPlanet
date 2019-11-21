package com.hansoin5.artplanet.service;

public class GcsDTO
{
	public String fileNo; //파일번호
	public String fileName; //원래 파일명
	public String fileUrl; // Storage에 저장된 파일 주소
	public String downloadUrl; // 파일 다운로드 주소
	public String fileSize; //파일크기
	public String blogNo; //블로그 글번호
	public String projectNo; //프로젝트 글번호
	public String classNo; //클래스 글번호
	public String memberNo; //회원번호 (프로필사진 업로드할때만)
	
	
	public String getFileNo()
	{
		return fileNo;
	}
	public void setFileNo(String fileNo)
	{
		this.fileNo = fileNo;
	}
	public String getFileName()
	{
		return fileName;
	}
	public void setFileName(String fileName)
	{
		this.fileName = fileName;
	}
	public String getFileUrl()
	{
		return fileUrl;
	}
	public void setFileUrl(String fileUrl)
	{
		this.fileUrl = fileUrl;
	}
	public String getDownloadUrl()
	{
		return downloadUrl;
	}
	public void setDownloadUrl(String downloadUrl)
	{
		this.downloadUrl = downloadUrl;
	}
	public String getFileSize()
	{
		return fileSize;
	}
	public void setFileSize(String fileSize)
	{
		this.fileSize = fileSize;
	}
	public String getBlogNo()
	{
		return blogNo;
	}
	public void setBlogNo(String blogNo)
	{
		this.blogNo = blogNo;
	}
	
}
