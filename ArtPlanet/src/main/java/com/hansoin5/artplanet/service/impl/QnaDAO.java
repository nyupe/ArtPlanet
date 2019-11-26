package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.QnaDTO;

//저장소 쓰기위해 추가
@Repository
public class QnaDAO {
	
	//추가
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		return template.insert("qnaInsert",map);
	}
	
	public List<QnaDTO> selectList(Map map) {
		return template.selectList("qnaSelectList",map);
	}

	public int getTotalRecord(Map map) {
		return template.selectOne("qnaTotalRecord",map);
		
	}
	//상세보기
	public QnaDTO selectOne(String qnaNo) {
		return template.selectOne("qnaSelectOne",qnaNo);
	}
	//수정
	public int update(Map map) {
		return template.update("qnaUpdate",map);
	}
	//삭제
	public int delete(Map map) {
		return template.delete("qnaDelete",map);
	}

	
	
}////
