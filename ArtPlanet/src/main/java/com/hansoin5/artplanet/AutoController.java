package com.hansoin5.artplanet;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.hansoin5.artplanet.service.impl.MemberDAO;
import com.hansoin5.artplanet.service.impl.ProjectDAO;
import com.hansoin5.artplanet.service.impl.SubscribeDAO;
import com.hansoin5.artplanet.utils.AutoPayment;


@Controller
public class AutoController {
   
   //셀레니움 적용한 서비스(AutoPayment.class) 주입
	////////////////////////////////////
   @Resource(name="autoPayment")
   private AutoPayment autoPaymentObj;
   /////////////////////////////////////
   
   //member 테이블 접근 객체 주입
   @Resource(name="memberDAO")
   private MemberDAO memberDao;
   
   //Subscribe 테이블 접근 객체 주입
   @Resource(name="subscribeDAO")
   private SubscribeDAO subscribeDAO;
   
   //Project 테이블 접근 객체 주입
   @Resource(name="projectDAO")
   private ProjectDAO projectDAO;
   
   
   
   // 자동 DB 조회 및 조건에 따른 서비스 호출 (프로젝트 실행 한다음 10초후 셀레니움 실행)
   //@Scheduled(fixedDelay = 30000)  //서버와 동시에 시작 후 30초마다 자동 실행 //30000
   public void autoPay() {
      
       // 셀리니움 적용한 정기구독 결제 메소드 실행 
       // 주석처리시 셀레니움 창이 떠도 아무 실행안함
///////////////////////////////////
       autoPaymentObj.autoPayment();
///////////////////////////////////
   }///// autoPay()
    
}/////class