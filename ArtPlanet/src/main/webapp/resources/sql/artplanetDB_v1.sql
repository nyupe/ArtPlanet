
/* Drop Tables */

DROP TABLE CLASSOPENINGDATE CASCADE CONSTRAINTS;
DROP TABLE CLASSRESERVATION CASCADE CONSTRAINTS;
DROP TABLE ARTCLASS CASCADE CONSTRAINTS;
DROP TABLE ATTACHFILE CASCADE CONSTRAINTS;
DROP TABLE ATTACHIMAGE CASCADE CONSTRAINTS;
DROP TABLE AUTHORITY CASCADE CONSTRAINTS;
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




/* Create Tables */

CREATE TABLE ARTCLASS
(
	classNo number NOT NULL,
	title nvarchar2(30) NOT NULL,
	content nvarchar2(2000) NOT NULL,
	postDate date DEFAULT SYSDATE,
	numberOfPeople number NOT NULL,
	tuitionFee number NOT NULL,
	classAddress nvarchar2(50) NOT NULL,
	memberNo number NOT NULL,
	kategorieNo number NOT NULL,
	PRIMARY KEY (classNo)
);


CREATE TABLE ATTACHFILE
(
	attachfileNo number NOT NULL,
	originalFileName nvarchar2(30) NOT NULL,
	serverFileName nvarchar2(30) NOT NULL,
	fileSize number NOT NULL,
	blogNo number NOT NULL,
	PRIMARY KEY (attachfileNo)
);


CREATE TABLE ATTACHIMAGE
(
	imageNo number NOT NULL,
	imageOriginalFileName nvarchar2(30) NOT NULL,
	imageServerFileName nvarchar2(30) NOT NULL,
	blogNo number NOT NULL,
	PRIMARY KEY (imageNo)
);


CREATE TABLE AUTHORITY
(
	authorityNo number NOT NULL,
	authorityName nvarchar2(20) NOT NULL,
	memberNo number NOT NULL,
	PRIMARY KEY (authorityNo)
);


CREATE TABLE BLOGPOST
(
	blogNo number NOT NULL,
	title nvarchar2(30) NOT NULL,
	content nvarchar2(2000) NOT NULL,
	postDate date DEFAULT SYSDATE,
	viewCount number DEFAULT 0,
	memberNo number NOT NULL,
	PRIMARY KEY (blogNo)
);


CREATE TABLE CANCEL
(
	tno nvarchar2(20) NOT NULL,
	res_cd nvarchar2(10),
	res_msg nvarchar2(50),
	memberNo number NOT NULL,
	PRIMARY KEY (tno)
);


CREATE TABLE CLASSOPENINGDATE
(
	classOpeningDateNo number NOT NULL,
	openingDate date NOT NULL,
	classNo number NOT NULL,
	openingTime date,
	closingTime date,
	PRIMARY KEY (classOpeningDateNo)
);


CREATE TABLE CLASSRESERVATION
(
	classReservationNo number NOT NULL,
	signupDate date NOT NULL,
	signupTime date NOT NULL,
	memberNo number NOT NULL,
	classNo number NOT NULL,
	PRIMARY KEY (classReservationNo)
);


CREATE TABLE COMMENT
(
	CommentNo number NOT NULL,
	commentContent nvarchar2(200) NOT NULL,
	commentPostDate date DEFAULT SYSDATE,
	memberNo number NOT NULL,
	PRIMARY KEY (CommentNo)
);


CREATE TABLE HASHTAG
(
	tagNo number NOT NULL,
	tagName nvarchar2(20) NOT NULL,
	PRIMARY KEY (tagNo)
);


CREATE TABLE KATEGORIE
(
	kategorieNo number NOT NULL,
	kategorieName nvarchar2(15) NOT NULL,
	PRIMARY KEY (kategorieNo)
);


CREATE TABLE KATEGORIE_RELATION
(
	memberNo number NOT NULL,
	kategorieNo number NOT NULL,
	blogNo number NOT NULL
);


