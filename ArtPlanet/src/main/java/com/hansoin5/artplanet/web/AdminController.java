package com.hansoin5.artplanet.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping("AdmUserInfo.ad")
	public String admUser() {
		return "admin/admUserInfo";
	}//////AdmUserInfo.ad
	
	@RequestMapping("AdmUserPay.ad")
	public String admPay() {
		return "admin/admPay";
	}//////AdmUserPay.ad
	
	@RequestMapping("AdmUserRecPay.ad")
	public String admReccuring() {
		return "admin/admRecurring";
	}//////AdmUserPay.ad
	
}
