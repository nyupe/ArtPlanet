package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.RecAuthDTO;

@Repository("recAuth")
public class RecAuthDAO {
	
	// member 테이블에 접근하는 객체를 주입받습니다.
		@Resource(name = "memberDAO")
		private MemberDAO memberDao;
	
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
		public List<RecAuthDTO> getDaoByBatch(Map map) {
			return template.selectList("getDaoByBatch", map);
		}
		//블로그 정기구독 결제시 인증테이블 app_time 덮어씌우기용 메서드
		public int updateApptime(Map map) {
			return template.update("updateApptime", map);
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
					
		//프로젝트카운트 세기용 11/25projGetCount
		public int projGetCount() {
			return template.selectOne("projGetCount");
		}
		
		//프로젝트 서포트넘버 얻기 11/25
		public String projGetProjSupNo() {
			return template.selectOne("projGetProjSupNo");
		}
		
		//프로젝트 결제시 인증테이블 app_time 덮어씌우기용 메서드
		public int updateApptimeForProj(Map map) {
			return template.update("updateApptimeForProj", map);
		}
				
}/////
