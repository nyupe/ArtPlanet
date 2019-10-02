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
		return "about/About.tiles";
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
	public String blog2()
	{
		return "contents/blog/View.tiles";
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
	
	@RequestMapping("/ArtClass2")
	public String art_class2()
	{
		return "sub/art_class/ArtClass2.tiles";
	}
	
	@RequestMapping("/Others")
	public String others()
	{
		return "supporter/report/Report.tiles";
	}
}
