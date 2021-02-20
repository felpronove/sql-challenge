show search_path

-- find all first names, last names, sex, salary, and employee number for all employees
select "Employees".emp_no, "Employees".first_name, "Employees".last_name, "Employees".sex, "Salaries".salary 
from "Salaries"
inner join "Employees" on
"Employees".emp_no="Salaries".emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986
select first_name, last_name, hire_date 
from "Employees"
where split_part(hire_date, '/', 3)='1986';
--split_part allows you to break up a string and look for on particular portion of the string (looking for part 3 in instance above)

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select "Employees".emp_no, "Employees".first_name, "Employees".last_name, "Department_Manager".dept_no, "Departments".dept_name
from "Employees"
inner join "Department_Manager" on "Employees".emp_no="Department_Manager".emp_no
inner join "Departments" on "Department_Manager".dept_no="Departments".dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select "Employees".emp_no, "Employees".first_name, "Employees".last_name, "Departments".dept_name
from "Employees"
inner join "Department_Employees" on "Employees".emp_no="Department_Employees".emp_no
inner join "Departments" on "Department_Employees".dept_no="Departments".dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select last_name, first_name, sex
from "Employees"
where last_name like 'B%' and first_name = 'Hercules';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
from "Departments" 
inner join "Department_Employees" on "Departments".dept_no="Department_Employees".dept_no
inner join "Employees" on "Department_Employees".emp_no="Employees".emp_no
where dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
from "Departments"
inner join "Department_Employees" on "Departments".dept_no="Department_Employees".dept_no
inner join "Employees" on "Department_Employees".emp_no="Employees".emp_no
where dept_name in ('Sales', 'Development');

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as "employee count"
from "Employees"
group by last_name
order by "employee count" desc;