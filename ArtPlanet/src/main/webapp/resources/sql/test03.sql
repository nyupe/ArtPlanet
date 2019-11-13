
/* Drop Tables */

DROP TABLE CLASSOPENINGDATE CASCADE CONSTRAINTS;
DROP TABLE CLASSRESERVATION CASCADE CONSTRAINTS;
DROP TABLE ARTCLASS CASCADE CONSTRAINTS;
DROP TABLE ATTACHFILE CASCADE CONSTRAINTS;
DROP TABLE ATTACHIMAGE CASCADE CONSTRAINTS;
DROP TABLE AUTH_SECURITY CASCADE CONSTRAINTS;
DROP TABLE KATEGORIE_RELATION CASCADE CONSTRAINTS;
DROP TABLE TAGRELATION CASCADE CONSTRAINTS;
DROP TABLE BLOGPOST CASCADE CONSTRAINTS;
DROP TABLE CANCEL CASCADE CONSTRAINTS;
DROP TABLE COMMENT CASCADE CONSTRAINTS;
DROP TABLE HASHTAG CASCADE CONSTRAINTS;
DROP TABLE KATEGORIE CASCADE CONSTRAINTS;
DROP TABLE Pay CASCADE CONSTRAINTS;
DROP TABLE PROJECTREWARD CASCADE CONSTRAINTS;
DROP TABLE PROJECTSUPPORT CASCADE CONSTRAINTS;
DROP TABLE PROJECT CASCADE CONSTRAINTS;
DROP TABLE RECAUTH CASCADE CONSTRAINTS;
DROP TABLE RECPAY CASCADE CONSTRAINTS;
DROP TABLE SUBSCRIBE CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_AUTH_SECURITY_authorityNo;
DROP SEQUENCE SEQ_MEMBER_memberNo;




/* Create Sequences */

CREATE SEQUENCE SEQ_AUTH_SECURITY_authorityNo NOCYCLE NOCACHE;
CREATE SEQUENCE SEQ_MEMBER_memberNo NOCYCLE NOCACHE;



/* Create Tables */

-- 아트클래스
CREATE TABLE ARTCLASS
(
	-- 클래스 글번호
	classNo number NOT NULL,
	-- 글제목
	title nvarchar2(30) NOT NULL,
	-- 글내용
	content nvarchar2(2000) NOT NULL,
	-- 작성일
	postDate date DEFAULT SYSDATE,
	-- 인원수
	numberOfPeople number NOT NULL,
	-- 수강료
	tuitionFee number NOT NULL,
	-- 주소
	classAddress nvarchar2(50) NOT NULL,
	-- 회원번호
	memberNo number NOT NULL,
	-- 카테고리번호
	kategorieNo number NOT NULL,
	PRIMARY KEY (classNo)
);


-- 첨부파일
CREATE TABLE ATTACHFILE
(
	-- 첨부파일번호
	attachfileNo number NOT NULL,
	-- 오리지날 파일명
	originalFileName nvarchar2(30) NOT NULL,
	-- 서버 파일명
	serverFileName nvarchar2(30) NOT NULL,
	-- 파일크기
	fileSize number NOT NULL,
	-- 글번호
	blogNo number NOT NULL,
	PRIMARY KEY (attachfileNo)
);


-- 내용첨부이미지
CREATE TABLE ATTACHIMAGE
(
	-- 이미지번호
	imageNo number NOT NULL,
	-- 이미지 오리지날 파일명
	imageOriginalFileName nvarchar2(30) NOT NULL,
	-- 이미지 서버 파일명
	imageServerFileName nvarchar2(30) NOT NULL,
	-- 글번호
	blogNo number NOT NULL,
	PRIMARY KEY (imageNo)
);


-- 권한 테이블
CREATE TABLE AUTH_SECURITY
(
	-- 권한번호
	authorityNo number NOT NULL,
	-- 권한명
	authority nvarchar2(20) DEFAULT 'ROLE_USER' NOT NULL,
	-- 회원번호
	memberNo number NOT NULL,
	-- 회원 활동승인여부
	enabled number DEFAULT 1 NOT NULL,
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
	title nvarchar2(30) NOT NULL,
	-- 글내용
	content nvarchar2(2000) NOT NULL,
	-- 작성일
	postDate date DEFAULT SYSDATE,
	-- 조회수
	viewCount number DEFAULT 0,
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
	classOpeningDateNo number NOT NULL,
	-- 개설날짜
	openingDate date NOT NULL,
	-- 클래스 글번호
	classNo number NOT NULL,
	-- 개설시각
	openingTime date,
	-- 종료시각
	closingTime date,
	PRIMARY KEY (classOpeningDateNo)
);


