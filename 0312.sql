create database green3;  -- sql구문, 생성(create) database(데이터 베이스)
-- green3
drop database green3;	-- 삭제(drop) database, green3 sql 명령문
use green;
create table greenTbl(
	hakbun char(4) not null,	 -- 클래스 ahkbun(멤버벤수/field)
    name varchar(20) not null);	 -- name (멤버변수/field)
insert into greenTbl values( '34','홍길동');
insert into greentBl (hakbun) values( '12');
create table greenTbl1(
	hakbun char(4) not null,	 -- 클래스 ahkbun(멤버벤수/field)
    name varchar(20));	 -- name (멤버변수/field)
insert into greentBl1 (hakbun) values( '12');
select * from greentbl;	-- 데이터 조회 * = 모든 것
select hakbun from greentbl;	-- hakbun 칼럼에 있는 데이터
create table a (
	a1 int, a2 char(5)	-- 테이블 생성
);
insert into a (a1, a2) values (4, '홍길동');
select * from a;	-- 데이터 조회(read)

create table b(
	b1 int, b2 varchar(10), b3 varchar(12)
);

insert into b (b1, b2, b3) values (1, '강아지', '고양이');
select * from b;
set sql_safe_updates=0; -- 함부로 수정 못 하도록 하는 것을 해제
delete from b where b1=1;

create database sqlDB;
use sqlDB;
create table userTbl -- 회원 테이블
( 	userId char(8) not null primary key, -- 사용자 아이디 (PK)
	name varchar(10) not null, -- 이름
    birthYear int not null, -- 출생년도
    addr char(2) not null, -- 지역(경기, 서울, 경남식으로 2글자만 입력)
    mobile1 char(3), -- 휴대폰의 국번(011,016, 017,018 등)
    mobile2 char(8), -- 휴대폰의 나머지 전화번호( 하이픈 제외)
    height smallint, -- 키, 일반 정수형보다 작은 테이터
    mDate DATE -- 회원가입일, 날짜 타입(date)
);
create table buyTbl -- 회원 구매 테이블
(	num int auto_increment not null primary key, -- 순번(PK)
	userId char(8) not null, -- 아이디(FK), Foreign key(외래키)
    prodName char(6) not null, -- 물품명
    groupName char(4), -- 분류
    price int not null, -- 단가
    amount smallint not null, -- 수량
    foreign key (userid) references usertbl(userid));
insert into usertbl values ('LSG','이승기', 1987, '서울', '011','11111111', 182,'2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울', NULL  , NULL      , 186, '2013-12-12');
INSERT INTO usertbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO usertbl VALUES('YJS', '윤종신', 1969, '경남', NULL  , NULL      , 170, '2005-5-5');
INSERT INTO usertbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO usertbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO usertbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200,  1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '모니터', '전자', 200,  5);
INSERT INTO buytbl VALUES(NULL, 'KBS', '청바지', '의류', 50,   3);
INSERT INTO buytbl VALUES(NULL, 'BBK', '메모리', '전자', 80,  10);
INSERT INTO buytbl VALUES(NULL, 'SSK', '책'    , '서적', 15,   5);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '청바지', '의류', 50,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);	-- shift+ctrl+enter
select * from usertbl;
select * from buytbl;
drop table buytbl;	-- foreign key로 연결되어 있는 자식 테이블을 삭제 후
drop table usertbl;	-- 부모의 primary key를 가진 테이블 삭제해야함
select * from usertbl where name = '김경호';	-- where 절 사용

-- 키가 180 이상인 사람 구하기
select * from usertbl where height >= 180;
select userid, name from usertbl where birthyear >= 1970 and height >= 182;
select name, height from usertbl where height >=180 and height <=183;
select name, height from usertbl where height between 180 and 183;
select name, addr from usertbl where addr ='경남' or addr ='전남' or addr='경북';
select name, addr from usertbl where addr in('경남','전남','경북');		-- 집합
select name, height from usertbl  where name like '김%';		-- 김씨 성을 가진 사람은
select name, height from usertbl  where name like '%승%';	-- 이름중에 승이 있는 사람
select name, height from usertbl  where name like '김__';	
select name, height from usertbl  where name like '_종신';
-- 서브쿼리 subquery문

select name, height from usertbl where height > 177;
select name, height from usertbl where height > (
	select height from usertbl where name = '김경호');
	
-- 문제 2) subquery를 이용하여 지역이 경남인 사람의 키보다 크거나 같은 사람을 추출
select height from usertbl where addr = '경남'; 
-- 데이터가 2개 이상
select name, height from usertbl where height >= any (select height from usertbl where addr = '경남'); 
-- 이중에서 하나라도 만족하는 것을 골라라 합집합 (any)/ 모두 만족하는 것을 골라라 교집합(all)

select name, mdate from usertbl order by mdate asc;	-- mdate 오름차순 정렬 
select name, mdate from usertbl order by mdate desc;	-- mdate 내림차순 정렬 
-- 기본값을 ascending (오름차순) descending(내림차순)
desc usertbl;	-- 테이블의 구조 파악하기 위해 describe 
select distinct addr from usertbl;	-- 고유한 것들만 추출 distinct / 자바에서는 set을 사용하면 중복 제거
-- group by
select avg(amount) as '평균 구매 개수' from buytbl;
select userid as '우수고객', avg(amount) as '고객순위' from buytbl group by userid 
	order by 고객순위 desc limit 3;	-- 우수 고객 찾아서 상금제공
select avg(height) as '평균 키' from usertbl;

create table test( math int, korea int, ban int, bun int);
insert into test values(40, 60, 3, 4);
insert into test values(37, 25, 2, 5);
insert into test values(55, 46, 2, 6);
insert into test values(34, 22, 7, 2);
select * from test;
-- 문제 bun으로 그룹져서 수학점수의 평균 출력
select bun as '번',korea, avg(math) as '수학점수 평균' from test group by bun order by bun;
