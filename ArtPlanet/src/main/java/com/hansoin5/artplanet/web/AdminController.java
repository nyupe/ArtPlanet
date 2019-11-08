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
import com.hansoin5.artplanet.service.ArtPlanetRecAuthDTO;
import com.hansoin5.artplanet.service.impl.ArtPlanetPayDAO;
import com.hansoin5.artplanet.service.impl.ArtPlanetRecAuthDAO;

@Controller
public class AdminController {
	
	@Resource(name="payInfo")	
	private ArtPlanetPayDAO dao;
	
	@Resource(name="recAuth")	
	private ArtPlanetRecAuthDAO recAuthDao;
	
	//메뉴 가입회원
	@RequestMapping("AdmUserInfo.ad")
	public String admUser() {
		
		return "admin/admUserInfo";
	}//////AdmUserInfo.ad
	
	//메뉴 일반결제-취소가능
	@RequestMapping("AdmUserPay.ad")
	public String admPay() {
		
		return "admin/admPay";
	}//////AdmUserPay.ad
	
	//메뉴 정기결제-배치키
	@RequestMapping("AdmUserBatch.ad")
	public String admBatch() {
		return "admin/admBatchKey";
	}//////AdmUserBatch.ad
	
	//메뉴 정기결제
	@RequestMapping("AdmUserRecPay.ad")
	public String admReccuring() {
		return "admin/admRecurring";
	}//////AdmUserPay.ad
	
	//일반결제 데이터 AJAX뿌려주기
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
				record.put("tno", dto.getTno());
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
			 * [{"app_time":"20191106220723","memberno":5,"amount":30000,"tno":"19940928719018","card_name":"롯데카드","buyr_name":"아트플래닛","app_no":"18849194","ordr_idxx":"TEST201911061573045462216","good_name":"강좌결제테스트상품 ","buyr_tel2":"010-0000-0000","buyr_tel1":"02-0000-0000","buyr_mail":"rlawq@naver.com"},{"app_time":"20191106230620","memberno":8,"amount":30000,"tno":"19940928719407","card_name":"롯데카드","buyr_name":"아트플래닛","app_no":"86503020","ordr_idxx":"TEST201911061573049030968","good_name":"강좌결제테스트상품 ","buyr_tel2":"010-0000-0000","buyr_tel1":"02-0000-0000","buyr_mail":"abc@seungchan.kr"}]
[{"app_time":"20191106220723","memberno":5,"amount":30000,"tno":"19940928719018","card_name":"롯데카드","buyr_name":"아트플래닛","app_no":"18849194","ordr_idxx":"TEST201911061573045462216","good_name":"강좌결제테스트상품 ","buyr_tel2":"010-0000-0000","buyr_tel1":"02-0000-0000","buyr_mail":"rlawq@naver.com"},{"app_time":"20191106230620","memberno":8,"amount":30000,"tno":"19940928719407","card_name":"롯데카드","buyr_name":"아트플래닛","app_no":"86503020","ordr_idxx":"TEST201911061573049030968","good_name":"강좌결제테스트상품 ","buyr_tel2":"010-0000-0000","buyr_tel1":"02-0000-0000","buyr_mail":"abc@seungchan.kr"}]
			 */	
			System.out.println(JSONArray.toJSONString(collections));
			
			return JSONArray.toJSONString(collections);
		}////////////////////AdmUserPayList.ad
	
	//배치키 데이터 AJAX뿌려주기
		@RequestMapping(value="AdmBatchKeyList.ad",produces = "text/html; charset=UTF-8")
		@ResponseBody
		public String admBatchKeyList() {
			//비지니스 로직 호출]
				Map map = new HashMap();
				map.put("start",1);
				map.put("end",10);
				List<ArtPlanetRecAuthDTO> list=recAuthDao.recAuthSelectlist(map);
				//[{},{},{},{}]형태로 반환
				
				/*JSONArray의 정적 메소드인 toJSONString(List계열 컬렉션)
				호출시에는 List계열 컬렉션에 반드시 Map계열 컬렉션이 저장되어야 한다]		
				ReplyBBSDTO를 Map으로 변경]		
				ReplyBbsDTO를 Map으로 저장해서
				List계열 컬렉션에 저장
				*/
				List<Map> collections = new Vector<Map>();
				for(ArtPlanetRecAuthDTO dto:list) {
					Map record = new HashMap();
					record.put("ordr_idxx",dto.getOrdr_idxx());
					record.put("res_cd",dto.getRes_cd());
					record.put("batch_key",dto.getBatch_key());
					record.put("card_cd",dto.getCard_code());					
					record.put("buyr_name",dto.getBuyr_name());					
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
