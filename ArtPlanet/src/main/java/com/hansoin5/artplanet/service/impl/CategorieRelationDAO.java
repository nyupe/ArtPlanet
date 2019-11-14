package com.hansoin5.artplanet.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.CategorieDTO;

@Repository
public class CategorieRelationDAO
{
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	public int insert(Map map)
	{
		return template.insert("insertCategorieRelation",map);
	}
}
