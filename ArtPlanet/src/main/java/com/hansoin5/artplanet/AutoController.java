package com.hansoin5.artplanet;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.hansoin5.artplanet.service.impl.MemberDAO;
import com.hansoin5.artplanet.service.impl.ProjectDAO;
import com.hansoin5.artplanet.service.impl.SubscribeDAO;


@Controller
public class AutoController {
	
	
	//셀레니움 적용한 서비스(AutoPayment.class) 주입
	//@Resource(name="autoPayment")
	//private AutoPayment autoPaymentObj;
	
	//member 테이블 접근 객체 주입
	@Resource(name="memberDAO")
	private MemberDAO memberDao;
	
	//Subscribe 테이블 접근 객체 주입
	@Resource(name="subscribeDAO")
	private SubscribeDAO subscribeDAO;
	
	//Project 테이블 접근 객체 주입
	@Resource(name="projectDAO")
	private ProjectDAO projectDAO;
	
	
	// 자동 DB 조회 및 조건에 따른 서비스 호출
	//@Scheduled(cron = "0/30 * * * * ?") // 30초마다 조회
	public void autoPay() {
		System.out.println("정해진 시간마다 계속 메소드 호출");
		//데이터베이스 조회해야 할것(서비스 호출 리스트)
		//1. 크라우드 펀딩 프로젝트 결제: 현재날짜와 마감일이 일치하는 동시에 ( 모금액 - 목표액 )이 0이상인 레코드 조회 
		//2. 정기구독 결제 : ( 현재시각 - 구독시작시각 )이 3분이상인 레코드 조회 // 발표용 3분, 실제 정기구독은 30일이상
		                                                      
		
		  // 정기구독 결제해야하는 레코드가 1개이상 반환될 경우	
		  if(subscribeDAO.checkSubPayRecordCount() >= 1) {// 정기구독결제 자동화 서비스 호출
			  System.out.println("정기구독결제 조회 쿼리 성공");
			  // 셀리니움 적용한 정기구독 결제 메소드 실행 
			  //autoPaymentObj.autoPayment("subscribe"); 
		  }/////
		  
		  // 자동 결제 조건에 맞는 크라우드 펀딩 프로젝트를 1개 이상 찾을시 
		  //if(projectDAO.autoPayGetProjectRecords() >=1 ) { // 프로젝트 모금액 자동결제 서비스 호출
			  //System.out.println("크라우드 펀딩 자동결제 관련  쿼리 성공");
			  // 셀리니움 적용한 크라우드 펀딩 프로젝트 결제 메소드 실행
			  //autoPaymentObj.autoPayment("project");
		  //}/////
	 		
	}///// autoPay()
	 
}/////class
