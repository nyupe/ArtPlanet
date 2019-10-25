package com.hansoin5.artplanet;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//아이디 중복처리를 위한 변수
	private boolean isDuplicated=true;
	
	
	@RequestMapping("/Others")
	public String others()
	{
		return "support/report/Report.tiles";
	}
	
	@RequestMapping("/Login")
	public String login()
	{
		return "support/login/Login";
	}
	
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
		if(!validate(cmd, req)) {//유효성 검증 실패시 
			//뷰정보반환]-다시 입력폼으로 이동
			return "forward:/WEB-INF/views/support/login/Register.jsp";
		}
		//회원가입하는데에 인증절차가 필요없다고 가정
		//서비스 호출(회원가입 처리 : 테이블에 레코드 삽입) 
		//입력한 데이터는 모두 map에 저장되어있으며 키값은  input태그의 name속성값
		/* req.setAttribute("SUC", "SUC"); */
		artPlanetMemberService.insert(map);// 회원정보 입력 서비스 호출
		//뷰정보반환]-회원가입 완료페이지로 이동
		return "forward:/WEB-INF/views/support/login/Welcome.jsp";
		/* support/login/MemberInfo */
	}
	
	//회원 아이디 중복 판별
	@ResponseBody
	@RequestMapping(value ="/IdDuplication", produces = "text/html; charset=UTF-8")
	public String idDuplication(@RequestParam Map map, HttpServletRequest req, Model model )
	{	
		if(artPlanetMemberService.isDuplicated(map)) { // 중복검사 버튼 눌렀을때 검색된 회원이 없다면
			//model.addAttribute("SUC", "SUC");
			isDuplicated = false; // 중복되지 않았다.
		}		
		return isDuplicated==false?"Y":"N"; // 원래는 뷰 반환해야하는 패턴이지만 ajax의 요청을 처리하는 메소드이므로 @ResponseBody 어노테이션 덕분에 값을 넘길 수있다. 
	}/////idDuplication()
	
	
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
	
	
	//내가 만든 유효성 검증용 메소드]
	private boolean validate(RegisterFormCommand cmd,HttpServletRequest req) {
		if (cmd.getId().trim().equals("")) {
			req.setAttribute("idError", "아이디를 입력하세요");
			return false;
		}
		
		if (cmd.getIdDuplicationFlag().trim().equals("noChecked")
				|| cmd.getIdDuplicationFlag().trim().equals("FAIL")) {
			req.setAttribute("idDuplicationError", "아이디를 중복체크하세요");
			return false;
		}
		else {
			 req.setAttribute("SUC", "SUC");
		}
		 
		if(cmd.getName().trim().equals("")) {			
			req.setAttribute("nameError", "이름을 입력하세요");
			return false;
		}
		if (cmd.getPassword().trim().equals("")) {
			req.setAttribute("passwordError", "비밀번호을 입력하세요");
			return false;
		}
		if (cmd.getPasswordConfirm().trim().equals("")
				|| !cmd.getPassword().trim().equals(cmd.getPasswordConfirm().trim())) {
			req.setAttribute("passwordConfirmError", "비밀번호를 확인하세요");
			return false;
		}
		if (cmd.getAddress().trim().equals("")) {
			req.setAttribute("addressError", "주소를 입력하세요");
			return false;
		}
		if (cmd.getCheckMembershipTerms()==null) {
			req.setAttribute("checkMembershipTermsError", "회원약관을 읽었는지 체크하세요");
			return false;
		}
		
		System.out.println("유효성 전부 통과");
		return true;
	}///////////////validate()
}///// SupportController class