CREATE TABLE MEMBER
(
	memberNo number NOT NULL,
	id nvarchar2(50) NOT NULL UNIQUE,
	password nvarchar2(15) NOT NULL,
	nickName nvarchar2(10) NOT NULL,
	name nvarchar2(10) NOT NULL,
	phoneNumber nvarchar2(13) NOT NULL,
	address nvarchar2(30) NOT NULL,
	membershipDate date DEFAULT SYSDATE NOT NULL,
	birth nvarchar2(11),
	profilePicture varchar2(50),
	mainPicture varchar2(50),
	introContent nvarchar2(100),
	SubscriptionFee number,
	PRIMARY KEY (memberNo)
);


CREATE TABLE Pay
(
	tno nvarchar2(20),
	ordr_idxx nvarchar2(40) NOT NULL,
	amount number,
	good_name nvarchar2(20),
	buyr_name nvarchar2(10),
	buyr_tel1 nvarchar2(15),
	buyr_tel2 nvarchar2(20),
	buyr_mail nvarchar2(30),
	card_name nvarchar2(10),
	app_time nvarchar2(20),
	app_no nvarchar2(10),
	memberNo number NOT NULL,
	PRIMARY KEY (ordr_idxx)
);


CREATE TABLE PROJECT
(
	projectNo number NOT NULL,
	title nvarchar2(30) NOT NULL,
	content nvarchar2(2000) NOT NULL,
	postDate date DEFAULT SYSDATE,
	deadline date NOT NULL,
	targetFigure number NOT NULL,
	memberNo number NOT NULL,
	PRIMARY KEY (projectNo)
);


CREATE TABLE PROJECTREWARD
(
	projectRewardNo number NOT NULL,
	projectNo number NOT NULL,
	rewardContent nvarchar2(2000) NOT NULL,
	supportStep number NOT NULL,
	PRIMARY KEY (projectRewardNo)
);


CREATE TABLE PROJECTSUPPORT
(
	projectSupportNo number NOT NULL,
	projectSupportSum number NOT NULL,
	projectSupportDate date NOT NULL,
	memberNo number NOT NULL,
	projectNo number NOT NULL,
	PRIMARY KEY (projectSupportNo)
);


CREATE TABLE RECAUTH
(
	ordr_idxx nvarchar2(50) NOT NULL,
	res_cd nvarchar2(10),
	batch_key nvarchar2(20),
	card_cd nvarchar2(10),
	buyr_name nvarchar2(30),
	memberNo number NOT NULL,
	PRIMARY KEY (ordr_idxx)
);


CREATE TABLE RECPAY
(
	tno nvarchar2(20),
	ordr_idxx nvarchar2(40) NOT NULL,
	amount number,
	good_name nvarchar2(20),
	buyr_name nvarchar2(10),
	buyr_tel1 nvarchar2(15),
	buyr_tel2 nvarchar2(20),
	buyr_mail nvarchar2(30),
	card_name nvarchar2(10),
	app_time nvarchar2(20),
	app_no nvarchar2(10),
	res_cd nvarchar2(10),
	memberNo number NOT NULL,
	batch_key nvarchar2(20),
	PRIMARY KEY (ordr_idxx)
);


CREATE TABLE SUBSCRIBE
(
	subscribeNo number NOT NULL,
	subscribeStartDate date DEFAULT SYSDATE,
	targetedMemberNo number NOT NULL,
	memberNo number NOT NULL,
	PRIMARY KEY (subscribeNo)
);


CREATE TABLE TAGRELATION
(
	tagNo number NOT NULL,
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


ALTER TABLE AUTHORITY
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
	ADD FOREIGN KEY (targetedMemberNo)
	REFERENCES MEMBER (memberNo)
;


ALTER TABLE SUBSCRIBE
	ADD FOREIGN KEY (memberNo)
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



