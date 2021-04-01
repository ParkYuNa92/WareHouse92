create database 
use employees;
drop procedure if exists ifproc2 ;
delimiter %%
select * from employees limit 5;
create procedure ifproc2()
begin
	declare hireDate DATE;	-- 입사일
    declare curDate DATE;	-- 오늘
    declare days int;	-- 근무한 일수
	select hire_date into hireDate	-- hire_date열의 결과를 hireDATE 변수에 대입
		from employees.employees
		where emp_no =10001;
	set curDate = current_date();	-- 현재 날짜
    set days = datediff(curDATE, hireDATE);	-- 날짜의 차이, 일단위
    if (days/365) >= 5 then -- 5년이 지나면
		select concat('입사한지',days,'일이 지났습니다. 축하합니다');
	else 
		select '입사한지'+days+'일 밖에 안되었네요 열심히 일하세요';
	end if;
end %%
delimiter ;
call ifproc2();

drop procedure if exists ifproc3;
delimiter $$
create procedure ifproc3()
begin
	declare point int;
    declare credit char(1) ;
    set point = 77;
    if point >= 90 then
		set credit = 'A';
	elseif point>=80 then
		set credit = 'B';
	elseif point>=70 then
		set credit = 'C';
	elseif point>=60 then
		set credit = 'D';
	else
		set credit = 'F';
	end if;
    select concat('취득점수 ==>', point), concat('학점==>', credit);
end $$
delimiter ;
call ifproc3();

drop procedure if exists caseproc;
delimiter $$
create procedure caseproc()
begin
	declare point int;
    declare credit char(1) ;
    set point = 77;
    case 
		when point >= 90 then
			set credit = 'A';
		when point>=80 then
			set credit = 'B';
		when point>=70 then
			set credit = 'C';
		when point>=60 then
			set credit = 'D';
		else
			set credit = 'F';
	end CASE;
    select concat('취득점수 ==>', point), concat('학점==>', credit);
end $$
delimiter ;
call caseproc();

use sqldb;

select userId, sum(price*amount) as '총구매액'
	from buytbl
    group by userid
    order by sum(price*amount) desc;
select B.userId, U.name, sum(price*amount) as '총구매액'
	from buytbl B
		inner join usertbl U
			on B.userId = U.userId
		group by B.userId, U.name
        order by sum(price*amount) desc;
select B.userId, U.name, sum(price*amount) as '총구매액'
	from buytbl B
		right outer join usertbl U
			on B.userId = U.userId
		group by B.userId, U.name
        order by sum(price*amount) desc;

-- 문제1) 위의 코드를 참고하여 구매 테이블에 구매액이 1500이상인 고객은 '최우수고객'
-- 1000원 이상인 고객은 '우수고객', 1원 이상인 고객은 '일반고객'으로 출력
-- 또 전혀 구매 실적이 없는 고객은 유령고객이라고 출력

drop procedure if exists customproc ;
delimiter $$
create procedure customproc()
begin
	select U.userId '사용자 아이디', U.name '구매고객', sum(price*amount) as '총구매액',
    case 
		when (sum(price*amount) >= 1500) then '최우수고객'
		when (sum(price*amount) >= 1000) then '우수고객'
		when (sum(price*amount) >= 1) then '일반고객'
		else '유령고객'
	end as '고객관리'
    
	from buytbl B
		right outer join usertbl U
			on B.userId = U.userId
		group by B.userId, U.name
        order by sum(price*amount) desc;
	
end $$
delimiter ;
call customproc();

drop procedure if exists whileproc;
delimiter $$
create procedure whileproc()
begin
	declare i int;	-- 1에서 100까지 증가할 변수
    declare hap int;	-- 더한 값을 누적할 변수
    set i =1;
    set hap=0;
    while (i<=100) do
		set hap = hap +i;	-- 원래 hap의 값에 i를 더해서 다시 hap에 넣으라는 의미
        set i = i+1;	   -- i의 원래 값에 1을 더해서 다시 i에 넣으라는 의미
	end while;
    select hap;
end $$
delimiter ;
call whileproc();

-- 동적 (dynamic) sql
drop table if exists mytable;
create table mytable (id int auto_increment primary key, mDate datetime);
set @curDate = current_timestamp();	-- 현재 날짜와 시간을 가져와 변수에 저장
prepare myQuery from 'insert into myTable values(null,?)';	-- 나중에 ? 채워서 실행하고 준비함
execute myQuery using @curDate;
deallocate prepare myQuery; -- 할당된 prepare 제거
select * from mytable;
insert into mytable value(1,current_timestamp());
delete from mytable where id = 1;
-- auto_increment로 설정된 칼럼은 null을 주면 자동으로 숫자가 증가되고 값을 주면 그 값으로 들어감
-- 제약 조건 (constraint)
-- 무결성을 위해서 제공됨
-- 1) primary key
-- 2) foreign key
-- 3) unique
-- 4) default
-- 5) null 허용 여부
-- 6) check
-- 7) auto_increment
-- 테이블 구조 변경 alter
create database tabledb;
use tabledb;
drop table if exists buytbl, usertbl;
create table usertble
(
	userid char(8) not null primary key,
    name varchar(10) not null,
    birthYear int not null
    );
