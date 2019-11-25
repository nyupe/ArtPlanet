package com.hansoin5.artplanet.web;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.appengine.repackaged.com.google.gson.Gson;
import com.google.common.reflect.TypeToken;
import com.hansoin5.artplanet.service.ArtClassDTO;
import com.hansoin5.artplanet.service.ClassOpeningDateDTO;
import com.hansoin5.artplanet.service.MemberDTO;
import com.hansoin5.artplanet.service.impl.ArtClassDAO;
import com.hansoin5.artplanet.service.impl.ClassOpeningDateDAO;
import com.hansoin5.artplanet.service.impl.ClassReservationDAO;
import com.hansoin5.artplanet.service.impl.GcsDAO;
import com.hansoin5.artplanet.service.impl.MemberDAO;

@Controller
public class ArtclassController {
	
	//아트클래스 테이블 접근 객체
	@Resource(name = "artClassDAO")
	private ArtClassDAO artClassDAO;
	//아트클래스 개설날짜정보 테이블 접근 객체
	@Resource(name = "classOpeningDateDAO")
	private ClassOpeningDateDAO classOpeningDateDAO;
	//아트클래스 예약정보 테이블 접근 객체
	@Resource(name ="classReservationDAO")
	private ClassReservationDAO classReservationDAO;
	//구글클래스 스토리지 테이블 접근 객체
	@Resource(name = "gcsDAO")
	private GcsDAO gcsDAO;
	//member 테이블 접근 객체
	@Resource(name = "memberDAO")
	private MemberDAO memberDAO;
	
