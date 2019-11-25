package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.TagRelationDTO;

@Repository
public class TagRelationDAO
{
	//sqlSessionTemplate주입 받는다
	@Resource(name="template")
	private SqlSessionTemplate template;
		
	public int insertBlogTagRelation(Map map)
	{
		return template.insert("blog-insertTagRelation", map);
	}
	public int insertProjectTagRelation(Map map)
	{
		return template.insert("project-insertTagRelation", map);
	}
	public List<TagRelationDTO> getProjectTagRelation(Map map)
	{
		return template.selectList("project-getTagRelation", map);
	}
}
