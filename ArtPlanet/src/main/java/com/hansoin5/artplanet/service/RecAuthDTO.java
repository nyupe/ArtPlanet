package com.hansoin5.artplanet.service;

import java.sql.Date;

public class RecAuthDTO {
	private String ordr_idxx;//주문번호
	private String res_cd;// 응답코드
	private String batch_key;// 배치키
	private String card_cd;//카드코드
	private String buyr_name; //주문자명
	private String memberNo;// 멤버고유번호
	
	//조인할때 쓰기위해 필요한 프로젝트 1회성후원 후원금액컬럼 
	private String projectSupportSum; // projectSupportSum
	private String projectSupportNo; //projectSupportNo
	private String projectNo; //projectNo
	
	
	//app_time용 컬럼
	private String app_time; //시간용_
	
	
	//게터세터
	public String getOrdr_idxx() {
		return ordr_idxx;
	}
	public void setOrdr_idxx(String ordr_idxx) {
		this.ordr_idxx = ordr_idxx;
	}
	public String getRes_cd() {
		return res_cd;
	}
	public void setRes_cd(String res_cd) {
		this.res_cd = res_cd;
	}
	public String getBatch_key() {
		return batch_key;
	}
	public void setBatch_key(String batch_key) {
		this.batch_key = batch_key;
	}
	public String getBuyr_name() {
		return buyr_name;
	}
	public void setBuyr_name(String buyr_name) {
		this.buyr_name = buyr_name;
	}

	public String getCard_cd() {
		return card_cd;
	}
	public void setCard_cd(String card_cd) {
		this.card_cd = card_cd;
	}

	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getProjectSupportSum() {
		return projectSupportSum;
	}
	public void setProjectSupportSum(String projectSupportSum) {
		this.projectSupportSum = projectSupportSum;
	}
	//app_time
	public String getApp_time() {
		return app_time;
	}
	public void setApp_time(String app_time) {
		this.app_time = app_time;
	}
	public String getProjectSupportNo() {
		return projectSupportNo;
	}
	public void setProjectSupportNo(String projectSupportNo) {
		this.projectSupportNo = projectSupportNo;
	}
	public String getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}
	/////////캐시아니라고
}
