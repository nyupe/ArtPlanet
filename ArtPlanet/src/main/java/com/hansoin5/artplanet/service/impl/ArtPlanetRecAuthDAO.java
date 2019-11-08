package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.ArtPlanetPayDTO;
import com.hansoin5.artplanet.service.ArtPlanetRecAuthDTO;

@Repository("recAuth")
public class ArtPlanetRecAuthDAO {
	
	//sqlSessionTemplate주입 받는다
		@Resource(name="template")
		private SqlSessionTemplate template;
		
		public int recAuthDelete(Map map) {
			return template.delete("recAuthDelete",map);
		}
		
		public int recAuthInsert(Map map) {
			return template.insert("recAuthInsert",map);
		}
		
		public int recAuthUpdate(Map map) {
			return template.update("recAuthUpdate",map);
		}
		
		//배치키테이블용
		public List<ArtPlanetRecAuthDTO> recAuthSelectlist(Map map){
			return template.selectList("recAuthSelectlist", map);
		}
	
}/////
