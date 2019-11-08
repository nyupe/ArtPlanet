package com.hansoin5.artplanet.service;

public class ArtPlanetRecAuthDTO {
	private String ordr_idxx;//주문번호
	private String res_cd;// 응답코드
	private String batch_key;// 배치키
	private String card_cd;//카드코드
	private String buyr_name; //주문자명
	private String memberno;// 멤버고유번호
	
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
	public String getCard_code() {
		return card_cd;
	}
	public void setCard_code(String card_cd) {
		this.card_cd = card_cd;
	}
	public String getBuyr_name() {
		return buyr_name;
	}
	public void setBuyr_name(String buyr_name) {
		this.buyr_name = buyr_name;
	}
	public String getMemberno() {
		return memberno;
	}
	public void setMemberNo(String memberno) {
		this.memberno = memberno;
	}
	
	
	
}
