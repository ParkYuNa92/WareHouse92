use green;	-- database 선택
-- 문제1) 테이블 생성
-- 테이블 이름 mail
-- 칼럼명(field), 1) t datatime 2) scruser 문자열(8), srchose 문자열(20), dstuser문자열(8), dsthost 문자열(20), size bigint
create table mail(
	t datetime,
    srcuser char(8),	-- source user
    srchost char(20),	-- source host
    dstuser char(8),	-- destination user
    dsthost char(20),	-- destination host
    size bigint
    );
    select * from mail limit 5;
    -- 문제2) mail 테이블에서 srcuser, srchost, t, size만 가져와라
    select srcuser, srchost, t, size from mail;
    -- 문제3) mail 테이블에서 srchost가 'venus'인 t,srcuser, srchost를 가져와라
    select t,srcuser,srchost from mail where srchost='venus';
    -- 문제4) mail 테이블에서 srchost가 s로 시작하는 t, srcuser, srchost를 가져와라
    select srchost, t, srcuser,srchost from mail where srchost like 's%';
    -- 문제5) mail 테이블에서 srcuser가 barb이고 dstuser가 tricia인 모든 칼럼을 가져와라
    select * from mail where srcuser= 'barb' and dstuser='tricia';
    select t, concat(srcuser,'@', srchost,'.com')as 이메일, size from mail;	-- 문자열 결합 concat
	select date_format(t,'%M %e, %Y')as '보낸 날짜',concat(srcuser,'@',srchost) as '전송인'
    , size from mail order by size desc;
    	select date_format(t,'%M %e, %Y')as '보낸 날짜',concat(srcuser,'@',srchost) as '전송자 메시지'
    , size as '바이트수' from mail order by size desc;
    select t, srcuser, dstuser, size/1024 as 'kilobytes' from mail where size/1024 >500 order by kilobytes;	-- 500kbyte 이상인 것들을 가져와라
    select * from mail where dstuser ='tricia' order by srchost, srcuser;	-- srchost가 같으면 그중에서 srcuser로 정렬
    -- 문제7) 크기가 50000 이상인 것들의 크기로 기준으로 내림차순으로 정렬하고 모든 칼럼을 가져오세요
    select * from mail where size>=50000 order by size desc;
    select srcuser from mail;	-- 16개
    -- 16개의 데이터, 중복제거
    select distinct srcuser from mail;	-- 4개
    select count(distinct srcuser) from mail;	-- 집계함수 (aggregation), sum, avg, count, min,max
    select sum(distinct size) from mail;
    select count(size) from mail;
    select avg(size) from mail;
    select min(size) from mail;
    select max(size) from mail;
    select std(size) from mail;	-- 표준 편차, standard deviation
    select distinct year(t), month(t), dayofmonth(t) from mail;
    select time(t) from mail;
    select hour(t) from mail;
    select minute(t) from mail;
    select second(t) from mail;
    -- 문제10) 테이블 생성
    -- 테이블명 profile
    create table profile(
		id int unsigned auto_increment not null primary key,
		name char(20),
        birth date,
        color enum('blue','red','green','brown','black', 'white'),
        foods set('lutefisk','burrito', 'curry','eggroll','fadge','pizza'),
        cats int
    );
    create table profile_contact(
		profile_id int unsigned not null,
        service char(20) not null,
        contact_name char(25) not null
    );
    INSERT INTO profile
  VALUES
    (NULL,'Fred','1970-04-13','black','lutefisk,pizza,fadge',0),
    (NULL,'Mort','1969-09-30','white','curry,eggroll,burrito',3),
    (NULL,'Brit','1957-12-01','red','burrito,pizza,curry',1),
    (NULL,'Carl','1973-11-02','red','pizza,eggroll',4),
    (NULL,'Sean','1963-07-04','blue','burrito,curry',5),
    (NULL,'Alan','1965-02-14','red','curry,fadge',1),
    (NULL,'Mara','1968-09-17','green','fadge,lutefisk',1),
    (NULL,'Shepard','1975-09-02','black','pizza,curry',2),
    (NULL,'Dick','1952-08-20','green','fadge,lutefisk',0),
    (NULL,'Tony','1960-05-01','white','pizza,burrito',0)
