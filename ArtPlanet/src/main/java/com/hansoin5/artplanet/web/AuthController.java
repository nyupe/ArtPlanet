package com.hansoin5.artplanet.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AuthController {
	@RequestMapping("AuthStart.do")
	public String authStart() {
		return "kcpcert_enc_jsp/WEB_ENC/kcpcert_start";
	}//////authStart
	
	@RequestMapping("AuthReq.do")
	public String authReq() {
		return "kcpcert_enc_jsp/WEB_ENC/kcpcert_proc_req";
	}//////authStart
	
	@RequestMapping(value="AuthRes.do" ,method=RequestMethod.POST
			,produces ="application/text;charset=utf-8")
	public String authRes() {
		return "kcpcert_enc_jsp/WEB_ENC/kcpcert_proc_res";
	}//////authStart
	
	
}
