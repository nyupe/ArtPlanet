package com.hansoin5.artplanet.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hansoin5.artplanet.service.RecPayDTO;
import com.hansoin5.artplanet.service.impl.MemberDAO;
import com.hansoin5.artplanet.service.impl.ProjectDAO;
import com.hansoin5.artplanet.service.impl.RecAuthDAO;
import com.hansoin5.artplanet.service.impl.RecPayDAO;

@Controller
public class ProjectPayController {

	// member 테이블에 접근하는 객체를 주입받습니다.
	@Resource(name = "memberDAO")
	private MemberDAO memberDao;
	@Resource(name="projectDAO")
	private ProjectDAO projectDao;

	@Resource(name = "recAuth")
	private RecAuthDAO authDao;
	@Resource(name = "recPay")
	private RecPayDAO payDao;

	// 인증
	@RequestMapping("/ProjectAuthReq.do")
	public String authReq(@RequestParam Map map,Model model) {
		System.out.println("ProjectAuthReq 컨트롤시작");
		
		//프로젝트에서 후원 할 때 후원액 , 삭제 
		String projectSupportSum = map.get("projectSupportSum").toString().replace(",", "");
		map.put("projectSupportSum", projectSupportSum);
		//프로젝트에서 후원할 때 id로 memberNo 가져오기
		String memberNo = memberDao.getMemberNo(map.get("id").toString());
		map.put("memberNo", memberNo);
		
		//영역에 저장 총액,멤버번호,프로젝트번호
		model.addAttribute("projectSupportSum",map.get("projectSupportSum"));
		model.addAttribute("memberNo",map.get("memberNo"));
		model.addAttribute("projectNo",map.get("projectNo"));
		System.out.println(map.get("projectNo"));
		System.out.println("ProjectAuthReq 컨트롤 끝");
		
		return "project_pay/sample/auth/Requestkey.tiles";
	}////////////// RecurringAuthReq.do

	@RequestMapping("/ProjectAuthHub.do")
	public String authHub(@RequestParam Map map,Model model) {
		System.out.println("/ProjectAuthHub 요청으로 들어온 컨트롤러 메소드 입니다");
		System.out.println("스프링 시큐리티를 적용하여 아이디를 히든으로 넘겼습니다 :" + map.get("id").toString());
		String memberNo = memberDao.getMemberNo(map.get("id").toString());
		System.out.println("아이디로 멤버테이블에서 조회한 회원번호입니다:" + memberNo);
		System.out.println(map.get("memberNo"));
		model.addAttribute("projectSupportSum",map.get("projectSupportSum"));
		model.addAttribute("memberNo",map.get("memberNo"));
		model.addAttribute("projectNo",map.get("projectNo"));
		
		return "project_pay/sample/auth/pp_cli_hub";
	}////////////// RecurringAuthHub.do

	// DB저장
	@RequestMapping("/ProjectAuthRes.do")
	public String authRes(@RequestParam Map map) {
		System.out.println("ProjectAuthRes 컨트롤 시작");
		System.out.println(map.get("projectNo"));
		System.out.println(map.get("batch_key"));
		map.put("memberNo", memberDao.getMemberNo(map.get("id").toString()));
		map.put("app_time", "");
		
		//프로젝트 서포트 넘버 반환
		projectDao.insertsupport(map);
		
		int affected = authDao.projAuthInsert(map);
		if (affected == 1) {
			System.out.println("프로젝트 후원[인증] DB입력완료");
		}
		
			
		System.out.println("ProjectAuthRes 컨트롤 끝");

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
		System.out.println("프로젝트 멤버노? "+memberDao.getMemberNo(map.get("id").toString()));
		map.put("memberNo", memberDao.getMemberNo(map.get("id").toString()));
		//아이디 넘기기
		map.put("id",map.get("id").toString());
		System.out.println("id : "+map.get("id").toString());
		
		int affected = payDao.projPayInsert(map);

		if (affected == 1) {
			System.out.println("프로젝트 후원[결제] DB입력완료");
			//결제시간을 인증테이블 app_time컬럼에 업데이트합니다
			System.out.println("paied_batch:"+map.get("paied_batch"));
			SimpleDateFormat format = new SimpleDateFormat("YY/MM/dd");
			String time = format.format(new Date(System.currentTimeMillis()));
			System.out.println("★☆★☆★☆"+time+"★☆★☆★☆");
			map.put("currentTime", time);
			int updated =authDao.updateApptimeForProj(map);
			if (updated == 1)
				System.out.println("○○○○○○배치키로 [앱타임] 갱신완료○○○○○○");
				//정상적으로 앱타임이 수정된경우 해당 레코드를 삭제하여 배치키 정보도 같이 삭제합니다
				authDao.projAuthDelete(map);
		}
		
		
		return "admin/admBatchKeyForProj2";
		// return "support/member/Login";
	}////////////// RecurringPayRes.do

	
	
	
	
