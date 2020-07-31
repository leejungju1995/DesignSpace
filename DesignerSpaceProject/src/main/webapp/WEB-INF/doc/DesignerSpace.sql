drop table project_like;
drop table free_like;
drop table file_table;
drop table profile_table;
drop table project_comment;
drop table free_comment;
drop table QNA_comment;
drop table free_board;
drop table QNA_BOARD;
drop table report_board;
drop table project_board;
drop table member;
---------------------------
drop sequence member_mno_SEQ;
drop sequence project_board_pbno_SEQ;
drop sequence project_comment_pcno_SEQ;
drop sequence free_board_fbno_SEQ;
drop sequence free_comment_fcno_SEQ;
drop sequence qna_board_qbno_SEQ;
drop sequence qna_comment_qcno_SEQ;
drop sequence report_board_rbno_SEQ;
drop sequence file_table_ftno_SEQ;
drop sequence profile_table_ptno_SEQ;
drop sequence project_like_plno_SEQ;
drop sequence free_like_flno_SEQ;
----------------------------
create table member(
    member_no number constraint member_mno_pk primary key,
    member_name varchar2(30) not null,
    member_nick varchar2(30) unique not null,
    member_email varchar2(100) unique not null,
    member_pwd varchar2(100) not null,
    member_phone varchar2(100) unique not null,
    member_check_question number check(member_check_question in(1,2,3)) not null,
    member_check_answer varchar2(100) not null,
    member_comments varchar2(300) null,
    member_cre_date date not null,
    member_mod_date date,
    member_sign_check varchar2(2) check(member_sign_check in('Y','N')) not null,
    member_grade number default 0 check(member_grade in(0,1)) not null,
    member_del_flag varchar2(2) default 'N' check(member_del_flag in('Y','N')) not null
);

create table project_board(
    project_board_no number constraint project_board_pbno_pk primary key,
    project_board_mno number not null,
    project_board_title varchar2(100)unique not null,
    project_board_views number default 0 not null,
    project_board_cre_date date not null,
    project_board_mod_date date,
    project_board_del_flag varchar2(2) default 'N' check(project_board_del_flag in('Y','N')) not null,
    project_board_category varchar2(2) check(project_board_category in('p','i')) not null,
    project_board_contents varchar2(600) not null,
    constraint project_board_mno_fk foreign key(project_board_mno)
    references member(member_no)
);

create table project_like(
    project_like_no number constraint project_like_no_pk primary key,
    project_like_mno number,
    project_like_pbno number,
    project_like_flag varchar2(2) default 'Y',
    constraint project_like_mno_fk foreign key(project_like_mno)
    references member(member_no),
    constraint project_like_pbno_fk foreign key(project_like_pbno)
    references project_board(project_board_no)
);

create table project_comment(
    project_comment_no number constraint project_comment_pcno_pk primary key,
    project_comment_mno number not null,
    project_comment_pbno number not null,
    project_comment_comments varchar2(300) not null,
    project_comment_cre_date date not null,
    project_comment_mod_date date,
    constraint project_comment_mno_fk foreign key(project_comment_mno)
    references member(member_no),
    constraint project_comment_pbno_fk foreign key(project_comment_pbno)
    references project_board(project_board_no)
);

create table free_board(
    free_board_no number constraint free_board_fbno_pk primary key,
    free_board_mno number not null,
    free_board_title varchar2(100) not null,
    free_board_contents varchar2(4000) not null,
    free_board_cre_date date not null,
    free_board_mod_date date,
    free_board_views number default 0 not null,
    constraint free_board_mno_fk foreign key(free_board_mno)
    references member(member_no)
);

create table free_like(
    free_like_no number constraint free_like_no_pk primary key,
    free_like_mno number,
    free_like_fbno number,
    free_like_flag varchar2(2) default 'Y',
    constraint free_like_mno_fk foreign key(free_like_mno)
    references member(member_no),
    constraint free_like_fbno_fk foreign key(free_like_fbno)
    references free_board(free_board_no)
);

create table free_comment(
    free_comment_no number constraint free_comment_fcno_pk primary key,
    free_comment_fbno number not null,
    free_comment_mno number not null,
    free_comment_comments varchar2(1000) not null,
    free_comment_cre_date date not null,
    free_comment_mod_date date,
    constraint free_comment_fbno_fk foreign key(free_comment_fbno)
    references free_board(free_board_no),
    constraint free_comment_mno_fk foreign key(free_comment_mno)
    references member(member_no)
);
------------------
CREATE TABLE QNA_BOARD(
    QNA_BOARD_NO NUMBER CONSTRAINT QNA_BOARD_QBNO_PK PRIMARY KEY,
    QNA_BOARD_MNO NUMBER NOT NULL,
    QNA_BOARD_TITLE VARCHAR2(200) NOT NULL,
    QNA_BOARD_CONTENTS VARCHAR2(500) NOT NULL,
    QNA_BOARD_CRE_DATE DATE NOT NULL,
    QNA_BOARD_mod_date date,
    QNA_BOARD_ANSWER_DATE DATE,
    QNA_BOARD_ANSWER_STATUS VARCHAR2(100) default '접수중' NOT NULL,
    CONSTRAINT QNA_BOARD_MNO_FK FOREIGN KEY(QNA_BOARD_MNO) 
    REFERENCES MEMBER(MEMBER_NO)
);


CREATE TABLE QNA_COMMENT(
    QNA_COMMENT_NO NUMBER CONSTRAINT QNA_BOARD_QCNO_PK PRIMARY KEY,
    QNA_COMMENT_QBNO NUMBER NOT NULL,
    QNA_COMMENT_MNO NUMBER NOT NULL,
    QNA_COMMENT_COMMENTS VARCHAR2(200) NOT NULL,
    QNA_COMMENT_CRE_DATE DATE NOT NULL,
    QNA_COMMENT_mod_date date,
    CONSTRAINT QNA_COMMENT_QBNO_FK FOREIGN KEY(QNA_COMMENT_QBNO) 
    REFERENCES QNA_BOARD(QNA_BOARD_NO),
    CONSTRAINT QNA_COMMENT_MNO_FK FOREIGN KEY(QNA_COMMENT_MNO)
    REFERENCES MEMBER(MEMBER_NO)
);


CREATE TABLE REPORT_BOARD(
    REPORT_BOARD_NO NUMBER CONSTRAINT REPORT_BOARD_RBNO_PK PRIMARY KEY,
    REPORT_BOARD_MNO NUMBER NOT NULL,
    REPORT_BOARD_REASON VARCHAR2(100) NOT NULL,
    REPORT_BOARD_TITLE VARCHAR2(100) NOT NULL,
    REPORT_BOARD_NAME VARCHAR2(100) NOT NULL,
    REPORT_BOARD_CONTENTS VARCHAR2(500) NOT NULL,
    REPORT_BOARD_CRE_DATE DATE NOT NULL,
    REPORT_BOARD_mod_date date,
    REPORT_BOARD_ANSWER_DATE DATE,
    REPORT_BOARD_ANSWER_STATUS VARCHAR2(20) default '접수중' NOT NULL,
    CONSTRAINT REPORT_BOARD_MNO_FK FOREIGN KEY(REPORT_BOARD_MNO) 
    REFERENCES MEMBER(MEMBER_NO),
    CONSTRAINT REPORT_BOARD_TITLE_FK FOREIGN KEY(REPORT_BOARD_TITLE) 
    REFERENCES project_board(project_board_title)
);


CREATE TABLE FILE_TABLE(
    FILE_TABLE_NO NUMBER CONSTRAINT FILE_TABLE_FTNO_PK PRIMARY KEY,
    FILE_TABLE_MNO NUMBER NOT NULL,
    FILE_TABLE_PBNO number not null,
    FILE_TABLE_ORIGINAL_FILE_NAME VARCHAR2(100),
    FILE_TABLE_STORED_FILE_NAME VARCHAR2(100),
    FILE_TABLE_CRE_DATE DATE NOT NULL,
    FILE_TABLE_mod_date date,
    CONSTRAINT FILE_TABLE_MNO_FK FOREIGN KEY(FILE_TABLE_MNO) 
    REFERENCES MEMBER(MEMBER_NO)
);

CREATE TABLE PROFILE_TABLE(
    PROFILE_TABLE_NO NUMBER CONSTRAINT PROFILE_TABLE_PTNO_PK PRIMARY KEY,
    PROFILE_TABLE_MNO NUMBER NOT NULL,
    PROFILE_TABLE_ORIGINAL_NAME VARCHAR2(100),
    PROFILE_TABLE_STORED_NAME VARCHAR2(100),
    CONSTRAINT PROFILE_TABLE_MNO_FK FOREIGN KEY(PROFILE_TABLE_MNO) 
    REFERENCES MEMBER(MEMBER_NO)
);
-------------------------------------
create sequence member_mno_SEQ
    increment by 1
    start with 1;

create sequence project_board_pbno_SEQ
    increment by 1
    start with 1;
    
create sequence project_comment_pcno_SEQ
    increment by 1
    start with 1;
    
create sequence free_board_fbno_SEQ
    increment by 1
    start with 1;
    
create sequence free_comment_fcno_SEQ
    increment by 1
    start with 1;
    
create sequence qna_board_qbno_SEQ
    increment by 1
    start with 1;

create sequence qna_comment_qcno_SEQ
    increment by 1
    start with 1;
    
create sequence report_board_rbno_SEQ
    increment by 1
    start with 1;
    
create sequence file_table_ftno_SEQ
    increment by 1
    start with 1;
    
create sequence profile_table_ptno_SEQ
    increment by 1
    start with 1;

create sequence project_like_plno_SEQ
    increment by 1
    start with 1;
    
create sequence free_like_flno_SEQ
    increment by 1
    start with 1;
------------------------------------------

