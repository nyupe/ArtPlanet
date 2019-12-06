package com.hansoin5.artplanet.web;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hansoin5.artplanet.service.MemberDTO;
import com.hansoin5.artplanet.service.impl.AndroidDAO;


@CrossOrigin
@Controller
public class AndroidController {

	@Resource(name = "androidDAO")
	private AndroidDAO androidDao;

	// GCS 테이블에 접근하여 모든 이미지 URL을 JSON 형태로 반환하는 메소드
	@ResponseBody
	@RequestMapping(value = "/AndroidArrayList", produces = "text/html; charset=UTF-8")
	public String getGCSList(@RequestParam Map map) {
		System.out.println("안드로이드 컨트롤 시작");
		// 서비스호출
		List<Map> list = androidDao.selectPictures();
		System.out.println(JSONArray.toJSONString(list).replace("\\/", "/"));
		System.out.println("안드로이드 컨트롤 끝");
		return JSONArray.toJSONString(list).replace("\\/", "/");
	}
	

	// android top위치
	@RequestMapping("/Ajax") /// ArtPlanet/src/main/webapp/WEB-INF/views/admin/android
	public String ajax() {
		return "support/member/Ajax";
	}///
	
	// [JSON으로 응답할때]
	@RequestMapping(value = "/ANDROID/AndIsMember.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String ajaxJson(@RequestParam Map map) {
		System.out.println("로그인요청 받는 메소드 진입");
		// 1]비지니스 로직 호출
		// boolean isLogin=memberDao.login(map); //dao에서 memberDao로 치환
		boolean isLogin = androidDao.mobilelogin(map); // dao에서 memberDao로 치환
		// JSON데이타 타입으로 반환하기위해 JSONObject객체 생성
		JSONObject json = new JSONObject();
		// JSON객체의 put("키값","값")메소드로 저장하면
		// {"키값":"값"} JSON형태의 데이타로 저장됨.
		json.put("isLogin", isLogin ? "Y" : "N");
		System.out.println("json.toString():" + json.toString());
		System.out.println("json.toJSONString():" + json.toJSONString());
		return json.toJSONString();
	}///////////////////////
	
	@RequestMapping("/AdmRegisterToken")
	public String RegisterToken(@RequestParam Map map) throws UnsupportedEncodingException, SQLException {
		System.out.println("token: "+map.get("token"));
			if(!map.isEmpty())
			{
				boolean isToken = androidDao.mobileinsert(map); // dao에서 memberDao로 치환
				
				JSONObject json = new JSONObject();
				// JSON객체의 put("키값","값")메소드로 저장하면
				// {"키값":"값"} JSON형태의 데이타로 저장됨.
				//System.out.println("isToken"+isToken);
				json.put("isToken", isToken ? "Y" : "N");
				//json.put("isToken", "Y");
				System.out.println("json.toString():" + json.toString());
				System.out.println("json.toJSONString():" + json.toJSONString());
			}

		return "/admin/admRegisterToken";
	}///
	
	@RequestMapping(value = "/ANDROID/RegisterJson.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String RegisterJson(@RequestParam Map map) throws UnsupportedEncodingException, SQLException {
		System.out.println("들어왔나??");
		System.out.println("token"+map.get("token"));
	    boolean isToken = androidDao.mobileinsert(map); // dao에서 memberDao로 치환
		JSONObject json = new JSONObject();
		// JSON객체의 put("키값","값")메소드로 저장하면
		// {"키값":"값"} JSON형태의 데이타로 저장됨.
		//System.out.println("isToken"+isToken);
		json.put("isToken", isToken ? "Y" : "N");
		//json.put("isToken", "Y");
		System.out.println("json.toString():" + json.toString());
		System.out.println("json.toJSONString():" + json.toJSONString());
		
		return json.toJSONString();
	}///////////////////////
	
	// 아이디로 회원정보 조회
	   @RequestMapping(value = "/ANDROID/GetMeberInfo.do", produces = "text/html; charset=UTF-8")
	   @ResponseBody
	   public String getMemberInfo(@RequestParam Map map) {

	      System.out.println("id: " + map.get("id"));

	      MemberDTO list = androidDao.mobileselect(map);

	      if (list.equals(null)) {
	         System.out.println("조회한 값이 없어요");
	         return "";
	      }
	      JSONObject json = new JSONObject();
	      json.put("id", map.get("id"));
	      json.put("nickname", list.getNickName());
	      json.put("PHONENUMBER", list.getPhoneNumber());
	      json.put("ADDRESS", list.getAddress());
	      json.put("MEMBERSHIPDATE", list.getMembershipDate());
	      json.put("BIRTH", list.getBirth());
	      json.put("PROFILEPICTURE", list.getProfilePicture());

	      System.out.println("json.toJSONString : " + json.toJSONString());

	      return json.toJSONString();

	   }///// getMemberInfo()

	
}
