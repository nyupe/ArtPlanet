package com.hansoin5.artplanet.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectController
{
	@RequestMapping("/Project")
	public String project()
	{
		return "contents/project/Project.tiles";
	}
	
	@RequestMapping("/Project/View")
	public String viewProject()
	{
		return "contents/project/ViewProject.tiles";
	}
	
	@RequestMapping("/Project/Write")
	public String writeProject()
	{
		return "contents/project/WriteProject.tiles";
	}
	
	@RequestMapping("/Project/Edit")
	public String editProject()
	{
		return "contents/project/EditProject.tiles";
	}
}