------회원 정보 추가

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date,member_grade, member_sign_check)
values(member_mno_SEQ.nextval,'관리자','관리자','admin@test.com','admin','01000000000',1,'꿈틀이들','관리자입니다.',sysdate,1,'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'오현석','우주최강현석','ohs@test.com','test','01012458795',2,'사당동','자바기반프로그래밍 배웠습니다.
일러스트쪽에 관심있습니다.
잘부탁드립니다',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'김홍','쪼꼬덕규','kh@test.com','test','01035426678',3,'김청','힘들다... 탈출하고싶다... 
사진만이 내 유일한 탈출구...',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'이정주','정주리', 'ljj@test.com', 'test', '01012044688', 1, '컴퓨터', '엔터가 왜 돼요??
이게되네
하하하',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'이환상','뱅개','lws@test.com','test','01046587753',1,'핸드폰','환상입니다.',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'황지원','지원군','wjw@test.com','test','01046465731',3,'황초롱','',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'이찬양','차냥','lcy@test.com','test','01079512258',2,'마이애미','서울에 거주중입니다.
같이 작업할 사람 구해요',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'고재민','형님','gjm@test.com','test','01046791301',3,'더락드웨인존슨','',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'류제건','류사장','rjg@test.com','test','01066578879',1,'프로젝트','봉화마을에서 여행사업 진행중입니다. 
관심있으시다면 놀러와 주세요~',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'정의광','사나이정의광','jug@test.com','test','01089711324',2,'디트로이트시티','위풍당당 사나의 정의광',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'이용훈','-메-','lyh@test.com','test','01091399978',1,'100억메소','메소 익스플로전~',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'원아름','앎','yar@test.com','test','01055233147',2,'이천','이천의 자랑 이천의 꿈',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'양우진','양우진진자라','yuj@test.com','test','01014786896',3,'태진아','일러스트쪽에 관심 많습니다. 
회기역쪽에서 같이 작업하실분 구해요',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'김윤진','외로운나그네','kyj@test.com','test','01025872367',1,'안드로이드는전기양의꿈을꾸는가','귀여워',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'차정경','정경','cjg@test.com','test','01099963154',3,'바나프레소','정경정정경정경정경정경정경정경정경정경정경정경경정경정경정경정경정경정경정경정경.',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'윤형식','개굴밥','yhs@test.com','test','01022348897',1,'핸드폰','',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'박지훈','경남죽염통림','pjh@test.com','test','01078452365',2,'경남','경남죽염통림 이너스빌 아파트에 거주중',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'박상아','쌍Ah','psa@test.com','test','01032455876',2,'캐나다','Im canadian',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'홍길동','길동쓰','hgd@test.com','test','010784639982',1,'율도국','어려서부터 아버지를 아버지라 부르지 못하고 형을 형이라 부르지 못하고....',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'John avigail','Mr.john','sgd@test.com','test','021645784996',1,'love and peace','I never seen dvssnkc seenns',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'AmiSchskil','SllJinon','gsaaa@test.com','test','0107846251889',2,'TORONTO','MOU is the abbreviation for Memorandum Of Understanding
rights and responsibilities',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'페이커','SKT_Faker','faker@test.com','test','01079722256',3 ,'Teddy','롤드컵 3회우승 skt 미드 페이커입니다.',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'Aimming','Aimming','Aimming@test.com','test','0802853198754', 3,'jassica','One shoot one kill',sysdate, 'Y');



insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'최필규','adala','oijs234@fsgg.com','test','010123456', 1,'라홍','',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'김덕배','덕더러','dkb@xvxva.com','test','0108883456', 1,'두피','',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'이산','이산','leesan352@goolid.com','test','010123457', 3,'대통령','대통령의 임기연장대하여는 효력이 없다. ',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'이금복','이금복','kbn@sfsf.com','test','010123458', 1,'가족','연습용계정',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'황금독수리하늘로날아','golden Eagle','fly@est.com','test','010123459', 1,'eagle','i never seen like this awsome site XD',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'최유기','XDXDXDXD','dgsg@www.net','test','0101234510', 2,'전북 익산','',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'christian','The Tech','test6@test.com','test','0101234511', 3,'The Tech','Everyone owns an email address each and every hour, for everything from connecting at work, with business prospects',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'Eagle','Eagle','diggydigg@242.com','test','0101234512', 3,'Everyone','address each and every hour',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'東京都で293人','理由','sfs@lljl.net','test','0101234513', 1,'640万人','640万人突破！ドコモユーザーが得をする「dカード GOLD」',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'コロナ給付金の','v6の方','dis2@vjl.com','test','0101234514', 3,'くいIPv6の方が','「接続方法」が異なるため、入り口が広く混雑が発生しにくいIPv6の方が快適にネットを使えます',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'の設備せ','の設備らせ','diggqq1@gmail.com','test','0101234515', 2,'知','の設備増強のお知らせ',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'وا تسديدة','تسديدة','tds12@goo.com','test','0101234516', 1,'وا','وا',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'pages','pages','p23s@saaa.com','test','0101234517', 3,'pages','over 150,000 pages',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'test13','ljnxkk','goo@test.com','asdgasg','0101234518', 1,'test','Are you ready to order, sir?',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'김갑환','갑갑해','kjh22@kmls.com','test','0101234519', 1,'스파','왓따따뚜겐',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'알베르트','피자알볼로','pizza@sgsg.com','test','0101234520', 3,'italian','',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'American','American','Ame34@aad.com','test','0101234522', 2,'English',' British and American English native speakers',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'EXPRESSI','ABSTRACT','exex@aad.com','test','0101234523', 1,'dsf','ABSTRACT EXPRESSIONISM',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'Yahoo','Yahoo','arap11@sff.com','test','0101234124', 2,'Yahoo','Yahoo fait partie de Verizon Media',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'stecken','Wo','Enorme@gsgw.com','test','010004525', 1,'Enorme','Enorme Diskrepanz nach Coronakrise: 
Wo stecken 7.305',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'Diskrepanz','nach','Diskrepanz@ada.com','Diskrepanz','0101234526', 1,'Diskrepanz','Wo',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'Verizon','Media et','à@ffhgg.com','test','0101234527', 3,'Verizon','Verizon Media et ses partenaires à',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'test22','test22','test22@test.com','test','0101234528', 1,'test','test',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'김철수','모에피쨩','moemoe@fsfs.krr','test','0101234529', 1,'모에피쨩피규어','moemoe~~',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'페이리스','냥냥','paris@add.net','test','0101234530', 2,'아키하바라','faris nang nang',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'En savoir','En savoir','savoir@add.com','test','0101234531', 1,'privée','privéecomprendre vos centres',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'제라르','jeraa','jjj@test.net','test','0101234532', 3,'soccer','성은 제 이름은 라르입니다',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'뉴턴','아이작','asock131@test.com','test','0101234533', 3,'apple','l love apple',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'샘해밍턴','sam Haming','sam18a@goo.gs','test','0101234534', 3,'asggg','Hello world',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'金を今より','イントを','bakca500s@net.net','test','0101234535', 3,'トを貯','ポイントを貯めて
@niftyご利用料金を今よりお得に!',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'惑や不倫','惑や不倫','120dppls@gsg.bet','test','0101234536', 1,'惑や不倫','ZOC 薬疑惑や不倫暴露で騒然',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'최익현','익헨이','bosan1@af.krr','test','0101234537', 2,'부산사나이','내가 그저께도 으이
어제도 으이 그느서장이랑
다했어 으이',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'최형배','행배야','deaBoo444@test.jp','test','0101234538', 2,'부산상남자','대부님',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'오태식','다가져간놈','sunflower@google.kr','test','0101234539', 1,'해바라기','사람이 잘못을했으면 벌을 받는게 세상의 이치라더라',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'원빈','투빈','oneBin@test.com','test','0101234540', 1,'이나영','아직 한발 남았따',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'くろう','くろう','aidewo@japan.jg','test','0101234541', 2,'くろう','木を育てて自分だけの庭をつくろう',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'gies','technologies','te232ies@test.com','test','0101234542', 2,'cookies','cookies et des technologies similaires',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'diedie','Produktion','Nachdem@sgsg.aaa','test','0101234543', 2,'Produktion','Nachdem die Produktion beim Fleischkonzern ',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'한상용','jinAir','flyAgain@gg.aaa','test','0101234544', 3,'그리핀','rip 진에어...',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'test39','test39','test39@test.com','test','0101234545', 1,'test','test',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'chin','ischin','orle@oracle.un','test','0101287994', 3,'vorlegen','Fleischindustrie vorlegen',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'烈庆','祝新小','faaaKdd@china.com','test','0101234546', 3,'烈庆祝新小','1-哎呀我就去!热烈庆祝新小吧上任! 2',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'我就去','我就去','da445lis@sfs.net','test','0101234547', 1,'烈庆小','烈庆祝新小',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'나루토','김나루','naru@ninja.km','test','0101234548', 1,'호카게','나는 호카게가 될거야
받아라 나선수리검',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'강남','에건물백채','gagan@krkk.com','test','0101234549', 1,'가지고싶다','Young And Rich',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'스윙스','돈까스','swings@hip.hop','test','0101111150', 2,'불도저','우사인 볼트가 왜 1등인지알아요?
끝까지 달렸기 때문이에요',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'部新任发言人','发','ching@ff.gg','test','0101234552', 1,'部新言人','外交部新任发言人汪文斌亮相新',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'신태일','아구몬','digi@mon.gin','test','0101234553', 1,'agumon','태일아 진화시켜줘',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'리키','rickyee','rick@mon.gin','test','0101234554', 1,'agumon','파피몬 진화하면 가루몬',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'사라코너','sara conner','sara@mon.gin','test','0101234555', 3,'john conner','존코너는 어디이싼',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'Learn sara','citizen','becoming@d11.zz','test','0101234556', 2,'becomin','Learn the steps to becoming a U.S. citizen',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'Naturalization','Application','about@for.in','test','0101234557', 3,'becomin','Be prepared for questions 
about the N-400 Application for Naturalization',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'이타치','탈주닌자','itachi@5s.nin','test','0101234558', 3,'탈주','너는 부족하다 증오가...',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'제시카알바','jassy','jassy@51.in','test','0101234559', 3,'jassy','jassysexxysexxxu',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'술탄오브더디스코','술탄오브더디스코','sultan@sul.tan','test','01012345560', 1,'디스코','나는 요술왕자',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'government','ovent','tor@sul.en','test','0101234561', 1,'Study','Study U.S. history and government for the English test',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'장발장','빵한개의눈물','torsui@gg.af','test','0101234562', 3,'germansiy','r efficacité. Nous vous présenterons ég',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'体离','集体离','takkcl@s1l.ch','test','0101234563', 1,'所回','研究所回应集体离职:被挖走的',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'강백호','희대의천재','basket@ball.game','test','0101234564', 2,'북산','왼손은 거들뿐',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'서태웅','농구귀신','tea@ball.game','test','0101234565', 2,'북산','음...',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'채지수','고릴라','gorilla@uu.game','test','0101234566', 2,'북산','파리채 블로킹!!',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'des','utiliser','partees@u23s.e','test','0101234567', 1,'ksanxllkk','edia et ses partenaires à utiliser des cookies et des t',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'collecter','pour','des33s@u23.net','test','0101234568', 1,'Cesrten','Ces partenaires peuvent 
pour collecter des',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'강감찬','강감찬장군','ggchan@ne.net','test','0101465877', 1,'살쑤','오랑캐를 죽여라',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'손오공','son','son@heme.dot','test','0101234569', 2,'사이어인','계왕권 16배로 단련된 나의 포토실력',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'베지터','제일예쁜베지터','pretty@vag.dot','test','0101234570', 3,'사이어인','사이어인 정통환자 제일예쁜 베지터',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'ひとつで','詐欺やフィ','dkllxk168@va.dot','test','0101234571', 3,'でワンクリ','これひとつでワンクリック詐欺やフィッシング詐欺な',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'장복례','복례띠','book@nes.net','test','0101234572', 1,'해남','',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'بارت','تداء كم','opqll@nsds.net','test','0101234573', 1,'ارت','بارتداء كملعامة',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'유재석','압구정날라리','yjs@test.com','test','0101234574', 2,'무한도전','압구정~날라리~~~',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'정형돈','강북멋쟁이','jhd@test.com','test','0101234575', 2,'무한도전','강북멋쟁이',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'artists','Knowledge33','from@test.top','test','0101234576', 3,'Knowledge from top','Knowledge from top artists from all over the world!',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'Subscribe','course224','trends@en.en','test','0101234577', 1,'trends in motion','Subscribe for our emails and trends in motion design',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'성북구','성남구','sung@sah.en','test','0101234578', 3,'가르리','',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,' البر','لبر ار','cllkx@sah.en','test','0101234579', 2,' البر','كان ت البرازيل من ',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'档新','工后首批','sjxk@chinh.ll','test','0101234580', 3,'工后首批','影院复定档新片',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'메르세데스','벤츠','bentc@cdh.ll','test','0101234581', 2,'bollckl','skclly',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'vocabulary','prtion','sssk@cggh.ll','test','0101234582', 3,'tenioc','English speaking, listening, vocabulary, pronunciation,',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'고명환','리카','jogasaky@rika.ll','test','0101234583', 1,'idole@Master','im ready~~',sysdate, 'Y');


insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'ة ',' الق','silcl@arap.hl','test','0101234585', 3,'ل نهاي','بحلول نهاية القرن.',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'한지우','포켓몬마스터','poket@mon.ma','test','0101234586', 1,'피카츄','나는 포켓몬마스터가 될거야',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'이슬이','이슬이','lii@asgas.lfl','test','0101234587', 2,'토게피','토게피 어디갔니',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'なソ','プルなソリ','dlvk@jnet.jp','test','010223416587', 2,'ソリテ','토게피 はシルなソリティアゲーム',sysdate, 'Y');


insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'박다혜','Park DaHae','pd@test.com','test','0101234589', 1,'더좋은아카데미','현재 일러스트 공부중입니다.
많이 알려주세요~',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'정다빈','다빈쓰','jdb@naber.net','test','0101234590', 3,'실력향상','1달에 1프로젝트 제작을 목표중...',sysdate, 'Y');

insert into member
value(member_no,member_name,member_nick,member_email,member_pwd,member_phone,member_check_question,member_check_answer,member_comments,
        member_cre_date, member_sign_check)
values(member_mno_SEQ.nextval,'강강강강강','강빈','strongDo@do.net','test','0112341459', 3,'근육','잘부탁드립니다',sysdate, 'Y');




-----프로필 이미지 추가
insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 1 ,'관리자.jpg','6f0b5fae3d2e435091aeb1d245ef169c.jpg');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 2 ,'공사중.jpg','f263363e1d5c411080a830a046958f80.jpg');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 3 ,'초콜릿.png','341150078f7a4df29ed7a314f3467d06.png');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 4 ,'아구몬.jpg','dd7ca1285f434970ad10c3408ad413b0.jpg');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 5 ,'rion.png','cb5d07fa1a6d4d888a8bd63e0f2561e8.png');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 6 ,'꼬북이.jpg','34f61b178ab0474fb4fa3071da85f42e.jpg');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 7 ,'dizimon.jpg','587415763f9d46f2a2c28fd24fc95b19.jpg');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 8 ,'개사진.jpg','ddb988c9732a47628f4b7cbd3d0afe3b.jpg');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 9 ,'애니미즘.png','d65c54c08a9b464c91e5b7a1feedd1af.png');


insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 10 ,'자르반.jpg','f2ec738c2c164cb6918a51e892d08c7b.jpg');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 11 ,'maple.jpg','fab3ffa5117a486cb7d0456c73754b81.jpg');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 12 ,'heart.jpg','b503e61423b240279a937e67467fe250.jpg');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 13 ,'jinjin.jpg','d29a215ac9554977ae26e2a2055308c0.jpg');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 14 ,'다운로드.jpg','f3f76a21cb4141ebba5d0c382ebff592.jpg');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 15 ,'다운로드.png','bc329b57c43a4e6c9535b3b3d5a5ae81.png');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 16 ,'개굴밥.jpg','1ff66c63393647e4a8495a029b4ad7eb.jpg');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 17 ,'경남.png','19c43cf174ed42fc93cb0d130dd95efa.png');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 18 ,'unnamed.jpg','c5de993ad33d43d196d5bf16234886b8.jpg');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 19 ,'홍길동.png','d40b91badea34f91a5809a0f4634e662.png');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 20 ,'taatat.jpg','d4f982be26a44168a740d62a050f80f3.jpg');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 21 ,'506730_168965_1818.jpg','dae24f44e4144f09aa25fce1d4874862.jpg');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 22 ,'restmb_allidxmake.jpg','e617de078fc34219bc9cfdab49870c75.jpg');

insert into profile_table
value(PROFILE_TABLE_NO, PROFILE_TABLE_MNO, PROFILE_TABLE_ORIGINAL_NAME, PROFILE_TABLE_STORED_NAME)
values(profile_table_ptno_SEQ.nextval, 23 ,'곰_(2).jpg','3d02f68723154670b4ddead955cb5e12.jpg');

select member_comments
from member;

commit;
-------------------------------------------
select *
from member;
----------------------자유게시판 글
insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,1,'관리자입니다','자유게시판입니당.', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,2,'현성의 쟁기로 새 문명의 밭을 갈다 제6편 신장방광편','자연의 원리 강의록 『현성의 쟁기로 새 문명의 밭을 갈다』 시리즈 전 6권을 마무리 짓는 본서
「신장·방관편」 에서는 현시대를 살아가는 많은 사람들이 겪고 있는 질병인
신장·방광이 허약해짐으로 인하여 혈액이 탁해지고 신장 기능이 나빠지는 과정들을
자연의 원리, 생명 원리의 관점에서 심도 있게 집중적으로 다루었습니다.
현대의학은 한 번 나빠진 신장은 회복되지 않는다고 말하고 있습니다.
본 강의록에서 언급하는 현성의학에 따르면 그 사람의 6장 6부 중에서
신장·방광이 제일 허약해지면 석맥이 나타나는데,
맥을 개선하면 신장이 나빠졌다 하여도 회복되는 속도가 약간 느릴 뿐
회복할 수 있다고 분명하게 말하고 있습니다.
현성의학은 신장이 허약하여 석맥이 나왔으니 석맥을 고치라고 말합니다
석맥이 고쳐지면 신장과 방광의 기능이 회복되어 건강한 사람으로 돌아가는 것입니다.
이 시대의 대표적 질병인 당뇨, 고혈압, 각종 암, 중풍 등은 신장이 병드는 것과 밀접한 관계가 있으며, 일체의 모든 염증의 
원인도 신장과 관련이 있음을 본 강의록에서는 설명하고 있습니다.
또한 류마티스, 루푸스 등 각종 희귀병, 대상포진과 통풍도 어렵지 않게 해결되는 병입니다.
지금 천만 명이 넘는 사람들이 탈모로 인해 고통 받는다고 합니다. 탈모 환자의 80% 이상이
석맥이 나오기 때문인데, 현성의학에서는 신장·방광을 튼튼하게 하면 탈모도
개선될 수 있음을 분명하게 말하고 있습니다.
또한 본 강의록에서는 치매와 조현병(정신질환), 중풍에 대해서도 그 원인과 증상,
대처방법에 대해 알기 쉽게 설명하였습니다.
본서는 우리 민족 3대 경전 중 『천부경』과 『삼일신고』에 대해 해설한 내용을 수록했습니다.
책 문의 010-8468-0321.', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,3,'[서울책보고] 온라인 책처방 <어디서든 책처방>','서울책보고 온라인 책처방 <어디서든 책처방>
**서울책보고는 코로나19 확산 방지를 위해
기존 오프라인 운영 프로그램을 온라인으로 대체하여 운영합니다.
<어디서든 책처방>은 어떤 책을 읽어야 할지 몰라 고민되시는 분들,
나에게 맞는 책은 어떤 책일까 궁금하신 분들, 책과 관련된 해답을 얻고 싶은 분들을 위한 
서울책보고의 온라인 책처방 프로그램입니다.
<어디서든 책처방> 참여방법
1. 서울책보고 홈페이지 내 <문화프로그램 - 어디서든 책처방> 내원
2. 온오프믹스 신청링크를 통한 신청 접수(2주단위 월요일 오픈)
3. 안내에 따라 도서 진단지 제출(월요일)
4. 북 레시피 닥터의 처방전 수령(금요일)
* 신청링크 : 운영기간내 2주단위 월요일 공지사항을 통해 오픈
* 북 레시피 닥터 : 박연식 작가(전방향독서심리상담연구소장)', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,10,'미니멀라이프 책 추천해주세요.','미니멀라이프 너무 하고싶은데 어려워요.. 도움받으신 책 있다면 추천 해 주세요^^*', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,2,'이번한주 마무리하면서 좋은글귀 보시고 푹 쉬세요 ~!','여러분 불금 잘 보내시고 계신가요?ㅎ
저는 요즘에 코로나와 점점 폭염에 가까워지는 날씨때문에....ㅠㅠㅠ
집에만 있는 시간이 더 많아졌네요 ㅠㅠ
쉬면서 뒹굴뒹굴 거리며 베스트 셀러 에세이 읽는 재미에 푹 빠졌습니다. ㅎㅎ
지인한테 에세이 추천 해달라고 했더니 베스트셀러 에세이 한권 있다고해서 이번에 구매해봤는데
예전에 본 책들은 다 위로해주거나 예쁜말들이 많았는데
이 책은 뭔가 돌직구 마냥 시원시원한 글귀도 많네요 ㅎㅎ
욕도 나오고 약간 직설적인 에세이네요 ㅎㅎㅎ', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,7,'유튜브 리딩맨: 책 읽어주는 남자 를 소개합니다','안녕하세요 :)
저는 <리딩맨: 책 읽어주는 남자>라는 유튜브를 운영하고 있으며 오디오북과 음성 컨텐츠를 주로 올리고 있습니다. 
아직 많은 부분이 부족한 채널이지만 여러분들께 제 유튜브 채널을 여기 소개해 드리려고 합니다. 
<리딩맨: 책 읽어주는 남자>는 좋은 책과 글들을 제 목소리로 정성을 담아 읽어드리고 있고 여러분은 편안하게 듣기만 하셔도 됩니다. 
잠들기 전에 듣기에도 좋아요 :) 
많은분들이 각박한 인생 속에서도 저의 채널을 통해 휴식과 힐링을 얻기를 바라는 마음으로 콘텐츠를 만들어나가고 있습니다. 
비주류 컨텐츠를 올리는 작고 소박한 채널이지만 저의 유튜브를 찾아주시는 한분 한분이 모두 여기서 큰 행복을 안고 가셨으면 좋겠습니다. 
감성과 사랑이 가득한 리딩맨의 유튜브 채널로 여러분을 초대합니다. 
고맙습니다 :) ', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,5,'오늘 먹었던 떡볶이 입니다~! 다들 점심은 드셨나요?','점심에 무엇을 먹을까 하다가 간만에 떡볶이가 먹고싶어서
떡볶이집을 가봤는데 맛은 적당히 좋았는데 양이 상당하네요 ㅎㄷㄷ;;;
얼마전에 지인이 엽기 떡볶이에 교촌치킨 먹는법을 알려줬는데
여긴 아예 대놓고 두개를 다파네요 ㅎㅎ
여러분도 꼭 끼니 챙겨드세용~!', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,4,'인간관계론 출판사','저작권이 끝나서 여러출판사가 있던데 내용은 다 똑같나요? 목차가 다 달라서 고민이네요..', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,9,'책 추천쩜 해주세요...','정말 감명깊게 읽은 소설책 추천쩜
해주세요 ㅜ.ㅜ 책사이즈는 작으면
작을수록 좋을것같아요 이동하면서
볼꺼라...', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,11,'윤동주 <어머니>','어머니


                                                                               - 1938년 5월 28일


어머니!

젖을 빨려 이 마음을 달래어 주시오.

이 밤이 자꾸 서러워지나이다.


이 아이는 턱에 수염자리 잡히도록

무엇을 먹고 자랐나이까?

오늘도 흰 주먹이

입에 그대로 물려 있나이다.


어머니

부서진 납인형도 슬혀진 지

벌써 오랩니다.



철비가 후누주군이 나리는 이 밤을

주먹이나 빨면서 새우리까?

어머니! 그 어진 손으로

이 울음을 달래어 주시오.


                                                       -106페이지-
동주의 처음 보는 시이다. 작금의 어두운 현실에 간절함과 절박함이 담겨 있다. 그의 여타의 시와 정서상의 흐름을 벗어나지 않는다.
 다만 처음 보는 시이다. 인터넷에 검색해 보니, 이미 많이 돌아다닌다. 몰랐다. 나만?? ', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,4,'6월 맘스데이 임신육아 페스티벌 일정 알려드려요~','6월 맘스데이 임신육아 페스티벌 일정입니다.