-- 클래스예약정보
CREATE TABLE CLASSRESERVATION
(
	-- 예약정보번호
	classReservationNo number NOT NULL,
	-- 수강날짜
	signupDate date NOT NULL,
	-- 수강시간
	signupTime date NOT NULL,
	-- 회원번호
	memberNo number NOT NULL,
	-- 클래스 글번호
	classNo number NOT NULL,
	PRIMARY KEY (classReservationNo)
);


-- 댓글
CREATE TABLE COMMENT
(
	-- 댓글번호
	CommentNo number NOT NULL,
	-- 댓글내용
	commentContent nvarchar2(200) NOT NULL,
	-- 댓글 작성일
	commentPostDate date DEFAULT SYSDATE,
	-- 회원번호
	memberNo number NOT NULL,
	PRIMARY KEY (CommentNo)
);


-- 해시태그
CREATE TABLE HASHTAG
(
	-- 태그번호
	tagNo number NOT NULL,
	-- 태그명
	tagName nvarchar2(20) NOT NULL,
	PRIMARY KEY (tagNo)
);


-- 카테고리
CREATE TABLE KATEGORIE
(
	-- 카테고리번호
	kategorieNo number NOT NULL,
	-- 카테고리명
	kategorieName nvarchar2(15) NOT NULL,
	PRIMARY KEY (kategorieNo)
);


-- 카테고리 관계
CREATE TABLE KATEGORIE_RELATION
(
	-- 회원번호
	memberNo number NOT NULL,
	-- 카테고리번호
	kategorieNo number NOT NULL,
	-- 글번호
	blogNo number NOT NULL
);


