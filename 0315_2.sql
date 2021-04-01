-- SQL 프로그래밍 
drop procedure if exists ifProc ; -- 기존에 있으면 삭제 
delimiter %%	
-- 만날 때까지 보관
create procedure ifproc()
begin
	declare var1 int; -- var1 변수 선언 
    set var1 = 50;  -- 변수에 값 대입
    
    if var1= 100 then -- 만약 var1 의 값이 100이면 
		select '100입니다.';
	else
		select '100이 아닙니다.';
	end if;
end %%
delimiter ; -- 여기까지 프로시저 생성됨 
call ifproc(); -- 생성된 프로시저 호출

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