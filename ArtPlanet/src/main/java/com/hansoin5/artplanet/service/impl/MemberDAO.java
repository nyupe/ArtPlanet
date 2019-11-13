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
		
	//아이디로 회원번호 가져오기 
	public String getMemberNo(String id) {
		return template.selectOne("getMemberNo", id);
	}/////getMemberNo()
	
	
	//회원정보 조회
	public MemberDTO getMemberDTO(Map map) {
		return template.selectOne("getMemberDTO", map);
	}/////getMemberNo()
	
	
	//아이디 중복처리 
	public boolean isDuplicated(Map map) {
		return (Integer)template.selectOne("memberIsDuplicated", map)==0?false:true;
	}/////isDuplicated()
	
	//닉네임 중복처리 
	public boolean nickNameisDuplicated(Map map) {
		return (Integer)template.selectOne("nickNameIsDuplicated", map)==0?false:true;
	}/////nickNameisDuplicated()
	

	// 회원가입처리  
	public int insert(Map map) {
		return template.insert("memberInsert",map);
	}/////insert()

	
	//회원 여부 판단 
	public boolean loginProcess(Map map) { // 사용자가 입력한 아이디와 비밀번호가 일치한 회원은 1개여야함 
		return (Integer)template.selectOne("loginProcess", map)== 1 ? true : false;
	}/////loginProcess()
	
	
	
	
	
	//미구현 ======================================================================================
	
	

	// 회원정보 가져오기
	public MemberDTO selectOne(Map map) {
		return template.selectOne("getMemberInfo", map);
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
