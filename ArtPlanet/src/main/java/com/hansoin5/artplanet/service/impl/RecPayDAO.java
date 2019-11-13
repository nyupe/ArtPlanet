package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.RecPayDTO;

@Repository("recPay")
public class RecPayDAO {
	
	//sqlSessionTemplate주입 받는다
		@Resource(name="template")
		private SqlSessionTemplate template;
		
		//정기결제용
		public int recPayDelete(Map map) {
			return template.delete("recPayDelete",map);
		}
		
		public int recPayInsert(Map map) {
			return template.insert("recPayInsert",map);
		}
		
		public int recPayUpdate(Map map) {
			return template.update("recPayUpdate",map);
		}
		
		//배치결제 테이블용
		public List<RecPayDTO> recPaySelectlist(Map map){
			return template.selectList("recPaySelectlist", map);
		}
		//////////////////////////////////////////////////////////////
		//1회성 프로젝트결제용
		
		public int projPayDelete(Map map) {
			return template.delete("projPayDelete",map);
		}
		
		public int projPayInsert(Map map) {
			return template.insert("projPayInsert",map);
		}
		
		public int projPayUpdate(Map map) {
			return template.update("projPayUpdate",map);
		}
		
		//배치결제 테이블용
		public List<RecPayDTO> projPaySelectlist(Map map){
			return template.selectList("projPaySelectlist", map);
		}
		
	
}/////
