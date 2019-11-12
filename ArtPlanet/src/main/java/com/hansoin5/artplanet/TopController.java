package com.hansoin5.artplanet;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hansoin5.artplanet.service.impl.AuthorityDAO;
import com.hansoin5.artplanet.service.impl.MemberDAO;
import com.hansoin5.artplanet.utils.FileUpDownUtils;

@Controller
public class TopController
{
	
	//DAO 주입	
	@Resource(name="memberDAO")
	private MemberDAO memberDao;
	
	@Resource(name="authorityDAO")
	private AuthorityDAO authorityDao;
	
	
	//회원가입 페이지으로 이동
	@RequestMapping(value = "/Register" , method=RequestMethod.GET)
	public String register(@RequestParam Map map){	
		return "support/member/Register.tiles";
	}/////register()
	
	//회원가입 처리
	@RequestMapping(value = "/Register" , method=RequestMethod.POST)
	public String registerOk(@RequestParam Map map,
			@RequestParam MultipartFile upload, HttpServletRequest req) throws IllegalStateException, IOException{
		if(!upload.isEmpty()) { // 회원가입시 프로필 사진을 같이 첨부했을 경우
			//1]서버의 물리적 경로 얻기
			String phisicalPath=req.getServletContext().getRealPath("/ProfilePicture");
			//2]File객체 생성
			//똑같은 파일의 이름을 업로드시 서버에 저장되는 파일 변경
			String newFileName=FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
			String profilePicturePath = phisicalPath+File.separator+newFileName;
			File file = new File(phisicalPath+File.separator+newFileName);
			//3]업로드 처리		
			upload.transferTo(file);
			map.put("profilePicture",profilePicturePath);
		}
		
		
		memberDao.insert(map);// 회원정보 입력 
		map.put("memberNo", memberDao.getMemberDTO(map).getMemberNo()); // 권한설정용 회원번호 저장 
		authorityDao.insertAuthority(map); // 회원 권한 설정
		
		//뷰정보반환]-회원가입 완료페이지로 이동
		return "forward:/WEB-INF/views/support/member/Welcome.jsp";
	}/////registerOk()
	
	
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
	public String searchProject()
	{
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
	
	//MyPage로 이동
	@RequestMapping("/MyPage")
	public String moveMyPage() {
		return "support/member/MyPage.tiles";
	}/////moveMyPage()
	
	//로그인 페이지로 이동
	@RequestMapping(value = "/Login")
	public String login()
	{
		return "support/member/Login.tiles";
	}/////login()
	

	
}
