CREATE TABLE departments_dup (
    dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);
insert into departments_dup select dept_no, dept_name from departments;
select * from departments_dup order by dept_no;
insert into departments_dup (dept_name) values ('Public Relations');
delete from departments_dup
where dept_no='d002';
insert into departments_dup (dept_no) values ('d010'),('d011');
create table dept_manager_dup (
emp_no int(11) not null,
dept_no char(4) null,
from_date date not null,
to_date date null);
insert into dept_manager_dup select * from dept_manager;
insert into dept_manager_dup (emp_no, from_date) values (999904, '2017-01-01'), (999905,'2017-01-01'), (999906,'2017-01-01'), (999907, '2017-01-01');
DELETE FROM dept_manager_dup 
WHERE
    dept_no = 'd001';
select * from dept_manager_dup;
select * from departments_dup;
SELECT 
    m.dept_no, m.emp_no, d.dept_no
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no order by m.dept_no;
    SELECT 
    m.dept_no, m.emp_no, d.dept_no
FROM
    dept_manager_dup m
        left JOIN
    departments_dup d ON m.dept_no = d.dept_no order by m.dept_no;
    SELECT 
    m.dept_no, m.emp_no, d.dept_no
FROM
    dept_manager_dup m
        right JOIN
    departments_dup d ON m.dept_no = d.dept_no order by m.dept_no;
    select e.emp_no, e.first_name, e.last_name, d.dept_no, e.hire_date
    from employees e
    inner join dept_manager_dup d on e.emp_no=d.emp_no;
select e.emp_no, e.from_date, d.dept_name
from dept_emp e
join departments d on e.dept_no=d.dept_no;
SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager d ON e.emp_no = d.emp_no
    where e.last_name='Markovitch'
ORDER BY d.dept_no DESC, e.emp_no;
SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager d ON e.emp_no = d.emp_no
    where e.last_name='Bamford'
ORDER BY d.dept_no DESC, e.emp_no;
SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date
FROM
    dept_manager d
        right JOIN
    employees e ON e.emp_no = d.emp_no
    where e.last_name='Bamford'
ORDER BY d.dept_no DESC;
SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, e.hire_date
FROM
    employees e,
    dept_manager d
WHERE
    e.emp_no = d.emp_no;
SELECT 
    d.emp_no, s.salary, s.from_date
FROM
    dept_manager d,
    salaries s
WHERE
    d.emp_no = s.emp_no;
    set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');
    select @@global.sql_mode;
SELECT 
    e.emp_no,e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
where 
e.first_name='Margareta' and e.last_name='Markovitch' order by emp_no;
SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    last_name = 'Bamford'
ORDER BY emp_no;
select dm.*,d.*
from dept_manager dm cross join departments d where d.dept_no='d009' order by d.dept_no;
SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no < 10011
ORDER BY e.emp_no , d.dept_name;
SELECT

    e.*, d.*

FROM

    employees e

        CROSS JOIN

    departments d

WHERE

    e.emp_no < 10011

ORDER BY e.emp_no, d.dept_name;
SELECT 
    d.*, dm.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE
    d.dept_no = 'd006';
  SELECT 
    demp.*, d.*
FROM
    dept_emp demp
	CROSS JOIN
    departments d
    where (demp.emp_no=10001) or  (demp.emp_no=10002)
    ORDER BY demp.emp_no , d.dept_name;
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    dm.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
        JOIN
    dept_manager dm ON t.emp_no = dm.emp_no
        JOIN
    departments d ON dm.dept_no = d.dept_no
WHERE
    title = 'Manager';
    SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    de.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
        JOIN
    departments d ON de.dept_no = d.dept_no
WHERE
    title = 'Senior Engineer';
select count(dm.emp_no), e.gender
from dept_manager dm
join employees e on dm.emp_no=e.emp_no
group by gender;
