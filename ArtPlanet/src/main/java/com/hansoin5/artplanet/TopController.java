package com.hansoin5.artplanet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TopController
{
	
	@RequestMapping("/Home")
	public String home()
	{
		return "Home.tiles";
	}
	
	@RequestMapping("/About")
	public String about()
	{
		return "about/About2.tiles";
	}
	
	@RequestMapping("/Search")
	public String search()
	{
		return "contents/Search.tiles";
	}
	
	@RequestMapping("/Blog")
	public String blog()
	{
		return "contents/blog/Blog.tiles";
	}
	
	@RequestMapping("/ViewPost")
	public String viewpost()
	{
		return "contents/blog/ViewPost.tiles";
	}
	@RequestMapping("/WritePost")
	public String writePost()
	{
		return "contents/blog/WritePost.tiles";
	}
	
	@RequestMapping("/Project")
	public String project()
	{
		return "contents/project/Project.tiles";
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
	
	
}
