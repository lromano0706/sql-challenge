-- creating table for dept_emp
create table dept_emp(
emp_no varchar(30) not null,
dept_no varchar(30) not null,
from_date date,
to_date date);

-- creating table for employees
create table employees(
emp_no varchar(30) not null,
birth_date varchar(30) not null,
first_name varchar(30) not null,
last_name varchar(30) not null,
gender varchar(30) not null,
hire_date date);

-- creating table for salaries
create table salaries(
emp_no varchar(30),
salary int,
from_date date,
to_date date);

-- creating table for titles
create table titles(
emp_no varchar(30) not null,
title varchar (30) not null,
from_date date,
to_date date)

-- creating table for departments
create table departments(
dept_no varchar(30) not null,
dept_name varchar(30) not null)

--creating table for dept_manager
create table dept_manager(
dept_no varchar(30) not null,
emp_no varchar(30) not null)

--reviewed all tables for accuracty
select * from departments;
select * from dept_manager;
select * from titles; -- emp can have multiple titles
select * from dept_emp; -- emp can have mulptile dept
select * from employees;
select * from salaries;

-- testing to see what table have multiple values for key id's
select emp_no, count(*)
from titles
group by emp_no
having count(*) > 1

select emp_no, count(*)
from dept_emp
group by emp_no
having count(*) > 1

-- only found two tables witgh multple values under employee number



-- Data Analysis
--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select emp_no, last_name, first_name, gender, salary
from employees
join salaries
using(emp_no)

--2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where date_part('year', hire_date::date)= 1986

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
select dept_no, dept_name, emp_no, last_name, first_name
from employees
join dept_manager
using(emp_no)
join departments
using(dept_no)
order by (dept_name)

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select emp_no, last_name, first_name, dept_name 
from employees
join dept_emp
using(emp_no)
join departments
using(dept_no)
order by(dept_name)

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, gender
from employees
where first_name = 'Hercules' and last_name like 'B%'

--6. List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
select emp_no, last_name, first_name, dept_name 
from employees
join dept_emp
using(emp_no)
join departments
using(dept_no)
where dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select emp_no, last_name, first_name, dept_name 
from employees
join dept_emp
using(emp_no)
join departments
using(dept_no)
where dept_name = 'Sales' or dept_name = 'Development'

--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc

select * from departments;
select * from dept_manager;
select * from titles;
select * from dept_emp;
select * from employees;
select * from salaries;

-- randoming testing to extract date year
select date_part('year', birth_date::date), count(*) 
from employees
group by DATE_PART
having count(*) > 0








