package com.hansoin5.artplanet.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hansoin5.artplanet.service.ProjectDTO;
import com.hansoin5.artplanet.service.impl.MemberDAO;
import com.hansoin5.artplanet.service.impl.ProjectDAO;

@Controller
public class ProjectController{
	
	@Resource(name="projectDAO")
	private ProjectDAO projectDao;
		
	@RequestMapping("/Search/Project/ProjectView")
	public String searchProjectview(@RequestParam Map map, Model model)
	{
		System.out.println("컨트롤 들어옴");
		ProjectDTO record = projectDao.selectOne(map);
		ProjectDTO fundInfo = projectDao.selectFundInfo(map);
		
		record.setContent(record.getContent().replace("<p>", "").replace("</p>", ""));
		List<Map> list = projectDao.selectsupport(map);
		int supportcount = list.size();
		System.out.println(list.get(0).get("PROJECTSUPPORTDATE"));
		
		model.addAttribute("list",list);
		model.addAttribute("record",record);
		model.addAttribute("supportcount",supportcount);
		model.addAttribute("fundInfo",fundInfo);
		
		
		return "contents/project/SearchProjectView.tiles";
	}
	
	@RequestMapping("/Search/Project/ProjectWrite")
	public String searchProjectwrite()
	{
		return "contents/project/WriteProj.tiles";
	}
	
	//프로젝트 작성
	@RequestMapping("/Search/Project/Write")
	public String searchProjectwriteInsert(@RequestParam Map map)
	
	{
		System.out.println("컨트롤러 들어옴");
		System.out.println(map.get("deadline"));
		
		projectDao.insert(map);
		
		return "forward:/Search/Project";
	}

	@ResponseBody
	@RequestMapping(value = "/Search/Project/Comments")
	public String commentajax(@RequestParam Map map,Authentication auth) {
		System.out.println("코멘트입력폼 컨트롤러 들어옴");
		
		/* map.put("id", ((UserDetails)auth.getPrincipal()).getUsername()); */
		System.out.println("쿼리 시작");
		projectDao.insertcomment(map);
		System.out.println("쿼리 적용 됨");
		
		return map.get("projectNo").toString();
		
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/Search/Project/Writes")
	public String writeajax(@RequestParam Map map) {
		System.out.println("컨트롤러들어옴");
		JSONObject json  = new JSONObject();
		System.out.println(map.get("title"));
		
		if(map.get("title") == "" || map.get("targetFigure") == "" || map.get("deadline") == "" || map.get("content") == "" ) {
			json.put("empty", "0");
		}
		else {
			json.put("empty", "1");
		}
		
		System.out.println("컨트롤러작동");
		return json.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="/Search/Project/CommentsList",produces = "text/html; charset=UTF-8")
	public String commentlist(@RequestParam Map map) {
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
