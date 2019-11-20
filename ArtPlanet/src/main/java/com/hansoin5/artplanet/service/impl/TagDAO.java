package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.TagDTO;

@Repository
public class TagDAO
{
	//sqlSessionTemplate주입 받는다
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	public List<TagDTO> getTags(Map map)
	{
		return template.selectList("getTags", map);
	}
	public int insertTag(String tagName)
	{
		return template.insert("insertTag", tagName);
	}
}
