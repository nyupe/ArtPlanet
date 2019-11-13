package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

import com.hansoin5.artplanet.service.ArtClassDTO;

public class ArtClassDAO  {

	@Resource(name="template")
	private SqlSessionTemplate template;
	
	@Override
	public List<ArtClassDTO> selectList(Map map){
		return template.selectList("ClassSelectList", map);
	}
	
	
	@Override
	public int delete(Map map) {
		template.delete("classInfoDelete", map);
		return template.delete("classDelete", map);
	}
	
	@Override
	public int insert(Map map) {
		return template.insert("classInsert",map)
	}
	@Override
	public int update(Map map) {
		return template.update("classUpdate",map);
	}
	
}
