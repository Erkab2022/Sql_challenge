--1.List the employee number, last name, first name, sex, and salary of each employee
CREATE VIEW employee_salaries AS
	SELECT e.emp_no, e.last_name, e.first_name, sex, s.salary AS Amount  
	FROM salaries AS s 
	JOIN employees AS e ON s.emp_no = e.emp_no;
	
SELECT * FROM employee_salaries

--2.List the first name, last name, and hire date for the employees who were hired in 1986.
CREATE VIEW emp_hired_1986 AS
	SELECT first_name, last_name, hire_date
	FROM employees
	WHERE hire_date IN ('01/01/1986', '12/31/1986');
	
--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.
CREATE VIEW managers AS
	SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
	FROM employees AS e
	JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
	JOIN departements AS d ON dm.dept_no = d.dept_no
	GROUP BY dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name;
	
--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.	
CREATE VIEW employees_list AS
	SELECT de.dept_no,de.emp_no, e.last_name, e.first_name, d.dept_name
	FROM employees AS e
	JOIN dept_emp AS de ON e.emp_no = de.emp_no
	JOIN departements as d ON de.dept_no = d.dept_no;
	
--5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
CREATE VIEW Hercules AS
	SELECT first_name, last_name, sex
	FROM employees
	WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
	
--6.List each employee in the Sales department, including their employee number, last name, and first name.
CREATE VIEW Sales_employees AS	
	SELECT e.emp_no, e.last_name, e.first_name 
		FROM employees AS e
		JOIN dept_emp AS de ON de.emp_no = e.emp_no
		JOIN departements AS d ON de.dept_no= d.dept_no
		WHERE dept_name = 'Sales';
SELECT * FROM Sales_employees;
	
	
--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW sales_dev_employees AS	
	SELECT e.emp_no, e.last_name, e.first_name,d.dept_name 
			FROM employees AS e
			JOIN dept_emp AS de ON de.emp_no = e.emp_no
			JOIN departements AS d ON de.dept_no= d.dept_no
			WHERE dept_name = 'Sales'
	UNION
	SELECT e.emp_no, e.last_name, e.first_name,d.dept_name 
			FROM employees AS e
			JOIN dept_emp AS de ON de.emp_no = e.emp_no
			JOIN departements AS d ON de.dept_no= d.dept_no
			WHERE dept_name = 'Development';
			
--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
CREATE VIEW frequency_counts AS	
	SELECT last_name,COUNT(last_name)
	FROM employees
	GROUP BY last_name
	ORDER BY last_name DESC;


