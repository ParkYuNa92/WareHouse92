select cast('2020-10-19 12:35:29.123' as date) as '날짜';	-- 형변환
select cast('2020-10-19 12:35:29.123' as time) as '시간';	-- 형변환
select cast('2020-10-19 12:35:29.123' as datetime) as '시간 날짜';	-- 형변환
use sqldb;
set @myVar1 = 5;	-- 변수 선언
set @myVar2 = 3;
set @myVar3 = 4.25;
set @myVar4 = '가수이름 ===>';
set @myvar5 = 0;

select @myvar1;
set @myvar5= @myvar2 + @myVar3;
select @myvar4, name from usertbl where height > 180 order by name; 
select @myvar5;
set @myvar1 =3;
prepare myQuery	-- 준비(prepare)하고 실행(excute)은 나중에 동적(dynamic)으로 해라
	from 'select Name, height from usertbl order by height limit ?';
 execute myquery using @myvar1;	-- 실행
 -- 서블릿 JDBC (JAVA DATABASE CONNECTION)
 select cast(avg(amount) as signed integer) as '평균 구매갯수' from buytbl;
 -- signed는 부호(sign)가 있는 정수형, unsigned는 음수가 없는 정수
 select convert(avg(amount), signed integer) as '평균 구매갯수' from buytbl;
 -- convert 파라미터 2개로 받는 내장함수
select cast('2020$12$12' as date) as 'dollar 날짜';
select cast('2020/12/12' as date) as 'slash 날짜';
select cast('2020%12%12' as date) as 'percent 날짜';
select cast('2020@12@12' as date) as 'at(@) 날짜';
select num, 
	concat(cast(price as char(10)), 'X', cast(amount as char(4)) , '=') 
	as '단가x수량', price*amount as '구매액' from buytbl;	-- concat은 문자열 결합(concatenate의 약자)
select if(100<200, '참이다', '거짓이다') as '참/거짓';
select ifnull(null, '널이군요'), ifnull(100,'널이군요');
select '100'+'200';	-- 문자와 문자를 더함 (정수로 변환되어 연산됨)
select concat('100','200');	-- 문자와 문자를 연결 (문자로 처리)
select concat(100,'200');	-- 정수와 문자를 연결 (정수가 문자로 변환돼서 처리)
select 1> '2mega';	-- 정수 2로 변환되어 비교
select 0 = 'mega2';	-- 문자는 0으로 변환됨, 0은 거짓, 1은 참
select (0 = 'mega2')+5;	-- 연산이 가능
select case 3
	when 1 then '일'
    when 5 then '오'
    when 10 then '십'
    else '모름'
end as 'case 연습';
select ascii('A'), CHAR(65);
select ascii('B'), CHAR(66);
select ascii('C'), CHAR(67);
select ascii('a'), CHAR(97); 
select ascii('1'), CHAR(49);
select ascii('*'), CHAR(42);
select ascii('\t'), CHAR(9);
select ascii('\n'), CHAR(10);
select ascii(' '), CHAR(32);     

select insert('abcdefghi',3,4,'@@@@'), insert('abcdefghi',3,2,'@@@@');
select left('abcdefghi',3), right('abcdefghi',5);
select lower('abcdeFghi'), upper('abcdeFghi');	-- 대소문자 변환
select lpad('이것이', 5, '##'), rpad('이것이', 5,'##'); 	-- padding
select ltrim('    이것이'), rtrim('이것이     ');	-- 다듬다
select trim('  이것이  '), trim(both 'ㅋ' FROM 'ㅋㅋㅋㅋ재미있어요ㅋㅋㅋㅋ');
select repeat('이것이',3);	-- 반복
select replace('이것이 Mysql이다', '이것이', 'This is') as '대체';
select reverse('Mysql') as '반전';	-- 반전
select concat('이것이', space(10), 'Mysql이다') as '결합';
select substring('대한민국만세', 3, 2) as '문자열자르기';
select substring_index('cafe-naver-com-1','-',2),	
-- 두번째 파라미터를 기준으로 분할하여 세번째 파라미터로 앞에서 2개만
	 substring_index('cafe-naver-com-1','-',-2);	
-- 두번째 파라미터로 기준으로 분할하여 세번째 파라미터로 뒤에서 2개만
-- 테이블 수정(update)
-- 테이블의 구조 변경(alter)과 테이블의 데이터 변경(update)
-- DDL(database definition(정의) Language), DCL (database Control(제어) Language),
-- DML(Database Manipulation(조작) Language) 
-- 테이블의 구조 변경 -> DDL
-- 테이블 데이터 변경 -> DML
-- 테이블이나 데이터베이스 삭제(drop) => DDL
-- 테이블의 데이터를 삭제 (delete) => DML
use sqldb;
update buytbl set price = price*1.5;
select * from buytbl;
create table testdel
	(math int, eng int, korea int, name varchar(10));
insert into testdel values(410,150,23,'홍길동3');
select * from testdel;
update testdel set math = 90 where name = '홍길동2';
update testdel set korea= korea-90 where name = '홍길동2';
delete from testdel where name = '홍길동';

-- 문제2) 홍길동의 영어 점수를  100점으로 변경하세요
update testdel set eng = 100 where name = '홍길동';
update testdel set eng = eng-50 where name = '홍길동';
-- 문제3) 국어점수가 23점인 행(레코드)를 삭제하세요
delete from testdel where korea = 23;
