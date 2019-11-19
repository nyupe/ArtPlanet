package com.hansoin5.artplanet.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class GcsDAO
{
	//sqlSessionTemplate주입 받는다
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	public int editorUploadImage(Map map)
	{
		return template.insert("editor-uploadImage",map);
	}
	public int blogUploadImage(Map map)
	{
		return template.insert("blog-uploadImage",map);
	}
	public String getFileNoByURL(String fileUrl)
	{
		return template.selectOne("getFileNoByURL", fileUrl);
	}
	public int updateBlogNo(Map map)
	{
		return template.update("updateBlogNo", map);
	}
}
