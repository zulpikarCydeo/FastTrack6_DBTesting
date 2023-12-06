-- select
select FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES;
select * from EMPLOYEES;

-- distinct
select distinct (FIRST_NAME) from EMPLOYEES;

-- where
select SALARY from EMPLOYEES
where  SALARY > 5000;

-- operators >, <, != , or , and
-- <> this is not equal sign

select FIRST_NAME from EMPLOYEES
where  FIRST_NAME != 'Steven';

-- count
select count(*) from EMPLOYEES;

select count(FIRST_NAME) from EMPLOYEES
where  FIRST_NAME = 'David';

select count(distinct LAST_NAME) from EMPLOYEES;

select count(COMMISSION_PCT) from EMPLOYEES;
-- count is not counting null data


-- order by
select FIRST_NAME from EMPLOYEES
order by FIRST_NAME asc ;

select FIRST_NAME from EMPLOYEES
order by FIRST_NAME desc ;

select SALARY from EMPLOYEES
order by SALARY;

--between
select SALARY from EMPLOYEES
where SALARY >= 5000 and SALARY <= 10000;

select SALARY from EMPLOYEES
where  SALARY between 5000 and 10000;

--in
select city,COUNTRY_ID from LOCATIONS
where COUNTRY_ID in ('US','UK','JP');

select city,COUNTRY_ID from LOCATIONS
where COUNTRY_ID not in ('US','UK','JP');

-- like
--    %  using for the missing part of the data
--    _  using for the missing character of the data

select FIRST_NAME from EMPLOYEES
where  FIRST_NAME like 'Da%';

select LAST_NAME from EMPLOYEES
where LAST_NAME like '_____';

select FIRST_NAME from EMPLOYEES
where  FIRST_NAME like '__%__';

select FIRST_NAME from EMPLOYEES
where  FIRST_NAME not like '__%__';

-- aggregate functions
-- sum  avg  min max
select salary from EMPLOYEEs;
select min(SALARY), max(SALARY), avg(SALARY), sum(SALARY) from EMPLOYEES;
select min(SALARY), max(SALARY), round(avg(SALARY),1), sum(SALARY) from EMPLOYEES;

-- group by
select FIRST_NAME,JOB_ID from EMPLOYEES;
select JOB_ID, count(*) from EMPLOYEES
group by JOB_ID;

select DEPARTMENT_ID , sum(SALARY) from EMPLOYEES
group by DEPARTMENT_ID;

-- having  providing condition
select DEPARTMENT_ID , sum(SALARY) from EMPLOYEES
group by DEPARTMENT_ID
having sum(salary) > 20000;

-- difference between having and where
-- where is put condition before group by, applies to individual rows
-- having is put condition after group by, applies to grouped rows

-- row number
select FIRST_NAME from EMPLOYEES
where ROWNUM < 11;

--subquery
select max(SALARY) from EMPLOYEES;


-- highest salary
select FIRST_NAME from EMPLOYEES
where  SALARY = (select max(SALARY) from EMPLOYEES);

-- second highest salary
select max(SALARY) from EMPLOYEES
where  SALARY < (select max(SALARY) from EMPLOYEES);

select FIRST_NAME, LAST_NAME from EMPLOYEES
where  SALARY = (select max(SALARY) from EMPLOYEES
                 where  SALARY < (select max(SALARY) from EMPLOYEES));

-- string functions
-- concatenation  ||
select FIRST_NAME || ' ' || LAST_NAME from EMPLOYEES;

-- lower upper length  intcap
select lower(FIRST_NAME), upper(LAST_NAME), initcap(email),length(LAST_NAME) from EMPLOYEES;

-- substring (starting point, take how many characters)
select LAST_NAME, substr(LAST_NAME,1,3) from EMPLOYEES;

-- view   virtual table
create view fullInfo as select * from EMPLOYEES;

--join
-- (INNER) JOIN: Returns records that have matching values in both tables
-- LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
-- RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
-- FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table
select DEPARTMENT_NAME, city from LOCATIONS
left join DEPARTMENTS
on LOCATIONS.LOCATION_ID = DEPARTMENTS.LOCATION_ID;

SELECT FIRST_NAME, END_DATE FROM EMPLOYEES
RIGHT OUTER JOIN JOB_HISTORY
ON EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID;

select * from JOB_HISTORY;

SELECT FIRST_NAME, END_DATE FROM EMPLOYEES
left OUTER JOIN JOB_HISTORY
ON EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID;