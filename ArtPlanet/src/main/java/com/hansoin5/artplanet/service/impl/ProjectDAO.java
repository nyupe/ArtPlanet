package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.ProjectDTO;


//데이터베이스에 직접적으로 관련된 로직이 있는 클래스에는 레포지토리 어노테이션
@Repository
public class ProjectDAO {

	//sqlSessionTemplate주입 받는다
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	// 프로젝트 삭제
	public int delete(Map map) {
		return 0;
	}
	
	// 프로젝트 목록 
	public List<ProjectDTO> selectlist(Map map) {
		return template.selectList("Projectselectlist",map);
	}
	
	
	// 프로젝트 수정
	public int update(Map map) {
		return 0;
	}
	
	// 프로젝트 등록
	public int projectinsert(Map map) {
		return template.insert("ProjectInsert",map);
	}
	
	// 프로젝트 코멘트 등록
	public void insertcomment(Map map) {
		template.insert("ProjectInsertComment",map);
	}
	
	// 프로젝트 코멘트 리스트
	public List<Map> selectcomment(Map map){
		return template.selectList("ProjectSelectListComment",map);
	}
	
	// 프로젝트 내용뿌리기
	public ProjectDTO selectOne(Map map) {
		return template.selectOne("projectselectone",map);
	}
	
	// 프로젝트 펀딩 정보 뿌리기
	public ProjectDTO selectFundInfo(Map map) {
		return template.selectOne("projectSelectOneFundInfo",map);
	}
	
	//프로젝트 태그 가져오기
	public List<Map> selectTagslist(Map map) {
		return template.selectList("projectSelectTagsList",map);
	}
	
	// 프로젝트 코멘트 숫자 구하기
	public int getCommentCount(Map map) {
		return template.selectOne("projectCommentCount", map);
	}
	
	// 프로젝트에 서포터 리스트
	public List<Map> selectsupport(Map map){
		return template.selectList("ProjectSelectListSupport",map);
	}
	public int insertsupport(Map map) {
		return template.insert("InsertSupport",map);
	}
	public List<Map> selectTags(Map map){
		return template.selectList("SelectTags", map);
	}
	
	//  크라우드 펀딩 프로젝트 결제관련
	// 현재날짜와 마감일이 일치하는 동시에 ( 모금액 - 목표액 )이 0이상인 레코드수 반환  - 용주
	// AutoPay.xml과 연관된 메소드
	public int autoPayGetProjectRecords() {
		return template.selectOne("autoPayGetProjectRecords");
	}/////autoPayGetProjectRecords
	
}/////class
