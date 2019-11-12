package com.hansoin5.artplanet.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hansoin5.artplanet.service.RecPayDTO;
import com.hansoin5.artplanet.service.impl.RecAuthDAO;
import com.hansoin5.artplanet.service.impl.RecPayDAO;

@Controller
public class ProjectPayController {

	@Resource(name = "recAuth")
	private RecAuthDAO authDao;
	@Resource(name = "recPay")
	private RecPayDAO payDao;

	// 인증
	@RequestMapping("/ProjectAuthReq.do")
	public String authReq() {
		return "project_pay/sample/auth/Requestkey.tiles";
	}////////////// RecurringAuthReq.do

	@RequestMapping("/ProjectAuthHub.do")
	public String authHub() {
		return "project_pay/sample/auth/pp_cli_hub";
	}////////////// RecurringAuthHub.do

	// DB저장
	@RequestMapping("/ProjectAuthRes.do")
	public String authRes(@RequestParam Map map) {
		System.out.println(map.get("batch_key"));
		int affected = authDao.projAuthInsert(map);
		if (affected == 1) {
			System.out.println("프로젝트 후원[인증] DB입력완료");
		}

		return "project_pay/sample/auth/result";
	}/////////// RecurringAuthRes.do

	// 결제
	@RequestMapping("/ProjectPayOrder.do")
	public String payOrder() {
		return "project_pay/sample/payx/order";
	}////////////// RecurringPayOrder.do

	@RequestMapping("/ProjectPayHub.do")
	public String payHub() {
		return "project_pay/sample/payx/pp_cli_hub";
	}////////// RecurringPayHub.do


	@RequestMapping(value = "/ProjectPayRes", method = RequestMethod.POST)
	public String payRes2(@RequestParam Map map) {
	
		int affected = payDao.projPayInsert(map);

		if (affected == 1) {
			System.out.println("프로젝트 후원[결제] DB입력완료");
		}
		return "project_pay/sample/payx/result";
		//return "support/member/Login";
	}////////////// RecurringPayRes.do
	
	//정기결제 데이터 AJAX뿌려주기
	@RequestMapping(value="/AdmBatchPayList2222.ad",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String admBatchKeyList() {
		//비지니스 로직 호출]
			Map map = new HashMap();
			map.put("start",1);
			map.put("end",10);
			List<RecPayDTO> list=payDao.projPaySelectlist(map);
			//[{},{},{},{}]형태로 반환
			
			/*JSONArray의 정적 메소드인 toJSONString(List계열 컬렉션)
			호출시에는 List계열 컬렉션에 반드시 Map계열 컬렉션이 저장되어야 한다]		
			ReplyBBSDTO를 Map으로 변경]		
			ReplyBbsDTO를 Map으로 저장해서
			List계열 컬렉션에 저장
			*/
			List<Map> collections = new Vector<Map>();
			for(RecPayDTO dto:list) {
				Map record = new HashMap();
				record.put("tno", dto.getTno());
				record.put("ordr_idxx",dto.getOrdr_idxx());
				record.put("good_mny",dto.getGood_mny());
				record.put("good_name",dto.getGood_name());
				record.put("buyr_name",dto.getBuyr_name());				
				record.put("buyr_tel1",dto.getBuyr_tel1());
				record.put("buyr_tel2",dto.getBuyr_tel2());
				record.put("buyr_mail",dto.getBuyr_mail());
				record.put("card_name",dto.getCard_name());
				record.put("app_time",dto.getApp_time());
				record.put("app_no",dto.getApp_no());
				record.put("res_cd", dto.getRes_cd());
				record.put("memberno",dto.getMemberNo());

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
