package com.hansoin5.artplanet.web;

import com.google.appengine.repackaged.com.google.gson.JsonObject;
import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.hansoin5.artplanet.service.ArtClassDTO;
import com.hansoin5.artplanet.service.ClassOpeningDateDTO;
import com.hansoin5.artplanet.service.GcsDTO;
import com.hansoin5.artplanet.service.PayDTO;
import com.hansoin5.artplanet.service.impl.ArtClassDAO;
import com.hansoin5.artplanet.service.impl.ClassOpeningDateDAO;
import com.hansoin5.artplanet.service.impl.GcsDAO;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.security.config.annotation.authentication.configurers.userdetails.DaoAuthenticationConfigurer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ArtclassController {
	@Resource(name = "artClassDAO")
	private ArtClassDAO artClassDAO;
	@Resource(name = "classOpeningDateDAO")
	private ClassOpeningDateDAO classOpeningDateDAO;
	@Resource(name = "gcsDAO")
	private GcsDAO gcsDAO;
	
	
	
	
	@RequestMapping("/View")
	public String view(@RequestParam String classNo,Model model, Map map) {
		
		//맵에 클래스 고유번호 담기
		map.put("classNo",classNo);
		//map.put("memberNo",memberNo);
		//서비스 호출
		ArtClassDTO record=artClassDAO.selectOne(map); //데이터 저장 //줄바꿈 처리
		System.out.println("dao에서 데이터 컨트롤러로 가져옴 성공");
		//record.setContent(record.getContent().replace("\r\n", "<br/>"));
		model.addAttribute("record",record);
			 
		
		return "sub/art_class/View.tiles";
	}/////

	//입력
	@RequestMapping(value = "/WriteClass", method = { org.springframework.web.bind.annotation.RequestMethod.GET })
	public String moveViewinput() {
		return "sub/art_class/WriteClass.tiles";
	}
	
	//artclass(list)페이지
	@RequestMapping(value = "/WriteClass", method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	public String viewinputOK(@RequestParam Map map, HttpServletRequest req) throws ParseException {
		/*
		 * Map<String, String> arrMap = new TreeMap();
		 * 
		 * Set set = map.entrySet(); Iterator iterator = set.iterator(); while
		 * (iterator.hasNext()) { System.out.println(iterator.next()); }
		 * 
		 */
		System.out.println("writeClass");
		//System.out.println("memberNo:"+map.get("memberNo"));
	    map.put("memberNo", 2);
	    //JSON형태 문자열 자바객체로 변환하기
		Map<String,List<Map<String,Object>>> gsonMap2 = new HashMap<String, List<Map<String,Object>>>();
		Gson gson2 = new Gson();
		JSONParser parser2 = new JSONParser();
		System.out.println("map.get.schd:"+map.get("schedules").toString());
		Object obj2 = parser2.parse(map.get("schedules").toString());
		JSONObject jsonObj2 = (JSONObject) obj2;
		
		gsonMap2 = gson2.fromJson(JSONObject.toJSONString(jsonObj2).replace("\\/", "/"),
				new TypeToken<Map<String,List<Map<String,Object>>>>(){}.getType());
		/////////////////////////////
		System.out.println("jsonObj2:"+JSONObject.toJSONString(jsonObj2).replace("\\/", "/"));
		
		if (this.artClassDAO.insert(map) == 1) {
			for (int i = 0; i < gsonMap2.get("schedules").size(); i++) {
				String[] scheduleStrArr = gsonMap2.get("schedules").get(i).get("schedule").toString().split(" ");
				map.put("openingDate", scheduleStrArr[0]);
				map.put("openingTime", scheduleStrArr[1]);
				System.out.println("classNo:"+map.get("classNo"));
				this.classOpeningDateDAO.insert(map);
			}
			//JSON형태 문자열 자바객체로 변환하기
			Map<String,List<Map<String,Object>>> gsonMap = new HashMap<String, List<Map<String,Object>>>();
			
			Gson gson = new Gson();
			JSONParser parser = new JSONParser();
			System.out.println("map.get.img:"+map.get("imgs").toString());
			Object obj = parser.parse(map.get("imgs").toString());
			JSONObject jsonObj = (JSONObject) obj;
			
			gsonMap = gson.fromJson(JSONObject.toJSONString(jsonObj).replace("\\/", "/"),
					new TypeToken<Map<String,List<Map<String,Object>>>>(){}.getType());
			/////////////////////////////
			for(int i = 0; i < gsonMap.get("images").size(); i++)
			{
				String fileNo = gcsDAO.getFileNoByURL(gsonMap.get("images").get(i).get("src").toString());
				map.put("fileNo", fileNo);
				gcsDAO.updateClassNo(map);
			}
			System.out.println("jsonObj:"+JSONObject.toJSONString(jsonObj).replace("\\/", "/"));
			
		}
		return "sub/art_class/WriteClass.tiles";
		
	}
	
	// 목록 처리]
	@RequestMapping(value="/getClassList",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getClassList() {
		System.out.println("controller 들어옴");

		
		  List<Map> collections = new Vector<Map>();
		  
		  
		  List<ArtClassDTO> list = artClassDAO.selectList();
		  
		  for(ArtClassDTO dto:list) { 
			 
			  Map record = new HashMap(); 
			  
			  List<GcsDTO> gcsList = gcsDAO.getListByClassNo(dto.getClassNo());
			  //Map map = new HashMap();
			
			  //record.put("memberNo",2);
			  System.out.println("dto.getClassNo():"+dto.getClassNo());
			  System.out.println("dto.getMemberNo():"+dto.getMemberNo());
			  //아트클래스 고유번호
			  record.put("classNo", dto.getClassNo());
			  record.put("title",dto.getTitle());
			  record.put("content",dto.getContent());
			  record.put("classLevel",dto.getClassLevel());
			  record.put("timeRequired",dto.getTimeRequired());
			  record.put("numberOfPeople",dto.getNumberOfPeople());
			  record.put("tuitionFee",dto.getTuitionFee());
			  //record.put("dateAndTime",dto.getDateAndTime());
			  record.put("classAddress",dto.getClassAddress());
			  record.put("detailedAddr",dto.getDetailedAddr());
			  record.put("categorie",dto.getCategorie());
			 // record.put("memberNo",dto.getMemberNo());
			
			  //record.put("imageUrl",gcsList.get(0).getFileUrl());
			  
			  //map.put("classNo", dto.getClassNo());
			 
		  //List<GcsDTO> gcsDTOList = gcsDAO.getListByClass(map);
		  
		  //record.put("gcsDTOList",gcsDTOList);
		 /* 
		  List<ClassOpeningDateDTO> timeList = classOpeningDateDAO.selectList(map);
		  
		  record.put("timeList",timeList);
		  
		  collections.add(record); 
		  */
			  collections.add(record);
			  
		  }
		  
		 
		  return JSONArray.toJSONString(collections);
		 	
	}
/*
	
 //수정폼으로 이동 및 수정처리]
	 
	  @RequestMapping("ClassEdit") 
	  public String edit(HttpServletRequest req,@RequestParam Map map) {
	  if(req.getMethod().equals("GET")) {//수정폼으로 이동 //서비스 호출]
	  ArtClassDTO record=artClassDAO.selectOne(map); //데이타 저장] 
	  req.setAttribute("record",record); //수정 폼으로 이동] 
	  return "ClassEdit.tiles"; 
	  } //수정처리후 메시지 뿌려주는(Message.jsp)로 이동 
	  int sucFail=artClassDAO.update(map);
	 req.setAttribute("WHERE", "EDT"); req.setAttribute("SUCFAIL", sucFail);
	 return "ClassMessage"; 
	 }////////////////// //삭제처리]
	 
	 @RequestMapping("ClassEdit") public String delete(@RequestParam Map map,Model model) { //서비스 호출] 
	int sucFail=artClassDAO.delete(map); //데이타저장] 
	model.addAttribute("SUCFAIL", sucFail); //뷰정보 반환] 
	return "ClassMessage"; 
	} */
}
