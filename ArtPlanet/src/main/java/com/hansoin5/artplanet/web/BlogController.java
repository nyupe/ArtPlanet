package com.hansoin5.artplanet.web;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.hansoin5.artplanet.service.impl.BlogPostDAO;
import com.hansoin5.artplanet.service.impl.GcsDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BlogController
{
	@Resource(name="blogPostDAO")	
	private BlogPostDAO dao;
	@Resource(name="gcsDAO")	
	private GcsDAO gcsDAO;
	
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
	
	@RequestMapping("/EditPost")
	public String editPost()
	{
		return "contents/blog/EditPost.tiles";
	}
	
	@RequestMapping("/UploadBlogPost")
	public String UploadBlogPost(@RequestParam Map map) throws ParseException
	{	
		map.put("memberNo", "1");
		
		
		int affected = dao.uploadBlogPost(map);
		//int blogNo = Integer.parseInt(map.get("blogNo").toString());
		System.out.println(map.get("blogNo"));
		if(affected > 0)
		{
			//JSON형태 문자열 자바객체로 변환하기
			Map<String,List<Map<String,Object>>> gsonMap = new HashMap<String, List<Map<String,Object>>>();
			Gson gson = new Gson();
			JSONParser parser = new JSONParser();
			//이미지
			Object obj = parser.parse(map.get("imgs").toString());
			JSONObject jsonObj = (JSONObject) obj;
			gsonMap = gson.fromJson(JSONObject.toJSONString(jsonObj).replace("\\/", "/"),
					new TypeToken<Map<String,List<Map<String,Object>>>>(){}.getType());
			/////////////////////////////
			for(int i = 0; i < gsonMap.get("images").size(); i++)
			{
				String fileNo = gcsDAO.getFileNoByURL(gsonMap.get("images").get(i).get("src").toString());
				map.put("fileNo", fileNo);
				gcsDAO.updateBlogNo(map);
			}
			
			System.out.println("jsonObj:"+JSONObject.toJSONString(jsonObj).replace("\\/", "/"));
			//태그
			System.out.println("gettags:"+map.get("tags").toString());
			obj = parser.parse(map.get("tags").toString());
			jsonObj = (JSONObject) obj;
			gsonMap = gson.fromJson(JSONObject.toJSONString(jsonObj).replace("\\/", "/"),
					new TypeToken<Map<String,List<Map<String,Object>>>>(){}.getType());
			for(int i = 0; i < gsonMap.get("tags").size(); i++)
			{
				System.out.println(gsonMap.get("tags").get(i).get("tag").toString());
				
				//gcsDAO.updateBlogNo(map);
			}
			System.out.println("jsonObj2:"+JSONObject.toJSONString(jsonObj).replace("\\/", "/"));
			
		}
		return "contents/blog/WritePost.tiles";
	}
	
}
