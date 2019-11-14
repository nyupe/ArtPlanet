package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.RecAuthDTO;

@Repository("recAuth")
public class RecAuthDAO {
	
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
		public List<RecAuthDTO> recAuthSelectlist(Map map){
			return template.selectList("recAuthSelectlist", map);
		}
		
		/////////////////////////////////////////////////
		//프로젝트용 1회용 배치키
		
		public int projAuthDelete(Map map) {
			return template.delete("projAuthDelete",map);
		}
		
		public int projAuthInsert(Map map) {
			return template.insert("projAuthInsert",map);
		}
		
		public int projAuthUpdate(Map map) {
			return template.update("projAuthUpdate",map);
		}
		
		//배치키테이블용
		public List<RecAuthDTO> projAuthSelectlist(Map map){
			return template.selectList("projAuthSelectlist", map);
		}
		
	
}/////
