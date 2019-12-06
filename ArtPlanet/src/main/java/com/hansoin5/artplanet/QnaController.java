package com.hansoin5.artplanet;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hansoin5.artplanet.service.QnaDTO;
import com.hansoin5.artplanet.service.impl.QnaDAO;

//Rest를 위한 컨트롤러 추가
/*@PostMapping:POST방식의 요청을 받는다
@GetMapping:GET방식의 요청을 받는다
@PutMapping:Put방식의 요청을 받는다
@DeleteMapping:Delete방식의 요청을 받는다
@PathVariabel:URI 파라미터를 받을때 사용
@RequestBody:컨트롤러 메소드의 인자 타입으로 @RequestBody DTO클래스 변수명 형식으로
             JSON으로 데이타를 받을때 
	     	(RequestBody의 json데이터를 dto로 변환)
@RequestPart: 파일 업로드시 @RequestPart(value="file입력요소의 name값") MultipartFile 변수명
              형식으로 파일 업로드처리시*/

@RestController
public class QnaController {
	
	// 리액트용]
	@Resource(name = "qnaDAO")
	private QnaDAO dao;

	// 등록하기]
	@CrossOrigin
	@PostMapping(value = "/api/contact", produces = "text/plain;charset=UTF-8")
	public String register(@RequestParam Map map){
		System.out.println(map.get("qnaCategory"));
		System.out.println(map.get("id"));
		System.out.println(map.get("qnaTitle"));
		return dao.insert(map) == 1 ? "입력성공" : "입력실패";
	}

	// 전체보기
	@CrossOrigin
	@GetMapping(value = "/api/contacts", produces = "application/json;charset=UTF-8")
	public List<QnaDTO> getContacts(@RequestParam Map map) {
		System.out.println("컨트롤러 들어옴");
		List<QnaDTO> contacts = new Vector<QnaDTO>();
		contacts = dao.selectList(map);
		return contacts;
	}

	// 총레코드수
	@CrossOrigin
	@GetMapping("/api/contacts/total")
	public String getContactsTotal() {
		int total = dao.getTotalRecord(null);
		return String.valueOf(total);
	}

	// 상세보기
	@CrossOrigin
	@GetMapping(value = "/api/contacts/{qnaNo}", produces = "application/json;charset=UTF-8")
	public QnaDTO getContact(@PathVariable String qnaNo) {
		return dao.selectOne(qnaNo);
	}

	// 수정하기
	@CrossOrigin
	@PostMapping(value = "/api/contact/{qnaNo}", produces = "text/plain;charset=UTF-8")
	public String update(@PathVariable String qnaNo, @RequestParam Map map){
		return dao.update(map) == 1 ? "수정성공" : "수정실패";
	}

	@CrossOrigin
	@DeleteMapping(value = "/api/contact", produces = "text/plain;charset=UTF-8")
	public String delete(@RequestParam Map map) {
		return dao.delete(map) == 1 ? "삭제성공" : "삭제실패";
	}

}
