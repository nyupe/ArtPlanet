package com.hansoin5.artplanet.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping("AdmUserInfo.ad")
	public String authStart() {
		return "admin/admUserInfo";
	}//////AdmUserInfo.ad
}