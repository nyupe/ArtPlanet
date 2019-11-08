package com.hansoin5.artplanet.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AuthorityDAO {
	
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	
	// 회원 권한 입력
	public int insertAuthority(Map map) {
		return template.insert("insertAuthority",map);
	}/////insert()
	
	
	
}/////class
