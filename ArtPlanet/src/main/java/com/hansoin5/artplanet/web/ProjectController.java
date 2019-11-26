package com.hansoin5.artplanet.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hansoin5.artplanet.service.ProjectDTO;
import com.hansoin5.artplanet.service.impl.GcsDAO;
import com.hansoin5.artplanet.service.impl.MemberDAO;
import com.hansoin5.artplanet.service.impl.ProjectDAO;
import com.hansoin5.artplanet.service.impl.TagDAO;
import com.hansoin5.artplanet.service.impl.TagRelationDAO;

@Controller
public class ProjectController{
	
	@Resource(name="projectDAO")
	private ProjectDAO projectDao;
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	@Resource(name="gcsDAO")	
	private GcsDAO gcsDAO;
	@Resource(name="tagDAO")
	private TagDAO tagDAO;
	@Resource(name="tagRelationDAO")
	private TagRelationDAO tagRelationDAO;
		
	
	//프로젝트 상세 메소드
	@RequestMapping("/Search/Project/ProjectView")
	public String searchProjectview(@RequestParam Map map, Model model)
	{
		System.out.println("프로젝트 뷰 컨트롤 들어옴");
		ProjectDTO record = projectDao.selectOne(map);
		ProjectDTO fundInfo = projectDao.selectFundInfo(map);
		List<Map> tagList = projectDao.selectTagslist(map);
		List<Map> rewardList = projectDao.selectRewardList(map);
		
		List<String[]> rewardcontent = new Vector<String[]>();
		for(int i=0; i< rewardList.size();i++) {
			String[] contentarray =  rewardList.get(i).get("REWARDCONTENT").toString().split(",");
			rewardcontent.add(contentarray);
		}
		/* int commentCount = projectDao.getCommentCount(map); 필요 없어짐 */
		String tags = "";
		for(int i=0; i<tagList.size();i++) {
			tags += "#" + tagList.get(i).get("TAGNAME") +" ";
		}
		record.setContent(record.getContent());
		List<Map> list = projectDao.selectsupport(map);
		int supportcount = list.size();
		List<Map> updateList = projectDao.selectUpdateList(map);
		int updatecount = updateList.size();
		model.addAttribute("tags",tags);
		model.addAttribute("list",list);
		model.addAttribute("record",record);
		model.addAttribute("supportcount",supportcount);
		model.addAttribute("fundInfo",fundInfo);
		model.addAttribute("rewardList",rewardList);
		model.addAttribute("tagList",tagList);
		model.addAttribute("updateList",updateList);
		model.addAttribute("updatecount",updatecount);
		model.addAttribute("rewardcontent",rewardcontent);
		return "contents/project/SearchProjectView.tiles";
	}
	
	
		
	
	//프로젝트 코멘트 입력 메소드
	@ResponseBody
	@RequestMapping(value = "/Search/Project/Comments")
	public String commentajax(@RequestParam Map map,Authentication auth) {
		System.out.println("코멘트입력폼 컨트롤러 들어옴");
		//스프링 시큐리티 이용할 때 아이디 값 가져오는 코드
		map.put("id", ((UserDetails)auth.getPrincipal()).getUsername());
		System.out.println("쿼리 시작");
		String memberNo = memberDAO.getMemberNo(map.get("id").toString());
		map.put("memberNo", memberNo);
		projectDao.insertcomment(map);
		System.out.println("쿼리 적용 됨");
		return map.get("projectNo").toString();
	}
	
	
	
	//댓글 삭제 메소드
	@ResponseBody
	@RequestMapping(value = "/Search/Project/CommentsDelete",produces ="text/html; charset=UTF-8")
	public String commentajaxDelete(@RequestParam Map map) {
		projectDao.commentDelete(map);
		return null;
	}
	
	
	
	//댓글 수정 메소드,구현 중
	@ResponseBody
	@RequestMapping(value = "/Search/Project/CommentsUpdate",produces ="text/html; charset=UTF-8")
	public String commentajaxUpdate(@RequestParam Map map) {
		return null;
	}
	
	
	
	//프로젝트 작성 메소드
	@RequestMapping("/Search/Project/Write")
	public String projectWrite(@RequestParam Map map) throws ParseException {
		System.out.println("프로젝트 작성 폼 컨트롤러 들어옴");
		String memberNo = memberDAO.getMemberNo(map.get("id").toString());
		map.put("memberNo", memberNo);
		int affected = projectDao.projectinsert(map);
		if(affected > 0) {
			//JSON형태 문자열 자바객체로 변환
			Map<String,List<Map<String,Object>>> gsonMap = new HashMap<String, List<Map<String,Object>>>();
			Gson gson = new Gson();
			JSONParser parser = new JSONParser();
			//이미지
			Object obj = parser.parse(map.get("imgs").toString());
			JSONObject jsonObj = (JSONObject) obj;
			gsonMap = gson.fromJson(JSONObject.toJSONString(jsonObj).replace("\\/", "/"),
					new TypeToken<Map<String,List<Map<String,Object>>>>(){}.getType());
			for(int i = 0; i < gsonMap.get("images").size(); i++) {
				String fileNo = gcsDAO.getFileNoByURL(gsonMap.get("images").get(i).get("src").toString());
				map.put("fileNo", fileNo);
				gcsDAO.updateProjectNo(map);
			}//for
			System.out.println("jsonObj:"+JSONObject.toJSONString(jsonObj).replace("\\/", "/"));
			System.out.println("이미지 성공");
			//태그
			System.out.println("gettags:"+map.get("tags").toString());
			obj = parser.parse(map.get("tags").toString());
			jsonObj = (JSONObject) obj;
			gsonMap = gson.fromJson(JSONObject.toJSONString(jsonObj).replace("\\/", "/"),
					new TypeToken<Map<String,List<Map<String,Object>>>>(){}.getType());			
			for(int i = 0; i < gsonMap.get("tags").size(); i++)
			{
				System.out.println(gsonMap.get("tags").get(i).get("tag").toString());
				String tagName = gsonMap.get("tags").get(i).get("tag").toString();
				map.put("tagName", tagName);
				tagDAO.insertTag(map);
				
				//중복된 태그일시 기존에 있던 태그번호 얻어오기 위해 서비스 한번 더 호출
				String tagNo = tagDAO.getTagNo(map).toString();
				map.put("tagNo", tagNo);
				
				System.out.println("tagNo:"+tagNo);
				System.out.println("projectNo:"+map.get("projectNo"));
				tagRelationDAO.insertProjectTagRelation(map);
			}//for
			System.out.println("jsonObj2:"+JSONObject.toJSONString(jsonObj).replace("\\/", "/"));
		}//if(affected > 0)
		System.out.println("쿼리 작동");
		return "forward:/Search/Project";
	}
	
	
	@RequestMapping("/Search/Project/projectUpdate")
	public String projectUpdate(@RequestParam Map map) {
		projectDao.insertUpdate(map);
		return "forward:/Search/Project/ProjectView";
		
	}
	
	
	
