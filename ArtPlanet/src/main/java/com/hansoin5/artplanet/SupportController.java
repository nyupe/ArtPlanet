package com.hansoin5.artplanet;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hansoin5.artplanet.validation.RegisterFormCommand;


//@Controller 어노테이션 : 클래스를 컨트롤러로 만들어줍니다.
@Controller
public class SupportController {
	
	//서비스(ArtPlanetMemberService)클래스를 주입받습니다. 
	@Resource(name="artPlanetMemberService")
	private com.hansoin5.artplanet.service.ArtPlanetMemberService artPlanetMemberService;
	
	
	@RequestMapping("/LoginComplete")
	public String loginComplete()
	{
		return "contents/SearchArtist.tiles";
	}
	
	@RequestMapping("/Others")
	public String others()
	{
		return "support/report/Report.tiles";
	}
	
	@RequestMapping("/Login")
	public String login()
	{
		return "support/login/MyPage.tiles";
	}
	
	//회원가입 폼 유효성 처리 - 아이디 중복, 닉네임 중복,  
	@RequestMapping(value="/Validation")
	@ResponseBody
	public boolean validation(@RequestParam Map map) {
		return artPlanetMemberService.isDuplicated(map);
	}/////validation
	
	
	
	
	//회원가입 페이지으로 이동
	@RequestMapping(value = "/Register" , method=RequestMethod.GET)
	public String register(@RequestParam Map map)
	{	
		return "support/login/Register";
	}
	
	//회원가입 페이지에서 입력값 받아 실질적 회원가입 처리
	@RequestMapping(value = "/Register" , method=RequestMethod.POST)
	public String registerOk(@RequestParam Map map, HttpServletRequest req, RegisterFormCommand cmd)
	{	
		
		
		
		//회원가입하는데에 인증절차가 필요없다고 가정
		//서비스 호출(회원가입 처리 : 테이블에 레코드 삽입) 
		//입력한 데이터는 모두 map에 저장되어있으며 키값은  input태그의 name속성값
		/* req.setAttribute("SUC", "SUC"); */
		//artPlanetMemberService.insert(map);// 회원정보 입력 서비스 호출
		//뷰정보반환]-회원가입 완료페이지로 이동
		return "forward:/WEB-INF/views/support/login/Welcome.jsp";
		/* support/login/MemberInfo */
	}
	
	
	@RequestMapping("/ForgotPassword")
	public String forgotPassword()
	{
		return "support/login/ForgotPassword";
	}
	
	@RequestMapping("/LeaveArtPlanet")
	public String leaveArtplanet()
	{
		return "support/login/LeaveArtPlanet";
	}
	
}///// SupportController class
