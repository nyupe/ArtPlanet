
/* Drop Tables */

DROP TABLE CLASSOPENINGDATE CASCADE CONSTRAINTS;
DROP TABLE CLASSRESERVATION CASCADE CONSTRAINTS;
DROP TABLE GCS CASCADE CONSTRAINTS;
DROP TABLE ARTCLASS CASCADE CONSTRAINTS;
DROP TABLE AUTH_SECURITY CASCADE CONSTRAINTS;
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE TAGRELATION CASCADE CONSTRAINTS;
DROP TABLE BLOGPOST CASCADE CONSTRAINTS;
DROP TABLE CANCEL CASCADE CONSTRAINTS;
DROP TABLE Pay CASCADE CONSTRAINTS;
DROP TABLE PROJAUTH CASCADE CONSTRAINTS;
DROP TABLE PROJECTREWARD CASCADE CONSTRAINTS;
DROP TABLE PROJECTSUPPORT CASCADE CONSTRAINTS;
DROP TABLE PROJECT CASCADE CONSTRAINTS;
DROP TABLE QNA CASCADE CONSTRAINTS;
DROP TABLE RECAUTH CASCADE CONSTRAINTS;
DROP TABLE RECPAY CASCADE CONSTRAINTS;
DROP TABLE SUBSCRIBE CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE TAG CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_ARTCLASS_classNo;
DROP SEQUENCE SEQ_ATTACHFILE_attachfileNo;
DROP SEQUENCE SEQ_ATTACHIMAGE_imageNo;
DROP SEQUENCE SEQ_AUTH_SECURITY_authorityNo;
DROP SEQUENCE SEQ_BLOGPOST_blogNo;
DROP SEQUENCE SEQ_CATEGORIE_categorieNo;
DROP SEQUENCE SEQ_CLASSOPENINGDATE_DateNo;
DROP SEQUENCE SEQ_CLASSRESERVATION_classReservationNo;
DROP SEQUENCE SEQ_GCS_fileNo;
DROP SEQUENCE SEQ_HASHTAG_tagNo;
DROP SEQUENCE SEQ_MEMBER_memberNo;
DROP SEQUENCE SEQ_PROJECTREWARD_projectRewardNo;
DROP SEQUENCE SEQ_PROJECTSUPPORT_projectSupportNo;
DROP SEQUENCE SEQ_PROJECT_projectNo;
DROP SEQUENCE SEQ_QNA_qnaNo;
DROP SEQUENCE SEQ_REPLY_replyNo;
DROP SEQUENCE SEQ_STORAGE_fileNo;
DROP SEQUENCE SEQ_SUBSCRIBE_subscribeNo;
DROP SEQUENCE SEQ_TAG_tagNo;




/* Create Sequences */

CREATE SEQUENCE SEQ_ARTCLASS_classNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ATTACHFILE_attachfileNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ATTACHIMAGE_imageNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_AUTH_SECURITY_authorityNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_BLOGPOST_blogNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_CATEGORIE_categorieNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_CLASSOPENINGDATE_DateNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_CLASSRESERVATION_classReservationNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_GCS_fileNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_HASHTAG_tagNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_MEMBER_memberNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_PROJECTREWARD_projectRewardNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_PROJECTSUPPORT_projectSupportNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_PROJECT_projectNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_QNA_qnaNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_REPLY_replyNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_STORAGE_fileNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SUBSCRIBE_subscribeNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_TAG_tagNo INCREMENT BY 1 START WITH 1;



/* Create Tables */

-- 아트클래스
CREATE TABLE ARTCLASS
(
	-- 클래스 글번호
	classNo number NOT NULL,
	-- 글제목
	title nvarchar2(30),
	-- 글내용
	content nvarchar2(2000),
	-- 인원수
	numberOfPeople number,
	-- 수강료
	tuitionFee number,
	-- 주소
	classAddress nvarchar2(50),
	-- 상세주소
	detailedAddr nvarchar2(100),
	-- 난이도
	classLevel nvarchar2(10),
	-- 소요시간
	timeRequired nvarchar2(20),
	-- 카테고리
	Categorie nvarchar2(30),
	-- 회원번호
	memberNo number NOT NULL,
	PRIMARY KEY (classNo)
);