	//코멘트 리스트 메소드
	@ResponseBody
	@RequestMapping(value="/Search/Project/CommentsList",produces = "text/html; charset=UTF-8")
	public String commentlist(@RequestParam Map map,Model model) {
		System.out.println("코멘트리스트 컨트롤러 ");
		System.out.println("projectno:"+map.get("projectNo"));
		//서비스호출
		List<Map> list = projectDao.selectcomment(map);
		System.out.println("쿼리 작동");
		for(Map comment:list) {
			comment.put("REPLYPOSTDATE", comment.get("REPLYPOSTDATE").toString().substring(0,10));
		}
		System.out.println("날짜 변환");
		System.out.println(JSONArray.toJSONString(list).toString());
		return JSONArray.toJSONString(list);	
	}
	
	
	
	//아래 메소드는 필요 없음, 결제 컨트롤러로 옮김
	@RequestMapping("/Search/Project/projectSupport")
	public String projectSupport(@RequestParam Map map) {
		System.out.println("프로젝트 후원 컨트롤러");
		System.out.println("쿼리 시작");
		String projectSupportSum = map.get("projectSupportSum").toString().replace(",", "");
		System.out.println(projectSupportSum);
		map.put("projectSupportSum", projectSupportSum);
		String memberNo = memberDAO.getMemberNo(map.get("id").toString());
		map.put("memberNo", memberNo);
		projectDao.insertsupport(map);
		System.out.println("쿼리 적용 됨");
		String url = "forward:/Search/Project/ProjectView";
		return url;
	}
	
	
	
	//리워드 등록 메소드
	@RequestMapping("/Search/Project/projectreward")
	public String projectreward(@RequestParam Map map) {
		System.out.println("프로젝트 리워드 등록 컨트롤러");
		String supportStep = map.get("supportStep").toString().replace(",", "");
		System.out.println(supportStep);
		System.out.println(map.get("projectNo"));
		System.out.println(map.get("rewardContent"));
		map.put("supportStep", supportStep);
		projectDao.insertReward(map);
		System.out.println("쿼리 적용 됨");
		return "forward:/Search/Project/ProjectView";
	}
	
	
	
	//프로젝트 삭제 메소드
	@RequestMapping("/Search/Project/projectDelete")
	public String projectDelete(@RequestParam Map map) {
		System.out.println("프로젝트 삭제 컨트롤 시작");
		projectDao.delete(map);
		System.out.println("프로젝트 삭제 컨트롤 끝");
		return "forward:/Search/Project";
		
	}
	
	
	
	
	
	//프로젝트 마감임박 목록 리스트
	@RequestMapping("/Search/Project/Closing")
	public String searchProject(@RequestParam Map map, Model model)
	{
		List<ProjectDTO> list = projectDao.selectlistClosing(map);
		List<Map> tags  = projectDao.selectTags(map);		
		/* tagRelationDao. */
		List<String[]> list2 = new Vector<String[]>();
		for(int i =0; i<list.size();i++) {
			String[] strarr = list.get(i).getTagName().split(",");
			list2.add(strarr);
		}
		model.addAttribute("list",list);
		model.addAttribute("tags",tags);
		model.addAttribute("list2",list2);
		return "contents/SearchProjectClosing.tiles";
	}
	
	
	
	//테스트 메소드
	@RequestMapping("/Search/Project/ProjectWrite")
	public String searchProjectwrite()
	{
		return "contents/project/WriteProj.tiles";
	}
	
	//테스트 메소드
	@RequestMapping("/Search/Project/Test")
	public String kakaolink(@RequestParam Map map) {
		
		return "contents/project/ViewProject.tiles";
	}
	//테스트 메소드
	@RequestMapping("/Search/Project/Test2")
	public String kakaolink2(@RequestParam Map map) {
		
		return "contents/project/ViewProject2.tiles";
	}
	
	/*public String project()
	{
		return "contents/project/Project.tiles";
	}
	
	@RequestMapping("/Project/View")
	public String viewProject()
	{
		return "contents/project/ViewProject.tiles";
	}
	
	@RequestMapping("/Project/Write")
	public String writeProject()
	{
		return "contents/project/WriteProject.tiles";
	}
	
	@RequestMapping("/Project/Edit")
	public String editProject()
	{
		return "contents/project/EditProject.tiles";
	}*/
}