코로나19 확산으로 오프라인에서 진행이 안될 경우
온라인 LIVE로 변경되어 진행되며
신청하신분들에게는 연락을 드린다고 합니다.
육아와 산모 모두 참여가능한 임신육아교실 맘스데이
엄마가 행복한날  맘스데이TV 6월 함께해요~', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,15,'유월의 향기 ... 박현희','유월의 향기   ... 박현희
                        
두렁에 무리지어 하얗게 핀
망초꽃 이파리
살랑이는 실바람에 한들한들 나부끼는
한적한 유월 한낮은
싱그러움이 넘쳐서 참 좋습니다.
 
앙증맞고 소담스러운 망초꽃 향기
바람결 타고 솔솔 날아와 코끝을 간질이면
은은한 향 내음에 취한 작은 벌 나비떼
어디선가 하늘하늘 날아와
노란 꽃술의 애무가 한창입니다.
 
풋풋하고 아담한 꽃송이
한 다발 꺾어 모아
예쁜 화병에 꽂으면
하얀 망초 꽃으로도
소박한 행복은 한 아름 피어오릅니다.
 
흔하디흔한 꽃이라
누구 하나 관심 두지 않아도
순백의 아름다움이 넘쳐나는
하얀 망초 꽃잎 사이로
유월의 향기는 짙어만 갑니다.', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,12,'우한시 화난수산시장 바이러스 검사 결과 내부보고서 유출','신종 코로나 바이러스가 확진자가
계속 속출하고 있습니다
신종 코로나 바이러스는 우한시에서 화난수산시장에서
바이러스가 검사 결과 나왔다고 합니다
확실한 입장을 밝히지 않는 중국은
신종 코로나 바이러스 대한 진실을 밝히 알려 주었으면 좋겠습니다
아직도 확진자가 속출하고 있습니다
사회적 거리를 두기와 마스크 쓰기를 생활화 합시다', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,14,'인생은 가볍다','삶이 답답하고 무거울 때.
무엇을 할지 더 힘들게 만듭니다.
작가 김훈이 쓴 ‘결국은 가볍다. 어떻게 죽을 것인가’를 요약한 글입니다.
삶을 가벼이 하기를 바랍니다.
화장터에서 죽은 사람의 관이 전기 화로 속으로 들어가 시간이 몇 십 
분쯤 지나면 ‘소각 완료’, 조금 더 후에는 ‘냉각 중’이라는 글자가 켜지고 
화장은 끝이 난다. 흰 뼛가루가 컨베이어 벨트에 실려서 나오고 한 사람 분은 
한 되 반 정도이다. 세 살 난 아기도 ‘소각’된다. 관이 내려갈 때 젊은 엄마는 돌아서서 
울었다. 뼛가루의 침묵은 완강했고, 범접할 수 없는 적막이 흐른다. 죽음은 날이 저물고, 
비가 오고, 바람이 부는 것과 같은 자연현상이었다. ‘일상생활 하듯이 그렇게 가볍게 
죽어야겠구나.’라는 생각이 들었다. ‘질척거리지 말고 가자, 지저분한 것들을 남기지 말고 
가자, 남은 것 있으면 다 주고 가자.’ 책장을 들여다보았더니 지니고 있었던 것의 거의 전부(!)가
 쓰레기였다. 이 쓰레기더미 속에서 한 생애가 지나갔다. 똥을 백자 항아리에 담아서 냉장고에 
넣어둔 꼴이었다. 나는 매일 조금씩, 표가 안 나게 이 쓰레기들을 내다버린다. 뼛가루에게 무슨 
연민이 있겠는가. 삶은 무겁고 죽음은 가볍다. 죽음은 싸워서 이겨야 할 대상이 아니다. 결국은 가볍다.', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,13,'오늘 먹었던 떡볶이 입니다~! 다들 점심은 드셨나요?','점심에 무엇을 먹을까 하다가 간만에 떡볶이가 먹고싶어서
떡볶이집을 가봤는데 맛은 적당히 좋았는데 양이 상당하네요 ㅎㄷㄷ;;;
얼마전에 지인이 엽기 떡볶이에 교촌치킨 먹는법을 알려줬는데
여긴 아예 대놓고 두개를 다파네요 ㅎㅎ
여러분도 꼭 끼니 챙겨드세용~!', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,17,'앗싸 ~ 글판이 열리네요. 고맙습니다 ~~ 알라뷰 ! ^^','너무 힘든 시기라서.
우리님들 무탈 하시겠지요.
신간의 사진 한장도 못 올리고. 그럭저럭 4 개월도 지난 지금.
마치 보호자 없는 생명체처럼.  스폰서도 없고. 신문 잡지의 세상도 지나가고.
하다보니 완전 방치된 불쌍한 책. ㅎㅎㅎ
오래된 우리 사이트. 누가 오시는지. 가시는지. 저는 또 남기고 갑니다.
엉뚱하게도 미국 달라스 [뉴스코리아] 컬럼 쓰는 분이 제게 먼저 보낸 초고를
손질 안하고 부쳐 봅니다. 엉망인 마춤법은 신문사에서 교정하겟지요.
그저 함 구경하시고. 책도 인터넷 구입 가능하니. 과연 재밌는지 .... ㅎㅎ
이렇게 문안 드립니다.  건 행 (건강과 행복이라죠 ) 하십시다.', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,19,'책 제목이 죽어도 기억이 안나요ㅠㅠㅠ 아시는 분 계실까요?','한국의 남성 작가 (4~60대 추정)
예술가(아마도 화가)
내용
: 시력(확실하지는 않음)을 점차 잃어가고 시력을 잃었다가 기적적으로 회복한 과정에서 느낀 자신의 삶의 철학을 예술적 관점으로 정리한 책
시력을 잃어가면서도 그 과정을 그림으로 그리는 내용이 있었던 것 같음
뭔가 추천사가 있었던 것 같기도 함
2~3년전에 지하철에서 리디북스에서 이북으로 읽은 기억이 있는데 끝까지 다 읽지는 않았지만 사고방식과 문체가 흔치 않은 느낌이라
인상깊었던 책인데 다시 읽으려고 찾는데 도저히 기억이 안나서 
혹시나 알고계신 분이 계실까 싶어 글로 적어봅니다ㅠㅠ', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,21,'[수다]옆집 배송사고','얼마전에 받은 택배도 책이었죠. 
어버이날 행사와 어린이날 그리고 택배시스템 발달로 택배가 자주 오는데 정말 드물게 제 택배물이 옆집에 있기도 해요.
며칠전에 로젠기사님이 제게 전화로 옆집물건이 들어갔는지 확인 전화를 주셨어요.
택배를 여러개 받았지만 다 제가 신청했던 것들이라 그런 물건은 없다고 했지요. 도대체 무슨 물건인지 되묻기도 했구요.
택배기사님의 다급한 목소리가 안타까워 주변이나 확인해볼 요령으로 나갔는데 옆집문 앞에 택배상자와 노란색포스트잇이 붙어있더군요.
 송장스티커는 옆집으로 정상적으로 표기되었는데 택배 
겉면에 큼직하게 윗층으로 기입되어  윗층에 배달되었고 윗층은  겉박스를 개봉후 오배송상품을 인지하고 직접 문앞에 갖다줬어요.
전 때마침 그걸 발견하고 택배기사님께 전달하고요.
보통은 잘못 배달되면 기사가 찾을때까지 그대로 두는데 윗층분이 직접 갖다주고 메모까지 남기니 감동받았어요.
직접 갖다준 경우를 처음 봤거든요.
자신의 물건이 아니고 주소도 아는데 1주일이나 가지고 있던 이웃을 겪어서 자신의 실수가 아니더라도 약간의 수고로움을 기꺼이 
하는 이름 모를 이웃의 존재는 마음을 따뜻하게 합니다.', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,22,'출첵합니다~','ㅊㅊ', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,23,'오늘도 비가오네요 ~^^','계속 날씨가 엉망이네요 ㅎㅎ 
쟁사도안되고 ㅜㅡㅜ 
다들 화이팅합시다!', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,12,'날씨가 흐리네요.~','오늘도 화이팅하세요~', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,15,'도배 죄송합니다.','등업을 해야되서요;;', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,8,'가입했습니다~~','잘 부탁드립니다~', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,19,'배달음식도 하루이틀이지...','다들 점심 뭐 드시나요?
전 오늘 떡볶이!!', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,17,'코로나조심 건강조심입니다','제발제발제발요~', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,11,'좋은아침임돠~','즐거운하루보내세요~', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,14,'한걸음씩!','한걸음씩! 느리지만', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,16,'안녕하세요!','무료로 사용할 수 있는 사이트를 알게되서 기쁩니다!! 감사드려요! ㅎㅎ', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,8,'여기좋은데?','사진 넘나좋아요~', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,7,'이제 반정도 쓴것같다','정말.. 양심엔 찔리지만 급한 맘에 어쩔수 없음!!', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,3,'이미지!','함께 할수있어서 감사합니다.', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,4,'만들기 힘들어요!!','만들기 힘들어요!!', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,14,'안녕하세요~ 가입인사 드립니다.','안녕하세요~ 가입인사 드립니다.', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,21,'블리드가 뭔가요?','블리드에 대해 알려주세요!!!', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,23,'만만세~','만만세~~~~~', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,19,'수도권·광주·대전 곳곳서 확진자 잇따라','모이지 말고 자제들 좀 하라고 해도 왜 자꾸 모여서 종교를 욕먹일까요. 
특히 교회들!!
이번엔 절 확진자도 있지만, 교회 확진자 나올때마다 너무 화가 납니다. 
국민들 대다수가 화가 나 있어요.  
교회 욕은 자신들이 다 먹이고 있다는거 알려나 모르겠네요.
모이지 말라면 좀 모이지 마세요. 
가만 있는 교회까지 휘말려서 너무 짜증납니다!', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,9,'하지만 어쩔수없는걸...','등업완료인가요 !!?
', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,4,'도배가 되어버렷...','죄송합니다..ㅠㅠ', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,11,'와 정말 여름이네요...','며칠전만해도 일교차가 심해서
저녁에는 엄청 추웠는데
지금은 저녁공기도 뜨끈~~
에어컨, 선풍기는 필수인거 같아요
다들 에어컨, 선풍기 트시나요???ㅠㅠ
저는 이번에 아이가 선풍기에 손넣는거 보고
날없는 선풍기 무풍선풍기 구매했네요ㅜㅜ
이번 여름엔 여름이 짧았으면 좋겠네여ㅎㅎ', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,12,'아래글 제제좀여 신천지 스멜 ㅋㅋ','역겨워서 죽여벌고싶네요 허허', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,17,'코로나19 감염은 죄인가 피해인가?','지난달 28일로 대구교회에서 코로나19 확진자가 발생한 지 100일이 되었고
방역을 이유로 전국 신천지교회가 폐쇄된 지도 100일이 되었습니다.
원치 않은 코로나19 감염자에게 살인죄를 운운하며 책임을 묻고 
세무감사, 검찰조사에 법인 취소까지 쉼 없이 압박을 가하는 행태가 
‘정의’인지 정말 ‘방역’ 때문인지 많은 의문을 낳고 있습니다. ', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,16,'좋은자료가 많네요','직접 사진찍어 인스타하고 있는데 도움되는 자료가 많아요
운영자님 감사합니다
', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,15,'코로나','다들 코로나 조심하시고 힘내세요.', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,17,'양선지해장국','양선지 해장국도있나요?', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,13,'오늘도 잼나게~~','오늘도 힘차게 하루 보내요~~~~', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,7,'코로나 때문에 매출도 없고 많이 힘드네요~~','다들 힘내시고 이 카페는 도움되는 일이 많을거 같아 너무 좋은거 같네요~~^^', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,2,'코로나','코로나가 빠르게 정리 되었으면 좋겠습니다.', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,4,'힘내요!','힘내서 다들 !! 열심히 이겨내요~', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,8,'코로나19 기원 조사','신종 코로나바이러스 감염증(코로나19) 기원을 둘러싼 온갖 추측이 난무하는 가운데
세계보건기구(WHO)가 6일 추적을 위한 전문가팀의 중국 파견을 검토하고 있다네요.
이번 파견은 학술적인 부분에 초점을 맞추면서 
코로나19 확산 초기 중국에서 무슨 일이 있었는지 살피고 
이를 통해 동물원성 기원을 찾기 위한 새로운 접근법을 모색할 수 있을 것이라고 하네요.
제발 이번 파견을 통해 철저한 조사가 이뤄졌으면 좋겠네요', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,10,'코로나19','끝나라...', sysdate);

