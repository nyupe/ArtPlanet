package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.ClassOpeningDateDTO;

@Repository
public class ClassOpeningDateDAO
{	
  //template 객체주입
  @Resource(name="template")
  private SqlSessionTemplate template;
  
  // 클래스 개설시각 리스트 반환 
  public List<ClassOpeningDateDTO> selectList(Map map)
  {
    return this.template.selectList("openingDateSelectList",map);
  }/////
  
  // 클래스 개설시각 레코드 한개 반환 
  public ClassOpeningDateDTO selectOne(Map map) {
	  return template.selectOne("getClassOpeningDateDTO", map);
  }
  
  // 클래스 개설시각 레코드 삽입(생성)
  public int insert(Map map)
  {
    return this.template.insert("openingDateInsert", map);
  }/////
  
  // 클래스 개설시각 수정
  public int update(Map map)
  {
    return this.template.update("openingDateUpdate", map);
  }/////
  
  // 클래스 개설시각 삭제 
  public int delete(Map map)
  {
    return this.template.delete("openingDateDelete", map);
  }/////
  
}
