package com.hansoin5.artplanet.web;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.hansoin5.artplanet.service.BlogPostDTO;
import com.hansoin5.artplanet.service.GcsDTO;
import com.hansoin5.artplanet.service.MemberDTO;
import com.hansoin5.artplanet.service.PayDTO;
import com.hansoin5.artplanet.service.SubscribeDTO;
import com.hansoin5.artplanet.service.TagRelationDTO;
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
	public static final String NO_IMAGE = "https://storage.googleapis.com/art-planet-storage/default/no_image.jpg";

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
		
			List<SubscribeDTO> subList2 = subscribeDAO.getSubscribe(map);
			if(subList2.size() > 0)
				map.put("subscribe", 1);
		}
		
		List<SubscribeDTO> subList = subscribeDAO.getWhoSubscribeMe(map);
		map.put("subscribeCount",subList.size());
			
		return "contents/blog/Blog.tiles";
	}
	
	@RequestMapping(value="/getPosts", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getPosts(@RequestParam Map map, Authentication auth)
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
			post.put("categorie",dto.getCategorie());
			post.put("viewCount","'"+dto.getViewCount()+"'");
			//글이 구독자 전용일때
			if(dto.getAccessRight().equals("1"))
			{
				System.out.println("1");
				//비로그인 상태일때
				if(auth == null)
				{
					post.put("accessRight","1");
				}
				//로그인 상태일때
				else
				{
					map.put("loginedId", ((UserDetails)auth.getPrincipal()).getUsername());
					//id는 map에 이미 들어있음
					List<SubscribeDTO> subList = subscribeDAO.getSubscribe(map);
					//구독중이 아닐때
					if(subList == null || subList.size() == 0)
					{
						post.put("accessRight","1");
					}
					//구독중일때
					else
					{
						post.put("accessRight","0");
					}
					//현재 로그인한 아이디와 글 작성자 아이디가 같을때 || 관리자 아이디일때
					if(map.get("id").toString().equals(((UserDetails)auth.getPrincipal()).getUsername())
						|| "ADMIN".equals(((UserDetails)auth.getPrincipal()).getUsername()))
					{
						post.put("accessRight","0");
					}
				}
			}
			//글이 전체공개일때
			else 
			{
				post.put("accessRight","0");
			}
			
			posts.add(post);
		}
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
		List<SubscribeDTO> subCountList = subscribeDAO.getWhoSubscribeMe(map);
		map.put("subscribeCount",subCountList.size());
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
		//구독중인지 확인
		if(auth != null)
		{
			map.put("loginedId", ((UserDetails)auth.getPrincipal()).getUsername());
		
			List<SubscribeDTO> subList2 = subscribeDAO.getSubscribe(map);
			if(subList2.size() > 0)
				map.put("subscribe", 1);
		}
		//글이 구독자 전용일때
		if(dto.getAccessRight().equals("1"))
		{
			//비로그인 상태일때
			if(auth == null)
			{
				map.put("accessRight","1");
			}
			//로그인 상태일때
			else
			{
				map.put("loginedId", ((UserDetails)auth.getPrincipal()).getUsername());
				map.put("id", memberDto.getId());
				List<SubscribeDTO> subList = subscribeDAO.getSubscribe(map);
				//구독중이 아닐때
				if(subList == null || subList.size() == 0)
				{
					map.put("accessRight","1");
				}
				//구독중일때
				else
				{
					map.put("accessRight","0");
				}
				//현재 로그인한 아이디와 글 작성자 아이디가 같을때 || 관리자 아이디일때
				if(map.get("id").toString().equals(((UserDetails)auth.getPrincipal()).getUsername())
					|| "ADMIN".equals(((UserDetails)auth.getPrincipal()).getUsername()))
				{
					map.put("accessRight","0");
				}
			}
		}
		//글이 전체공개일때
		else 
		{
			map.put("accessRight","0");
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
	public String getArtworkList(@RequestParam Map map, @RequestParam int nowPage, Authentication auth)
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
			System.out.println("blogno:"+dto.getBlogNo());
			List<GcsDTO> gcsList = gcsDAO.getListByBlogNo(dto.getBlogNo());
			System.out.println("size:"+gcsList.size());
			try {
				record.put("imgUrl", gcsList.get(0).getFileUrl());
			} catch (IndexOutOfBoundsException e)
			{
				record.put("imgUrl", NO_IMAGE);
			}
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
			record.put("memberNo",dto.getMemberNo());
			
			//memberNo로 memberDTO 가져오기
			MemberDTO memberDto = memberDAO.getMemberByMemberNo(dto.getMemberNo()).get(0);
			record.put("profile",memberDto.getProfilePicture());
			record.put("nickname",memberDto.getNickName());
			record.put("memberId", memberDto.getId());
			//글이 구독자 전용일때
			if(dto.getAccessRight().equals("1"))
			{
				//비로그인 상태일때
				if(auth == null)
				{
					record.put("accessRight","1");
				}
				//로그인 상태일때
				else
				{
					map.put("loginedId", ((UserDetails)auth.getPrincipal()).getUsername());
					map.put("id", memberDto.getId());
					List<SubscribeDTO> subList = subscribeDAO.getSubscribe(map);
					//구독중이 아닐때
					if(subList == null || subList.size() == 0)
					{
						record.put("accessRight","1");
					}
					//구독중일때
					else
					{
						record.put("accessRight","0");
					}
					//현재 로그인한 아이디와 글 작성자 아이디가 같을때 || 관리자 아이디일때
					if(map.get("id").toString().equals(((UserDetails)auth.getPrincipal()).getUsername())
						|| "ADMIN".equals(((UserDetails)auth.getPrincipal()).getUsername()))
					{
						record.put("accessRight","0");
					}
				}
			}
			//글이 전체공개일때
			else 
			{
				record.put("accessRight","0");
			}
			
			collections.add(record);
		}
		System.out.println("getartwork:"+JSONArray.toJSONString(collections).replace("\\/", "/"));
		return JSONArray.toJSONString(collections).replace("\\/", "/");
	}
	
	@RequestMapping("/UploadBlogPost")
	public String UploadBlogPost(@RequestParam Map map) throws ParseException
	{	
		String id = map.get("id").toString();
		String memberNo = memberDAO.getMemberNo(map.get("id").toString());		
		map.put("memberNo", memberNo);
		
		int affected = dao.uploadBlogPost(map);
		//int blogNo = Integer.parseInt(map.get("blogNo").toString());
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
			
			//태그
			obj = parser.parse(map.get("tags").toString());
			jsonObj = (JSONObject) obj;
			gsonMap = gson.fromJson(JSONObject.toJSONString(jsonObj).replace("\\/", "/"),
					new TypeToken<Map<String,List<Map<String,Object>>>>(){}.getType());
			for(int i = 0; i < gsonMap.get("tags").size(); i++)
			{
				String tagName = gsonMap.get("tags").get(i).get("tag").toString();
				map.put("tagName", tagName);
				tagDAO.insertTag(map);
				
				//중복된 태그일시 기존에 있던 태그번호 얻어오기 위해 서비스 한번 더 호출
				String tagNo = tagDAO.getTagNo(map).toString();
				map.put("tagNo", tagNo);
				
				tagRelationDAO.insertBlogTagRelation(map);
				
			}
			
		}
		//현재 글등록 2	번되는 문제때문에 그냥 검색페이지로 리턴
		//return "contents/blog/WritePost.tiles";
		//return "forward:/Blog/"+id;
		return "contents/SearchArtwork.tiles";
	}
	public String updateViewCount(@RequestParam Map map)
	{
		int affected = dao.updateViewCount(map);

		return "updatedCount";
	}
	@RequestMapping(value = "/getArtistList", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getArtistList(@RequestParam Map map, @RequestParam int nowPage, Authentication auth)
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
				if(i == 3)
					break;
				post.put("blogNo", postList.get(i).getBlogNo());
				try {
				post.put("url", gcsDAO.getListByBlogNo(postList.get(i).getBlogNo()).get(0).getFileUrl());
				} catch (IndexOutOfBoundsException e)
				{
					record.put("imgUrl", NO_IMAGE);
				}
				//글이 구독자 전용일때
				if(postList.get(i).getAccessRight().equals("1"))
				{
					//비로그인 상태일때
					if(auth == null)
					{
						post.put("accessRight","1");
					}
					//로그인 상태일때
					else
					{
						map.put("loginedId", ((UserDetails)auth.getPrincipal()).getUsername());
						map.put("id", dto.getId());
						List<SubscribeDTO> subList = subscribeDAO.getSubscribe(map);
						//구독중이 아닐때
						if(subList == null || subList.size() == 0)
						{
							post.put("accessRight","1");
						}
						//구독중일때
						else
						{
							post.put("accessRight","0");
						}
						//현재 로그인한 아이디와 글 작성자 아이디가 같을때 || 관리자 아이디일때
						if(map.get("id").toString().equals(((UserDetails)auth.getPrincipal()).getUsername())
							|| "ADMIN".equals(((UserDetails)auth.getPrincipal()).getUsername()))
						{
							post.put("accessRight","0");
						}
					}
				}
				//글이 전체공개일때
				else 
				{
					post.put("accessRight","0");
				}
				
				posts.add(post);
			}
			record.put("posts", posts);
						
			collections.add(record);
		}
		System.out.println("json:"+JSONArray.toJSONString(collections).replace("\\/", "/"));
		return JSONArray.toJSONString(collections).replace("\\/", "/");
		
	}
	
	//댓글관련
	@ResponseBody
	@RequestMapping(value = "/BlogPost/Comments")
	public String commentajax(@RequestParam Map map,Authentication auth) {
		
		//스프링 시큐리티 이용할 때 아이디 값 가져오는 코드
		map.put("id", ((UserDetails)auth.getPrincipal()).getUsername());
		String memberNo = memberDAO.getMemberNo(map.get("id").toString());
		map.put("memberNo", memberNo);
		dao.insertcomment(map);
		return map.get("blogNo").toString();
	}
	
	@ResponseBody
	@RequestMapping(value="/BlogPost/CommentsList",produces = "text/html; charset=UTF-8")
	public String commentlist(@RequestParam Map map,Model model) {
		//서비스호출
		List<Map> list = dao.selectcomment(map);
		
		for(Map comment:list) {
			comment.put("REPLYPOSTDATE", comment.get("REPLYPOSTDATE").toString().substring(0,10));
		}
		return JSONArray.toJSONString(list).replace("\\/", "/");	
	}
	
	//구독
	@RequestMapping("/Subscribe")
	public String subscribe(@RequestParam Map map)
	{
		String id = map.get("id").toString();
		map.put("targetId", id);
		String loginedId = map.get("loginedId").toString();
		int affected = subscribeDAO.doSubscribe(map);
		
		return "forward:/Blog/"+id;
	}
	@RequestMapping("/Search/Artwork/Image")
	public String searchArtworkImg(@RequestParam String tags, Map map)
	{
		String tagString = tags.substring(0, tags.length()-1).replace("undefined", "");
		map.put("tagString", tagString);
		return "contents/SearchArtworkByImg.tiles";
	}
	@RequestMapping(value = "/ImgTagSearch", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String imgTagSearch(@RequestParam int nowPage, @RequestParam String tagString, Authentication auth)
	{
		String[] tagArr = tagString.split(",");
		Map map = new HashMap();
		map.put("tagArr", tagArr);
		List<String> tagNoList = dao.imgTagSearch(map);
		map.put("tagNoList",tagNoList);
		List<String> blogNoList = dao.tagRelSearch(map); //blogNo만 반환
		map.put("blogNoList",blogNoList);
		
		//페이징을 위한 로직 시작]
	 	//전체 레코드수]		
	 	int totalRecordCount= blogNoList.size();
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
	 	
	 	List<BlogPostDTO> list = dao.getDtoByList(map);
		List<Map> collections = new Vector<Map>();
		for(BlogPostDTO dto : list) {
			Map record = new HashMap();
			//List페이지에선 첫번째 그림만 반환
			List<GcsDTO> gcsList = gcsDAO.getListByBlogNo(dto.getBlogNo());
			//for(GcsDTO gd : gcsList)
			try {
			record.put("imgUrl", gcsList.get(0).getFileUrl());
			} catch (IndexOutOfBoundsException e)
			{
				record.put("imgUrl", NO_IMAGE);
			}
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
			record.put("memberNo",dto.getMemberNo());
			
			//memberNo로 memberDTO 가져오기
			MemberDTO memberDto = memberDAO.getMemberByMemberNo(dto.getMemberNo()).get(0);
			record.put("profile",memberDto.getProfilePicture());
			record.put("nickname",memberDto.getNickName());
			record.put("memberId", memberDto.getId());
			
			//글이 구독자 전용일때
			if(dto.getAccessRight().equals("1"))
			{
				//비로그인 상태일때
				if(auth == null)
				{
					record.put("accessRight","1");
				}
				//로그인 상태일때
				else
				{
					map.put("loginedId", ((UserDetails)auth.getPrincipal()).getUsername());
					map.put("id", memberDto.getId());
					List<SubscribeDTO> subList = subscribeDAO.getSubscribe(map);
					//구독중이 아닐때
					if(subList == null || subList.size() == 0)
					{
						record.put("accessRight","1");
					}
					//구독중일때
					else
					{
						record.put("accessRight","0");
					}
					//현재 로그인한 아이디와 글 작성자 아이디가 같을때 || 관리자 아이디일때
					if(map.get("id").toString().equals(((UserDetails)auth.getPrincipal()).getUsername())
						|| "ADMIN".equals(((UserDetails)auth.getPrincipal()).getUsername()))
					{
						record.put("accessRight","0");
					}
				}
			}
			//글이 전체공개일때
			else 
			{
				record.put("accessRight","0");
			}
			
			collections.add(record);
		}
		//json 배열 반환
		return JSONArray.toJSONString(collections).replace("\\/", "/");
	}
	
}
