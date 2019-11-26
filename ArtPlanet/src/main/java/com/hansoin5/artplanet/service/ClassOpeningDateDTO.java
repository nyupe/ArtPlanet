package com.hansoin5.artplanet.service;

public class ClassOpeningDateDTO
{ 
  //멤버변수
  private String DateNo; // 아트클래스 개설날짜정보 테이블 일련번호 PK
  private String classNo; // 아트클래스 번호 FK
  private String openingDate; //시작날짜 
  private String openingTime; //시작시간
  
  
  //게터 & 세터 
  public String getDateNo()
  {
    return this.DateNo;
  }
  
  public void setDateNo(String dateNo)
  {
    this.DateNo = dateNo;
  }
  
  public String getClassNo()
  {
    return this.classNo;
  }
  
  public void setClassNo(String classNo)
  {
    this.classNo = classNo;
  }
  
  public String getOpeningDate()
  {
    return this.openingDate;
  }
  
  public void setOpeningDate(String openingDate)
  {
    this.openingDate = openingDate;
  }
  
  public String getOpeningTime()
  {
    return this.openingTime;
  }
  
  public void setOpeningTime(String openingTime)
  {
    this.openingTime = openingTime;
  }
  
}/////class

