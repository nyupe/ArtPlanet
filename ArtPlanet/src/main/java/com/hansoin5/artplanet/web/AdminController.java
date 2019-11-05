package com.hansoin5.artplanet.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hansoin5.artplanet.service.ArtPlanetPayDTO;
import com.hansoin5.artplanet.service.impl.ArtPlanetPayDAO;

@Controller
public class AdminController {
	
	@Resource(name="payInfo")	
	private ArtPlanetPayDAO dao;
	
	
	@RequestMapping("AdmUserInfo.ad")
	public String admUser() {
		
		return "admin/admUserInfo";
	}//////AdmUserInfo.ad
	
	@RequestMapping("AdmUserPay.ad")
	public String admPay() {
		
		return "admin/admPay";
	}//////AdmUserPay.ad
	
	@RequestMapping("AdmUserRecPay.ad")
	public String admReccuring() {
		return "admin/admRecurring";
	}//////AdmUserPay.ad
	
	
	@RequestMapping(value="AdmUserPayList.ad",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String admPayList() {
		//비지니스 로직 호출]
			Map map = new HashMap();
			map.put("start",1);
			map.put("end",10);
			List<ArtPlanetPayDTO> list=dao.paySelectlist(map);
			//[{},{},{},{}]형태로 반환
			
			/*JSONArray의 정적 메소드인 toJSONString(List계열 컬렉션)
			호출시에는 List계열 컬렉션에 반드시 Map계열 컬렉션이 저장되어야 한다]		
			ReplyBBSDTO를 Map으로 변경]		
			ReplyBbsDTO를 Map으로 저장해서
			List계열 컬렉션에 저장
			*/
			List<Map> collections = new Vector<Map>();
			for(ArtPlanetPayDTO dto:list) {
				Map record = new HashMap();
				record.put("tno",dto.getTno());
				record.put("ordr_idxx",dto.getOrdr_idxx());
				record.put("amount",dto.getAmount());
				record.put("good_name",dto.getGood_name());
				record.put("buyr_name",dto.getBuyr_name());				
				record.put("buyr_tel1",dto.getBuyr_tel1());
				record.put("buyr_tel2",dto.getBuyr_tel2());
				record.put("buyr_mail",dto.getBuyr_mail());
				record.put("card_name",dto.getCard_name());
				record.put("app_time",dto.getApp_time());
				record.put("app_no",dto.getApp_no());
				record.put("memberno",dto.getMemberno());
				
				
				collections.add(record);
			}
			/*
			 * ※아래 형태로 반환됨
			 * [{"name":"가길동","postDate":"2019-09-20","title":"1111111111111111"},{"name":"가길동","postDate":"2019-09-17","title":"sgfsdgdfd"},{"name":"가길동","postDate":"2019-09-17","title":"2222222"},{"name":"가길동","postDate":"2019-09-17","title":"4444"},{"name":"가길동","postDate":"2019-09-17","title":"11111111111"},{"name":"이길동","postDate":"2019-09-11","title":"이가 원본글"},{"name":"가길동","postDate":"2019-09-11","title":"1111111111"},{"name":"가길동","postDate":"2019-09-11","title":"저도 답글 달아요1"},{"name":"이길동","postDate":"2019-09-11","title":"조언 감사합니다"},{"name":"이길동","postDate":"2019-09-11","title":"내가 다시 답글"}]
			 * 
			 * 
			 */	
			System.out.println(JSONArray.toJSONString(collections));
			
			return JSONArray.toJSONString(collections);
		}////////////////////AdmUserPayList.ad

}
