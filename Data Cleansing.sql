Create database SQLPROJECT;

use sqlproject;

select * from hr;

alter table hr
change column ï»¿id emp_id varchar(20) not null;

describe hr;

select birthdate from hr;

update hr
set birthdate = case
	when birthdate like '%/%' then date_format(str_to_date(birthdate, '%m/%d/%Y'),'%Y-%m-%d')
	when birthdate like '%-%' then date_format(str_to_date(birthdate, '%m-%d-%Y'),'%Y-%m-%d')
    else null
end;

alter table hr
modify column birthdate date;

update hr
set hire_date = case
	when hire_date like '%/%' then date_format(str_to_date(hire_date, '%m/%d/%Y'),'%Y-%m-%d')
	when hire_date like '%-%' then date_format(str_to_date(hire_date, '%m-%d-%Y'),'%Y-%m-%d')
    else null
end;

alter table hr
modify column hire_date date;

update hr
set termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
where termdate is not null and termdate = ''; 

alter table hr
modify column termdate date;

alter table hr 
add column age int;

update hr
set age = timestampdiff(Year, birthdate, curdate());

select 
	min(age) as youngest,
    max(age) as oldest
from hr;

select count(*) from hr
	where age < 18;
select birthdate, age from hr;