package com.hansoin5.artplanet.service;

public class ArtPlanetPayDTO {
	private String tno;//거래번호
	private String ordr_idxx;//주문번호
	private int amount;//결제금액
	private String good_name; //상품명
	private String buyr_name; //주문자명
	private String buyr_tel1; //집전화
	private String buyr_tel2; //핸번
	private String buyr_mail; //이메일
	private String card_name; //카드사
	private String app_time; //승인시간
	private String app_no; //승인번호
	private int memberno; //회원번호
	
	private int isCanceled;//취소여부 확인 위한 추가 멤버변수 0==취소전 1==취소됨
	
	//게터세터
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public String getOrdr_idxx() {
		return ordr_idxx;
	}
	public void setOrdr_idxx(String ordr_idxx) {
		this.ordr_idxx = ordr_idxx;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getGood_name() {
		return good_name;
	}
	public void setGood_name(String good_name) {
		this.good_name = good_name;
	}
	public String getBuyr_name() {
		return buyr_name;
	}
	public void setBuyr_name(String buyr_name) {
		this.buyr_name = buyr_name;
	}
	public String getBuyr_tel1() {
		return buyr_tel1;
	}
	public void setBuyr_tel1(String buyr_tel1) {
		this.buyr_tel1 = buyr_tel1;
	}
	public String getBuyr_tel2() {
		return buyr_tel2;
	}
	public void setBuyr_tel2(String buyr_tel2) {
		this.buyr_tel2 = buyr_tel2;
	}
	public String getBuyr_mail() {
		return buyr_mail;
	}
	public void setBuyr_mail(String buyr_mail) {
		this.buyr_mail = buyr_mail;
	}
	public String getCard_name() {
		return card_name;
	}
	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}
	public String getApp_time() {
		return app_time;
	}
	public void setApp_time(String app_time) {
		this.app_time = app_time;
	}
	public String getApp_no() {
		return app_no;
	}
	public void setApp_no(String app_no) {
		this.app_no = app_no;
	}
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}

	public int getIsCanceled() {
		return isCanceled;
	}
	public void setIsCanceled(int isCanceled) {
		this.isCanceled = isCanceled;
	}
}