insert into free_board
value(free_board_no,free_board_mno,free_board_title, free_board_contents, free_board_cre_date)
values(free_board_fbno_seq.nextval,10,'나이','젊을때는 일이 무겁게만 느껴졌는데!
나이가 60에 가까워지니 일을 할수 있음에 감사하게 되네요~
여러분 오늘도 화이팅 입니다!^^', sysdate);

commit;
---------------------------------------

select *
from free_board;

----------------------------------------
-- 작품게시글 삽입
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,2,'종이컵 아트',0,sysdate-9,null,'N','p','종이컵을 가지고 아트를 해보았습니다. 어때요? 멋지죠');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,3,'휴식',0,sysdate-9,null,'N','p','휴식에는 커피 한잔');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,4,'인도할머니',0,sysdate-9,null,'N','p','인생을 곱씹고 있는 인도의 할머니를 찍었습니다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,5,'미래 신기술 시연회',0,sysdate-9,null,'N','p','미래의 기술을 시연하고 있는 현장');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,6,'이집트 신화',0,sysdate-9,null,'N','p','이집트 신화중 멍멍신 그림. 동물을 신으로 모시는 것 같다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,7,'흑인 자화상 스케치',0,sysdate-9,null,'N','p','흑인의 삶을 녹여 그린 그림.. 슬퍼보인다...');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,8,'AFTER OPPORTUNITY',0,sysdate-9,null,'N','i','AFTER OPPORTUNITY - Hi I am Go');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,9,'그 어느 순간의 구름',0,sysdate-9,null,'N','p','그 어느 순간의 구름 첫번째 사진이다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,9,'그 어느 순간의 구름 - 두번째',0,sysdate-9,null,'N','p','그 어느 순간의 구름의 두번째 사진이다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,9,'그 어느 순간의 구름 - 세번째',0,sysdate-9,null,'N','p','그 어느 순간의 구름 세번째 사진이다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,9,'그 어느 순간의 구름 - 네번째',0,sysdate-8,null,'N','p','그 어느 순간의 구름 네번째 사진이다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,10,'어느 나라의 구름 - 1',0,sysdate-8,null,'N','p','어느 나라의 구름 - 1편,
구름을 보며
반성');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,10,'어느 나라의 구름 - 2편',0,sysdate-8,null,'N','p','어느 나라의 구름 - 2편,
구름을 보며
반성');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,10,'어느 나라의 구름 - 3편',0,sysdate-8,null,'N','p','어느 나라의 구름 - 3편,
구름을 보며
반성');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,11,'메마른 강 위의 육교',0,sysdate-8,null,'N','p','강이 메마른 이유는 지구 온난화 때문이다');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,11,'내가 살고 싶은 집',0,sysdate-8,null,'N','p','내가 살고 싶은 집은 구름도 있고 도로도 있고 자동차도 있고 그다음은엔 행복이 있다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,12,'유럽의 모델 사진 - 1',0,sysdate-8,null,'N','p','유럽의 모델 사진 - 1');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,12,'유럽의 모델 사진 - 2',0,sysdate-8,null,'N','p','유럽의 모델 사진 - 2');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,12,'유럽의 모델 사진 - 3',0,sysdate-8,null,'N','p','유럽의 모델 사진 - 3');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,12,'유럽의 모델 사진 - 4',0,sysdate-8,null,'N','p','유럽의 모델 사진 - 4');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,13,'내가 사고 싶은 신발 라인업',0,sysdate-7,null,'N','p','내가 사고 싶은 신발 라인업 - 나이키, 아디다스, 뭐있지');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,13,'미국의 모델 시리즈 1편',0,sysdate-7,null,'N','p','미국의 모델 시리즈 1편입니다. 내용은 생략하겠습니다. ');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,13,'미국의 모델 시리즈 2편입니다. 내용은 생략하겠습니다. ',0,sysdate-7,null,'N','p','미국의 모델 시리즈 2편입니다. 내용은 생략하겠습니다. ');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,13,'미국의 모델 시리즈 3편 ',0,sysdate-7,null,'N','p','미국의 모델 시리즈 3편입니다. 내용은 생략하겠습니다. ');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,13,'눈화장이 짙은 흑인여성분',0,sysdate-7,null,'N','p','눈화장이 짙은 흑인여성분 화장좀 적당히 하세요~');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,14,'선캡쓰고 동네 운동나온분',0,sysdate-7,null,'N','p','선캡쓰고 한강투어중 너무 힘들어요 다리아파요 ');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,14,'워킹이란 이런 것이다.!',0,sysdate-7,null,'N','p','나의 파워워킹을 보아라 이것이 워킹이다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,14,'패션을 잘 모르는 세 쌍둥이',0,sysdate-7,null,'N','p','아무래도 패션을 잘 모르는 세 쌍둥이인 것 같다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,14,'패션을 잘 모르는 쌍둥이',0,sysdate-7,null,'N','p','아무래도 그들은 패션을 잘 모르는 쌍둥이인 것 같다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,15,'어제 했던 카드게임',0,sysdate-7,null,'N','i','카드게임 추천합니다. 정말 재미있어요 ㅎㅎㅎ');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,15,'오늘 하고 있는 게임',0,sysdate-6,null,'N','i','망했어!');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,16,'공주님 방',0,sysdate-6,null,'N','p','아이구 우리 공주님 이쪽으로 오세요~~~');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,16,'Motion Design Music and Bolumar',0,sysdate-6,null,'N','i','Motion Design Music and Bolumar - in detail context in this pic');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,16,'4차원 일러스트',0,sysdate-6,null,'N','i','저는 이해하지 못했지만 누군가는 이해했으면 좋겠습니다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,17,'우리 몸안의 세포들',0,sysdate-6,null,'N','i','우리 몸안의 세포들을 귀엽게 표현해보았습니다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,17,'4차 산업은 로봇입니다. 로봇',0,sysdate-6,null,'N','i','로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇로봇');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,17,'내 손에 캔디~ 꿈처럼 달콤했니',0,sysdate-6,null,'N','i','사탕을 보니까 단게 땡기고 단게 땡기니까 쓴게 땡기고 쓴게 땡기니까 배가 고파지네요');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,17,'어두운 공간의 이상한 조형물',0,sysdate-6,null,'N','i','어두운 공간의 이상한 조형물 시리즈 1');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,17,'NAMASTE',0,sysdate-6,null,'N','i','NAMASTE HELLO');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,17,'RUSSIAN  X 6',0,sysdate-6,null,'N','i','RUSSIAN  X 6 Six pic in this picture');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,19,'콜게이트 치약모델',0,sysdate-5,null,'N','i','콜게이트 치약모델 - 1편');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,19,'콜게이트 치약 - SMILE',0,sysdate-5,null,'N','i','콜게이트 치약 - SMILE 웃으면 복이와요');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,21,'팔다리 알루미늄 로보트',0,sysdate-5,null,'N','p','팔다리 알루미늄을 재활용하여 만든 로보트');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,21,'중국 신화속 몬스터',0,sysdate-5,null,'N','i','중국 신화속 몬스터 모음입니다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,21,'배타고 항해하는 방법',0,sysdate-5,null,'N','i','1. 물을 따르고 2. 물을 받고 3. 물을 던지고 4. 배를 만들고 5. 북을 치고 6. 항해 꼬우~');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,22,'Always a childlike
sense of excitement',0,sysdate-5,null,'N','i','we live and breathe the creative 
process. It''s the place that we call
home. When a new project comes');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,22,'실인형 슈퍼로보트인형',0,sysdate-5,null,'N','i','실인형 슈퍼로보트인형 팔다리가 날라갔습니다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,22,'소금밭',0,sysdate-5,null,'N','p','소금 줌 X 100');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,9,'신경세포 현미경',0,sysdate-5,null,'N','p','현미경 줌 X 10000배 ');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,9,'SoleSavy',0,sysdate-5,null,'N','i','SoleSavyCharacter');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,7,'살고싶은 집 - 주방편',0,sysdate-4,null,'N','p','살고싶은 집 - 주방편');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,7,'살고싶은 집2 - 주방편',0,sysdate-4,null,'N','p','살고싶은 집2 - 주방편');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,7,'살고싶은 집 - 옥상편',0,sysdate-4,null,'N','p','살고싶은 집 - 옥상편');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,3,'컨테이너형식의 집',0,sysdate-4,null,'N','p','호');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,3,'계단있는 집 거실',0,sysdate-4,null,'N','p','계단있는 집 거실사진입니다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,2,'눈이 아플정도로 창문이 많은 집',0,sysdate-4,null,'N','p','눈이 아플정도로 창문이 많은 집,
나의 피로감도 비슷한것 같다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,2,'노랭집',0,sysdate-4,null,'N','p','노래노랭');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,17,'이탈리아의 한 도시',0,sysdate-4,null,'N','p','가고싶어라~');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,17,'모던 하우스',0,sysdate-4,null,'N','p','모던하다모던해');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,14,'초록초록한 테라스',0,sysdate-4,null,'N','p','테라스가 초록초록하다');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,14,'반사되는 공간',0,sysdate-3,null,'N','p','반사되는 공간.
그 심오한 의미.
...');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,5,'과거와 현재, 미래가 모두 공존하는 집',0,sysdate-3,null,'N','p','과거와 현재, 미래가 모두 공존하는 집
가장 현대적인 공간
 - 2019.02.10');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,5,'코엑스 스타일',0,sysdate-3,null,'N','p','빛이 반사되며 빛나는 우리만의 공간');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,10,'우리집',0,sysdate-3,null,'N','p','우리집 이쁘죠?');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,10,'곡선과 직선의 미래지향적인 건축디자인',0,sysdate-3,null,'N','p','미래지향적인 건축디자인 예시입니다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,11,'풀이 화사한 공간',0,sysdate-3,null,'N','p','화사하여라');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,11,'나만의 공간',0,sysdate-3,null,'N','p','소파가 정말 편합니다. 우리집이예요 히히');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,15,'분위기가 좋은 이탈리아의 한 도시',0,sysdate-3,null,'N','p','발 냄새, 시궁창 냄새');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,16,'분위기가 좋은 SOLID 가게 앞',0,sysdate-3,null,'N','p','이탈리아의 한 도시');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,6,'런던 한복판, 비 겁나 오네..',0,sysdate-3,null,'N','p','비오는 것은 정말 우울해');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,6,'가장 유명한 SF 사진',0,sysdate-3,null,'N','i','내가 좋아하는 SF 사진입니다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,13,'24세기 수술실 ',0,sysdate-3,null,'N','i','미래에서 찍어왔습니다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,13,'패션스타일 캡쳐 - 1 ',0,sysdate-2,null,'N','i','패션스타일 캡쳐 - 1 번쨰 리스트 !');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,7,'패션 스타일 견본 일러스트',0,sysdate-2,null,'N','i','패션 스타일 견본 리스트 첫번째 일러스트');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,7,'그 시절. 과거의 문화',0,sysdate-2,null,'N','i','문화적인 모습들을 닮은 일러스트 입니다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,7,'KOF Character - top 3',0,sysdate-2,null,'N','i','KOF Character - top 3 list .
