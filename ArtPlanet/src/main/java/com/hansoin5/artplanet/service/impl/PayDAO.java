package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.PayDTO;

@Repository("payInfo")
public class PayDAO {
	
	//sqlSessionTemplate주입 받는다
		@Resource(name="template")
		private SqlSessionTemplate template;
		
		public int payDelete(Map map) {
			return template.delete("payDelete",map);
		}
		
		public int payInsert(Map map) {
			return template.insert("payInsert",map);
		}
		
		public int payUpdate(Map map) {
			return template.update("payUpdate",map);
		}
		
		//게시판 결제테이블용
		public List<PayDTO> paySelectlist(Map map){
			return template.selectList("paySelectlist", map);
		}
		
		//총 레코드수 사용안하는중. 쿼리는 맞은상태
		public int payCount() {
			return template.selectOne("payCounter");
		}
	
}/////
