package com.hansoin5.artplanet.web;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.hansoin5.artplanet.service.BlogPostDTO;
import com.hansoin5.artplanet.service.GcsDTO;
import com.hansoin5.artplanet.service.MemberDTO;
import com.hansoin5.artplanet.service.PayDTO;
import com.hansoin5.artplanet.service.SubscribeDTO;
import com.hansoin5.artplanet.service.impl.BlogPostDAO;
import com.hansoin5.artplanet.service.impl.GcsDAO;
import com.hansoin5.artplanet.service.impl.MemberDAO;
import com.hansoin5.artplanet.service.impl.SubscribeDAO;
import com.hansoin5.artplanet.service.impl.TagDAO;
import com.hansoin5.artplanet.service.impl.TagRelationDAO;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BlogController
{
	public static final int SEC = 60;
	public static final int MIN = 60;
	public static final int HOUR = 24;
	public static final int DAY = 30;
	public static final int MONTH = 12;

	@Resource(name="blogPostDAO")	
	private BlogPostDAO dao;
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	@Resource(name="gcsDAO")	
	private GcsDAO gcsDAO;
	@Resource(name="tagDAO")
	private TagDAO tagDAO;
	@Resource(name="tagRelationDAO")
	private TagRelationDAO tagRelationDAO;
	@Resource(name="subscribeDAO")
	private SubscribeDAO subscribeDAO;
	
	
	@RequestMapping("/Blog")
	public String blog()
	{
		return "contents/blog/Blog.tiles";
	}
	
	@RequestMapping(value="/Blog/{id}", produces = "text/html; charset=UTF-8")
	public String blog(@PathVariable("id") String id, Map map, Authentication auth)
	{	
		MemberDTO memberDto = memberDAO.getMemberById(id).get(0);
		map.put("memberNo", memberDto.getMemberNo());
		List<BlogPostDTO> list = dao.getDtoByMemberNo(map);
		List<Map> posts = new Vector<Map>();
		for(BlogPostDTO dto : list) {
			Map post = new HashMap();
			List<GcsDTO> gcsList = gcsDAO.getListByBlogNo(dto.getBlogNo());
			List<Map> images = new Vector<Map>();
			for(GcsDTO gd : gcsList)
			{
				Map image = new HashMap();
				image.put("src", gd.getFileUrl());
				images.add(image);
			}
			post.put("images", images);
			post.put("blogNo", dto.getBlogNo());
			post.put("title",dto.getTitle());
			post.put("content",dto.getContent());
			post.put("postDate",dto.getPostDate());
			System.out.println("dto.getPostDate():"+dto.getPostDate());
			post.put("categorie",dto.getCategorie());
			post.put("viewCount",dto.getViewCount());
			post.put("accessRight",dto.getAccessRight());
			
			posts.add(post);
		}
		map.put("posts",posts);
		map.put("memberNo",memberDto.getMemberNo());
		map.put("profilePicture",memberDto.getProfilePicture());
		map.put("nickname",memberDto.getNickName());
		map.put("memberId", memberDto.getId());
		map.put("banner", memberDto.getMainPicture());
		map.put("introContent", memberDto.getIntroContent());
		map.put("fee", memberDto.getSubscriptionFee());
		map.put("id",id);
		map.put("subscribe",0);
		//스프링 시큐리티 이용할 때 아이디 값 가져오는 코드
		if(auth != null)
		{
			map.put("loginedId", ((UserDetails)auth.getPrincipal()).getUsername());
			System.out.println("loginedId:"+map.get("loginedId"));
		
			List<SubscribeDTO> subList = subscribeDAO.getSubscribe(map);
			if(subList.size() > 0)
				map.put("subscribe", 1);
		}
			
		System.out.println("blog::::::"+JSONObject.toJSONString(map).replace("\\/", "/"));
		return "contents/blog/Blog.tiles";
	}
	
	@RequestMapping(value="/getPosts", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getPosts(@RequestParam Map map)
	{
		List<BlogPostDTO> list = dao.getDtoByMemberNo(map);
		List<Map> posts = new Vector<Map>();
		for(BlogPostDTO dto : list) {
			Map post = new HashMap();
			List<GcsDTO> gcsList = gcsDAO.getListByBlogNo(dto.getBlogNo());
			List<Map> images = new Vector<Map>();
			for(GcsDTO gd : gcsList)
			{
				Map image = new HashMap();
				image.put("src", gd.getFileUrl());
				images.add(image);
			}
			post.put("images", images);
			post.put("blogNo", dto.getBlogNo());
			post.put("title",dto.getTitle());
			post.put("content",dto.getContent());
			post.put("postDate","'"+dto.getPostDate()+"'");
			System.out.println("dto.getPostDate():"+dto.getPostDate());
			post.put("categorie",dto.getCategorie());
			post.put("viewCount","'"+dto.getViewCount()+"'");
			post.put("accessRight",dto.getAccessRight());
			
			posts.add(post);
		}
		System.out.println("posts::::"+JSONArray.toJSONString(posts).replace("\\/", "/"));
		return JSONArray.toJSONString(posts).replace("\\/", "/");
	}
	
	@RequestMapping("/Blog/{id}/{blogNo}")
	public String viewPost(
			@PathVariable("id") String id,
			@PathVariable("blogNo") String blogNo,
			Map map,
			Authentication auth)
	{
		map.put("id",id);
		map.put("memberId", id);
		map.put("blogNo", blogNo);
		List<GcsDTO> gcsList = gcsDAO.getListByBlogNo(blogNo);
		List<Map> images = new Vector<Map>();
		for(GcsDTO gd : gcsList)
		{
			Map image = new HashMap();
			image.put("src", gd.getFileUrl());
			images.add(image);
		}
		map.put("images", images);
		
		BlogPostDTO dto = dao.getDtoByBlogNo(map).get(0);
		map.put("title", dto.getTitle());
		map.put("content",dto.getContent());
		map.put("memberNo",dto.getMemberNo());
		map.put("accessRight",dto.getAccessRight());
		map.put("categorie",dto.getCategorie());
		map.put("postDate",dto.getPostDate());
		map.put("viewCount",dto.getViewCount());
		
		MemberDTO memberDto = memberDAO.getMemberByMemberNo(dto.getMemberNo()).get(0);
		map.put("profilePicture", memberDto.getProfilePicture());
		map.put("banner", memberDto.getMainPicture());
		map.put("introContent", memberDto.getIntroContent());
		map.put("fee", memberDto.getSubscriptionFee());
		map.put("nickname", memberDto.getNickName());
		map.put("subscribe",0);
		//스프링 시큐리티 이용할 때 아이디 값 가져오는 코드
		if(auth != null)
		{
			map.put("loginedId", ((UserDetails)auth.getPrincipal()).getUsername());
			System.out.println("loginedId:"+map.get("loginedId"));
		
			List<SubscribeDTO> subList = subscribeDAO.getSubscribe(map);
			if(subList.size() > 0)
				map.put("subscribe", 1);
		}
		
		return "contents/blog/ViewPost.tiles";
	}
	
	@RequestMapping("/WritePost")
	public String writePost()
	{	
		return "contents/blog/WritePost.tiles";
	}
	
	@RequestMapping("/EditPost")
	public String editPost()
	{
		return "contents/blog/EditPost.tiles";
	}
	
	@RequestMapping(value = "/getArtworkList", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getArtworkList(@RequestParam Map map, @RequestParam int nowPage)
	{
		//페이징을 위한 로직 시작]
	 	//전체 레코드수]		
	 	int totalRecordCount=dao.getTotalCount(map);	 	
	 	//페이지 크기]
	 	int pageSize = 5;
	 	//전체 페이지수]
	 	int totalPage=(int)Math.ceil((double)totalRecordCount/pageSize);	 	
	 	//시작 및 끝 ROWNUM구하기]
	 	int start = (nowPage - 1) * pageSize + 1;
	 	int end   = nowPage * pageSize;
	 	//페이징을 위한 로직 끝]	
	 	map.put("start", start);
	 	map.put("end", end);
		
		List<BlogPostDTO> list = dao.selectArtworkList(map);
		List<Map> collections = new Vector<Map>();
		for(BlogPostDTO dto : list) {
			Map record = new HashMap();
			//List페이지에선 첫번째 그림만 반환
			List<GcsDTO> gcsList = gcsDAO.getListByBlogNo(dto.getBlogNo());
			//for(GcsDTO gd : gcsList)
			//	System.out.println(gd.getFileNo());
			System.out.println("gscfileUrl:"+gcsList.get(0).getFileUrl());
			record.put("imgUrl", gcsList.get(0).getFileUrl());
			record.put("blogNo", dto.getBlogNo());
			record.put("title",dto.getTitle());
			record.put("content",dto.getContent());
			
			
			long curTime = System.currentTimeMillis();
			long regTime = dto.getPostDate().getTime();
			long diffTime = (curTime - regTime) / 1000;
			String msg = null;
			if (diffTime < SEC)
				msg = "방금 전";
			else if ((diffTime /= SEC) < MIN)
				msg = diffTime + "분 전";
			else if ((diffTime /= MIN) < HOUR)
				msg = (diffTime) + "시간 전";
			else if ((diffTime /= HOUR) < DAY)
				msg = (diffTime) + "일 전";
			else if ((diffTime /= DAY) < MONTH)
				msg = (diffTime) + "달 전";
			else
				msg = (diffTime) + "년 전";
			
			record.put("postDate",msg);
			record.put("categorie",dto.getCategorie());
			String engCategorie;
			switch (dto.getCategorie())
			{
			case "일러스트레이션":
				engCategorie = "illustration";
				break;
			case "애니메이션":
				engCategorie = "animation";
				break;
			case "디자인":
				engCategorie = "design";
				break;
			case "캘리그라피":
				engCategorie = "calligraphy";
				break;
			default:
				engCategorie = "crafts";
				break;
			}
			record.put("engCategorie",engCategorie);
			record.put("viewCount",dto.getViewCount());
			record.put("accessRight",dto.getAccessRight());
			record.put("memberNo",dto.getMemberNo());
			
			//memberNo로 memberDTO 가져오기
			MemberDTO memberDto = memberDAO.getMemberByMemberNo(dto.getMemberNo()).get(0);
			record.put("profile",memberDto.getProfilePicture());
			record.put("nickname",memberDto.getNickName());
			record.put("memberId", memberDto.getId());
			collections.add(record);
		}
		//json 배열 반환
		System.out.println(JSONArray.toJSONString(collections));
		return JSONArray.toJSONString(collections);
	}
	
	@RequestMapping("/UploadBlogPost")
	public String UploadBlogPost(@RequestParam Map map) throws ParseException
	{	
		String memberNo = memberDAO.getMemberNo(map.get("id").toString());		
		map.put("memberNo", memberNo);
		
		int affected = dao.uploadBlogPost(map);
		//int blogNo = Integer.parseInt(map.get("blogNo").toString());
		System.out.println(map.get("blogNo"));
		if(affected > 0)
		{
			//JSON형태 문자열 자바객체로 변환하기
			Map<String,List<Map<String,Object>>> gsonMap = new HashMap<String, List<Map<String,Object>>>();
			Gson gson = new Gson();
			JSONParser parser = new JSONParser();
			//이미지
			Object obj = parser.parse(map.get("imgs").toString());
			JSONObject jsonObj = (JSONObject) obj;
			gsonMap = gson.fromJson(JSONObject.toJSONString(jsonObj).replace("\\/", "/"),
					new TypeToken<Map<String,List<Map<String,Object>>>>(){}.getType());
			/////////////////////////////
			for(int i = 0; i < gsonMap.get("images").size(); i++)
			{
				String fileNo = gcsDAO.getFileNoByURL(gsonMap.get("images").get(i).get("src").toString());
				map.put("fileNo", fileNo);
				gcsDAO.updateBlogNo(map);
			}
			
			System.out.println("jsonObj:"+JSONObject.toJSONString(jsonObj).replace("\\/", "/"));
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
				System.out.println("blogNo:"+map.get("blogNo"));
				tagRelationDAO.insertBlogTagRelation(map);
				
			}
			System.out.println("jsonObj2:"+JSONObject.toJSONString(jsonObj).replace("\\/", "/"));
			
		}
		return "contents/blog/WritePost.tiles";
	}
	public String updateViewCount(@RequestParam Map map)
	{
		int affected = dao.updateViewCount(map);

		return "updatedCount";
	}
	@RequestMapping(value = "/getArtistList", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getArtistList(@RequestParam Map map, @RequestParam int nowPage)
	{
		//페이징을 위한 로직 시작]
	 	//전체 레코드수]		
	 	int totalRecordCount=memberDAO.getMemberCount(map);	
	 	//페이지 크기]
	 	int pageSize = 5;
	 	//전체 페이지수]
	 	int totalPage=(int)Math.ceil((double)totalRecordCount/pageSize);	 	
	 	//시작 및 끝 ROWNUM구하기]
	 	int start = (nowPage - 1) * pageSize + 1;
	 	int end   = nowPage * pageSize;
	 	//페이징을 위한 로직 끝]	
	 	map.put("start", start);
	 	map.put("end", end);
		
		List<MemberDTO> list = memberDAO.getArtistList(map);
		List<Map> collections = new Vector<Map>();
		for(MemberDTO dto : list) {
			Map record = new HashMap();
			
			record.put("memberNo", dto.getMemberNo());
			record.put("memberId", dto.getId());
			record.put("nickname",dto.getNickName());
			record.put("profile",dto.getProfilePicture());
			record.put("banner", dto.getMainPicture());
			record.put("intro",dto.getIntroContent());
			String engCategorie = "";
			if(dto.getIntroContent() != null)
			{
				if(dto.getIntroContent().contains("일러스트"))
					engCategorie += " illustration";
				else if(dto.getIntroContent().contains("애니메이션"))
					engCategorie += " animation";
				else if(dto.getIntroContent().contains("디자인"))
					engCategorie += " design";
				else if(dto.getIntroContent().contains("캘리그라피") || dto.getIntroContent().contains("글씨"))
					engCategorie += " calligraphy";
				else if(dto.getIntroContent().contains("조소") || dto.getIntroContent().contains("공예") || dto.getIntroContent().contains("만들기"))
					engCategorie += " crafts";
			}
			record.put("engCategorie",engCategorie);
			
			//memberNo로 public한 그림만 가져오기
			List<BlogPostDTO> postList = dao.getPublicByMemberNo(String.valueOf(dto.getMemberNo()));
			List<Map> posts = new Vector<Map>();
			for(int i=0; i<postList.size(); i++)
			{
				Map post = new HashMap();
				if(i == 3) break;
				post.put("blogNo", postList.get(i).getBlogNo());
				post.put("url", gcsDAO.getListByBlogNo(postList.get(i).getBlogNo()).get(0).getFileUrl());
				posts.add(post);
			}
			record.put("posts", posts);
			
			collections.add(record);
		}
		//json 배열 반환
		System.out.println(JSONArray.toJSONString(collections).replace("\\/", "/"));
		return JSONArray.toJSONString(collections).replace("\\/", "/");
		
	}
	
	//댓글관련
	@ResponseBody
	@RequestMapping(value = "/BlogPost/Comments")
	public String commentajax(@RequestParam Map map,Authentication auth) {
		System.out.println("코멘트입력폼 컨트롤러 들어옴");
		
		//스프링 시큐리티 이용할 때 아이디 값 가져오는 코드
		map.put("id", ((UserDetails)auth.getPrincipal()).getUsername());
		System.out.println("쿼리 시작");
		String memberNo = memberDAO.getMemberNo(map.get("id").toString());
		map.put("memberNo", memberNo);
		dao.insertcomment(map);
		System.out.println("쿼리 적용 됨");
		return map.get("blogNo").toString();
	}
	
	@ResponseBody
	@RequestMapping(value="/BlogPost/CommentsList",produces = "text/html; charset=UTF-8")
	public String commentlist(@RequestParam Map map,Model model) {
		System.out.println("코멘트리스트 컨트롤러 ");
		System.out.println("blogNo:"+map.get("blogNo"));
		//서비스호출
		List<Map> list = dao.selectcomment(map);
		
		System.out.println("JSONOBJ"+JSONObject.toJSONString(map));
		
		System.out.println("쿼리 작동");
		
		
		for(Map comment:list) {
			comment.put("REPLYPOSTDATE", comment.get("REPLYPOSTDATE").toString().substring(0,10));

		}
		System.out.println("날짜 변환");
		
		
		
		
		System.out.println(JSONArray.toJSONString(list).toString());
		return JSONArray.toJSONString(list).replace("\\/", "/");	
	}
	
	//구독
	@RequestMapping("/Subscribe")
	public String subscribe(@RequestParam Map map)
	{
		String id = map.get("id").toString();
		String loginedId = map.get("loginedId").toString();
		System.out.println("id:"+id);
		System.out.println("loginedId:"+loginedId);
		int affected = subscribeDAO.doSubscribe(map);
		System.out.println(affected);
		
		return "forward:/Blog/"+id;
	}
}
