package com.hansoin5.artplanet.service;

import java.util.List;
import java.util.Map;

public interface ArtPlanetMemberService {
	
	//로그인 용]
	boolean isLogin(Map map); 
	boolean isDuplicated(Map map);
	//목록용
	List<ArtPlanetMemberDTO> selectlist(Map map);
	//전체 레코드 수
	int getTotalRecord(Map map);
	//상세 보기용] 
	ArtPlanetMemberDTO selectOne(Map map);
	//입력/수정/삭제용]
	int delete(Map map);
	int insert(Map map);
	int update(Map map);
	
}/////interface