;
INSERT INTO profile_contact
  VALUES
    (1, 'AIM', 'user1-aimid'),
    (1, 'MSN', 'user1-msnid'),
    (2, 'AIM', 'user2-aimid'),
    (2, 'MSN', 'user2-msnid'),
    (2, 'Yahoo', 'user2-yahooid'),
    (4, 'Yahoo', 'user4-yahooid')
;

drop table mail;
drop table profile;
drop table profile_contact;
select * from profile_contact;
select * from profile_contact order by profile_id, service;
select id, name, service, contact_name from profile inner join profile_contact on id = profile_id;
-- 두 개의 테이블의 컬럼명이 같으면 구분하기 위해 테이블이름으로 구분하지만 칼럼명이 다르므로 별도의 구분이 필요 없음
select id from profile;
-- 문제17) name이 Mort인 id를 profile 테이블에서 조회하세요
select id from profile where name='Mort';
-- 문제18) 위에 조회된 쿼리 결과를 subquery로 이용하여 profile_id가 위의 쿼리 결과와 일치하는 것들에 해당하는 데이터를
-- 가져오는데 모든 컬럼을 profile_contact 테이블에서 가져오세요
select * from profile_contact where profile_id=(select id from profile where name='Mort');
use sqldb;
select U.userId, U.name, B.prodName, U.addr, U.mobile1+ U.mobile2 as '연락처'
	from buytbl B
		inner join usertbl U
			on B.userId= U.userId	-- 이름은 짧게 rename해서 사용함
		order by U.userId;
select distinct U.userId, U.name, U.addr, U.mobile1+ U.mobile2 as '연락처'
	from buytbl B
		inner join usertbl U
			on B.userId= U.userId	-- 중복 제거 = distinct
		order by U.userId;
-- buytbl에서 한 번이라도 있는 것을 가지고 있으므로 실제 구매 고객만 추출
select U.userId, U.name, U.addr, U.mobile1+ U.mobile2 as '연락처'
	from usertbl U
		where exists(
			select * from buytbl B where U.userId = B.userId
        );	-- 위의 코드와 동일한 결과, exists(존재하는가?)=> exists(), 집합 안에 존재하는가?
        
create table stdtbl(
	stdName char(10) not null primary key,
    addr char(4) not null
    );
create table clubtbl(
	clubName char(10) not null primary key,
    roomNo char(4) not null
);
create table stdclubtbl(
	num int auto_increment not null primary key,
    stdName char(10) not null,
    clubName char(10) not null,
    foreign key (stdName) references stdtbl(stdName),
    foreign key (clubName) references clubtbl(clubName));
    
desc stdtbl;	-- 테이블의 구조 파악하기 위해 describe 
desc clubtbl;
desc stdclubtbl;
insert into stdtbl values ('김범수','경남'),('성시경','서울'),('조용필','경기'),('은지원','경북'),('바비킴','서울');
insert into clubtbl values ('수영','101호'),('바둑','102호'),('축구','103호'),('봉사','104호');
insert into stdclubtbl values (null,'김범수','바둑'),(null,'김범수','축구'),(null,'조용필','축구'),(null,'은지원','축구'),
			(null,'은지원','봉사'),(null,'바비킴','봉사');
            
select * from stdclubtbl;
select S.stdName, S.addr, C.clubName, C.roomNo
	from stdtbl S
     inner join stdclubtbl SC
		on S.stdname=SC.stdName
	 inner join clubtbl
		on SC.clubName = C.clubName;
        
select U.userid, U.name, B.prodName, U.addr, concat(U.mobile1, U.mobile2) as '연락처'
	from buytbl B
		Right join usertbl U
			on U.userid = B.userid
		where B.prodName is null
            order by userid;	-- 한 번도 구매하지 않은 목록 추출