-- 권한 테이블
CREATE TABLE AUTH_SECURITY
(
	-- 권한번호
	authorityNo number NOT NULL,
	-- 권한명
	authority nvarchar2(20) DEFAULT 'ROLE_USER',
	-- 회원번호
	memberNo number NOT NULL,
	-- 회원 활동승인여부
	enabled number DEFAULT 1,
	-- 아이디
	id nvarchar2(50) NOT NULL UNIQUE,
	PRIMARY KEY (authorityNo)
);


-- 블로그총합게시판
CREATE TABLE BLOGPOST
(
	-- 글번호
	blogNo number NOT NULL,
	-- 글제목
	title nvarchar2(30),
	-- 글내용
	content nvarchar2(2000),
	-- 작성일
	postDate date DEFAULT SYSDATE,
	-- 조회수
	viewCount number DEFAULT 0,
	-- 카테고리
	Categorie nvarchar2(30),
	-- 열람권한
	accessRight number(5),
	-- 회원번호
	memberNo number NOT NULL,
	PRIMARY KEY (blogNo)
);


-- 결제취소 테이블
CREATE TABLE CANCEL
(
	-- 거래번호
	tno nvarchar2(20) NOT NULL,
	-- 취소응답코드
	res_cd nvarchar2(10),
	-- 취소메시지
	res_msg nvarchar2(50),
	-- 회원번호
	memberNo number NOT NULL,
	PRIMARY KEY (tno)
);


-- 클래스개설날짜정보
CREATE TABLE CLASSOPENINGDATE
(
	-- 날짜정보 번호
	DateNo number NOT NULL,
	-- 개설날짜
	openingDate date,
	-- 개설시각
	openingTime date,
	-- 클래스 글번호
	classNo number NOT NULL,
	PRIMARY KEY (DateNo)
);


-- 클래스예약정보
CREATE TABLE CLASSRESERVATION
(
	-- 예약정보번호
	classReservationNo number NOT NULL,
	-- 수강날짜
	signupDate nvarchar2(20),
	-- 수강시간
	signupTime nvarchar2(20),
	-- 회원번호
	memberNo number NOT NULL,
	-- 클래스 글번호
	classNo number NOT NULL,
	PRIMARY KEY (classReservationNo)
);


-- 구글 클라우드 스토리지
CREATE TABLE GCS
(
	-- 파일번호
	fileNo number NOT NULL,
	-- 오리지날 파일명
	fileName nvarchar2(200) NOT NULL,
	-- 스토리지 파일주소
	fileUrl nvarchar2(500) NOT NULL,
	-- 파일 다운로드 주소
	downloadUrl nvarchar2(500) NOT NULL,
	-- 파일크기
	fileSize number NOT NULL,
	-- 글번호
	blogNo number,
	-- 프로젝트 글번호
	projectNo number,
	-- 클래스 글번호
	classNo number,
	-- 회원번호
	memberNo number,
	PRIMARY KEY (fileNo)
);


-- 회원
CREATE TABLE MEMBER
(
	-- 회원번호
	memberNo number NOT NULL,
	-- 아이디
	id nvarchar2(50) UNIQUE,
	-- 비밀번호
	password nvarchar2(15),
	-- 별명
	nickName nvarchar2(10),
	-- 이름
	name nvarchar2(10),
	-- 핸드폰번호
	phoneNumber nvarchar2(13),
	-- 주소
	address nvarchar2(30),
	-- 가입일
	membershipDate date DEFAULT SYSDATE,
	-- 생년월일
	birth nvarchar2(11),
	-- 프로필사진_서버파일명
	profilePicture varchar2(500),
	-- 대문사진_서버파일명
	mainPicture varchar2(500),
	-- 소개글
	introContent nvarchar2(100),
	-- 구독료
	SubscriptionFee number,
	PRIMARY KEY (memberNo)
);


-- 결제테이블
CREATE TABLE Pay
(
	-- 거래번호
	tno nvarchar2(20),
	-- 주문번호
	ordr_idxx nvarchar2(40) NOT NULL,
	-- 결제금액
	good_mny number,
	-- 상품명
	good_name nvarchar2(20),
	-- 주문자명
	buyr_name nvarchar2(10),
	-- 전화번호
	buyr_tel1 nvarchar2(15),
	-- 핸드폰번호
	buyr_tel2 nvarchar2(20),
	-- 주문자이메일주소
	buyr_mail nvarchar2(30),
	-- 카드명
	card_name nvarchar2(10),
	-- 승인시간
	app_time nvarchar2(20),
	-- 승인번호
	app_no nvarchar2(10),
	-- 회원번호
	memberNo number NOT NULL,
	PRIMARY KEY (ordr_idxx)
);


