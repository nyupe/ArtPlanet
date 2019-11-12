package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.GcsDTO;

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
	public List<GcsDTO> getListByClass(Map map)
	{
		return template.selectList("artclass-getImages",map);
	}
}
