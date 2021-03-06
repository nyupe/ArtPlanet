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

import com.hansoin5.artplanet.service.PayDTO;
import com.hansoin5.artplanet.service.RecAuthDTO;
import com.hansoin5.artplanet.service.RecPayDTO;
import com.hansoin5.artplanet.service.impl.CancelDAO;
import com.hansoin5.artplanet.service.impl.MemberDAO;
import com.hansoin5.artplanet.service.impl.PayDAO;
import com.hansoin5.artplanet.service.impl.RecAuthDAO;
import com.hansoin5.artplanet.service.impl.RecPayDAO;

//(AdminController)에서는 (Admin)메뉴에서  (페이지이동)과 DB에 저장된 내용을 출력합니다.
@Controller
public class AdminController {
	// member 테이블에 접근하는 객체를 주입받습니다.
	@Resource(name = "memberDAO")
	private MemberDAO memberDao;
	
	//일반결제주입
	@Resource(name="payInfo")	
	private PayDAO dao;
	//취소 주입
	@Resource(name="cancel")
	private CancelDAO 	cancelDao;
	//정기인증+프로젝트1회성인증 주입
	@Resource(name="recAuth")	
	private RecAuthDAO recAuthDao;
	//정기결제+프로젝트1회성결제 주입
	@Resource(name = "recPay")
	private RecPayDAO recPayDao;
	
	
	//메뉴 가입회원 리스트 보여주는 페이지로 이동
	@RequestMapping("/AdmUserInfo.ad")
	public String admUser() {
		return "admin/admUserInfo";
	}//////AdmUserInfo.ad
	
	//메뉴 일반결제-취소가능
	@RequestMapping("/AdmUserPay.ad")
	public String admPay() {
		
		return "admin/admPay";
	}//////AdmUserPay.ad
	
	//메뉴 정기결제-배치키
	@RequestMapping("/AdmUserBatch.ad")
	public String admBatch() {
		return "admin/admBatchKey";
	}//////AdmUserBatch.ad
	
	//메뉴 정기결제-결제내역
	@RequestMapping("/AdmUserRecPay.ad")
	public String admReccuring() {
		return "admin/admRecurring";
	}//////AdmUserPay.ad
	
	//메뉴 프로젝트후원-배치키(일회성)
	@RequestMapping("/AdmUserProjBatch.ad")
	public String admProjBatch() {
		return "admin/admBatchKeyForProj3";
	}/// /AdmUserProjBatch.ad
	
	//메뉴 프로젝트후원-결제내역
	@RequestMapping("/AdmUserProjPay.ad")
	public String admProjPay() {
		return "admin/admProjPay";
	}///// /AdmUserRecPay.ad