	// 아트클래스 삭제하기
	@RequestMapping(value="/deleteClass", method = RequestMethod.POST)
	@ResponseBody
	public void deleteClass(@RequestParam Map map) {
		//서비스 호출(아트클래스 map에 담긴 classNo에 해당하는 레코드 삭제)
		artClassDAO.delete(map);
	}/////deleteClass()
	
	
	// 아트클래스 예약정보 레코드 생성요청 받음
	@RequestMapping(value="/createReservationRecord", method = RequestMethod.POST)
	public void createReservationRecord(@RequestParam Map map) {
		
		//찍어보기
		Set<String> keys = map.keySet();
		for(String key : keys ) {
			System.out.println("map에 담겨온 키 :"+key+"키에 해당하는 값 :"+map.get(key).toString());
		}///// 잘찍힘 
		
		
		// 아트클래스 개설날짜정보 테이블 일련번호를 문자열에서 -> 숫자로 변환 -> 맵에 담기
		map.put("dateNo",Integer.parseInt(map.get("dateNo").toString()));
		// 아트클래스 개설날짜정보 테이블에서 필요한 정보 가져온 다음 맵에 담기
		map.put("signUpDate", classOpeningDateDAO.selectOne(map).getOpeningDate()); // 개설날짜
		map.put("signUpTime", classOpeningDateDAO.selectOne(map).getOpeningTime()); // 개설시간
		
		// 아트클래스 예약정보 레코드 생성 
		classReservationDAO.insert(map);
		
		
		
	}/////createReservationRecord
	
	
	
	
	
	
	// 생성된 아트클래스에 해당하는 개설날짜정보 가져오기 (ajax 요청 받는 메소드)
	// ajax dataType : json 
	@RequestMapping("/getOpeningDates")
	@ResponseBody
	public String getOpeningDates(@RequestParam Map map, Model model) {
		
		/*
		//ajax 요청에 담겨오는 data 찍어보기
		Set keys = map.keySet();
		for(Object key : keys) {
			System.out.println(key.toString() +" : "+ map.get(key).toString());
		}/////for - Map안에 classNo 정상적으로 들어옴 (확인)
		*/
		
		
		//classNo에 해당하는 cod(ClassOpeningDate : 아트클래스 개설날짜정보)리스트 가져옴
		List<ClassOpeningDateDTO> codList =  classOpeningDateDAO.selectList(map);
		
		
		//JSONArray의 정적 메소드인 toJSONString(List계열 컬렉션)
		//호출시에는 List계열 컬렉션에 반드시 Map계열 컬렉션이 저장되어야 한다]	
			
		List<Map> collections = new Vector<Map>();
		for(ClassOpeningDateDTO codDto: codList) {
			Map record = new HashMap();
			//아트클래스 일련번호
			record.put("classNo",codDto.getClassNo());
			//개설 날짜
			record.put("openingDate",codDto.getOpeningDate());
			//개설 시각
			record.put("openingTime",codDto.getOpeningTime());
			//아트클래스 개설날짜정보 일련번호
			record.put("dateNo",codDto.getDateNo());
			collections.add(record);
		}/////for
		
		
		//반환값 전달
		return JSONArray.toJSONString(collections);
		
	}/////getOpeningDates()
	
	
	
	
	/////아트 클래스 상세보기
	@RequestMapping("/View")
	public String view(@RequestParam String classNo
			, Model model, Map map, Principal principal) {
		
		//맵에 아트클래스 일련번호 담기 -> 밑의 서비스 호출 관련 쿼리문에서 classNo가 필요함
		map.put("classNo",classNo);
		
		//서비스 호출 : 아트클래스 일련번호(classNo)에 해당하는 아트클래스 정보 가져오기
		ArtClassDTO record=artClassDAO.selectOne(map); //데이터 저장 //줄바꿈 처리
		
		//뷰에서 사용할 클래스 일련번호(classNo) 리퀘스트 영역에 저장
		//View 진입점에서 ${classNo}을 ajax 요청에 넣어서 아트클래스 개설날짜정보 테이블 조회
		model.addAttribute("classNo", classNo);
		
		// 아트클래스 등록한 회원번호(memberNo) 리퀘스트 영역에 저장
		//model.addAttribute("classMemberNo",record.getMemberNo());
		
		// map에 아트클래스 만든 아이디 넣기
		map.put("id", memberDAO.getMemberId((record.getMemberNo().toString())));
		// 리퀘스트 영역에 아트클래스 만든 사람 아이디 저장하기
		model.addAttribute("createClassId",memberDAO.getMemberId((record.getMemberNo().toString())));
		
		
		
		Set<String> keys = map.keySet();
		for(String key : keys) {
			System.out.println("키:"+key+"값:"+map.get(key));
		}
		
		// 아트클래스 만든 사람의 정보 가져오기
		MemberDTO artClassCreater = memberDAO.getMemberDTO(map);
		
		// 로그인한 회원의 아이디로 회원번호 가져오기
		model.addAttribute("memberNo", Integer.parseInt(memberDAO.getMemberNo(principal.getName()).toString()));
		
		//뷰에서 사용할 아트클래스 만든 사람정보 리퀘스트 영역에 저장
		model.addAttribute("artClassCreater", artClassCreater);
		
		//뷰에서 사용할 아트클래스 객체를 리퀘스트 영역에 저장
		model.addAttribute("record",record);
		
		//수강료 int형으로 변환 및 화폐단위표시 제거  
		model.addAttribute("fee", Integer.parseInt(record.getTuitionFee().toString().substring(2))); // W표시, 공백 제거
		
		//뷰반환
		return "sub/art_class/View.tiles";
	}/////view()
	
	
	//아트클래스 입력페이지 이동
	@RequestMapping(value = "/WriteClass", method = RequestMethod.GET)
	public String moveArtClassWritePage() {
		System.out.println("--아트클래스 입력페이지 이동  관련 컨트롤러 메소드 진입--");
		return "sub/art_class/WriteClass.tiles";
	}/////moveArtClassWritePage()
	
	
	/* { org.springframework.web.bind.annotation.RequestMethod.POST }  <- 이거 뭐지????*/ 
	//아트클래스 생성처리
	@RequestMapping(value = "/WriteClass", method = RequestMethod.POST )
	public String createArtClass(@RequestParam Map map, HttpServletRequest req) throws ParseException {
		System.out.println("--아트클래스 입력처리 관련 컨트롤러 메소드 진입--");
	    
		// 뷰단에서 넘어오는 값들이 담긴 Map의 키값들 찍어보기
		Set<String> keys = map.keySet();
		for(String key : keys ) {
			System.out.println("뷰단에서 넘어오는 값들이 담긴 Map의 키값들 : "+key+",키값으로 꺼내온 값 : "+map.get(key));
		}/////for
		
		// 아이디로 아트클래스 테이블 레코드 생성에 필요한 회원번호 얻어오기
		int memberNo = Integer.parseInt(memberDAO.getMemberNo(map.get("id").toString()));
		System.out.println("--아이디로 가져온 회원번호:"+memberNo);
		
		// 서비스 호출전 회원번호를 쿼리문 인자로 넣어줄 map에 넣어주기 
		map.put("memberNo", memberNo);
		
		// 아트클래스 테이블에 레코드 생성하기 - 성공 : 2019.11.22
		// 생성되었다면 1반환
		int successInsertRecordcount = artClassDAO.insert(map);
		System.out.println("생성된 아트클래스 레코드 수 : "+ successInsertRecordcount);
		
		System.out.println("삽입되고 map에 담겨나온 classNo:"+ map.get("classNo"));
		  
		
		
	    //뷰에서 입력하고 컨트롤러에 넘어온 날짜값 찍어보기
	    System.out.println("--아트클래스 입력처리 버튼 누를때 들어온 날짜값들:\r\n"+map.get("schedules").toString());
		  
		 
	    //Gson 형태의 값을 맵에 담기위한 자료구조 
	    // 맨 바깥 : Map - 키 : String / 값 : List<Map<String,Object> 
	    // 안쪽(List 안쪽) Map<String,Object> 
	    // 최대 안쪽 : Map - 키 : String / 값 : Ojbect 
	    Map<String, List<Map<String, Object>>> gsonMap = new HashMap<String, List<Map<String, Object>>>();
	  
		//Gson 객체 생성
		Gson gson = new Gson();
		  
		// JSON 파서(해석자) 객체 생성 
		JSONParser jsonParser = new JSONParser(); 
		//뷰 페이지에서  schedules라는 키값으로 담긴 값을 문자열로 변경 후 Json 파서로 Json 형태로 만들어줌 
		//Json 객체를 OJbect에 담는다. (부모클래스는 자식클래스를 모두 담을수 있으니) 
		String test = map.get("schedules").toString();
		//찍어보기(테스트)
		System.out.println(test);
		
		
		Object obj = jsonParser.parse(test);
		  
		//JSON 객체로 형변환 및 JSONObject 타입의 인스턴스 변수에 담기 
		JSONObject jsonObj = (JSONObject) obj;
		  
		//JSON 객체를 문자열로 변환 (fromJson 메소드 이용)(Gson형태에 맞는 문자열)
	  	// -> Gson 형태로 변환 이때 위에선언한 타입(맵안에 리스트 , 리스트안에 맵)으로 변환
		gsonMap = gson.fromJson(JSONObject.toJSONString(jsonObj).replace("\\/", "/") 
				  , new TypeToken<Map<String, List<Map<String, Object>>>>(){}.getType()); 
			
		//gson 구조 파악 예시 찍어보기
		System.out.println("gson 구조 파악 예시 찍어보기:"+gsonMap.get("schedules").get(0).get("schedule"));
		
		// 위에서 생성한 아트클래스 레코드의 아트클래스 일련번호 가져오기
		if ( successInsertRecordcount == 1) { // 아트클래스 생성이 되었다면
			  for (int i = 0; i < gsonMap.get("schedules").size(); i++) { 
				String[] scheduleStrArr = gsonMap.get("schedules").get(i).get("schedule").toString().split(" ");
			  	map.put("openingDate", scheduleStrArr[0]); 
			  	map.put("openingTime", scheduleStrArr[1]); 
			  	
			  	//아트클래스 개설시각 레코드 생성 서비스 호출
			  	//classNo은 클래스 생성시 map에 담아놓음
			  	classOpeningDateDAO.insert(map); 
			  }/////for
		 }/////if
		
		
		// 뷰반환
		return "sub/art_class/WriteClass.tiles";
		
	}/////createArtClass()
	
	
	/* 구글 클라우드 스토리지 저장하는 부분 뺌
	  // 아트클래스에 등록할 이미지들을 위해 다시 gsonMap, gson, jsonParser 객체 초기화 
		  gsonMap = new HashMap<String, List<Map<String, Object>>>(); gson = new Gson(); 
		  jsonParser =  new JSONParser();
		  
		  // 뷰에서 넘어오는 이미지들 문자열로 찍어보기 
		  System.out.println("map.get.img:" + map.get("imgs").toString());
		  
		  // 위에서 날짜와 정보를 gsonMap 객체에 담기위해 했던 작업 반복 obj =
		  jsonParser.parse(map.get("imgs").toString()); jsonObj = (JSONObject) obj;
		  
		  gsonMap = gson.fromJson(JSONObject.toJSONString(jsonObj).replace("\\/", "/"),
		  new TypeToken<Map<String, List<Map<String, Object>>>>() { }.getType());
		  
		  for (int i = 0; i < gsonMap.get("images").size(); i++) { 
			  // gsonMap 객체에서 이미지하나 뽑아서 문자열로 만든뒤(사진 파일 URL) 
			  // URL을 가지고 해당 이미지 일련번호를 가져옴 
			  String fileNo = gcsDAO.getFileNoByURL(gsonMap.get("images").get(i).get("src").toString()); 
			  // 이미지일련번호(fileNo) 서비스 호출때 인자로 넘겨줄 map에 넣기 
			  map.put("fileNo", fileNo); 
			  // 구글 클라우드 스토리지에 이미지에 해당하는 아트클래스 번호를 업데이트 
			  gcsDAO.updateClassNo(map); 
		  	}///// for  
	 */
	
	
	//아트클래스 리스트 출력 
	// :Artclass.jsp 내부의  ajax 요청(/getClassList)을 받는 메소드  ]
	@RequestMapping(value="/getClassList",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getClassList() {
		  //컨트롤러 진입확인 
		  //System.out.println("- ajax 요청받은 아트클래스 목록처리 컨트롤러 메소드 진입");
		 	
		  List<Map> collections = new Vector<Map>();
		  List<ArtClassDTO> list = artClassDAO.selectList();
		  
		  for(ArtClassDTO dto:list) { 
			 
			  Map record = new HashMap(); 
			  
			  //아트클래스 고유번호
			  record.put("classNo", dto.getClassNo());
			  record.put("title",dto.getTitle());
			  record.put("content",dto.getContent());
			  record.put("classLevel",dto.getClassLevel());
			  record.put("timeRequired",dto.getTimeRequired());
			  record.put("numberOfPeople",dto.getNumberOfPeople());
			  
			  record.put("tuitionFee",dto.getTuitionFee().toString());
			  
			  record.put("classAddress",dto.getClassAddress());
			  record.put("detailedAddr",dto.getDetailedAddr());
			  record.put("categorie",dto.getCategorie());
			  
			  collections.add(record);
			  
		  }
		  return JSONArray.toJSONString(collections);
	}/////getClassList()
	
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
	
}/////class
