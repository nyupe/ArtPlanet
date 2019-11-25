package com.hansoin5.artplanet.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

// 아트클래스 예약정보 테이블에 접근하는 클래스
@Repository
public class ClassReservationDAO {
	
	// template 객체 주입
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	// 아트클래스 예약정보 테이블  레코드 삽입(생성)
	public int insert(Map map){
		return this.template.insert("insertReservation", map);
	}/////insert()	
	
	
}/////class
