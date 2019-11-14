package com.hansoin5.artplanet.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//회원가입시 휴대폰 인증관련 요청들을 처리하는 컨트롤러 클래스
@Controller
public class AuthController { 

	// 휴대폰 인증버튼을 보여주는 page
	@RequestMapping("/AuthStart.do")
	public String authStart() {
		return "kcpcert_enc_jsp/WEB_ENC/kcpcert_start";
	}////// authStart()

	// 인증후 결과 데이터를 받는 page;
	@RequestMapping("AuthReq.do")
	public String authReq() {
		return "kcpcert_enc_jsp/WEB_ENC/kcpcert_proc_req";
	}////// authReq()

	
	/*
	 * @RequestMapping(value = "AuthRes.do", produces =
	 * "application/text;charset=utf-8") public String authRes() { return
	 * "kcpcert_enc_jsp/WEB_ENC/kcpcert_proc_res"; }////// authRes()
	 */
}/////class
