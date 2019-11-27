package com.hansoin5.artplanet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hansoin5.artplanet.service.SubscribeDTO;

@Repository
public class SubscribeDAO {
	
	@Resource(name="template")
	SqlSessionTemplate template;
	//Autopay////////////
	//구독테이블에서 '현재시각 - 구독시간'이 3분이상인 레코드 수를 조회하는 메소드
	public int checkSubPayRecordCount() {
		//정기구독결제해야 하는 레코드 찾을시 컨트롤러에게 true 반환
		return (Integer)template.selectOne("checkSubPayRecordCount");
	}/////checkSubPay()
	
	//구독테이블에서 정기구독결제 진행해야하는 레코드들을 List<Map>으로 반환하는 메소드
	public List<Map> checkSubPayRecordList(){
		return template.selectList("checkSubPayRecordList");
	}/////checkSubPayList()
	//Autopay///////////
	
	//구독신청
	public int doSubscribe(Map map)
	{
		return template.insert("doSubscribe", map);
	}
	//구독정보 조회
	public List<SubscribeDTO> getSubscribe(Map map)
	{
		return template.selectList("getSubscribe", map);
	}
	//나를 구독하고있는 정보
	public List<SubscribeDTO> getWhoSubscribeMe(Map map)
	{
		return template.selectList("getWhoSubscribeMe", map);
	}
	//내가 구독하고있는 정보
	public List<SubscribeDTO> getISubscribeWho(Map map)
	{
		return template.selectList("getISubscribeWho", map);
	}
}/////class