Strong member, but i cant play ');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,7,'Street in Thai',0,sysdate-2,null,'N','p','Street in Thai in Pic');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,2,'내가 그린 손그림',0,sysdate-2,null,'N','i','연필로 그렸고 정말 심심하고 귀찮고 피곤하고 근데 좀 잘그린거같습니다');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,2,'내가 그린 손그림 시리즈 2',0,sysdate-2,null,'N','i','연필로 그렸습니다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,4,'벽에 그리는 벽화그림',0,sysdate-2,null,'N','p','내가 그린 기린 그림은 목숨을 걸고 그린 기린 그림');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,4,'캐릭터 시리즈 - ???',0,sysdate-2,null,'N','i','누굴까요?');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,4,'캐릭터 시리즈 - 닌자 거북이',0,sysdate-2,null,'N','i','유명한 만화캐릭터인 닌자 거북이를 그려보았습니다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,8,'캐릭터 시리즈 - 월리스',0,sysdate-1,null,'N','i','유명 만화캐릭터인 월리스와 그로밋');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,8,'캐릭터 시리즈 - 엘사',0,sysdate-1,null,'N','i','유명 디즈니 애니메이션 캐릭터인 엘사를 그렸습니다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,8,'캐릭터 시리즈 - 손오공',0,sysdate-1,null,'N','i','유명 애니메이션 드래곤볼의 주인공 손오공을 그려봤습니다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,8,'캐릭터 시리즈 - 심슨',0,sysdate-1,null,'N','i','유명 애니메이션 심슨의 호머심슨입니다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,8,'캐릭터 시리즈 - 마지 심슨',0,sysdate-1,null,'N','i','유명 애니메이션의 캐릭터인 마지심슨을 그렸습니다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,8,'캐릭터 시리즈 - ???!',0,sysdate-1,null,'N','i','누구인지 맞춰보세요 !?');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,14,'FOURFOURTWO - Neymar',0,sysdate-1,null,'N','p','WorldClass - football player 
Neymar');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,14,'FourFourTwo - Buffon',0,sysdate-1,null,'N','p','WorldClass Football Player - Buffon');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,23,'America animation Character',0,sysdate-1,null,'N','i','I love America animation Character 
so cute~~');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,3,'분위기 있는 일러스트',0,sysdate-1,null,'N','i','유명 일러스트레이터가 그린 일러스트 리스트 
어두운 분위기의 감성적인 디자인이다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,6,'미로를 그리는 사람',0,sysdate,null,'N','p','미로이미지입니다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,6,'만화 일러스트',0,sysdate,null,'N','i','만화캐릭터');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,17,'큐트 디자인 광고촬영',0,sysdate,null,'N','p','귀여운 컨셉의 광고촬영 현장입니다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,5,'미니어쳐',0,sysdate,null,'N','p','미니어쳐로 만든 캐릭터 귀여움 뿜뿜');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,11,'모델 광고촬영 현장..',0,sysdate,null,'N','p','광고촬영 현장입니다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,7,'요즘 유행하는 만화',0,sysdate,null,'N','i','요즘 제가 제일 좋아하는 만화입니다.
모두 제목을 찾아주세요!');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,19,'도트 디자인 이미지',0,sysdate,null,'N','i','도트 디자인 게임 이미지입니다.');
Insert into DESIGN_SPACE.PROJECT_BOARD (PROJECT_BOARD_NO,PROJECT_BOARD_MNO,PROJECT_BOARD_TITLE,PROJECT_BOARD_VIEWS,PROJECT_BOARD_CRE_DATE,PROJECT_BOARD_MOD_DATE,PROJECT_BOARD_DEL_FLAG,PROJECT_BOARD_CATEGORY,PROJECT_BOARD_CONTENTS) values (project_board_pbno_SEQ.nextval,3,'외국 친구들',0,sysdate,null,'N','p','외국에 있는 나의 친구들 요즘 유행하는
점프샷 사진을 찍기위해 노력중..
제발 그만해!');

-- 파일( DB ) 삽입
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,2,1,'1.jpeg','8fcd43dc4d8d46ae852b626cad6f4688.jpeg',sysdate-9,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,2,1,'1_2.jpeg','fc48d4debef04b469bc3f09fa5c399c3.jpeg',sysdate-9,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,2,1,'1_3.jpeg','7ab31d2bc5ee45cebed8d9acac799131.jpeg',sysdate-9,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,3,2,'2.jpg','ffd8a6dd8c2944e8b6878e80c4fbe991.jpg',sysdate-9,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,4,3,'3.jpg','ee68d7f38e984e2083abbefd695fea10.jpg',sysdate-9,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,5,4,'4.jpg','99e6c32c51554c79b1f6e627d1c40edc.jpg',sysdate-9,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,6,5,'5.png','b59e99a2c348455abb3a6a3177788152.png',sysdate-9,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,7,6,'6.jpg','c55ea1fc17074a34b59cd7bbecfdd604.jpg',sysdate-9,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,8,7,'7.jpg','1ac2d61e824f48ec951d33e7810ec296.jpg',sysdate-9,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,9,8,'8.jpg','12d7bc38d5f7471180835290d847fe0f.jpg',sysdate-9,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,9,9,'9.jpg','f8a99e58220c4bb2b609f19c4bd829e2.jpg',sysdate-9,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,9,10,'10.jpg','a70dfd1198ed429084437996720a2c02.jpg',sysdate-9,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,9,11,'11.jpg','e6e51a029a8f4b29be0bdc02a815681f.jpg',sysdate-8,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,10,12,'12.jpg','a0493ec88c164f86a5928d45a1cf4600.jpg',sysdate-8,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,10,13,'13.jpg','1586524a9c9843a187bb267817fed110.jpg',sysdate-8,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,10,14,'14.jpg','22d7d4725dce4dac90e1b54cab452da3.jpg',sysdate-8,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,11,15,'15.jpg','f2d2734251614e6086aa3073ffa62595.jpg',sysdate-8,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,11,16,'16.jpg','95c015353d4442e586a4c314f873ef07.jpg',sysdate-8,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,12,17,'17.jpg','fb85ed2c0a124eccbafd8a194f0894e8.jpg',sysdate-8,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,12,18,'18.jpg','d901f8a58914402483ba2ff25c8933af.jpg',sysdate-8,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,12,19,'19.jpg','a912192cf2b44bcd8078f8e0a45dd44e.jpg',sysdate-8,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,12,20,'20.jpg','cd563e3f95a440c3ab9e284a21bd5844.jpg',sysdate-8,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,13,21,'21.png','38a87216d6ba4792a271234000dadbe0.png',sysdate-7,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,13,22,'22.jpg','2ed80c570e7f4ad8bcd5efd3c7e731a6.jpg',sysdate-7,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,13,23,'23.jpg','70d5a8bf45fb43ef8dec5672fe59375e.jpg',sysdate-7,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,13,24,'24.jpg','f44bd0d6392b465bb990674d4203b376.jpg',sysdate-7,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,13,25,'25.jpg','67b6ad6436ae49309b03ef3709d931b2.jpg',sysdate-7,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,14,26,'26.jpg','a0c52341bf2549abb2eaaf56f8d438c6.jpg',sysdate-7,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,14,27,'27.jpg','a13fb5c191884e02be53e5ca7c9a0ddb.jpg',sysdate-7,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,14,28,'28.jpg','c57b8eac68c3470995435a64cd354aa8.jpg',sysdate-7,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,14,29,'29.jpg','9c00849b3f3c4cadb7abcbfa9e8f2ba5.jpg',sysdate-7,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,15,30,'30.jpg','fba0110d39c84c2e8c588b5bcddba2a0.jpg',sysdate-7,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,15,31,'31.jpg','0a63761751e747919113f52bb1d850ae.jpg',sysdate-6,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,16,32,'32.png','7f8feba6dd2446939d69e53648447bd7.png',sysdate-6,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,16,33,'33.png','a1352f9898214eb49e45e593ac2cabe3.png',sysdate-6,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,16,34,'34.jpg','9f9a73c6569c436a993e92dee6f611b6.jpg',sysdate-6,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,17,35,'35.jpg','c15bcf35c7cd4405a2a20f4ee82a41f4.jpg',sysdate-6,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,17,36,'36.jpg','a3853c4e4f164b488778bab9b7bb00fd.jpg',sysdate-6,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,17,37,'37.jpg','a41a8f0e7efb4aedbf41e9a364a2f370.jpg',sysdate-6,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,17,38,'38.jpg','5fa8eeba627f4b26aae39d0d405aad0b.jpg',sysdate-6,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,17,39,'39.jpg','11f97d99498548e38e8b26497580e3b5.jpg',sysdate-6,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,17,40,'40.jpg','fcf001a3edff4b0ea52d7a797350f0d6.jpg',sysdate-6,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,19,41,'41.jpg','37d4bab984594bf4bec2654cc022987e.jpg',sysdate-5,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,19,42,'42..jpg','c01e33cfcede4d58b2bcbd7fa6cbe2c9.jpg',sysdate-5,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,21,43,'43.jpg','5bbd3ed570e840a0b838d2dd8795d1bd.jpg',sysdate-5,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,21,44,'44.png','19eafb2d3ed347a98b1b101a88ba4ea4.png',sysdate-5,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,21,45,'45.png','1a87eaaf5cb5477eb7997f906d0ca30d.png',sysdate-5,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,22,46,'46.jpg','6632c5fd8a164ea2bd79318eb1e3c6d7.jpg',sysdate-5,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,22,47,'47.jpg','1d72571f82ed4f4e8b765eb7f00efb03.jpg',sysdate-5,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,22,48,'48.jpg','1f2d5b1fe3fd4421bad530b301054054.jpg',sysdate-5,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,9,49,'49.jpg','a2bba1e1c2a34fd9b9c446abe0d302eb.jpg',sysdate-5,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,9,50,'50.png','0dd93c5a7e2046019a44166aff15d0de.png',sysdate-5,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,7,51,'51.jpg','4d2985137b264cf1836b084aff18aaea.jpg',sysdate-4,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,7,52,'52.jpg','ba5a0b74aafd446abcd2cb9ce89e20fb.jpg',sysdate-4,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,7,53,'53.jpg','64ff089a16bf4f409c0d929fe1a067b9.jpg',sysdate-4,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,3,54,'54.jpg','bd6741cf60894ef1850b48ecc7a68315.jpg',sysdate-4,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,3,55,'55.jpg','e56fa4535e9243489f5860d89ab572e8.jpg',sysdate-4,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,2,56,'56.jpg','7da4fa180e3d492fb62a8ab3163fd89b.jpg',sysdate-4,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,2,57,'57.jpg','05bc78cb07e848dfafe9920b57514fe4.jpg',sysdate-4,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,17,58,'58.jpg','3d8731d831d345ea988768dc27b8453d.jpg',sysdate-4,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,17,59,'59.jpg','f1bede81e36e43829a79b11ba724b4ff.jpg',sysdate-4,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,14,60,'60.jpg','e3f08d50d02c4caf8a635295093e56b4.jpg',sysdate-4,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,14,61,'61.jpg','954793f630094de08d9a6dfa2e53d4c2.jpg',sysdate-3,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,5,62,'62.jpg','1f1221615dab45fd9d8a1c37ae5522f5.jpg',sysdate-3,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,5,63,'63.jpg','f5da26632dd0423285d5bbd41a655030.jpg',sysdate-3,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,10,64,'64.jpg','81acddb5cc884777ab4ca29aecb8cb18.jpg',sysdate-3,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,10,65,'65.jpg','d0ac6634d6fc4ec7bc3e25db1b3fba10.jpg',sysdate-3,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,11,66,'66.jpg','e0845de424934466ad0b00036ef1582b.jpg',sysdate-3,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,11,67,'67.jpg','63843158833a48c59f0dd2baad7c1ce0.jpg',sysdate-3,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,15,68,'68.jpg','19ba1e97d6954c81a9c0b3e4c68d471e.jpg',sysdate-3,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,16,69,'69.jpg','959d0df7ce00497894f8893ad9d2dd22.jpg',sysdate-3,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,6,70,'70.jpeg','6e537ccbbbff40a6a354977679e3992c.jpeg',sysdate-3,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,6,71,'71.jpg','83e2b71876164b398ff8d1755e0992eb.jpg',sysdate-2,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,13,72,'72.jpg','7ff05f2510354a2e87bab0e35a1c0d27.jpg',sysdate-2,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,13,73,'73.jpg','673a160ebac340968de95b53319557a5.jpg',sysdate-2,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,7,74,'74.jpg','720f1e081d9f4d60b56fc945dca34bc7.jpg',sysdate-2,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,7,75,'75.jpg','ef5cf32f751744d0bddd50947c6e3524.jpg',sysdate-2,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,7,76,'76.jpg','57ff806a9e9c4e14b3c4ccad51bb8813.jpg',sysdate-2,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,7,77,'77.jpg','074d65a951874516a6e8b56d6c0ab0f7.jpg',sysdate-2,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,2,78,'78.jpg','9f6f0b709d234d30ba80f924a1de07be.jpg',sysdate-2,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,2,79,'79.jpg','960d7a73ba79482f8d4de7747bf820c5.jpg',sysdate-2,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,4,80,'80.jpg','b1aee2d762d04998a9c26e5c7153bf87.jpg',sysdate-2,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,4,81,'81.jpg','5178934e934a4b2f86ff949e2c0a0e96.jpg',sysdate-1,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,4,82,'82.jpg','7fff3138a58c4f319b5a9a44fcf4c10c.jpg',sysdate-1,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,8,83,'83.jpg','ae382096ebd94e6cb4157c714c5cf0da.jpg',sysdate-1,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,8,84,'84.jpg','18a8bf364ae54359851366e1acedf79a.jpg',sysdate-1,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,8,85,'85.jpg','226feccbe5894dc08d6150c679e7de70.jpg',sysdate-1,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,8,86,'86.jpg','70e0c2ba4f43440893e6b08233dd4a18.jpg',sysdate-1,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,8,87,'87.jpg','e94580547a864672b6757606bac21c77.jpg',sysdate-1,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,8,88,'88.jpg','a58577d5dd4c4313a885ca17e6ad0013.jpg',sysdate-1,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,14,89,'89.jpg','2a7e880d497b4b48acd7c4e7b4109558.jpg',sysdate-1,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,14,90,'90.jpg','e602501559514a0db44b0cc783ea839e.jpg',sysdate-1,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,23,91,'91.jpg','95738895de83477eba8467d18d69a25b.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,23,91,'91_2.jpg','8c08f4d50a8a4204adae756b34b63f13.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,23,91,'91_3.jpg','fa8d0ea2a72341baae1a537277be7da7.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,23,91,'91_4.jpg','d37f11830b894cfeb08f78e0723f1c46.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,3,92,'92.png','bdd46d5c729843ed8473b55651a0526d.png',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,3,92,'92_2.png','1f6fced8160a40e68f49d025312da348.png',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,3,92,'92_3.png','2f0d432cd15f4cc59105d444675c33bc.png',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,6,93,'93.jpg','6587b4cd2bb942ef8a37b4122c242270.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,6,93,'93_2.jpg','e832486f80c24223841524b195ddeeee.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,6,94,'94.jpg','2f2d220cef254855ab9479decff7ab23.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,6,94,'94_2.jpg','fe7ee37621914b4286e6b747d56c77c0.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,6,94,'94_3.jpg','8442c585c17341b6a47f51962c8b294f.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,17,95,'95.png','cb67da4692fc4a5da12ad42321603dc4.png',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,17,95,'95_2.png','307a58c3247c430e8bafa104d38053b8.png',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,17,95,'95_3.png','183a5d4db1ec414a84cfb1907e7ac8fa.png',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,5,96,'96.jpg','760544490149447ab4dcd9f8cf9b1f5c.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,5,96,'96_2.jpg','8ab899c76e9448e3a1e7c298b8b84b61.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,5,96,'96_3.jpg','64ea098e4f69480b820af6f2a9a9fdae.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,11,97,'97.jpg','2fb9e5a23b2d418cae6dbc8becc32ccb.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,11,97,'97_2.jpg','6494812f14a248e8925ef9d026c48367.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,11,97,'97_3.jpg','352b7cbe90b34937a6460960c564ec43.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,11,97,'97_4.jpg','a9c0c5cac25b42979aa67c3788121574.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,7,98,'98.png','24e21a46be774226a319ec06f8a001e4.png',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,7,98,'98_2.png','fc27b30135fa4d24b79003feb61c6fdd.png',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,7,98,'98_3.png','f34fb8e52c64441fae9a5c5b33ab5c75.png',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,7,98,'98_4.png','c95d04976fb24abc9597e4b5c480a76d.png',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,7,98,'98_5.png','46cf4cbaddc4445c95efb4a75f925162.png',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,19,99,'99.jpg','41cabc2336b64c15b3a9e4066cdc3665.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,19,99,'99_2.jpg','f67f62319d91407eb52ff75f90df2faa.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,19,99,'99_3.jpg','6f8c14b5fa234e8099b29c9bcca6cd7f.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,19,99,'99_4.jpg','3e51e98ad8fa47dbaa2d23ca2a8f6b1e.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,3,100,'100.jpg','1a26bfd255eb4ee9b2cb6dd1af5fbc01.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,3,100,'100_1.jpg','c570214e036c412197dfd534fca57cb3.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,3,100,'100_2.jpg','d7da9b23b27347fbaa606ca78ce11afe.jpg',sysdate,null);
Insert into DESIGN_SPACE.FILE_TABLE (FILE_TABLE_NO,FILE_TABLE_MNO,FILE_TABLE_PBNO,FILE_TABLE_ORIGINAL_FILE_NAME,FILE_TABLE_STORED_FILE_NAME,FILE_TABLE_CRE_DATE,FILE_TABLE_MOD_DATE) values (file_table_ftno_SEQ.nextval,3,100,'100_3.jpg','887516bdff1048b8ae7c43e7bc6d1896.jpg',sysdate,null);