-- 위의 결과에서 유령회원(null)을 골라 
create table ltable (
	a int, b int, c int, f int);
create table rtable(
	a int, c int, g int);
insert into ltable values(3, 5, 6, 7);
insert into ltable values(5, 15, 16, 17);
insert into ltable values(16, 25, 26, 27);
insert into ltable values(33, 35, 36, 37);
select * from ltable;
drop table ltable;
delete from ltable;
insert into rtable values(5, 8, 9);
insert into rtable values(16, 18, 19);
insert into rtable values(26, 28, 29);
insert into rtable values(36, 38, 39);
select * from rtable;
select l.a, l.b, r.a, r.c from ltable as l inner join rtable as r on l.a=r.a;
-- ltable를 l로 이름변경(rename/alias), rtable을 r로 이름병경, 결합 기준은 on(전치사)를 기준으로 교집합(inner join)

-- 문제13) 테이블 2개 생성해서 국어 수학 영어 점수(lscore), 미술 도덕 수학 영어 총점 점수(rscore)을 만들어서
-- 데이터를 입력하고 inner join을 하고 데이터를 확인 하세요
create table lscore(
 kor int, math int, eng int);
 create table rscore(
	art int, doduk int, math int, eng int, total int);
    
insert into lscore values(80, 90,98);
insert into lscore values(84, 87,93);
insert into lscore values(80, 90,90);
insert into lscore values(83, 96,98);

insert into rscore values(92, 89, 90, 98, 369);
insert into rscore values(92, 81, 91, 93, 357);
insert into rscore values(90, 82, 94, 90, 356);
insert into rscore values(90, 82, 93, 89, 354);
select l.kor, l.math, l.eng, r.art, r.doduk, r.math, r.eng, r.total from lscore as l inner join rscore as r  on l.math=r.math;
select l.kor, l.math, l.eng, r.art, r.doduk, r.math, r.eng, r.total from lscore as l inner join rscore as r  on l.eng=r.eng;
select * from lscore right join rscore on l.math=r.math;
-- mysql에서 full outer join을 지원하지 않아 이렇게 합집합으로 사용한다

drop table b;
create table a (score varchar(50), total int);
create table b (score varchar(50), total int);
insert into a values('국어',50);
insert into a values('수학',70);
insert into a values('영어',75);
insert into b values('국어',26);
insert into b values('수학',73);
insert into b values('미술',73);
select * from b;
select * from a inner join b on a.score=b.score;

INSERT INTO mail (t,srchost,srcuser,dsthost,dstuser,size)
  VALUES
    ('2006-05-11 10:15:08','saturn','barb','mars','tricia',58274),
    ('2006-05-12 12:48:13','mars','tricia','venus','gene',194925),
    ('2006-05-12 15:02:49','mars','phil','saturn','phil',1048),
    ('2006-05-13 13:59:18','saturn','barb','venus','tricia',271),
    ('2006-05-14 09:31:37','venus','gene','mars','barb',2291),
    ('2006-05-14 11:52:17','mars','phil','saturn','tricia',5781),
    ('2006-05-14 14:42:21','venus','barb','venus','barb',98151),
    ('2006-05-14 17:03:01','saturn','tricia','venus','phil',2394482),
    ('2006-05-15 07:17:48','mars','gene','saturn','gene',3824),
    ('2006-05-15 08:50:57','venus','phil','venus','phil',978),
    ('2006-05-15 10:25:52','mars','gene','saturn','tricia',998532),
    ('2006-05-15 17:35:31','saturn','gene','mars','gene',3856),
    ('2006-05-16 09:00:28','venus','gene','mars','barb',613),
    ('2006-05-16 23:04:19','venus','phil','venus','barb',10294),
    ('2006-05-17 12:49:23','mars','phil','saturn','tricia',873),
    ('2006-05-19 22:21:51','saturn','gene','venus','gene',23992)
;
