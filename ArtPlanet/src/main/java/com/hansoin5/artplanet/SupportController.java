package com.hansoin5.artplanet;

import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hansoin5.artplanet.service.impl.AuthorityDAO;
import com.hansoin5.artplanet.service.impl.MemberDAO;


//@Controller 어노테이션 : 클래스를 컨트롤러로 만들어줍니다.
@Controller
public class SupportController {
	
	//DAO 주입	
	@Resource(name="memberDAO")
	private MemberDAO memberDao;
	
	@Resource(name="authorityDAO")
	private AuthorityDAO authorityDao;
	
	
	// 아이디를 받아 회원번호를 반환하는 
	@RequestMapping("/GetMemberNo")	
	public String getMemberNo(@RequestParam String id) {
		return memberDao.getMemberNo(id);
	}/////getMemberNo()
	
	// 아이디로 회원정보 조회
	@ResponseBody
	@RequestMapping(value = "/GetMeberInfo", produces = "text/html; charset=UTF-8")
	public String getMemberInfo(@RequestParam Map map) {
		
		JSONObject json = new JSONObject();
		json.put("user_id", memberDao.getMemberDTO(map).getId());
		json.put("user_name",memberDao.getMemberDTO(map).getName());
		json.put("user_nickName", memberDao.getMemberDTO(map).getNickName());
		json.put("user_phoneNumber", memberDao.getMemberDTO(map).getPhoneNumber());
		json.put("user_address", memberDao.getMemberDTO(map).getAddress());
		int start = memberDao.getMemberDTO(map).getProfilePicture().lastIndexOf("\\");
		json.put("user_profilePicture", memberDao.getMemberDTO(map).getProfilePicture().substring(start+1));
		System.out.println(json.toJSONString(map));
		return json.toJSONString();
		//return memberDao.getMemberDTO(map);
	}/////getMemberInfo()
	
	
	// 로그인 완료 했다면 예술가 검색 페이지로 이동
	@RequestMapping("/LoginComplete")
	public String loginComplete()
	{
		return "contents/SearchArtist.tiles";
	}/////loginComplete()
	
	
	// Top메뉴의 contact 누를시 문의하기 페이지로 이동
	@RequestMapping("/Others")
	public String others()
	{
		return "support/report/Report.tiles";
	}/////others()
	
	
	
	
	// 아이디 중복 처리 
	@RequestMapping(value="/Validation")
	@ResponseBody
	public boolean validation(@RequestParam Map map) {
		return memberDao.isDuplicated(map);
	}/////validation
	
	// 닉네임 중복 처리
	@RequestMapping(value = "/ValidationNickName")
	@ResponseBody
	public boolean validationNickName(@RequestParam Map map) {
		return memberDao.nickNameisDuplicated(map);
	}/////ValidationNickName
	
	
	
	
	
	//비밀번호 찾기 요청 
	@RequestMapping("/ForgotPassword")
	public String forgotPassword(){
		return "support/member/ForgotPassword";
	}
	
	//회원탈퇴 요청
	@RequestMapping("/LeaveArtPlanet")
	public String leaveArtplanet(){
		return "support/member/LeaveArtPlanet";
	}
	
	
	
	
}/////class
