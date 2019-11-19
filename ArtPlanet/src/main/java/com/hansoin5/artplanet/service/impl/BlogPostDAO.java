package com.hansoin5.artplanet.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BlogPostDAO
{
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	public int uploadBlogPost(Map map)
	{
		return template.insert("uploadBlogPost",map);
	}
}
