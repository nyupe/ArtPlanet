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
