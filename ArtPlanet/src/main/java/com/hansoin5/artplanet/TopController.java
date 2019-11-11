package com.hansoin5.artplanet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TopController
{
	
	@RequestMapping("/About")
	public String about()
	{
		return "about/About.tiles";
	}
	
	@RequestMapping("/Search/Artwork")
	public String searchArtwork()
	{
		return "contents/SearchArtwork.tiles";
	}
	
	@RequestMapping("/Search/Artist")
	public String searchArtist()
	{
		return "contents/SearchArtist.tiles";
	}
	
	@RequestMapping("/Search/Project")
	public String searchProject()
	{
		return "contents/SearchProject.tiles";
	}
	
	@RequestMapping("/ArtClass")
	public String art_class()
	{
		return "sub/art_class/ArtClass.tiles";
	}
	
	@RequestMapping("/Pay")
	public String art_class2()
	{
		return "pay/Pay.tiles";
	}
	
	//MyPage로 이동
	@RequestMapping("/MyPage")
	public String moveMyPage() {
		return "support/member/MyPage.tiles";
	}/////moveMyPage()
	
	//로그인 페이지로 이동
	@RequestMapping(value = "/Login")
	public String login()
	{
		return "support/member/Login";
	}/////login()
	

	
}
