use emp;
select count(*) from countries;
select employee_id, first_name, last_name, hire_Date from employees;
select employee_id, first_name, last_name, floor(datediff('2021-03-15',hire_Date)/365) from employees;
select floor(12.7);	-- 소수점 버림
select ceil(11.4); -- 무조건 올림
select round(11.5);	-- 반올림
-- 정렬
select employee_id, first_name, last_name, hire_Date from employees order by first_name desc;
select employee_id, first_name, last_name, hire_Date from employees order by hire_Date desc;
select salary from employees order by salary desc;
select distinct salary from employees order by salary desc;	-- 중복제거 distinct
select employee_id, first_name, last_name from employees order by first_name limit 5 offset 3; -- 세번째부터 5개
select employee_id, first_name, last_name ,salary from employees order by salary desc limit 5;

-- 문제 8) 급여가 17000인 사람의 아이디와 성,이름,급여를 추출하세요
select employee_id,first_name, last_name, salary from employees where salary=17000;
select employee_id,first_name, last_name, salary from employees where salary =(
select distinct salary from employees order by salary desc limit 1);
select employee_id, first_name, last_name, salary from employees where
salary>14000 order by salary desc;
select employee_id,first_name, last_name,department_id from employees where department_id=5 order by first_name;
select employee_id,first_name, last_name from employees where last_name='Chen';
select employee_id, first_name, last_name, hire_date from employees where year(hire_date)=1999
	order by hire_date desc;
-- 문제 12) phone_number가 null인 사람들의 직원 아이디, 성, 이름 전화번호 출력
select employee_id, first_name, last_name, phone_number from employees where phone_number is null;
select department_id, first_name, last_name, employee_id from employees where department_id <> 8
	order by first_name, last_name;	-- <>는 같지 않은
select department_id,first_name, last_name, employee_id from employees
	where department_id <> 8 and employee_id <> 10
    order by first_name, last_name;

select first_name, last_name, salary from employees where salary between 9000 and 12000 order by salary;
select first_name, last_name, department_id from employees where department_id  in (8,9,10) order by department_id;
select department_id,first_name, last_name, employee_id from employees
	where department_id <> 8 and department_id <> 9 and department_id <> 10;
select department_id,first_name, last_name, employee_id from employees
	where department_id not in (8,9,10);
-- 문제15) first_name 의 두번째 문자가 h인 것을 찾아 직원 아이디, 성, 이름을 출력하세요
select employee_id, first_name, last_name from employees where first_name like '_h%';
select first_name, last_name, salary from employees
	where salary >= all(select salary from employees where department_id=8)
    order by salary desc;	-- 부서 아이디가 8에 포함되는 직원의 모든 월급보다 큰 모든 직원을 찾아라
-- 문제16) 각 부서의 평균월급보다 큰 모든 직원을 찾아라
select avg(salary) from employees where department_id=1;	-- 4400
select avg(salary) from employees where department_id=2;
select count(department_id) from employees where department_id=7;
select first_name, last_name, salary from employees where salary > 
	any(select avg(salary) from employees group by department_id);
create table temp( department_id varchar(10), salary int);
insert into temp values ('영업부',200);
insert into temp values ('영업부',500);
insert into temp values ('개발부',600);
insert into temp values ('개발부',300);
insert into temp values ('개발부',10);
insert into temp values ('인사팀',60);

select avg(salary) from temp group by department_id;

select first_name, last_name from employees e
	where exists (select last_name from dependents d where d.employee_id = e.employee_id);
-- dependents를 가진 모든 직원을 구하라, exists는 그 집합에 속하는가?
-- in, any, all 뒤에는 여러개의 record(데이터/행)이 있고 그 집합에서의 존재(in= or), all(집합) => 모든 조건 만족
-- any(집합), 그 집합의 조건을 하나라도 만족
-- multiple record (추출(extract된) 결과가 여러개)
-- hegiht > (multiple record) 이건 여러개의 비교라서 문제가 있음 