desc usertbl;	-- 테이블 명세(description) 파악
drop table if exists usertbl;
create table usertbl
(
	userid char(8) not null,
    name varchar(10) not null,
    birthYear int not null,
    constraint primary key PK_usertbl_userID(userID));	-- 제약 조건의 이름 부여
show index from usertbl;	-- index는 테이블의 검색을 위해 사용됨
-- primary key로 테이블을 생성하면 index가 무조건 생김
select *
from information_schema.table_constraints
	where table_name='tabledb';
    
    
drop table if exists usertbl;
create table usertbl
(
	userid char(8) not null,
    name varchar(10) not null,
    birthYear int not null
    );
alter table usertbl add constraint PK_usertble_userid primary key(userid);	-- 제약조건을 추가하기 위해 테이블 구조 변경 alter
-- primary key 를 추가하면 인덱스가 생김
desc usertbl;
show index from usertbl;
-- 색인
-- 1) 데이터가 정렬이 되어 들어감. (primary key) ㄱ,ㄴ,ㄷ,ㄹ,ㅁ
-- 2) 데이터는 정렬이 안되어 무조건 들어감. 뒤에 찾아보기(index) 테이블
-- unique 제약조건(constraint)
-- 중복되지 않는 유일한 값을 입력해야 하는 조건
-- primary key와 거의 동일하지만 null을 허용함
drop table if exists usertbl;
create table usertbl
(
	userid char(8) not null primary key,
    name varchar(10) not null,
    email char(30) null,
    birthYear int not null,
    constraint Ak_email unique(email)
    );
    
insert into usertbl values('홍길동','김개똥','hong@gmail.com',1992%10%12);
insert into usertbl values('홍말자','홍개똥',null,1992%10%12);
insert into usertbl values('홍길동','김개똥',null,1992%10%12);
insert into usertbl values('홍서범','김개똥','hong@gmail.com',92);
select * from usertbl;
show index from usertbl;

-- default
drop table if exists usertbl;
create table usertbl(
	useriD char(8) not null primary key,	-- 사용자 아이디(PK)
    name varchar(10) not null,				-- 이름
    birthYear int not null default -1,		-- 출생연도
    addr char(2) not null default '서울',	-- 지역(경기,서울, 경남식으로 2글자만 입력)
    mobile1 char(3),						-- 휴대폰의 국번(011,017,016)
    mobile2 char(8),						-- 휴대폰의 나머지 전화번호
    height smallint null default 170,		-- 키, 일반 정수보다 작은 데이터
    mDate DATE); 							-- 회원 가입일, 날짜타입(date)
    
insert into usertbl values('LHL', '이혜리',default,default,'011','12345345',default,'2019.12.12');
insert into usertbl(userid, name) values ('KAY','김아영');	-- 칼럼명이 있으면 그 값에만 들어감
select * from usertbl;
insert into usertbl values('WB','원빈','1982','대전','019','98723457','176','2017.5.7');

create table usertbl(
	useriD char(8) not null primary key,	-- 사용자 아이디(PK)
    name varchar(10) not null,				-- 이름
    birthYear int not null,					-- 출생연도
    addr char(2) not null,					-- 지역(경기,서울, 경남식으로 2글자만 입력)
    mobile1 char(3) null,					-- 휴대폰의 국번(011,017,016)
    mobile2 char(8) null,					-- 휴대폰의 나머지 전화번호
    height smallint null,					-- 키, 일반 정수보다 작은 데이터
    mDate DATE null); 						-- 회원 가입일, 날짜타입(date)
    
alter table usertbl alter column birthYear set default -1;
alter table usertbl alter column addr set default '서울';
alter table usertbl alter column height set default 170;
alter table usertbl add column tt int;
desc usertbl;
-- 테이블 구조 변경 alter, 원래 있던 column을 변경하려면 alter, 없던 칼럼을 추가할 때는 add
-- 테이블의 데이터를 변경 update, 테이블 데이터 삭제는 delete =>DML
-- 테이블의 구저 변경 alter, 테이블 자체를 삭제 drop =>DDL

alter table usertbl add constraint CK_birthYear check (birthYear >= 1900 and birthYear <= 2000);
alter table usertbl add column male varchar(5);
alter table usertbl add constraint CK_Male check(male='남' or male='여');
insert into usertbl values('7','홍길동',1910,'서울',null,null,1956,'2100-01-01',4,'남');
insert into usertbl values('7','홍길동',1910,'서울',null,null,1956,'2100-01-01',4,'중');

use sqldb;
select * from buytbl;
select * from usertbl;
-- 수정
update usertbl set userid = 'BBK' where userid='VVK';
set foreign_key_checks =0;	-- 외래키 설정 해제

-- 문제3) userid가 EJW의 전화번호 mobile1을 017로, mobile2를 123456로 변경하세요
update usertbl set  mobile1='017', mobile2='123456' where userid ='EJW';
set sql_safe_updates=0;
delete from usertbl where addr = '서울';

    