-----------QnA 게시물
INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 2, '회원탈퇴는 어떻게 하나요?', '회원탈퇴를 하고 싶은데 방법을 모르겠습니다. 운영자님 도와주세요', '2020-04-20');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 3, '신고는 어떻게 하는 겁니까?', '문란한 작품을 신고하고 싶은데 신고하는 방법좀 알려주세요', '2020-04-21');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 4, '회원정보수정에 대해서 문의드립니다', '회원정보수정하는 방법을 알고싶습니다', '2020-04-25');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 5, '작품올리는 법에 대해서 알려주세요', '작품은 어떻게 올리나요? 알려주세요 제발', '2020-04-27');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 6, '자유게시판도 신고가능한가요?', '자유게시판에 부적절한 단어가 쓰인 게시물 신고가능 합니까?', '2020-04-30');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 7, '아이디찾기에 대해서 궁금한게 있습니다', '아이디', '2020-05-02');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 8, '카테고리는 디자인과 사진이 전부인가요?', '카테고리에 이것 2개 밖에 없나요?', '2020-05-03');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 9, '관리자님 질문있습니다', '작품수정은 어떻게 하나요?', '2020-05-03');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 10, '캘러그래피', '캘러그래피도 디자인 쪽으로 작품을 만들면 되는 건가요?', '2020-05-09');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 11, '혹시 이 사이트 관리직원을 뽑나요?', '이 사이트관리직원으로 일해보고 싶습니다', '2020-05-12');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 12, '질문있습니다', '비밀번호 찾기는 어떻게 해야하는 건가요?', '2020-05-12');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 13, '질문있습니다 관리자님', '신고게시판이 있다고 들었는데 어떻게 들어가나요?', '2020-05-13');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 14, '회원탈퇴는 어떻게 하나요?', '회원탈퇴를 하고 싶은데 방법을 모르겠습니다. 운영자님 도와주세요', '2020-05-15');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 15, '신고는 어떻게 하는 겁니까?', '문란한 작품을 신고하고 싶은데 신고하는 방법좀 알려주세요', '2020-05-15');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 16, '회원정보수정에 대해서 문의드립니다', '회원정보수정하는 방법을 알고싶습니다', '2020-05-15');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 17, '작품올리는 법에 대해서 알려주세요', '작품은 어떻게 올리나요? 알려주세요 제발', '2020-05-18');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 18, '자유게시판도 신고가능한가요?', '자유게시판에 부적절한 단어가 쓰인 게시물 신고가능 합니까?', '2020-05-20');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 19, '아이디찾기에 대해서 궁금한게 있습니다', '아이디', '2020-05-22');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 20, '카테고리는 디자인과 사진이 전부인가요?', '카테고리에 이것 2개 밖에 없나요?', '2020-05-24');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 21, '관리자님 질문있습니다', '작품수정은 어떻게 하나요?', '2020-05-27');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 22, '캘러그래피', '캘러그래피도 디자인 쪽으로 작품을 만들면 되는 건가요?', '2020-05-30');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 23, '혹시 이 사이트 관리직원을 뽑나요?', '이 사이트관리직원으로 일해보고 싶습니다', '2020-05-30');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 2, '질문있습니다', '비밀번호 찾기는 어떻게 해야하는 건가요?', '2020-06-04');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 17, '질문있습니다 관리자님', '신고게시판이 있다고 들었는데 어떻게 들어가나요?', '2020-06-08');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 15, '회원탈퇴는 어떻게 하나요?', '회원탈퇴를 하고 싶은데 방법을 모르겠습니다. 운영자님 도와주세요', '2020-06-13');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 13, '신고는 어떻게 하는 겁니까?', '문란한 작품을 신고하고 싶은데 신고하는 방법좀 알려주세요', '2020-06-18');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 21, '회원정보수정에 대해서 문의드립니다', '회원정보수정하는 방법을 알고싶습니다', '2020-06-20');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 12, '작품올리는 법에 대해서 알려주세요', '작품은 어떻게 올리나요? 알려주세요 제발', '2020-06-22');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 7, '자유게시판도 신고가능한가요?', '자유게시판에 부적절한 단어가 쓰인 게시물 신고가능 합니까?', '2020-06-24');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 4, '작품올리는 법에 대해서 알려주세요', '작품은 어떻게 올리나요?', '2020-06-26');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 7, '캘러그래피', '비밀번호 찾기는 어떻게 해야하는 건가요?', '2020-06-30');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 11, '질문있습니다', '작품은 어떻게 올리나요?', '2020-07-04');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 15, '질문있습니다', '신고게시판이 있다고 들었는데 어떻게 들어가나요?', '2020-07-07');

