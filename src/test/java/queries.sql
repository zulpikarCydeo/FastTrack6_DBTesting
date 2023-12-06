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