	//일반결제 데이터 AJAX뿌려주기
	@RequestMapping(value="AdmUserPayList.ad",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String admPayList() {
		//cancelButtonShow
		//비지니스 로직 호출]
			Map map = new HashMap();
			map.put("start",1);
			map.put("end",10);
			
			List<PayDTO> list=dao.paySelectlist(map);
			//[{},{},{},{}]형태로 반환
			
			/*JSONArray의 정적 메소드인 toJSONString(List계열 컬렉션)
			호출시에는 List계열 컬렉션에 반드시 Map계열 컬렉션이 저장되어야 한다]		
			ReplyBBSDTO를 Map으로 변경]		
			ReplyBbsDTO를 Map으로 저장해서
			List계열 컬렉션에 저장
			*/
			List<Map> collections = new Vector<Map>();
			for(PayDTO dto:list) {
				Map record = new HashMap();
				record.put("tno", dto.getTno());
				record.put("ordr_idxx",dto.getOrdr_idxx());
				record.put("amount",dto.getAmount());
				record.put("good_name",dto.getGood_name());
				record.put("buyr_name",dto.getBuyr_name());				
				record.put("buyr_tel1",dto.getBuyr_tel1());
				record.put("buyr_tel2",dto.getBuyr_tel2());
				record.put("buyr_mail",dto.getBuyr_mail() == null ? "-" : dto.getBuyr_mail());
				record.put("card_name",dto.getCard_name());
				record.put("app_time",dto.getApp_time());
				record.put("app_no",dto.getApp_no());
				record.put("memberNo",dto.getMemberNo());
				//취소테이블에서 해당레코드 확인용 구분자 리턴 0 아니면 1
				record.put("isCanceled",cancelDao.cancelButtonShowCount(dto.getTno()));
				
				
				collections.add(record);
			}
			/*
			Map map2 = new HashMap();
			map2.put("payCounter", dao.payCount());
			
			collections.add(map2);
			*/
			/*
			 * ※아래 형태로 반환됨
			 * [{"app_time":"20191106220723","memberno":5,"amount":30000,"tno":"19940928719018","card_name":"롯데카드","buyr_name":"아트플래닛","app_no":"18849194","ordr_idxx":"TEST201911061573045462216","good_name":"강좌결제테스트상품 ","buyr_tel2":"010-0000-0000","buyr_tel1":"02-0000-0000","buyr_mail":"rlawq@naver.com"},{"app_time":"20191106230620","memberno":8,"amount":30000,"tno":"19940928719407","card_name":"롯데카드","buyr_name":"아트플래닛","app_no":"86503020","ordr_idxx":"TEST201911061573049030968","good_name":"강좌결제테스트상품 ","buyr_tel2":"010-0000-0000","buyr_tel1":"02-0000-0000","buyr_mail":"abc@seungchan.kr"}]
[{"app_time":"20191106220723","memberno":5,"amount":30000,"tno":"19940928719018","card_name":"롯데카드","buyr_name":"아트플래닛","app_no":"18849194","ordr_idxx":"TEST201911061573045462216","good_name":"강좌결제테스트상품 ","buyr_tel2":"010-0000-0000","buyr_tel1":"02-0000-0000","buyr_mail":"rlawq@naver.com"},{"app_time":"20191106230620","memberno":8,"amount":30000,"tno":"19940928719407","card_name":"롯데카드","buyr_name":"아트플래닛","app_no":"86503020","ordr_idxx":"TEST201911061573049030968","good_name":"강좌결제테스트상품 ","buyr_tel2":"010-0000-0000","buyr_tel1":"02-0000-0000","buyr_mail":"abc@seungchan.kr"}]
			 */	
			System.out.println(JSONArray.toJSONString(collections));
			//model.addAttribute("cancelButtonShow",cancelDao.cancelButtonShowCount());
			return JSONArray.toJSONString(collections);
		}////////////////////AdmUserPayList.ad
	
		//정기결제 배치키 데이터 AJAX뿌려주기
		@RequestMapping(value="AdmBatchKeyList.ad",produces = "text/html; charset=UTF-8")
		@ResponseBody
		public String admBatchKeyList() {
			System.out.println("1");
			//비지니스 로직 호출]
				Map map = new HashMap();
				map.put("start",1);
				map.put("end",10);
				List<RecAuthDTO> list=recAuthDao.recAuthSelectlist(map);
				//[{},{},{},{}]형태로 반환
				
				/*JSONArray의 정적 메소드인 toJSONString(List계열 컬렉션)
				호출시에는 List계열 컬렉션에 반드시 Map계열 컬렉션이 저장되어야 한다]		
				ReplyBBSDTO를 Map으로 변경]		
				ReplyBbsDTO를 Map으로 저장해서
				List계열 컬렉션에 저장
				*/
				List<Map> collections = new Vector<Map>();
				for(RecAuthDTO dto:list) {
					System.out.println("2");
					Map record = new HashMap();
					record.put("ordr_idxx",dto.getOrdr_idxx());
					record.put("res_cd",dto.getRes_cd());
					record.put("batch_key",dto.getBatch_key()==null? "인증실패" :dto.getBatch_key());
					record.put("card_cd",dto.getCard_cd()==null? "인증실패" :dto.getCard_cd());					
					record.put("buyr_name",dto.getBuyr_name());					
					record.put("memberNo",dto.getMemberNo());
					//app_time추가
					record.put("app_time",dto.getApp_time()==null?" 미결제":"\""+dto.getApp_time()+"\"");
					//관리자에서 아이디 출력용
					record.put("id", memberDao.getMemberId(dto.getMemberNo()));
					record.put("blogFee",dto.getBlogFee());
					collections.add(record);
					
				}
				/*
				 * ※아래 형태로 반환됨
				 * [{"name":"가길동","postDate":"2019-09-20","title":"1111111111111111"},{"name":"가길동","postDate":"2019-09-17","title":"sgfsdgdfd"},{"name":"가길동","postDate":"2019-09-17","title":"2222222"},{"name":"가길동","postDate":"2019-09-17","title":"4444"},{"name":"가길동","postDate":"2019-09-17","title":"11111111111"},{"name":"이길동","postDate":"2019-09-11","title":"이가 원본글"},{"name":"가길동","postDate":"2019-09-11","title":"1111111111"},{"name":"가길동","postDate":"2019-09-11","title":"저도 답글 달아요1"},{"name":"이길동","postDate":"2019-09-11","title":"조언 감사합니다"},{"name":"이길동","postDate":"2019-09-11","title":"내가 다시 답글"}]
				 * 
				 * 
				 */	
				System.out.println("3");
				System.out.println(JSONArray.toJSONString(collections));
				return JSONArray.toJSONString(collections);
			}////////////////////AdmUserPayList.ad
	
		//정기결제 배치키 데이터에서 결제된건 app_time  AJAX뿌려주기   안씀
		@RequestMapping(value="AdmAppTimeList.ad",produces = "text/html; charset=UTF-8")
		@ResponseBody
		public String admAppTimeList() {
			Map map = new HashMap();
			map.put("start",1);
			map.put("end",10);
			List<RecAuthDTO> list=recAuthDao.recAuthSelectlist(map);
			List<Map> collections = new Vector<Map>();
			for(RecAuthDTO dto:list) {
				Map record = new HashMap();
				record.put("app_time",dto.getApp_time()==null?"이번달미결제":"\""+dto.getApp_time()+"\"");
				collections.add(record);
				//캐시아님
				System.out.println("캐시아님");
			}
			System.out.println(JSONArray.toJSONString(collections));		
			return JSONArray.toJSONString(collections);
		}
		
		
		//정기결제 /AdmBatchPayList.ad 나중에 Recurring Controller에서 여기로 옮길것(완료하였음)
		//정기결제 데이터 AJAX뿌려주기
		@RequestMapping(value="/AdmBatchPayList.ad",produces = "text/html; charset=UTF-8")
		@ResponseBody
		public String admBatchPayList() {
			//비지니스 로직 호출]
				Map map = new HashMap();
				map.put("start",1);
				map.put("end",10);
				List<RecPayDTO> list=recPayDao.recPaySelectlist(map);
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
					record.put("tno", dto.getTno()==null? "결제실패" : dto.getTno());
					record.put("ordr_idxx",dto.getOrdr_idxx());
					record.put("good_mny",dto.getGood_mny());
					record.put("good_name",dto.getGood_name());
					record.put("buyr_name",dto.getBuyr_name());				
					record.put("buyr_tel1",dto.getBuyr_tel1());
					record.put("buyr_tel2",dto.getBuyr_tel2());
					record.put("buyr_mail",dto.getBuyr_mail());
					record.put("card_name",dto.getCard_name()==null?"결제실패":dto.getCard_name());
					record.put("app_time",dto.getApp_time()==null?"결제실패":dto.getApp_time());
					record.put("app_no",dto.getApp_no()==null? "결제실패":dto.getApp_no());
					record.put("res_cd", dto.getRes_cd());
					record.put("memberNo",dto.getMemberNo());

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
			}//////////////////// /AdmBatchPayList.ad
		
		
		//프로젝트 배치키(일회성) 데이터 AJAX뿌려주기
		@RequestMapping(value="/AdmBatchKeyForProjList.ad",produces = "text/html; charset=UTF-8")
		@ResponseBody
		public String admBatchKeyForProjList() {
			//비지니스 로직 호출]
				List<Map> collections = new Vector<Map>();
				List<RecAuthDTO> list = null;
				int projCount = recAuthDao.projGetCount();
				System.out.println("프로젝트의 레코드수 반환: "+projCount);
				Map map = new HashMap();
				for(int i=1; i<=projCount; i++ ) {
					map.put("projGetCount", i);
				
				list=recAuthDao.projAuthSelectlist(map);
					if(list.size() != 0)
					{
						for(RecAuthDTO dto:list)
						{
							Map recMap = new HashMap();
							recMap.put("ordr_idxx",dto.getOrdr_idxx());
							recMap.put("res_cd",dto.getRes_cd());
							recMap.put("batch_key",dto.getBatch_key()==null? "인증실패" :dto.getBatch_key());
							recMap.put("card_cd",dto.getCard_cd()==null? "인증실패" :dto.getCard_cd());					
							recMap.put("buyr_name",dto.getBuyr_name());					
							recMap.put("memberNo",dto.getMemberNo());
							//app_time추가
							recMap.put("app_time",dto.getApp_time()==null?" 프로젝트 미결제":"\""+dto.getApp_time()+"\"");
							//관리자에서 아이디 출력용
							recMap.put("id", memberDao.getMemberId(dto.getMemberNo()));
							//프로젝트서포트넘버+ 프로제트서포트섬+ 프로젝트넘버 추가 11/25
							recMap.put("projectSupportNo", dto.getProjectSupportNo());
							recMap.put("projectSupportSum", dto.getProjectSupportSum());
							recMap.put("projectNo", dto.getProjectNo());
							
							collections.add(recMap);
						}
					}
				}
				/*
				for(RecAuthDTO dto:list) {
					List<Map> recList = new Vector<Map>();
					System.out.println("카운트");
					System.out.println(dto.getProjectSupportNo());
					Map record = new HashMap();
					record.put("ordr_idxx",dto.getOrdr_idxx());
					record.put("res_cd",dto.getRes_cd());
					record.put("batch_key",dto.getBatch_key()==null? "인증실패" :dto.getBatch_key());
					record.put("card_cd",dto.getCard_cd()==null? "인증실패" :dto.getCard_cd());					
					record.put("buyr_name",dto.getBuyr_name());					
					record.put("memberNo",dto.getMemberNo());
					//app_time추가
					record.put("app_time",dto.getApp_time()==null?" 프로젝트 미결제":"\""+dto.getApp_time()+"\"");
					//관리자에서 아이디 출력용
					record.put("id", memberDao.getMemberId(dto.getMemberNo()));
					//프로젝트서포트넘버+ 프로제트서포트섬+ 프로젝트넘버 추가 11/25
					record.put("projectSupportNo", dto.getProjectSupportNo());
					record.put("projectSupportSum", dto.getProjectSupportSum());
					record.put("projectNo", dto.getProjectNo());
					
					collections.add(record);
				}
				*/
				/*
				 * ※아래 형태로 반환됨
				 * [{"name":"가길동","postDate":"2019-09-20","title":"1111111111111111"},{"name":"가길동","postDate":"2019-09-17","title":"sgfsdgdfd"},{"name":"가길동","postDate":"2019-09-17","title":"2222222"},{"name":"가길동","postDate":"2019-09-17","title":"4444"},{"name":"가길동","postDate":"2019-09-17","title":"11111111111"},{"name":"이길동","postDate":"2019-09-11","title":"이가 원본글"},{"name":"가길동","postDate":"2019-09-11","title":"1111111111"},{"name":"가길동","postDate":"2019-09-11","title":"저도 답글 달아요1"},{"name":"이길동","postDate":"2019-09-11","title":"조언 감사합니다"},{"name":"이길동","postDate":"2019-09-11","title":"내가 다시 답글"}]
				 * 
				 * 
				 */	
				System.out.println(JSONArray.toJSONString(collections));
				
				return JSONArray.toJSONString(collections);
			}////////////////////AdmUserPayList.ad
	
		//프로젝트 결제(1회성) 데이터 AJAX뿌려주기
		@RequestMapping(value="/AdmBatchPayForProjList.ad",produces = "text/html; charset=UTF-8")
		@ResponseBody
		public String admProjPayList() {
			//비지니스 로직 호출]
			Map map = new HashMap();
			map.put("start",1);
			map.put("end",10);
			List<RecPayDTO> list=recPayDao.projPaySelectlist(map);
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
				record.put("tno", dto.getTno()==null? "결제실패" :dto.getTno());
				record.put("ordr_idxx",dto.getOrdr_idxx());
				record.put("good_mny",dto.getGood_mny());
				record.put("good_name",dto.getGood_name());
				record.put("buyr_name",dto.getBuyr_name());		
				record.put("buyr_tel1",dto.getBuyr_tel1());
				record.put("buyr_tel2",dto.getBuyr_tel2());
				record.put("buyr_mail",dto.getBuyr_mail());
				record.put("card_name",dto.getCard_name()==null? "결제실패" :dto.getCard_name());
				record.put("app_time",dto.getApp_time()==null? "결제실패" :dto.getApp_time());
				record.put("app_no",dto.getApp_no()==null? "결제실패" :dto.getApp_no());
				record.put("res_cd", dto.getRes_cd());
				record.put("memberNo",dto.getMemberNo());

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
		
		
		 @RequestMapping("/AdmNotice.ad")
	      public String admNotice() {
	         
	         return "admin/admNotice";
	      }//////AdmNotice.ad
	      
	      @RequestMapping("/AdmPushToPhone")
	      public String admPushToPhone() {
	         System.out.println("컨트롤러 진입");
	         return "admin/admPushToPhone";
	      }//////AdmNotice.ad
}
