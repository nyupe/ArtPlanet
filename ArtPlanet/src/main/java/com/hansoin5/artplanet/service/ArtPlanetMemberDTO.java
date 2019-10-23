package com.hansoin5.artplanet.service;


//Member 테이블 = ArtPlanetMemberDTO
public class ArtPlanetMemberDTO {
	
	private String memberNo; // 회원 일련번호
	private String id; // 아이디(이메일 주소)
	private String password; // 비밀번호
	private String nickName; // 닉네임
	private String name; // 이름
	private String phoneNumber; // 핸드폰번호
	private String address; // 주소
	private java.sql.Date membershipDate; // 가입일
	private String birth; // 생년월일
	private String profilePicture; // 프로필 사진
	private String mainPicture; // 블로그 메인 사진
	private String introContent; // 자기소개글
	private int subscriptionFee; // 구독료 
	
	//게터 & 세터
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public java.sql.Date getMembershipDate() {
		return membershipDate;
	}
	public void setMembershipDate(java.sql.Date membershipDate) {
		this.membershipDate = membershipDate;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getProfilePicture() {
		return profilePicture;
	}
	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}
	public String getMainPicture() {
		return mainPicture;
	}
	public void setMainPicture(String mainPicture) {
		this.mainPicture = mainPicture;
	}
	public String getIntroContent() {
		return introContent;
	}
	public void setIntroContent(String introContent) {
		this.introContent = introContent;
	}
	public int getSubscriptionFee() {
		return subscriptionFee;
	}
	public void setSubscriptionFee(int subscriptionFee) {
		this.subscriptionFee = subscriptionFee;
	}
}/////class
