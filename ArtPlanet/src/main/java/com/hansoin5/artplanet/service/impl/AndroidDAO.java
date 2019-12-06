package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.MemberDTO;

@Repository
public class AndroidDAO {

	// sqlSessionTemplate주입 받는다
	@Resource(name = "template")
	private SqlSessionTemplate template;

	public List<Map> selectPictures() {
		return template.selectList("androidSelectListGCS");
	}
	
	// ========================== 모바일 메소드 시작 ===================================
		// 로그인 확인
		public boolean mobilelogin(Map map) {
			return (Integer)template.selectOne("getmobileMemberlogin", map)== 1 ? true : false;
		}
		// 토큰 생성처리
		public boolean mobileinsert(Map map) {
			return (Integer)template.insert("mobiletokenrInsert",map)== 1 ? true : false;
		}/////insert()
		
		// 회원정보 반환
		   public MemberDTO mobileselect(Map map) {
		      return template.selectOne("getmobileSelect", map);
		   }///// getMembers()
		// ========================== 모바일 메소드 끝 
}
