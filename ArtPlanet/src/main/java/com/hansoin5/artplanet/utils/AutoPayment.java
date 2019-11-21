package com.hansoin5.artplanet.utils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.stereotype.Service;

//셀레니움 라이브러리 사용해보기 
@Service
public class AutoPayment {
	
	//WebDriver
	private WebDriver driver;
	
	//Properties
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	//chromedriver.exe 드라이버 설치시 반드시 자신의 크롬브라우저 버전을 확인 후 해당 브라우저에 대응하는 드라이버를 설치할것
	public static final String WEB_DRIVER_PATH = "D:\\AYJ\\utility\\selenium\\chromedriver_win32\\chromedriver.exe";
	
	//셀리니움 타겟 URL
	private String tartgetUrl;
	
	//페이지 로딩시까지 대기하는 객체 멤버변수
	WebDriverWait wait; 
	
	//접근한 페이지의 DOM객체(Ex. 특정 id를 가진 태그)를 담을 멤버변수 
	private WebElement webElement;
	
	
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
		
		//태그 보일때까지 기다리게하는 객체 생성
		wait = new WebDriverWait(driver,5);
		
		// ArtPlanet 로그인 화면 = targetUrl
		tartgetUrl = "http://localhost:7070/artplanet/Login";
		
	}/////
	
	
	// 관리자 계정으로 로그인 및 구독정기결제 자동화 메소드
	public void autoPayment(String AutoKind) {
		try {
			if(AutoKind == "subscribe") { 
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
				
				
				
				
				//presenceOfElementLocated : 화면과 관계없이 셀리니움이 찾는다
				//visibilityOfElementLocated = 해당 엘리먼트가 보여질떄까지 대기한다. 
				//해당 엘리먼트를가 있는 부분을 화면에 안 띄울 시 코드는 더이상 진행되지않고 무한정 대기
				//TOP의  ADMIN 클릭
				
				webElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"go_admin\"]")));
				webElement.click();
				Thread.sleep(2000); // 2초 쉬고
				
				// 여기에 버튼 처리 과정넣기
				// 사이드 슬라이드 버튼중에 자동으로 결제되야하는 요소가 있는 페이지로 들어가는 버튼 클릭
				// 페이지 이동시 눌러야하는 버튼 다 누른다 
				
				
				
				//관리자 페이지에 있는 로고 누르기:(TOP)이 보이는 페이지로 이동 
				webElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("/html/body/div[1]/div/div[1]/div/div[1]/a[1]")));
				webElement.click();
				Thread.sleep(2000); // 2초 쉬고
				
				//관리자 로그아웃-> 다시 로그인 페이지 대기
				webElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"navbarSupportedContent\"]/ul/li[10]/a")));
				webElement.click();
			}/////if
			
		}/////try
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			//셀리니움으로 오픈한 브라우저 종료
			//driver.close();
			
		}
	}/////autoSubPayment()
	
	
	
	
	
}/////class