	/*
	 * //정기결제 데이터 AJAX뿌려주기
	 * 
	 * @RequestMapping(value="/AdmBatchPayList2222.ad",produces =
	 * "text/html; charset=UTF-8")
	 * 
	 * @ResponseBody public String admBatchKeyList() { //비지니스 로직 호출] Map map = new
	 * HashMap(); map.put("start",1); map.put("end",10); List<RecPayDTO>
	 * list=payDao.projPaySelectlist(map); //[{},{},{},{}]형태로 반환
	 * 
	 * JSONArray의 정적 메소드인 toJSONString(List계열 컬렉션) 호출시에는 List계열 컬렉션에 반드시 Map계열 컬렉션이
	 * 저장되어야 한다] ReplyBBSDTO를 Map으로 변경] ReplyBbsDTO를 Map으로 저장해서 List계열 컬렉션에 저장
	 * 
	 * List<Map> collections = new Vector<Map>(); for(RecPayDTO dto:list) { Map
	 * record = new HashMap(); record.put("tno", dto.getTno());
	 * record.put("ordr_idxx",dto.getOrdr_idxx());
	 * record.put("good_mny",dto.getGood_mny());
	 * record.put("good_name",dto.getGood_name());
	 * record.put("buyr_name",dto.getBuyr_name());
	 * record.put("buyr_tel1",dto.getBuyr_tel1());
	 * record.put("buyr_tel2",dto.getBuyr_tel2());
	 * record.put("buyr_mail",dto.getBuyr_mail());
	 * record.put("card_name",dto.getCard_name());
	 * record.put("app_time",dto.getApp_time());
	 * record.put("app_no",dto.getApp_no()); record.put("res_cd", dto.getRes_cd());
	 * record.put("memberno",dto.getMemberNo());
	 * 
	 * collections.add(record); }
	 * 
	 * ※아래 형태로 반환됨
	 * [{"name":"가길동","postDate":"2019-09-20","title":"1111111111111111"},{"name":
	 * "가길동","postDate":"2019-09-17","title":"sgfsdgdfd"},{"name":"가길동","postDate":
	 * "2019-09-17","title":"2222222"},{"name":"가길동","postDate":"2019-09-17","title"
	 * :"4444"},{"name":"가길동","postDate":"2019-09-17","title":"11111111111"},{"name"
	 * :"이길동","postDate":"2019-09-11","title":"이가 원본글"},{"name":"가길동","postDate":
	 * "2019-09-11","title":"1111111111"},{"name":"가길동","postDate":"2019-09-11",
	 * "title":"저도 답글 달아요1"},{"name":"이길동","postDate":"2019-09-11",
	 * "title":"조언 감사합니다"},{"name":"이길동","postDate":"2019-09-11","title":"내가 다시 답글"
	 * }]
	 * 
	 * 
	 * 
	 * System.out.println(JSONArray.toJSONString(collections));
	 * 
	 * return JSONArray.toJSONString(collections);
	 * }////////////////////AdmUserPayList.ad
	 */}
