package com.hansoin5.artplanet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SupportController {

	@RequestMapping("/Others")
	public String others()
	{
		return "support/report/Report.tiles";
	}
	
	@RequestMapping("/Login")
	public String login()
	{
		return "support/login/Login";
	}
	
	@RequestMapping("/Register")
	public String register()
	{
		return "support/login/Register";
	}
	
	@RequestMapping("/ForgotPassword")
	public String forgotPassword()
	{
		return "support/login/ForgotPassword";
	}
	
}/////class SupportController
