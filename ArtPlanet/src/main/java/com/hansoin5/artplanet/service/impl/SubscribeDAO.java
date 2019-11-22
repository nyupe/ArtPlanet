package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SubscribeDAO {
	
	
	@Resource(name="template")
	SqlSessionTemplate template;
	
	//구독테이블에서 '현재시각 - 구독시간'이 3분이상인 레코드 수를 조회하는 메소드
	public int checkSubPayRecordCount() {
		//정기구독결제해야 하는 레코드 찾을시 컨트롤러에게 true 반환
		return (Integer)template.selectOne("checkSubPayRecordCount");
	}/////checkSubPay()
	
	//구독테이블에서 정기구독결제 진행해야하는 레코드들을 List<Map>으로 반환하는 메소드
	public List<Map> checkSubPayRecordList(){
		return template.selectList("checkSubPayRecordList");
	}/////checkSubPayList()
	
	
	
}/////class
