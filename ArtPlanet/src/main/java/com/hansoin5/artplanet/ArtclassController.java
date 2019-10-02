package com.hansoin5.artplanet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ArtclassController {
	@RequestMapping("/View")
	public String view()
	{
		return "sub/art_class/View.tiles";
	}
	
	@RequestMapping("/TextArea")
	public String textarea()
	{
		return "sub/art_class/TextArea.tiles";
	}
	
	
}
