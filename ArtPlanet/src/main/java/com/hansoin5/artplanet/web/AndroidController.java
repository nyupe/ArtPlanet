package com.hansoin5.artplanet.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hansoin5.artplanet.service.impl.AndroidDAO;
import com.hansoin5.artplanet.service.impl.GcsDAO;
import com.hansoin5.artplanet.service.impl.MemberDAO;

@Controller
public class AndroidController {

	@Resource(name = "androidDAO")
	private AndroidDAO androidDao;

	// GCS 테이블에 접근하여 모든 이미지 URL을 JSON 형태로 반환하는 메소드
	@ResponseBody
	@RequestMapping(value = "/AndroidArrayList", produces = "text/html; charset=UTF-8")
	public String getGCSList(@RequestParam Map map) {
		System.out.println("안드로이드 컨트롤 시작");
		// 서비스호출
		List<Map> list = androidDao.selectPictures(map);
		System.out.println(JSONArray.toJSONString(list).toString());
		System.out.println("안드로이드 컨트롤 끝");
		System.out.println(JSONArray.toJSONString(list));
		return JSONArray.toJSONString(list);
	}
}
