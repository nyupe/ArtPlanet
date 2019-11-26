package com.hansoin5.artplanet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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


	@RequestMapping(value ="/AuthRegister", method = RequestMethod.POST, produces = "text/plain; charset:UTF-8")
	public String authRegister(@RequestParam Map map, Model model ) {
	
		System.out.println("컨트롤러에서 찍어보기 : " +map.get("auth_name"));
		System.out.println("컨트롤러에서 찍어보기 : " +map.get("auth_birth"));
		System.out.println("컨트롤러에서 찍어보기 : " +map.get("auth_phone"));
		
		//Reqeust 영역에 모듈에서 넘어온값 저장 
		model.addAttribute("auth_name",map.get("auth_name"));
		model.addAttribute("auth_birth",map.get("auth_birth"));
		model.addAttribute("auth_phone",map.get("auth_phone"));
		
		return "support/member/Register.tiles";
	}/////authRegister()


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
	public String registerOk(@RequestParam Map map, ModelMap modelmap, @RequestParam MultipartFile upload,
			HttpServletRequest req) throws IllegalStateException, IOException
	{
		/*
		 * System.out.println("컨트롤러에서 찍어보기 : " + map.get("auth_name"));
		 * 
		 * if (!upload.isEmpty()) { // 회원가입시 프로필 사진 첨부했을 경우 // 1]서버의 물리적 경로 얻기 String
		 * String phisicalPath = req.getServletContext().getRealPath("/ProfilePicture");
		 * // 2]File객체 생성 //똑같은 파일의 이름을 업로드시 서버에 저장되는 파일 변경 String String newFileName =
		 * FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
		 * String profilePicturePath = phisicalPath + File.separator + newFileName; File
		 * file = new File(phisicalPath + File.separator + newFileName); // 3]업로드 처리
		 * upload.transferTo(file); map.put("profilePicture", profilePicturePath);
		 * System.out.println(profilePicturePath); } else {// 회원가입시 프로필 사진 첨부안할시 서버에 이미
		 * 있는 디폴트 이미지의 경로를 저장 String defaultProfilePicturePath =
		 * "https://storage.googleapis.com/art-planet-storage/profile/%ED%94%84%EB%A1%9C%ED%95%84_%EA%B8%B0%EB%B3%B8.jpg";
		 * map.put("profilePicture", defaultProfilePicturePath); }
		 */

//gcs
		System.out.println("컨트롤러에서 찍어보기 : " + map.get("profileImg"));
		String defaultProfilePicturePath = "https://storage.googleapis.com/art-planet-storage/profile/%ED%94%84%EB%A1%9C%ED%95%84_%EA%B8%B0%EB%B3%B8.jpg";
		if (map.get("profileImg") == null || map.get("profileImg").toString().length() == 0)
		{
			defaultProfilePicturePath = "https://storage.googleapis.com/art-planet-storage/profile/%ED%94%84%EB%A1%9C%ED%95%84_%EA%B8%B0%EB%B3%B8.jpg";
			map.put("profilePicture", defaultProfilePicturePath);
		} else
			map.put("profilePicture", map.get("profileImg").toString());

//디폴트 배너
		String banner = "https://storage.googleapis.com/art-planet-storage/banner/default-banner.jpg";
		map.put("banner", banner);
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

	@RequestMapping("/Search/Project")
	public String searchProject(@RequestParam Map map, Model model)
	{
		List<ProjectDTO> list = projectDao.selectlist(map);
		model.addAttribute("list", list);

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
	public String moveMyPage()
	{
		return "support/member/MyPage.tiles";
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

	/*
	 * //회원가입 페이지으로 이동
	 *
	 * @RequestMapping(value = "/Register" , method=RequestMethod.GET, produces =
	 * "text/plain; charset:UTF-8") public String register(@RequestParam Map map,
	 * Model model ){
	 *
	 * //찍어보기 //System.out.println("컨트롤러에서 찍어보기 : "+map.get("name"));
	 * //System.out.println("컨트롤러에서 찍어보기 : "+map.get("auth_name"));
	 *
	 * //리퀘스트 영역에 이름 저장 model.addAttribute("name", map.get("name"));
	 * model.addAttribute("auth_name", map.get("auth_name"));
	 *
	 * return "support/member/Register.tiles"; }/////register()
	 */

}///// class