-- 회원
CREATE TABLE MEMBER
(
	-- 회원번호
	memberNo number NOT NULL,
	-- 아이디
	id nvarchar2(50) NOT NULL UNIQUE,
	-- 비밀번호
	password nvarchar2(15) NOT NULL,
	-- 별명
	nickName nvarchar2(10) NOT NULL,
	-- 이름
	name nvarchar2(10) NOT NULL,
	-- 핸드폰번호
	phoneNumber nvarchar2(13) NOT NULL,
	-- 주소
	address nvarchar2(30) NOT NULL,
	-- 가입일
	membershipDate date DEFAULT SYSDATE NOT NULL,
	-- 생년월일
	birth nvarchar2(11),
	-- 프로필사진_서버에 저장된 경로
	profilePicture varchar2(500),
	-- 대문사진_서버에 저장된 경로
	mainPicture varchar2(500),
	-- 소개글
	introContent nvarchar2(500),
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
	amount number,
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


-- 프로젝트
CREATE TABLE PROJECT
(
	-- 프로젝트 글번호
	projectNo number NOT NULL,
	-- 글제목
	title nvarchar2(30) NOT NULL,
	-- 글내용
	content nvarchar2(2000) NOT NULL,
	-- 작성일
	postDate date DEFAULT SYSDATE,
	-- 마감일
	deadline date NOT NULL,
	-- 목표액수
	targetFigure number NOT NULL,
	-- 회원번호
	memberNo number NOT NULL,
	PRIMARY KEY (projectNo)
);


-- 프로젝트보상정보
CREATE TABLE PROJECTREWARD
(
	-- 프로젝트보상정보 번호
	projectRewardNo number NOT NULL,
	-- 프로젝트 글번호
	projectNo number NOT NULL,
	-- 보상내용
	rewardContent nvarchar2(2000) NOT NULL,
	-- 후원액수단계
	supportStep number NOT NULL,
	PRIMARY KEY (projectRewardNo)
);


-- 프로젝트후원정보
CREATE TABLE PROJECTSUPPORT
(
	-- 프로젝트후원정보
	projectSupportNo number NOT NULL,
	-- 후원액수
	projectSupportSum number NOT NULL,
	-- 후원일
	projectSupportDate date NOT NULL,
	-- 회원번호
	memberNo number NOT NULL,
	-- 프로젝트 글번호
	projectNo number NOT NULL,
	PRIMARY KEY (projectSupportNo)
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
	-- 회원번호
	memberNo number NOT NULL,
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
	amount number,
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
	-- 배치키
	batch_key nvarchar2(20),
	PRIMARY KEY (ordr_idxx)
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


-- 태그 관계
CREATE TABLE TAGRELATION
(
	-- 태그번호
	tagNo number NOT NULL,
	-- 글번호
	blogNo number NOT NULL
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


ALTER TABLE ATTACHFILE
	ADD FOREIGN KEY (blogNo)
	REFERENCES BLOGPOST (blogNo)
;


ALTER TABLE ATTACHIMAGE
	ADD FOREIGN KEY (blogNo)
	REFERENCES BLOGPOST (blogNo)
;


ALTER TABLE KATEGORIE_RELATION
	ADD FOREIGN KEY (blogNo)
	REFERENCES BLOGPOST (blogNo)
;


ALTER TABLE TAGRELATION
	ADD FOREIGN KEY (blogNo)
	REFERENCES BLOGPOST (blogNo)
;


ALTER TABLE TAGRELATION
	ADD FOREIGN KEY (tagNo)
	REFERENCES HASHTAG (tagNo)
;


ALTER TABLE ARTCLASS
	ADD FOREIGN KEY (kategorieNo)
	REFERENCES KATEGORIE (kategorieNo)
;


ALTER TABLE KATEGORIE_RELATION
	ADD FOREIGN KEY (kategorieNo)
	REFERENCES KATEGORIE (kategorieNo)
;


ALTER TABLE ARTCLASS
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE AUTH_SECURITY
	ADD FOREIGN KEY (id)
	REFERENCES MEMBER (id)
;


ALTER TABLE AUTH_SECURITY
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
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


ALTER TABLE COMMENT
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE KATEGORIE_RELATION
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE Pay
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


ALTER TABLE RECAUTH
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE RECPAY
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE SUBSCRIBE
	ADD FOREIGN KEY (memberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE SUBSCRIBE
	ADD FOREIGN KEY (targetedMemberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE PROJECTREWARD
	ADD FOREIGN KEY (projectNo)
	REFERENCES PROJECT (projectNo)
;


ALTER TABLE PROJECTSUPPORT
	ADD FOREIGN KEY (projectNo)
	REFERENCES PROJECT (projectNo)
;



/* Comments */

COMMENT ON TABLE ARTCLASS IS '아트클래스';
COMMENT ON COLUMN ARTCLASS.classNo IS '클래스 글번호';
COMMENT ON COLUMN ARTCLASS.title IS '글제목';
COMMENT ON COLUMN ARTCLASS.content IS '글내용';
COMMENT ON COLUMN ARTCLASS.postDate IS '작성일';
COMMENT ON COLUMN ARTCLASS.numberOfPeople IS '인원수';
COMMENT ON COLUMN ARTCLASS.tuitionFee IS '수강료';
COMMENT ON COLUMN ARTCLASS.classAddress IS '주소';
COMMENT ON COLUMN ARTCLASS.memberNo IS '회원번호';
COMMENT ON COLUMN ARTCLASS.kategorieNo IS '카테고리번호';
COMMENT ON TABLE ATTACHFILE IS '첨부파일';
COMMENT ON COLUMN ATTACHFILE.attachfileNo IS '첨부파일번호';
COMMENT ON COLUMN ATTACHFILE.originalFileName IS '오리지날 파일명';
COMMENT ON COLUMN ATTACHFILE.serverFileName IS '서버 파일명';
COMMENT ON COLUMN ATTACHFILE.fileSize IS '파일크기';
COMMENT ON COLUMN ATTACHFILE.blogNo IS '글번호';
COMMENT ON TABLE ATTACHIMAGE IS '내용첨부이미지';
COMMENT ON COLUMN ATTACHIMAGE.imageNo IS '이미지번호';
COMMENT ON COLUMN ATTACHIMAGE.imageOriginalFileName IS '이미지 오리지날 파일명';
COMMENT ON COLUMN ATTACHIMAGE.imageServerFileName IS '이미지 서버 파일명';
COMMENT ON COLUMN ATTACHIMAGE.blogNo IS '글번호';
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
COMMENT ON COLUMN BLOGPOST.memberNo IS '회원번호';
COMMENT ON TABLE CANCEL IS '결제취소 테이블';
COMMENT ON COLUMN CANCEL.tno IS '거래번호';
COMMENT ON COLUMN CANCEL.res_cd IS '취소응답코드';
COMMENT ON COLUMN CANCEL.res_msg IS '취소메시지';
COMMENT ON COLUMN CANCEL.memberNo IS '회원번호';
COMMENT ON TABLE CLASSOPENINGDATE IS '클래스개설날짜정보';
COMMENT ON COLUMN CLASSOPENINGDATE.classOpeningDateNo IS '날짜정보 번호';
COMMENT ON COLUMN CLASSOPENINGDATE.openingDate IS '개설날짜';
COMMENT ON COLUMN CLASSOPENINGDATE.classNo IS '클래스 글번호';
COMMENT ON COLUMN CLASSOPENINGDATE.openingTime IS '개설시각';
COMMENT ON COLUMN CLASSOPENINGDATE.closingTime IS '종료시각';
COMMENT ON TABLE CLASSRESERVATION IS '클래스예약정보';
COMMENT ON COLUMN CLASSRESERVATION.classReservationNo IS '예약정보번호';
COMMENT ON COLUMN CLASSRESERVATION.signupDate IS '수강날짜';
COMMENT ON COLUMN CLASSRESERVATION.signupTime IS '수강시간';
COMMENT ON COLUMN CLASSRESERVATION.memberNo IS '회원번호';
COMMENT ON COLUMN CLASSRESERVATION.classNo IS '클래스 글번호';
COMMENT ON TABLE COMMENT IS '댓글';
COMMENT ON COLUMN COMMENT.CommentNo IS '댓글번호';
COMMENT ON COLUMN COMMENT.commentContent IS '댓글내용';
COMMENT ON COLUMN COMMENT.commentPostDate IS '댓글 작성일';
COMMENT ON COLUMN COMMENT.memberNo IS '회원번호';
COMMENT ON TABLE HASHTAG IS '해시태그';
COMMENT ON COLUMN HASHTAG.tagNo IS '태그번호';
COMMENT ON COLUMN HASHTAG.tagName IS '태그명';
COMMENT ON TABLE KATEGORIE IS '카테고리';
COMMENT ON COLUMN KATEGORIE.kategorieNo IS '카테고리번호';
COMMENT ON COLUMN KATEGORIE.kategorieName IS '카테고리명';
COMMENT ON TABLE KATEGORIE_RELATION IS '카테고리 관계';
COMMENT ON COLUMN KATEGORIE_RELATION.memberNo IS '회원번호';
COMMENT ON COLUMN KATEGORIE_RELATION.kategorieNo IS '카테고리번호';
COMMENT ON COLUMN KATEGORIE_RELATION.blogNo IS '글번호';
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
COMMENT ON COLUMN Pay.amount IS '결제금액';
COMMENT ON COLUMN Pay.good_name IS '상품명';
COMMENT ON COLUMN Pay.buyr_name IS '주문자명';
COMMENT ON COLUMN Pay.buyr_tel1 IS '전화번호';
COMMENT ON COLUMN Pay.buyr_tel2 IS '핸드폰번호';
COMMENT ON COLUMN Pay.buyr_mail IS '주문자이메일주소';
COMMENT ON COLUMN Pay.card_name IS '카드명';
COMMENT ON COLUMN Pay.app_time IS '승인시간';
COMMENT ON COLUMN Pay.app_no IS '승인번호';
COMMENT ON COLUMN Pay.memberNo IS '회원번호';
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
COMMENT ON COLUMN PROJECTREWARD.projectNo IS '프로젝트 글번호';
COMMENT ON COLUMN PROJECTREWARD.rewardContent IS '보상내용';
COMMENT ON COLUMN PROJECTREWARD.supportStep IS '후원액수단계';
COMMENT ON TABLE PROJECTSUPPORT IS '프로젝트후원정보';
COMMENT ON COLUMN PROJECTSUPPORT.projectSupportNo IS '프로젝트후원정보';
COMMENT ON COLUMN PROJECTSUPPORT.projectSupportSum IS '후원액수';
COMMENT ON COLUMN PROJECTSUPPORT.projectSupportDate IS '후원일';
COMMENT ON COLUMN PROJECTSUPPORT.memberNo IS '회원번호';
COMMENT ON COLUMN PROJECTSUPPORT.projectNo IS '프로젝트 글번호';
COMMENT ON TABLE RECAUTH IS '정기인증 테이블';
COMMENT ON COLUMN RECAUTH.ordr_idxx IS '주문번호';
COMMENT ON COLUMN RECAUTH.res_cd IS '인증응답코드';
COMMENT ON COLUMN RECAUTH.batch_key IS '배치키';
COMMENT ON COLUMN RECAUTH.card_cd IS '카드코드';
COMMENT ON COLUMN RECAUTH.buyr_name IS '주문자명';
COMMENT ON COLUMN RECAUTH.memberNo IS '회원번호';
COMMENT ON TABLE RECPAY IS '정기결제 테이블';
COMMENT ON COLUMN RECPAY.tno IS '거래번호';
COMMENT ON COLUMN RECPAY.ordr_idxx IS '주문번호';
COMMENT ON COLUMN RECPAY.amount IS '결제금액';
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
COMMENT ON COLUMN RECPAY.batch_key IS '배치키';
COMMENT ON TABLE SUBSCRIBE IS '구독';
COMMENT ON COLUMN SUBSCRIBE.subscribeNo IS '구독일련번호';
COMMENT ON COLUMN SUBSCRIBE.subscribeStartDate IS '구독시작날짜';
COMMENT ON COLUMN SUBSCRIBE.targetedMemberNo IS '피구독회원번호';
COMMENT ON COLUMN SUBSCRIBE.memberNo IS '구독회원번호';
COMMENT ON TABLE TAGRELATION IS '태그 관계';
COMMENT ON COLUMN TAGRELATION.tagNo IS '태그번호';
COMMENT ON COLUMN TAGRELATION.blogNo IS '글번호';



