package com.hansoin5.artplanet;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hansoin5.artplanet.service.MemberDTO;
import com.hansoin5.artplanet.service.ProjectDTO;
import com.hansoin5.artplanet.service.impl.AuthorityDAO;
import com.hansoin5.artplanet.service.impl.GcsDAO;
import com.hansoin5.artplanet.service.impl.MemberDAO;
import com.hansoin5.artplanet.service.impl.ProjectDAO;

@Controller
public class TopController
{
// MEMBER 테이블에 접근하는 객체주입
	@Resource(name = "memberDAO")
	private MemberDAO memberDao;
// AUTH_SECURITY 테이블에 접근하는 객체주입
	@Resource(name = "authorityDAO")
	private AuthorityDAO authorityDao;
	@Resource(name = "gcsDAO")
	private GcsDAO gcsDao;
// PROJECT 테이블에 접근하는 객체 주입
	@Resource(name = "projectDAO")
	private ProjectDAO projectDao;

	@RequestMapping(value = "/AuthRegister", method = RequestMethod.POST, produces = "text/plain; charset:UTF-8")
	public String authRegister(@RequestParam Map map, Model model)
	{

		System.out.println("컨트롤러에서 찍어보기 : " + map.get("auth_name"));
		System.out.println("컨트롤러에서 찍어보기 : " + map.get("auth_birth"));
		System.out.println("컨트롤러에서 찍어보기 : " + map.get("auth_phone"));

		// Reqeust 영역에 모듈에서 넘어온값 저장
		model.addAttribute("auth_name", map.get("auth_name"));
		model.addAttribute("auth_birth", map.get("auth_birth"));
		model.addAttribute("auth_phone", map.get("auth_phone"));

		return "support/member/Register.tiles";
	}///// authRegister()

// 인증모듈 없이 회원가입 페이지으로 이동
	@RequestMapping(value = "/Register", method = RequestMethod.GET, produces = "text/plain; charset:UTF-8")
	public String register(@RequestParam Map map, Model model)
	{

		return "support/member/Register.tiles";
	}///// register()

// 회원가입 처리
// 프로필 사진 업로드시 업로드 input TAG의 name속성명 = MultipartFile (upload) 이어야함! 안그러면 파일업로드
// 요청 거절함
	@RequestMapping(value = "/Register", method = RequestMethod.POST)
	public String registerOk(@RequestParam Map map, ModelMap modelmap, @RequestParam MultipartFile upload, HttpServletRequest req) throws IllegalStateException, IOException
	{
//gcs
		System.out.println("컨트롤러에서 찍어보기 : " + map.get("profileImg"));
		String default_profile = "https://storage.googleapis.com/art-planet-storage/default/default_profile.jpg";
		if (map.get("profileImg") == null || map.get("profileImg").toString().length() == 0)
		{
			default_profile = "https://storage.googleapis.com/art-planet-storage/default/default_profile.jpg";
			map.put("profilePicture", default_profile);
		} else
			map.put("profilePicture", map.get("profileImg").toString());

//디폴트 배너
		String default_banner = "https://storage.googleapis.com/art-planet-storage/default/default_banner.jpg";
		map.put("banner", default_banner);
// 주소 + 상세주소
		map.put("address", map.get("address").toString() + " " + map.get("detailAddress").toString());
		memberDao.insert(map);// 회원정보 입력

		map.put("memberNo", memberDao.getMemberDTO(map).getMemberNo()); // 권한설정용 회원번호 저장
		authorityDao.insertAuthority(map); // 회원 권한 설정

// 뷰정보반환]-회원가입 완료페이지로 이동
		return "forward:/WEB-INF/views/support/member/Welcome.jsp";
	}///// registerOk()

	@RequestMapping("/About")
	public String about()
	{
		return "about/About.tiles";
	}

	@RequestMapping("/Search/Artwork")
	public String searchArtwork()
	{
		return "contents/SearchArtwork.tiles";
	}

