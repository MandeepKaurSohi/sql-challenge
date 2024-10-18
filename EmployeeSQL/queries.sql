--Data Analysis:

---Query * FROM Each Table Confirming Data
select * from department;
select * from dept_emp;
select * from dept_manager;
select * from employee;
select * from title;
select * from salary;

--1. List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no, e.first_name, e.last_name,e.sex, s.salary
from employee as e
inner join salary as s on
s.emp_no = e.emp_no;

--2.List the first name, last name, and hire date for the employees who were hired in 1986
select first_name, last_name, hire_date
from employee
where hire_date >= '1986-01-01' AND hire_date < '1987-01-01'
order by hire_date;

--3.List the manager of each department along with their department number, department name, employee number, last name, and first name
select  dm.dept_no,d.dept_name,dm.emp_no,e.first_name, e.last_name
from dept_manager as dm
inner join department as d
on dm.dept_no = d.dept_no
inner join employee as e
on dm.emp_no = e.emp_no;

--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name
select de.dept_no, e.emp_no, e.first_name, e.last_name, d.dept_name
from dept_emp as de
join employee as e 
on de.emp_no = e.emp_no
join department as d
on de.dept_no = d.dept_no;

--5.List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex 
from employee
where first_name = 'Hercules' AND last_name like 'B%';

--6.List each employee in the Sales department, including their employee number, last name, and first name.
select e.emp_no, e.first_name, e.last_name, d.dept_name
from employee as e
join dept_emp as de
on de.emp_no = e.emp_no
join department as d
on d.dept_no = de.dept_no
where dept_name = 'Sales'
order by emp_no;

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
select e. emp_no, e.first_name, e.last_name, d.dept_name
from employee as e
join dept_emp as de
on de.emp_no = e.emp_no
join department as d
on d.dept_no = de.dept_no
where dept_name in ('Sales', 'Development')
order by emp_no;

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name,
count(last_name) as frequency
from employee
group by last_name
order by frequency desc;