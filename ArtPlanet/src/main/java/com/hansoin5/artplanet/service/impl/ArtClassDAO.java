package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.ArtClassDTO;

@Repository
public class ArtClassDAO
{
	// template 객체주입
	@Resource(name="template")
	private SqlSessionTemplate template;

	  
	public List<ArtClassDTO> selectList(){
		return this.template.selectList("ClassSelectList");
	}
	
	//아트클래스 고유번호로 아트클래스 한개의 대한 모든 정보 얻어오기
	public ArtClassDTO selectOne(Map map) {
		return template.selectOne("getClassOne", map);
	}/////selectOne()
	
	//아트클래스 일련번호 맵에 담음 -> 삭제 쿼리 호출 
	public int delete(Map map){
	  return this.template.delete("classDelete", map);
	}/////delete()
	  
	// 아트클래스 레코드 생성하기
	public int insert(Map map)
	{
	  return this.template.insert("classInsert", map);
	}/////insert
  
	public int update(Map map)
	{
	  return this.template.update("classUpdate", map);
	}
}/////class