	@RequestMapping("/Search/Artist")
	public String searchArtist()
	{
		return "contents/SearchArtist.tiles";
	}

	// 프로젝트 목록 리스트 메소드
	@RequestMapping("/Search/Project")
	public String searchProject(@RequestParam Map map, Model model)
	{
		System.out.println("탑컨트롤러 시작");
		// 프로젝트 목록 가져오기
		List<ProjectDTO> list = projectDao.selectlist(map);
		model.addAttribute("list", list);
		// 많이 등록된 태그들 가져오기
		List<Map> tags = projectDao.selectTags(map);
		// 프로젝트마다의 태그 넣기 위한 List 선언
		List<String[]> list2 = new Vector<String[]>();
		// 프로젝트별 태그 넣기
		for (int i = 0; i < list.size(); i++)
		{
			String[] strarr = list.get(i).getTagName().split(",");
			list2.add(strarr);
		}
		model.addAttribute("list", list);
		model.addAttribute("tags", tags);
		model.addAttribute("list2", list2);
		return "contents/SearchProject.tiles";
	}

	@RequestMapping("/ArtClass")
	public String art_class()
	{
		return "sub/art_class/ArtClass.tiles";
	}

	@RequestMapping("/Pay")
	public String art_class2()
	{
		return "pay/Pay.tiles";
	}

// MyPage로 이동
	@RequestMapping("/MyPage")
	public String moveMyPage(@RequestParam Map map, Model model, Authentication auth)
	{
		// 이종성 코드 시작
		System.out.println("마이페이지 컨트롤러 시작");
		// 스프링 시큐리티를 통해 id 가져오고 memberNo 가져와서 map에 담기
		map.put("id", ((UserDetails) auth.getPrincipal()).getUsername());
		String memberNo = memberDao.getMemberNo(map.get("id").toString());
		map.put("memberNo", memberNo);
		// 로그인한 회원 정보 가져오기
		MemberDTO memberInfo = memberDao.getmemberInfo(map);

		// 내가 개설한 아트 클래스 목록 가져오기
		List<Map> classList = memberDao.getArtClasss(map);
		// 내가 만든 프로젝트 목록 가져오기
		List<Map> projList = memberDao.getProject(map);
		// 날짜 타입 변환하기
		for (int i = 0; i < projList.size(); i++)
		{
			projList.get(i).put("DEADLINE", projList.get(i).get("DEADLINE").toString().substring(0, 10));
			projList.get(i).put("POSTDATE", projList.get(i).get("POSTDATE").toString().substring(0, 10));
		}
		// 내가 구독중인 작가들 목록 가져오기
		List<Map> subscribeList = memberDao.getsubscribe(map);
		// 내가 후원중인 프로젝트 목록 가져오기
		List<Map> fundingProjList = memberDao.getfundingProj(map);
		for (int i = 0; i < fundingProjList.size(); i++)
		{
			fundingProjList.get(i).put("PROJECTSUPPORTDATE", fundingProjList.get(i).get("PROJECTSUPPORTDATE").toString().substring(0, 10));
			fundingProjList.get(i).put("DEADLINE", fundingProjList.get(i).get("DEADLINE").toString().substring(0, 10));
		}
		System.out.println("이종성 테스트 ");
		// 내가 예약한 클래스 목록 가져오기
		List<Map> reservedClassList = memberDao.getreservedClass(map);

		// 영역에 저장
		model.addAttribute("classList", classList);
		model.addAttribute("projList", projList);
		model.addAttribute("subscribeList", subscribeList);
		model.addAttribute("fundingProjList", fundingProjList);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("reservedClassList", reservedClassList);
		// 이종성 코드 끝
		return "support/member/MyPage.tiles";
	}///// moveMyPage()

