package com.hansoin5.artplanet.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hansoin5.artplanet.service.BlogPostDTO;
import com.hansoin5.artplanet.service.GcsDTO;
import com.hansoin5.artplanet.service.MemberDTO;
import com.hansoin5.artplanet.service.impl.BlogPostDAO;
import com.hansoin5.artplanet.service.impl.GcsDAO;
import com.hansoin5.artplanet.service.impl.MemberDAO;

@Controller
public class AndroidController {
	
	@Resource(name="blogPostDAO")	
	private BlogPostDAO dao;
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	@Resource(name="gcsDAO")	
	private GcsDAO gcsDAO;
	
	// GCS 테이블에 접근하여 모든 이미지 URL을 JSON 형태로 반환하는 메소드
	@RequestMapping(value="/gcsArrayList", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getGCSList(@RequestParam Map map, @RequestParam String fileUrl) {
		
		BlogPostDAO.insert(map);
		
		
		
		
		
		// GCS 테이블에 접근하여 모든 레코드들의 이미지 URL을 가져오는 서비스 호출
		return "";
	}
	
	
	
}
