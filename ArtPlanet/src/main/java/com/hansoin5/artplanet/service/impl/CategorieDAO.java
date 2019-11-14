package com.hansoin5.artplanet.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.CategorieDTO;

@Repository
public class CategorieDAO
{
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	public int insert(Map map)
	{
		return template.insert("insertCategorie",map);
	}
	
	public CategorieDTO getCategorieDTO(Map map)
	{
		return null;
	}
}
