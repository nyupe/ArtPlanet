package com.hansoin5.artplanet.utils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.stereotype.Service;

//셀레니움 적용 
///////////////////////////////////
///////////////////////////////////
@Service
public class AutoPayment {
   
   //WebDriver
   private WebDriver driver;
   //Properties
   public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
   //chromedriver.exe 드라이버 설치시 반드시 자신의 크롬브라우저 버전을 확인 후 해당 브라우저에 대응하는 드라이버를 설치할것
   public static final String WEB_DRIVER_PATH = "D:\\chromeDriver\\chromedriver.exe";
   //셀리니움 타겟 URL
   private String tartgetUrl;
   //페이지 로딩시까지 대기하는 객체 멤버변수
   WebDriverWait wait; 
   //접근한 페이지의 DOM객체(Ex. 특정 id를 가진 태그)를 담을 멤버변수 
   private WebElement webElement;
   
   
   //무한루프를 탈출할 2개의 count 멤버변수
   private int countSubscribe = 0;
   private int countProject = 0;
   
   
   //기본 생성자
   public AutoPayment() {
      super();
      //System Property SetUp
      System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
      
      //Driver SetUp
      ChromeOptions options = new ChromeOptions();
      options.setCapability("ignoreProtectedModeSettings", true);
      driver = new ChromeDriver();
      
      //셀레니움에 의해 자동화로 열리는 창 최대 크키로
      driver.manage().window().maximize();
      
      // 10초내에 해당 tag를 찾으면 반환, 그렇지 않으면 timeout 발생!
      wait = new WebDriverWait(driver,20);
      
      // ArtPlanet 로그인 화면 = targetUrl
      tartgetUrl = "http://localhost:8080/artplanet/Login";
      
   }/////기본 생성자
   
   
   
   
   
   // 결제 자동화 메소드
   public void autoPayment() {
      try {   
         
         //get page(= 브라우저에서 url을 주소창에 넣은 후 request 한것과 같다)
         //로그인 화면으로 이동
         driver.get(tartgetUrl);
         //타겟 URL("http://localhost:7070/artplanet/Login")에서 DOM의 id속성이 id인 DOM을 객체를 반환
         webElement = driver.findElement(By.id("id"));
         // 관리자 아이디
         String adminId = "ADMIN";
         // 관리자 아이디 입력
         webElement.sendKeys(adminId);
         Thread.sleep(2000); // 2초 쉬고
         
         //타겟 URL("http://localhost:7070/artplanet/Login")에서 DOM의 id속성이 password인 DOM을 객체를 반환
         webElement = driver.findElement(By.id("password"));
         // 관리자 비밀번호
         String adminPassword = "ADMIN";
         // 관리자 비밀번호 입력
         webElement.sendKeys(adminPassword);
         Thread.sleep(2000); // 2초 쉬고
         
         //로그인화면의 로그인 버튼 클릭
         webElement = driver.findElement(By.id("btnLogin"));
         webElement.submit();
         Thread.sleep(2000); // 2초 쉬고
         
         
         // 여기까지 과정 요약 (셀리니움 적용)
         // 로그인 페이지 접속-> 관리자 아이디&비밀번호 입력후 로그인 버튼 클릭처리 -> Spring Security에 의해
         // SearchArtwork.jsp로 이동(로그인 후 디폴트 URL요청에 의해)
         
         
         
         //visibilityOfElementLocated = 해당 엘리먼트가 보여질떄까지 대기한다. 
         //해당 엘리먼트를가 있는 부분을 화면에 안 띄울 시 코드는 더이상 진행되지않고 무한정 대기
         
         //TOP의  ADMIN 클릭
         webElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"go_admin\"]")));
         webElement.click();
         Thread.sleep(2000); // 2초 쉬고
         
            
         // '[BLOG] 정기결제 - 배치키' 클릭
         // 정기구독 페이지로 이동
         
         webElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("/html/body/div[1]/div/div[1]/div/div[2]/div[1]/ul/li[3]/ul/li[2]/a")));
         webElement.click();
         Thread.sleep(2000); // 2초 쉬고
         
            
            
         //정기구독 결제 버튼들 1초시간 두면서 클릭
         
         while(true) { 
            
            Thread.sleep(1000); // 1초
            webElement = wait.until(
                  ExpectedConditions.
                  visibilityOfElementLocated
                  (By.xpath("//*[@id=\"example\"]/tbody/tr[1]/td[9]/button")));
            webElement.click();
            //3초마다 카운트가 1 증가
            countSubscribe++;
            //30초가 넘어갈시 무한루프 빠져나감
            if(countSubscribe >= 10) break;
            //버튼 한번은 클릭되야함
            
         }//while
         
         //구독 버튼 관련 카운트 멤버변수 초기화 - 무한루프 재 탈출을 위해
         countSubscribe = 0; 
         
         
         
         // '[PROJECT] 후원 - 배치키(일회성)' 클릭
         // 정기구독 페이지로 이동
         
         webElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("/html/body/div[1]/div/div[1]/div/div[2]/div[1]/ul/li[3]/ul/li[5]/a")));
         webElement.click();
         Thread.sleep(2000); // 2초 쉬고
         
         //프로젝트 후원해야하는 버튼들 1초시간 두면서 클릭
         
         while(true) { 
        	System.out.println("버튼 클릭전");
            Thread.sleep(3000); // 3초쉬고
            webElement = wait.until(
            		ExpectedConditions
            		.visibilityOfElementLocated(
            				By.xpath("//*[@id=\"example\"]/tbody/tr[1]/td[10]/button")));  
            webElement.click();
            System.out.println("버튼 클릭 후");
            //3초마다 카운트가 1 증가
            countProject++;
            System.out.println("countProject가 10이되면 로그아웃 로직이 시작됨 / countProject :"+countProject);
            //30초가 넘어갈시 무한루프 빠져나감
            if(countProject >= 20) break;
            
         }//while
         
         //프로젝트 자동결제 버튼 관련 카운트 멤버변수 초기화 - 무한루프 재 탈출을 위해
         countProject = 0;
         
         //버튼 다누르고 로그아웃하고 나가기
         //관리자 페이지에 있는 로고 누르기:(TOP)이 보이는 페이지로 이동 
         webElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("/html/body/div[1]/div/div[1]/div/div[1]/a[1]")));
         webElement.click();
         Thread.sleep(2000); // 2초 쉬고
         
         
         //관리자 로그아웃-> 로그인 페이지 대기
         webElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"navbarSupportedContent\"]/ul/li[8]/a")));
         webElement.click();
                  
      }/////try
      catch(Exception e) {
         
         //버튼을 못찾을시 로그아웃하고 나가기
         //관리자 페이지에 있는 로고 누르기:(TOP)이 보이는 페이지로 이동 
         webElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("/html/body/div[1]/div/div[1]/div/div[1]/a[1]")));
         webElement.click();
         
         try {
            Thread.sleep(2000); // 2초 쉬고
         }
         catch (Exception e2) {
            e2.printStackTrace();
         }
         
         //관리자 로그아웃-> 로그인 페이지 대기
         webElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"navbarSupportedContent\"]/ul/li[8]/a")));
         webElement.click();
         
         e.printStackTrace();
         
      }
      finally {
         
         //셀리니움으로 오픈한 브라우저 종료
         //driver.close();
      }
   }/////autoSubPayment()
   
   
   
}/////class