-- 프로젝트인증 테이블
CREATE TABLE PROJAUTH
(
	-- 주문번호
	ordr_idxx nvarchar2(50) NOT NULL,
	-- 인증응답코드
	res_cd nvarchar2(20),
	-- 배치키
	batch_key nvarchar2(20),
	-- 카드코드
	card_cd nvarchar2(10),
	-- 주문자명
	buyr_name nvarchar2(30),
	-- 최근결제시간
	app_time nvarchar2(20),
	-- 회원번호
	memberNo number NOT NULL,
	-- 프로젝트후원번호
	projectSupportNo number NOT NULL,
	PRIMARY KEY (ordr_idxx)
);


-- 프로젝트
CREATE TABLE PROJECT
(
	-- 프로젝트 글번호
	projectNo number NOT NULL,
	-- 글제목
	title nvarchar2(30),
	-- 글내용
	content nvarchar2(2000),
	-- 작성일
	postDate date DEFAULT SYSDATE,
	-- 마감일
	deadline date,
	-- 목표액수
	targetFigure number,
	-- 회원번호
	memberNo number NOT NULL,
	PRIMARY KEY (projectNo)
);


-- 프로젝트보상정보
CREATE TABLE PROJECTREWARD
(
	-- 프로젝트보상정보 번호
	projectRewardNo number NOT NULL,
	-- 보상내용
	rewardContent nvarchar2(2000),
	-- 후원액수단계
	supportStep number,
	-- 프로젝트 글번호
	projectNo number,
	PRIMARY KEY (projectRewardNo)
);


-- 프로젝트후원정보
CREATE TABLE PROJECTSUPPORT
(
	-- 프로젝트후원번호
	projectSupportNo number NOT NULL,
	-- 후원액수
	projectSupportSum number,
	-- 후원일
	projectSupportDate date,
	-- 회원번호
	memberNo number NOT NULL,
	-- 프로젝트 글번호
	projectNo number NOT NULL,
	PRIMARY KEY (projectSupportNo)
);


-- QNA 게시판
CREATE TABLE QNA
(
	-- 글번호
	qnaNo number NOT NULL,
	-- 글제목
	qnaTitle nvarchar2(100) NOT NULL,
	-- 글내용
	qnaContent nvarchar2(2000) NOT NULL,
	-- 작성일
	qnaPostdate date DEFAULT SYSDATE,
	-- 답변여부
	qnaChecked number(10) DEFAULT 0 NOT NULL,
	-- 카테고리
	qnaCategory nvarchar2(50) NOT NULL,
	-- 회원번호
	memberNo number NOT NULL,
	PRIMARY KEY (qnaNo)
);


-- 정기인증 테이블
CREATE TABLE RECAUTH
(
	-- 주문번호
	ordr_idxx nvarchar2(50) NOT NULL,
	-- 인증응답코드
	res_cd nvarchar2(10),
	-- 배치키
	batch_key nvarchar2(20),
	-- 카드코드
	card_cd nvarchar2(10),
	-- 주문자명
	buyr_name nvarchar2(30),
	-- 최근결제시간
	app_time nvarchar2(30),
	-- 회원번호
	memberNo number NOT NULL,
	-- 구독일련번호
	subscribeNo number NOT NULL,
	PRIMARY KEY (ordr_idxx)
);


-- 정기결제 테이블
CREATE TABLE RECPAY
(
	-- 거래번호
	tno nvarchar2(20),
	-- 주문번호
	ordr_idxx nvarchar2(40) NOT NULL,
	-- 결제금액
	good_mny number,
	-- 상품명
	good_name nvarchar2(20),
	-- 주문자명
	buyr_name nvarchar2(10),
	-- 전화번호
	buyr_tel1 nvarchar2(15),
	-- 핸드폰번호
	buyr_tel2 nvarchar2(20),
	-- 주문자이메일주소
	buyr_mail nvarchar2(30),
	-- 카드명
	card_name nvarchar2(10),
	-- 승인시간
	app_time nvarchar2(20),
	-- 승인번호
	app_no nvarchar2(10),
	-- 응답코드
	res_cd nvarchar2(10),
	-- 회원번호
	memberNo number NOT NULL,
	PRIMARY KEY (ordr_idxx)
);


