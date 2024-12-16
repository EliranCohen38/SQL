use employees;
select * from employees limit 10;
insert into employees 
(
emp_no, birth_date, first_name, last_name, gender, hire_date)
values
(999901, '1986-04-21', 'John', 'Smith','M', '2011-01-01');
select * from employees order by emp_no desc;
