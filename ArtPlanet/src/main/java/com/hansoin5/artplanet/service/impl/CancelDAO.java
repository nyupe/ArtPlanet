package com.hansoin5.artplanet.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("cancel")
public class CancelDAO {
	
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	public int cancelInsert(Map map) {
		return template.insert("cancelInsert", map);
	}////
	
	public int cancelDelete(Map map) {
		return template.delete("cancelDelete", map);
	}
	
	public int cancelCount() {
		return template.selectOne("cancelCount");
	}//
	
	//취소버튼 노출용 쿼리 
	public int cancelButtonShowCount(String tno) {
		Map map = new HashMap();
		map.put("tno", tno);
		return template.selectOne("cancelButtonShow",map);
	}
	
	//취소테이블에 입력할 멤버노 구하기위함 11/26
	public String getMemberNoFromPayforCancel(Map map) {
		return template.selectOne("getMemberNoFromPayforCancel", map);
	}
	
	
}/////