INSERT INTO QNA_BOARD
VALUE(QNA_BOARD_NO,QNA_BOARD_MNO,QNA_BOARD_TITLE,QNA_BOARD_CONTENTS,QNA_BOARD_CRE_DATE)
VALUES(QNA_BOARD_QBNO_SEQ.NEXTVAL, 19, '질문있습니다', '캘러그래피도 디자인 쪽으로 작품을 만들면 되는 건가요?', '2020-07-12');

select project_board_title, member_no, member_nick, project_board_cre_date
FROM project_board, member
where project_board_mno = member_no
order by project_board_no;

-- 신고 게시물

INSERT INTO REPORT_BOARD
VALUE(REPORT_BOARD_NO, REPORT_BOARD_MNO, REPORT_BOARD_REASON, REPORT_BOARD_TITLE,
      REPORT_BOARD_NAME, REPORT_BOARD_CONTENTS, REPORT_BOARD_CRE_DATE)
VALUES(REPORT_BOARD_RBNO_SEQ.NEXTVAL,3,'욕설 사용','종이컵 아트','우주최강현석','심한 폭언및 욕설을 남발함',SYSDATE-5);

INSERT INTO REPORT_BOARD
VALUE(REPORT_BOARD_NO,REPORT_BOARD_MNO,REPORT_BOARD_REASON,REPORT_BOARD_TITLE,
      REPORT_BOARD_NAME,REPORT_BOARD_CONTENTS,REPORT_BOARD_CRE_DATE)
VALUES(REPORT_BOARD_RBNO_SEQ.NEXTVAL,5,'게시글 성격에 맞지 않음','휴식','쪼꼬덕규','어울리지 않는 게시글을 작성하였다',SYSDATE-5);

INSERT INTO REPORT_BOARD
VALUE(REPORT_BOARD_NO,REPORT_BOARD_MNO,REPORT_BOARD_REASON,REPORT_BOARD_TITLE,
      REPORT_BOARD_NAME,REPORT_BOARD_CONTENTS,REPORT_BOARD_CRE_DATE)
VALUES(REPORT_BOARD_RBNO_SEQ.NEXTVAL,10,'인종차별 용어사용','흑인 자화상 스케치','차냥','심한 인종차별적인 발언을 하였습니다.',SYSDATE-5);

INSERT INTO REPORT_BOARD
VALUE(REPORT_BOARD_NO,REPORT_BOARD_MNO,REPORT_BOARD_REASON,REPORT_BOARD_TITLE,
      REPORT_BOARD_NAME,REPORT_BOARD_CONTENTS,REPORT_BOARD_CRE_DATE)
VALUES(REPORT_BOARD_RBNO_SEQ.NEXTVAL,6,'게시글 도배','그 어느 순간의 구름 - 두번째','류사장','같은 내용의 게시글을 도배함',SYSDATE-5);

INSERT INTO REPORT_BOARD
VALUE(REPORT_BOARD_NO,REPORT_BOARD_MNO,REPORT_BOARD_REASON,REPORT_BOARD_TITLE,
      REPORT_BOARD_NAME,REPORT_BOARD_CONTENTS,REPORT_BOARD_CRE_DATE)
VALUES(REPORT_BOARD_RBNO_SEQ.NEXTVAL,6,'게시글 도배','그 어느 순간의 구름 - 세번째','류사장','같은 내용의 게시글을 도배함',SYSDATE-5);

INSERT INTO REPORT_BOARD
VALUE(REPORT_BOARD_NO,REPORT_BOARD_MNO,REPORT_BOARD_REASON,REPORT_BOARD_TITLE,
      REPORT_BOARD_NAME,REPORT_BOARD_CONTENTS,REPORT_BOARD_CRE_DATE)
VALUES(REPORT_BOARD_RBNO_SEQ.NEXTVAL,4,'게시글 도배','유럽의 모델 사진 - 2','앎','같은 내용의 게시글을 도배함',SYSDATE-4);

INSERT INTO REPORT_BOARD
VALUE(REPORT_BOARD_NO,REPORT_BOARD_MNO,REPORT_BOARD_REASON,REPORT_BOARD_TITLE,
      REPORT_BOARD_NAME,REPORT_BOARD_CONTENTS,REPORT_BOARD_CRE_DATE)
VALUES(REPORT_BOARD_RBNO_SEQ.NEXTVAL,4,'게시글 도배','유럽의 모델 사진 - 3','앎','같은 내용의 게시글을 도배함',SYSDATE-4);

INSERT INTO REPORT_BOARD
VALUE(REPORT_BOARD_NO,REPORT_BOARD_MNO,REPORT_BOARD_REASON,REPORT_BOARD_TITLE,
      REPORT_BOARD_NAME,REPORT_BOARD_CONTENTS,REPORT_BOARD_CRE_DATE)
VALUES(REPORT_BOARD_RBNO_SEQ.NEXTVAL,4,'게시글 도배','유럽의 모델 사진 - 4','앎','같은 내용의 게시글을 도배함',SYSDATE-4);

INSERT INTO REPORT_BOARD
VALUE(REPORT_BOARD_NO,REPORT_BOARD_MNO,REPORT_BOARD_REASON,REPORT_BOARD_TITLE,
      REPORT_BOARD_NAME,REPORT_BOARD_CONTENTS,REPORT_BOARD_CRE_DATE)
VALUES(REPORT_BOARD_RBNO_SEQ.NEXTVAL,11,'게시글 도배','미국의 모델 시리즈 2편입니다. 내용은 생략하겠습니다. ','양우진진자라','같은 내용의 게시글을 도배함',SYSDATE-4);

INSERT INTO REPORT_BOARD
VALUE(REPORT_BOARD_NO,REPORT_BOARD_MNO,REPORT_BOARD_REASON,REPORT_BOARD_TITLE,
      REPORT_BOARD_NAME,REPORT_BOARD_CONTENTS,REPORT_BOARD_CRE_DATE)
VALUES(REPORT_BOARD_RBNO_SEQ.NEXTVAL,11,'게시글 도배','미국의 모델 시리즈 2편입니다. 내용은 생략하겠습니다. ','양우진진자라','같은 내용의 게시글을 도배함',SYSDATE-4);

INSERT INTO REPORT_BOARD
VALUE(REPORT_BOARD_NO, REPORT_BOARD_MNO, REPORT_BOARD_REASON, REPORT_BOARD_TITLE,
      REPORT_BOARD_NAME, REPORT_BOARD_CONTENTS, REPORT_BOARD_CRE_DATE)
VALUES(REPORT_BOARD_RBNO_SEQ.NEXTVAL,16,'무분별한 PPL','콜게이트 치약모델','길동쓰','광고를 위해서 게시글을 작성하였습니다.',SYSDATE-3);

INSERT INTO REPORT_BOARD
VALUE(REPORT_BOARD_NO,REPORT_BOARD_MNO,REPORT_BOARD_REASON,REPORT_BOARD_TITLE,
      REPORT_BOARD_NAME,REPORT_BOARD_CONTENTS,REPORT_BOARD_CRE_DATE)
VALUES(REPORT_BOARD_RBNO_SEQ.NEXTVAL,22,'not china','중국 신화속 몬스터','SllJinon','korean site ok?',SYSDATE-3);

INSERT INTO REPORT_BOARD
VALUE(REPORT_BOARD_NO,REPORT_BOARD_MNO,REPORT_BOARD_REASON,REPORT_BOARD_TITLE,
      REPORT_BOARD_NAME,REPORT_BOARD_CONTENTS,REPORT_BOARD_CRE_DATE)
VALUES(REPORT_BOARD_RBNO_SEQ.NEXTVAL,10,'징그러운 사진','신경세포 현미경','류사장','징그러운 사진을 게시하여 신고합니다.',SYSDATE-3);

INSERT INTO REPORT_BOARD
VALUE(REPORT_BOARD_NO,REPORT_BOARD_MNO,REPORT_BOARD_REASON,REPORT_BOARD_TITLE,
      REPORT_BOARD_NAME,REPORT_BOARD_CONTENTS,REPORT_BOARD_CRE_DATE)
VALUES(REPORT_BOARD_RBNO_SEQ.NEXTVAL,17,'게시글 도배','살고싶은 집2 - 주방편','차냥','같은 내용의 게시글을 도배함',SYSDATE-2);

INSERT INTO REPORT_BOARD
VALUE(REPORT_BOARD_NO,REPORT_BOARD_MNO,REPORT_BOARD_REASON,REPORT_BOARD_TITLE,
      REPORT_BOARD_NAME,REPORT_BOARD_CONTENTS,REPORT_BOARD_CRE_DATE)
VALUES(REPORT_BOARD_RBNO_SEQ.NEXTVAL,17,'게시글 도배','살고싶은 집 - 옥상편','차냥','같은 내용의 게시글을 도배함',SYSDATE-2);

INSERT INTO REPORT_BOARD
VALUE(REPORT_BOARD_NO,REPORT_BOARD_MNO,REPORT_BOARD_REASON,REPORT_BOARD_TITLE,
      REPORT_BOARD_NAME,REPORT_BOARD_CONTENTS,REPORT_BOARD_CRE_DATE)
VALUES(REPORT_BOARD_RBNO_SEQ.NEXTVAL,4,'정확하지 않은 정보','캐릭터 시리즈 - ???','정주리','정확하지 않은 정보에 대한 게시글을 작성하였습니다.',SYSDATE-2);

INSERT INTO REPORT_BOARD
VALUE(REPORT_BOARD_NO,REPORT_BOARD_MNO,REPORT_BOARD_REASON,REPORT_BOARD_TITLE,
      REPORT_BOARD_NAME,REPORT_BOARD_CONTENTS,REPORT_BOARD_CRE_DATE)
VALUES(REPORT_BOARD_RBNO_SEQ.NEXTVAL,4,'허락받지 않은 촬영현장','모델 광고촬영 현장..','-메-','허락받지 않고 촬영하여 게시글을 작성한듯 하여 신고합니다.',SYSDATE-1);

INSERT INTO REPORT_BOARD
VALUE(REPORT_BOARD_NO,REPORT_BOARD_MNO,REPORT_BOARD_REASON,REPORT_BOARD_TITLE,
      REPORT_BOARD_NAME,REPORT_BOARD_CONTENTS,REPORT_BOARD_CRE_DATE)
VALUES(REPORT_BOARD_RBNO_SEQ.NEXTVAL,3,'나보다 잘그려서 질투나','내가 그린 손그림','우주최강현석','질투나서 신고했다 왜',SYSDATE-1);

INSERT INTO REPORT_BOARD
VALUE(REPORT_BOARD_NO,REPORT_BOARD_MNO,REPORT_BOARD_REASON,REPORT_BOARD_TITLE,
      REPORT_BOARD_NAME,REPORT_BOARD_CONTENTS,REPORT_BOARD_CRE_DATE)
VALUES(REPORT_BOARD_RBNO_SEQ.NEXTVAL,11,'징그러워요!','24세기 수술실 ','양우진진자라','징그러워징그러워징그러워징그러워징그러워',SYSDATE);

INSERT INTO REPORT_BOARD
VALUE(REPORT_BOARD_NO,REPORT_BOARD_MNO,REPORT_BOARD_REASON,REPORT_BOARD_TITLE,
      REPORT_BOARD_NAME,REPORT_BOARD_CONTENTS,REPORT_BOARD_CRE_DATE)
VALUES(REPORT_BOARD_RBNO_SEQ.NEXTVAL,11,'게시글 도배','캐릭터 시리즈 - 마지 심슨','형님','같은 내용의 게시글을 도배함',SYSDATE);

commit;