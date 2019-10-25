package com.hansoin5.artplanet.validation;

public class RegisterFormCommand {
	
	//폼의 파라미터명과 같게 속성(멤버변수) 정의]
	private String id; // 이메일을 아이디로 지정할 예정
	private String name; // 이름
	private String password; // 비밀번호
	private String passwordConfirm; //비밀번호 확인
	private String address; // 주소
	private String checkMembershipTerms; // 회원약관 읽음 여부
	private String idDuplicationFlag; // 중복 체크 변수
	//private String detailAddress; //상세주소
	
	//게터/세터]	
	public String getIdDuplicationFlag() {
		return idDuplicationFlag;
	}
	public void setIdDuplicationFlag(String idDuplicationFlag) {
		this.idDuplicationFlag = idDuplicationFlag;
	}
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPasswordConfirm() {
		return passwordConfirm;
	}
	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCheckMembershipTerms() {
		return checkMembershipTerms;
	}
	public void setCheckMembershipTerms(String checkMembershipTerms) {
		this.checkMembershipTerms = checkMembershipTerms;
	}
	
	/*
	 * public String getDetailAddress() { return detailAddress; } public void
	 * setDetailAddress(String detailAddress) { this.detailAddress = detailAddress;
	 * }
	 */

	
	
}/////class
