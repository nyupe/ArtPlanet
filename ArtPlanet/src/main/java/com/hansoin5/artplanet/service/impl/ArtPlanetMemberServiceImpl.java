package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hansoin5.artplanet.service.ArtPlanetMemberDTO;

//서비스 어노테이션 적용하면 스캔하면서 자동적으로 생성 
//오른쪽 괄호내용을 써주면 id값이 첫글자 소문자 클래스명이 아닌 오른쪽 내용으로 바뀜
@Service("artPlanetMemberService")
public class ArtPlanetMemberServiceImpl implements com.hansoin5.artplanet.service.ArtPlanetMemberService{
	
	//ArtPlanetMemberDAO객체 주입]
	@Resource(name="artPlanetMemberDAO")
	private ArtPlanetMemberDAO dao;
	
	//회원 여부 판단
	@Override
	public boolean isLogin(Map map) {
		return dao.isLogin(map);
	}/////isLogin()
	
	//아이디 & 비밀번호 찾기
	@Override
	public ArtPlanetMemberDTO selectOne(Map map) {
		return dao.selectOne(map);
	}/////selectOne() 
	
	//회원탈퇴
	@Override
	public int delete(Map map) {
		return dao.delete(map);
	}/////delete() 
	
	//회원가입
	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}/////insert()
	
	//내정보 수정
	@Override
	public int update(Map map) {
		return dao.update(map);
	}/////update()
	
	// ========================== 미사용 메소드 시작 ===================================
	@Override 
	public List<ArtPlanetMemberDTO> selectlist(Map map) {
		return null;		
	}/////selectlist()
	@Override
	public int getTotalRecord(Map map) {
		return 0;
	}/////getTotalRecord()
	// =========================== 미사용 메소드 끝 ===================================
	
}/////class
