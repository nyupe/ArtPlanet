package com.hansoin5.artplanet.service;

public class AuthorityDTO { //권한(Authority)테이블 DTO
	
	private int authorityNo; // 권한 번호(기본키)
	private String authority; // 권한명
	private int enabled; // 회원 계정 활성화 여부
	private int memberNo; // 회원번호(외래키)
	private String id; // 아이디
	
	//게터 & 세터
	public int getAuthorityNo() {
		return authorityNo;
	}
	public void setAuthorityNo(int authorityNo) {
		this.authorityNo = authorityNo;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
	
}//////class
