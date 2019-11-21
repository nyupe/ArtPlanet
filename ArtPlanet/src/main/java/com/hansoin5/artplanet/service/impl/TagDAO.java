package com.hansoin5.artplanet.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class TagDAO
{
	//sqlSessionTemplate주입 받는다
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	public String getTagNo(Map map)
	{
		return template.selectOne("getTagNo", map);
	}
	public int insertTag(Map map)
	{
		return template.insert("insertTag", map);
	}
}
