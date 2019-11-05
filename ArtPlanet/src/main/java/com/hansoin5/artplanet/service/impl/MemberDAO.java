package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.MemberDTO;

//데이터베이스에 직접적으로 관련된 로직이 있는 클래스에는 레포지토리 어노테이션
@Repository
public class MemberDAO {
	
	//sqlSessionTemplate주입 받는다
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	
	//아이디 중복처리 
	public boolean isDuplicated(Map map) {
		return (Integer)template.selectOne("MemberIsDuplicated", map)==0?false:true;
	}
	
	//닉네임 중복처리 
	public boolean nickNameisDuplicated(Map map) {
			return (Integer)template.selectOne("NickNameIsDuplicated", map)==0?false:true;
	}
	

	// 회원가입처리  
	public int insert(Map map) {
		return template.insert("MemberInsert",map);
	}
	
	
	
	//미구현 ======================================================================================
	
	//회원 여부 판단 
	public boolean isLogin(Map map) {
		//mybatis 패키지 -> Member.xml ->  artPlanetMemberIsLogin id를 가진 select 태그안의 쿼리문의
		//결과가 0이면 false반환, 아니면 true반환
		return (Integer)template.selectOne("MemberIsLogin", map)==0?false:true;
	}

	
	//내 정보 확인(내정보 페이지에 필요한 값을 가져옴)
	public MemberDTO selectOne(Map map) {
		return template.selectOne("MemberSelectOne", map);
	}
	
	// 계정 탈퇴시 사용
	public int delete(Map map) {
		return template.delete("MemberDelete",map);
	}
	
	
	// 내정보 수정
	public int update(Map map) {
		return template.update("MemberUpdate",map);
	}
	
	// ========================== 미사용 메소드 시작 ===================================
	public List<MemberDTO> selectlist(Map map) {return null;}
	public int getTotalRecord(Map map) {return 0;}
	// ========================== 미사용 메소드 끝 ===================================


	





	
	
}/////class
