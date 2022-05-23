-- test if the tables populate
select * from departments
select * from dept_emp
select * from dept_manager
select * from employees
select * from salaries
select * from titles


-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT
	employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.sex, 
	salaries.salary 
FROM salaries
	INNER JOIN employees 
	ON employees.emp_no=salaries.emp_no
ORDER BY emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01;' AND '1986-12-31'
ORDER BY hire_date;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT
	d.dept_no,
	d.dept_name, 
	dm.emp_no,
	e.last_name, 
	e.first_name
FROM departments d
	INNER JOIN dept_manager dm ON d.dept_no = dm.dept_no
	INNER JOIN employees e ON dm.emp_no = e.emp_no
ORDER BY emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees e
	INNER JOIN dept_emp de ON de.emp_no=e.emp_no
	INNER JOIN departments d ON d.dept_no=de.dept_no
ORDER BY emp_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees e
	INNER JOIN dept_emp de ON de.emp_no=e.emp_no
	INNER JOIN departments d ON d.dept_no=de.dept_no
WHERE dept_name='Sales'
ORDER BY emp_no;

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees e
	INNER JOIN dept_emp de ON de.emp_no=e.emp_no
	INNER JOIN departments d ON d.dept_no=de.dept_no
WHERE
	dept_name='Sales' OR dept_name='Development'
ORDER BY emp_no;

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY 
	COUNT(last_name) DESC;