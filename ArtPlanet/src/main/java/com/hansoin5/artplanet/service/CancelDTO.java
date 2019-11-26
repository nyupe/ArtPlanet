package com.hansoin5.artplanet.service;

public class CancelDTO {
	private String tno;
	private String res_cd;
	private String res_msg;
	private String memberNo;
	

	//게터세터
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public String getRes_cd() {
		return res_cd;
	}
	public void setRes_cd(String res_cd) {
		this.res_cd = res_cd;
	}
	public String getRes_msg() {
		return res_msg;
	}
	public void setRes_msg(String res_msg) {
		this.res_msg = res_msg;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
}