-- 댓글
CREATE TABLE REPLY
(
	-- 댓글번호
	replyNo number NOT NULL,
	-- 댓글내용
	replyContent nvarchar2(200),
	-- 댓글 작성일
	replyPostDate date DEFAULT SYSDATE,
	-- 회원번호
	memberNo number NOT NULL,
	-- 글번호
	blogNo number,
	-- 프로젝트 글번호
	projectNo number,
	PRIMARY KEY (replyNo)
);


-- 구독
CREATE TABLE SUBSCRIBE
(
	-- 구독일련번호
	subscribeNo number NOT NULL,
	-- 구독시작날짜
	subscribeStartDate date DEFAULT SYSDATE,
	-- 피구독회원번호
	targetedMemberNo number NOT NULL,
	-- 구독회원번호
	memberNo number NOT NULL,
	PRIMARY KEY (subscribeNo)
);


-- 태그
CREATE TABLE TAG
(
	-- 태그번호
	tagNo number NOT NULL,
	-- 태그명
	tagName varchar2(20),
	PRIMARY KEY (tagNo)
);


-- 태그 관계
CREATE TABLE TAGRELATION
(
	-- 태그번호
	tagNo number,
	-- 글번호
	blogNo number,
	-- 프로젝트 글번호
	projectNo number
);



/* Create Foreign Keys */

ALTER TABLE CLASSOPENINGDATE
	ADD FOREIGN KEY (classNo)
	REFERENCES ARTCLASS (classNo)
;


ALTER TABLE CLASSRESERVATION
	ADD FOREIGN KEY (classNo)
	REFERENCES ARTCLASS (classNo)
;


ALTER TABLE GCS
	ADD FOREIGN KEY (classNo)
	REFERENCES ARTCLASS (classNo)
;


ALTER TABLE GCS
	ADD FOREIGN KEY (blogNo)
	REFERENCES BLOGPOST (blogNo)
;


ALTER TABLE REPLY
	ADD FOREIGN KEY (blogNo)
	REFERENCES BLOGPOST (blogNo)
;


ALTER TABLE TAGRELATION
	ADD FOREIGN KEY (blogNo)
	REFERENCES BLOGPOST (blogNo)
;


ALTER TABLE ARTCLASS
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE AUTH_SECURITY
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE AUTH_SECURITY
	ADD FOREIGN KEY (id)
	REFERENCES MEMBER (id)
;


