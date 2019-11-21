package com.hansoin5.artplanet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hansoin5.artplanet.service.MonthTotDTO;
import com.hansoin5.artplanet.service.RecPayDTO;
import com.hansoin5.artplanet.service.impl.AuthorityDAO;
import com.hansoin5.artplanet.service.impl.MemberDAO;


//@Controller 어노테이션 : 클래스를 컨트롤러로 만들어줍니다.
@Controller
public class SupportController {
	
	//MEMBER 테이블 접근 객체 주입
	@Resource(name="memberDAO")
	private MemberDAO memberDao;
	// AUTH_SECURITY 테이블에 접근하는 객체주입
	@Resource(name="authorityDAO")
	private AuthorityDAO authorityDao;
	
	//회원 chartJS용
	@RequestMapping(value="/getMemberTotal",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getMemberTotal() {
		List<MonthTotDTO> list=memberDao.getMemberTotal();
		System.out.println("찍혀라");
		List<Map> collections = new Vector<Map>();
		for(MonthTotDTO dto :list) {
			Map record = new HashMap();
			System.out.println(dto.getMonth());
			record.put("month", dto.getMonth());
			System.out.println(dto.getTot());
			record.put("tot", dto.getTot());
			
			collections.add(record);
		}
		return JSONArray.toJSONString(collections);
	}/////
	//회원 chartJS용
		@RequestMapping(value="/getAccumulated",produces = "text/html; charset=UTF-8")
		@ResponseBody
		public String getAccumulated() {
			List<MonthTotDTO> list=memberDao.getAccumulated();
			System.out.println("찍혀라");
			List<Map> collections = new Vector<Map>();
			for(MonthTotDTO dto :list) {
				Map record = new HashMap();
				System.out.println(dto.getMonth());
				record.put("month", dto.getMonth());
				System.out.println(dto.getTot());
				record.put("tot", dto.getTot());
				
				collections.add(record);
			}
			return JSONArray.toJSONString(collections);
		}/////
	
	
	// 회원 테이블 모든 레코드 반환
	@RequestMapping(value = "/getMemberList", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getMemberList(@RequestParam Map map){
		
		List<Map> memberList = memberDao.getMembers(map);
		
		//날짜값을 문자열로 변경해야한다 그렇지 않으면 JSON형식에 맞지 않는다
		//날짜를 2018-09-02 10:15:38.0에서 "2018-09-12"형태로 변경
		for(Map member:memberList) {
			//여기서 키값은 실제 테이블의 컬럼명과 정확히 일치해야함 MEMBER 테이블의 MEMBERSHIPDATE(회원가입일)컬럼
			//아래의 코드는 하나의 멤버 요소를 꺼내서 날짜 문자열 인덱스 0번부터 10번인덱스까지 추출하여 덮어씌움
			member.put("MEMBERSHIPDATE",member.get("MEMBERSHIPDATE").toString().substring(0, 10));
		}
		//반환값이 String(JSON객체배열(JSONArray)을 문자열로 변환)
		return JSONArray.toJSONString(memberList);
	}/////getMembers()
	
	
	
	
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
		json.put("user_birth",memberDao.getMemberDTO(map).getBirth());
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
	}/////validation()
	
	// 닉네임 중복 처리
	@RequestMapping(value = "/ValidationNickName")
	@ResponseBody
	public boolean validationNickName(@RequestParam Map map) {
		return memberDao.nickNameisDuplicated(map);
	}/////ValidationNickName()
	
	// 닉네임 수정
	@RequestMapping(value="/UpdateNickName", method = RequestMethod.POST)
	public String updateNickname(@RequestParam Map map) {
		//닉네임 수정 서비스 호출 
		memberDao.updateNickName(map);
		//마이페이지로 돌아가기
		return "support/member/MyPage.tiles";
	}/////
	
	
	//회원탈퇴
	@RequestMapping("/DeleteMember")
	public String deleteMember(@RequestParam Map map){
		
		//회원탈퇴 서비스 호출
		memberDao.deleteMember(map);
		
		//탈퇴 후 사진들 뿌려주는 게시판으로 
		return "contents/SearchArtwork.tiles";
	}/////deleteMember()
	
	
	//비밀번호 찾기 요청 
	@RequestMapping("/ForgotPassword")
	public String forgotPassword(){
		return "support/member/ForgotPassword";
	}
	
	
	
	
	
}/////class
