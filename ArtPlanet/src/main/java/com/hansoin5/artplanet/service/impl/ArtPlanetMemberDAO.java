package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.ArtPlanetMemberDTO;

//데이터베이스에 직접적으로 관련된 로직이 있는 클래스에는 레포지토리 어노테이션
@Repository
public class ArtPlanetMemberDAO implements com.hansoin5.artplanet.service.ArtPlanetMemberService{
	
	//sqlSessionTemplate주입 받는다
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	//아이디 중복처리 
	@Override
	public boolean isDuplicated(Map map) {
		return (Integer)template.selectOne("artPlanetMemberIsDuplicated", map)==0?false:true;
	}
	
	
	//회원 여부 판단 
	@Override
	public boolean isLogin(Map map) {
		//mybatis 패키지 -> Member.xml ->  artPlanetMemberIsLogin id를 가진 select 태그안의 쿼리문의
		//결과가 0이면 false반환, 아니면 true반환
		return (Integer)template.selectOne("artPlanetMemberIsLogin", map)==0?false:true;
	}

	
	//내 정보 확인(내정보 페이지에 필요한 값을 가져옴)
	@Override
	public ArtPlanetMemberDTO selectOne(Map map) {
		return template.selectOne("artPlanetMemberSelectOne", map);
	}
	
	// 계정 탈퇴시 사용
	@Override
	public int delete(Map map) {
		return template.delete("artPlanetMemberDelete",map);
	}
	
	// 회원가입시 MEMBER테이블에 레코드삽입
	@Override
	public int insert(Map map) {
		return template.insert("artPlanetMemberInsert",map);
	}
	
	// 내정보 수정
	@Override
	public int update(Map map) {
		return template.update("artPlanetMemberUpdate",map);
	}
	
	// ========================== 미사용 메소드 시작 ===================================
	@Override
	public List<ArtPlanetMemberDTO> selectlist(Map map) {return null;}
	@Override
	public int getTotalRecord(Map map) {return 0;}
	// ========================== 미사용 메소드 끝 ===================================


	





	
	
}/////class