	// 안드로이드 내가 등록한 프로젝트 정보
	@ResponseBody
	@RequestMapping(value = "/Android/AndMyPage.do", produces = "text/html; charset=UTF-8")
	public String AndProj(@RequestParam Map map)
	{
		// 코딩왕 이종성 코드 시작
		System.out.println("마이페이지 컨트롤러 시작");
		// 스프링 시큐리티를 통해 id 가져오고 memberNo 가져와서 map에 담기

		// map.put("id", ((UserDetails) auth.getPrincipal()).getUsername());
		System.out.println("아이디값:" + map.get("id"));
		String memberNo = memberDao.getMemberNo(map.get("id").toString());
		map.put("memberNo", memberNo);
		System.out.println("멤버넘버:" + map.get("memberNo"));

		// 내가 후원중인 프로젝트 목록 가져오기
		List<Map> fundingProjList = memberDao.getfundingProj(map);
		if (fundingProjList.equals(null))
		{
			System.out.println("조회한 값이 없어요");
			return "";
		}
		for (int i = 0; i < fundingProjList.size(); i++)
		{
			fundingProjList.get(i).put("PROJECTSUPPORTDATE", fundingProjList.get(i).get("PROJECTSUPPORTDATE").toString().substring(0, 10));
			fundingProjList.get(i).put("DEADLINE", fundingProjList.get(i).get("DEADLINE").toString().substring(0, 10));
			fundingProjList.get(i).put("POSTDATE", fundingProjList.get(i).get("POSTDATE").toString().substring(0, 10));
		}
		// 서비스호출
		// System.out.println(JSONArray.toJSONString(list).toString());
		System.out.println("안드로이드 컨트롤 끝");
		// System.out.println(JSONArray.toJSONString(list));
		System.out.println(JSONArray.toJSONString(fundingProjList));
		return JSONArray.toJSONString(fundingProjList);
	}///// moveMyPage()

	// 안드로이드 내가 등록한 클래스 정보
	@ResponseBody
	@RequestMapping(value = "/Android/AndMyPageClass.do", produces = "text/html; charset=UTF-8")
	public String AndClass(@RequestParam Map map)
	{
		System.out.println("class 마이페이지 컨트롤러 시작");
		// 스프링 시큐리티를 통해 id 가져오고 memberNo 가져와서 map에 담기

		// map.put("id", ((UserDetails) auth.getPrincipal()).getUsername());
		System.out.println("class 아이디값:" + map.get("id"));
		String memberNo = memberDao.getMemberNo(map.get("id").toString());
		map.put("memberNo", memberNo);
		System.out.println("class 멤버넘버:" + map.get("memberNo"));
		// 내가 예약한 클래스 목록 가져오기
		List<Map> reservedClassList = memberDao.getreservedClass(map);
		if (reservedClassList.equals(null))
		{
			System.out.println("조회한 값이 없어요");
			return "";
		}
		for (int i = 0; i < reservedClassList.size(); i++)
		{
			reservedClassList.get(i).put("TUITIONFEE", reservedClassList.get(i).get("TUITIONFEE").toString());
			reservedClassList.get(i).put("MEMBERNO", reservedClassList.get(i).get("MEMBERNO").toString());
			reservedClassList.get(i).put("CLASSNO", reservedClassList.get(i).get("CLASSNO").toString());
			reservedClassList.get(i).put("CLASSRESERVATIONNO", reservedClassList.get(i).get("CLASSRESERVATIONNO").toString());
			reservedClassList.get(i).put("NUMBEROFPEOPLE", reservedClassList.get(i).get("NUMBEROFPEOPLE").toString());
		}
		// 이종성 코드 끝
		System.out.println("안드로이드 컨트롤 끝");
		System.out.println(JSONArray.toJSONString(reservedClassList));
		return JSONArray.toJSONString(reservedClassList);
	}///// moveMyPage()

// 로그인 페이지로 이동
	@RequestMapping(value = "/Login")
	public String login()
	{
		return "support/member/Login.tiles";
	}///// login()

//리액트 페이지로 이동
	@RequestMapping(value = "/React.bbs")
	public String React()
	{
		return "react/index.tiles";
	}///// login()

}///// class