ALTER TABLE BLOGPOST
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE CANCEL
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE CLASSRESERVATION
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE GCS
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE Pay
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE PROJAUTH
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE PROJECT
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE PROJECTSUPPORT
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE QNA
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE RECAUTH
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE RECPAY
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE REPLY
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE SUBSCRIBE
	ADD FOREIGN KEY (targetedMemberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE SUBSCRIBE
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE GCS
	ADD FOREIGN KEY (projectNo)
	REFERENCES PROJECT (projectNo)
;


ALTER TABLE PROJECTREWARD
	ADD FOREIGN KEY (projectNo)
	REFERENCES PROJECT (projectNo)
;


ALTER TABLE PROJECTSUPPORT
	ADD FOREIGN KEY (projectNo)
	REFERENCES PROJECT (projectNo)
;


ALTER TABLE REPLY
	ADD FOREIGN KEY (projectNo)
	REFERENCES PROJECT (projectNo)
;


ALTER TABLE TAGRELATION
	ADD FOREIGN KEY (projectNo)
	REFERENCES PROJECT (projectNo)
;


ALTER TABLE PROJAUTH
	ADD FOREIGN KEY (projectSupportNo)
	REFERENCES PROJECTSUPPORT (projectSupportNo)
;


ALTER TABLE RECAUTH
	ADD FOREIGN KEY (subscribeNo)
	REFERENCES SUBSCRIBE (subscribeNo)
;


ALTER TABLE TAGRELATION
	ADD FOREIGN KEY (tagNo)
	REFERENCES TAG (tagNo)
;



/* Comments */

COMMENT ON TABLE ARTCLASS IS '아트클래스';
COMMENT ON COLUMN ARTCLASS.classNo IS '클래스 글번호';
COMMENT ON COLUMN ARTCLASS.title IS '글제목';
COMMENT ON COLUMN ARTCLASS.content IS '글내용';
COMMENT ON COLUMN ARTCLASS.numberOfPeople IS '인원수';
COMMENT ON COLUMN ARTCLASS.tuitionFee IS '수강료';
COMMENT ON COLUMN ARTCLASS.classAddress IS '주소';
COMMENT ON COLUMN ARTCLASS.detailedAddr IS '상세주소';
COMMENT ON COLUMN ARTCLASS.classLevel IS '난이도';
COMMENT ON COLUMN ARTCLASS.timeRequired IS '소요시간';
COMMENT ON COLUMN ARTCLASS.Categorie IS '카테고리';
COMMENT ON COLUMN ARTCLASS.memberNo IS '회원번호';
COMMENT ON TABLE AUTH_SECURITY IS '권한 테이블';
COMMENT ON COLUMN AUTH_SECURITY.authorityNo IS '권한번호';
COMMENT ON COLUMN AUTH_SECURITY.authority IS '권한명';
COMMENT ON COLUMN AUTH_SECURITY.memberNo IS '회원번호';
COMMENT ON COLUMN AUTH_SECURITY.enabled IS '회원 활동승인여부';
COMMENT ON COLUMN AUTH_SECURITY.id IS '아이디';
COMMENT ON TABLE BLOGPOST IS '블로그총합게시판';
COMMENT ON COLUMN BLOGPOST.blogNo IS '글번호';
COMMENT ON COLUMN BLOGPOST.title IS '글제목';
COMMENT ON COLUMN BLOGPOST.content IS '글내용';
COMMENT ON COLUMN BLOGPOST.postDate IS '작성일';
COMMENT ON COLUMN BLOGPOST.viewCount IS '조회수';
COMMENT ON COLUMN BLOGPOST.Categorie IS '카테고리';
COMMENT ON COLUMN BLOGPOST.accessRight IS '열람권한';
COMMENT ON COLUMN BLOGPOST.memberNo IS '회원번호';
COMMENT ON TABLE CANCEL IS '결제취소 테이블';
COMMENT ON COLUMN CANCEL.tno IS '거래번호';
COMMENT ON COLUMN CANCEL.res_cd IS '취소응답코드';
COMMENT ON COLUMN CANCEL.res_msg IS '취소메시지';
COMMENT ON COLUMN CANCEL.memberNo IS '회원번호';
COMMENT ON TABLE CLASSOPENINGDATE IS '클래스개설날짜정보';
COMMENT ON COLUMN CLASSOPENINGDATE.DateNo IS '날짜정보 번호';
COMMENT ON COLUMN CLASSOPENINGDATE.openingDate IS '개설날짜';
COMMENT ON COLUMN CLASSOPENINGDATE.openingTime IS '개설시각';
COMMENT ON COLUMN CLASSOPENINGDATE.classNo IS '클래스 글번호';
COMMENT ON TABLE CLASSRESERVATION IS '클래스예약정보';
COMMENT ON COLUMN CLASSRESERVATION.classReservationNo IS '예약정보번호';
COMMENT ON COLUMN CLASSRESERVATION.signupDate IS '수강날짜';
COMMENT ON COLUMN CLASSRESERVATION.signupTime IS '수강시간';
COMMENT ON COLUMN CLASSRESERVATION.memberNo IS '회원번호';
COMMENT ON COLUMN CLASSRESERVATION.classNo IS '클래스 글번호';
COMMENT ON TABLE GCS IS '구글 클라우드 스토리지';
COMMENT ON COLUMN GCS.fileNo IS '파일번호';
COMMENT ON COLUMN GCS.fileName IS '오리지날 파일명';
COMMENT ON COLUMN GCS.fileUrl IS '스토리지 파일주소';
COMMENT ON COLUMN GCS.downloadUrl IS '파일 다운로드 주소';
COMMENT ON COLUMN GCS.fileSize IS '파일크기';
COMMENT ON COLUMN GCS.blogNo IS '글번호';
COMMENT ON COLUMN GCS.projectNo IS '프로젝트 글번호';
COMMENT ON COLUMN GCS.classNo IS '클래스 글번호';
COMMENT ON COLUMN GCS.memberNo IS '회원번호';
COMMENT ON TABLE MEMBER IS '회원';
COMMENT ON COLUMN MEMBER.memberNo IS '회원번호';
COMMENT ON COLUMN MEMBER.id IS '아이디';
COMMENT ON COLUMN MEMBER.password IS '비밀번호';
COMMENT ON COLUMN MEMBER.nickName IS '별명';
COMMENT ON COLUMN MEMBER.name IS '이름';
COMMENT ON COLUMN MEMBER.phoneNumber IS '핸드폰번호';
COMMENT ON COLUMN MEMBER.address IS '주소';
COMMENT ON COLUMN MEMBER.membershipDate IS '가입일';
COMMENT ON COLUMN MEMBER.birth IS '생년월일';
COMMENT ON COLUMN MEMBER.profilePicture IS '프로필사진_서버파일명';
COMMENT ON COLUMN MEMBER.mainPicture IS '대문사진_서버파일명';
COMMENT ON COLUMN MEMBER.introContent IS '소개글';
COMMENT ON COLUMN MEMBER.SubscriptionFee IS '구독료';
COMMENT ON TABLE Pay IS '결제테이블';
COMMENT ON COLUMN Pay.tno IS '거래번호';
COMMENT ON COLUMN Pay.ordr_idxx IS '주문번호';
COMMENT ON COLUMN Pay.good_mny IS '결제금액';
COMMENT ON COLUMN Pay.good_name IS '상품명';
COMMENT ON COLUMN Pay.buyr_name IS '주문자명';
COMMENT ON COLUMN Pay.buyr_tel1 IS '전화번호';
COMMENT ON COLUMN Pay.buyr_tel2 IS '핸드폰번호';
COMMENT ON COLUMN Pay.buyr_mail IS '주문자이메일주소';
COMMENT ON COLUMN Pay.card_name IS '카드명';
COMMENT ON COLUMN Pay.app_time IS '승인시간';
COMMENT ON COLUMN Pay.app_no IS '승인번호';
COMMENT ON COLUMN Pay.memberNo IS '회원번호';
COMMENT ON TABLE PROJAUTH IS '프로젝트인증 테이블';
COMMENT ON COLUMN PROJAUTH.ordr_idxx IS '주문번호';
COMMENT ON COLUMN PROJAUTH.res_cd IS '인증응답코드';
COMMENT ON COLUMN PROJAUTH.batch_key IS '배치키';
COMMENT ON COLUMN PROJAUTH.card_cd IS '카드코드';
COMMENT ON COLUMN PROJAUTH.buyr_name IS '주문자명';
COMMENT ON COLUMN PROJAUTH.app_time IS '최근결제시간';
COMMENT ON COLUMN PROJAUTH.memberNo IS '회원번호';
COMMENT ON COLUMN PROJAUTH.projectSupportNo IS '프로젝트후원번호';
COMMENT ON TABLE PROJECT IS '프로젝트';
COMMENT ON COLUMN PROJECT.projectNo IS '프로젝트 글번호';
COMMENT ON COLUMN PROJECT.title IS '글제목';
COMMENT ON COLUMN PROJECT.content IS '글내용';
COMMENT ON COLUMN PROJECT.postDate IS '작성일';
COMMENT ON COLUMN PROJECT.deadline IS '마감일';
COMMENT ON COLUMN PROJECT.targetFigure IS '목표액수';
COMMENT ON COLUMN PROJECT.memberNo IS '회원번호';
COMMENT ON TABLE PROJECTREWARD IS '프로젝트보상정보';
COMMENT ON COLUMN PROJECTREWARD.projectRewardNo IS '프로젝트보상정보 번호';
COMMENT ON COLUMN PROJECTREWARD.rewardContent IS '보상내용';
COMMENT ON COLUMN PROJECTREWARD.supportStep IS '후원액수단계';
COMMENT ON COLUMN PROJECTREWARD.projectNo IS '프로젝트 글번호';
COMMENT ON TABLE PROJECTSUPPORT IS '프로젝트후원정보';
COMMENT ON COLUMN PROJECTSUPPORT.projectSupportNo IS '프로젝트후원번호';
COMMENT ON COLUMN PROJECTSUPPORT.projectSupportSum IS '후원액수';
COMMENT ON COLUMN PROJECTSUPPORT.projectSupportDate IS '후원일';
COMMENT ON COLUMN PROJECTSUPPORT.memberNo IS '회원번호';
COMMENT ON COLUMN PROJECTSUPPORT.projectNo IS '프로젝트 글번호';
COMMENT ON TABLE QNA IS 'QNA 게시판';
COMMENT ON COLUMN QNA.qnaNo IS '글번호';
COMMENT ON COLUMN QNA.qnaTitle IS '글제목';
COMMENT ON COLUMN QNA.qnaContent IS '글내용';
COMMENT ON COLUMN QNA.qnaPostdate IS '작성일';
COMMENT ON COLUMN QNA.qnaChecked IS '답변여부';
COMMENT ON COLUMN QNA.qnaCategory IS '카테고리';
COMMENT ON COLUMN QNA.memberNo IS '회원번호';
COMMENT ON TABLE RECAUTH IS '정기인증 테이블';
COMMENT ON COLUMN RECAUTH.ordr_idxx IS '주문번호';
COMMENT ON COLUMN RECAUTH.res_cd IS '인증응답코드';
COMMENT ON COLUMN RECAUTH.batch_key IS '배치키';
COMMENT ON COLUMN RECAUTH.card_cd IS '카드코드';
COMMENT ON COLUMN RECAUTH.buyr_name IS '주문자명';
COMMENT ON COLUMN RECAUTH.app_time IS '최근결제시간';
COMMENT ON COLUMN RECAUTH.memberNo IS '회원번호';
COMMENT ON COLUMN RECAUTH.subscribeNo IS '구독일련번호';
COMMENT ON TABLE RECPAY IS '정기결제 테이블';
COMMENT ON COLUMN RECPAY.tno IS '거래번호';
COMMENT ON COLUMN RECPAY.ordr_idxx IS '주문번호';
COMMENT ON COLUMN RECPAY.good_mny IS '결제금액';
COMMENT ON COLUMN RECPAY.good_name IS '상품명';
COMMENT ON COLUMN RECPAY.buyr_name IS '주문자명';
COMMENT ON COLUMN RECPAY.buyr_tel1 IS '전화번호';
COMMENT ON COLUMN RECPAY.buyr_tel2 IS '핸드폰번호';
COMMENT ON COLUMN RECPAY.buyr_mail IS '주문자이메일주소';
COMMENT ON COLUMN RECPAY.card_name IS '카드명';
COMMENT ON COLUMN RECPAY.app_time IS '승인시간';
COMMENT ON COLUMN RECPAY.app_no IS '승인번호';
COMMENT ON COLUMN RECPAY.res_cd IS '응답코드';
COMMENT ON COLUMN RECPAY.memberNo IS '회원번호';
COMMENT ON TABLE REPLY IS '댓글';
COMMENT ON COLUMN REPLY.replyNo IS '댓글번호';
COMMENT ON COLUMN REPLY.replyContent IS '댓글내용';
COMMENT ON COLUMN REPLY.replyPostDate IS '댓글 작성일';
COMMENT ON COLUMN REPLY.memberNo IS '회원번호';
COMMENT ON COLUMN REPLY.blogNo IS '글번호';
COMMENT ON COLUMN REPLY.projectNo IS '프로젝트 글번호';
COMMENT ON TABLE SUBSCRIBE IS '구독';
COMMENT ON COLUMN SUBSCRIBE.subscribeNo IS '구독일련번호';
COMMENT ON COLUMN SUBSCRIBE.subscribeStartDate IS '구독시작날짜';
COMMENT ON COLUMN SUBSCRIBE.targetedMemberNo IS '피구독회원번호';
COMMENT ON COLUMN SUBSCRIBE.memberNo IS '구독회원번호';
COMMENT ON TABLE TAG IS '태그';
COMMENT ON COLUMN TAG.tagNo IS '태그번호';
COMMENT ON COLUMN TAG.tagName IS '태그명';
COMMENT ON TABLE TAGRELATION IS '태그 관계';
COMMENT ON COLUMN TAGRELATION.tagNo IS '태그번호';
COMMENT ON COLUMN TAGRELATION.blogNo IS '글번호';
COMMENT ON COLUMN TAGRELATION.projectNo IS '프로젝트 글번호';



