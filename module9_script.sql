-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees as emp
    LEFT JOIN salaries as sal
    ON (emp.emp_no = sal.emp_no)
ORDER BY emp.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SElECT first_name, last_name, hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

-- SElECT first_name, last_name, hire_date FROM employees
-- WHERE EXTRACT(YEAR FROM hire_date) = '1986';

-- 3. List the manager of each department along with their department number, 
--      department name, employee number, last name, and first name.

SELECT  man.emp_no,
        man.dept_no,
        emp.first_name,
        emp.last_name,
        dept.dept_name
FROM employees as emp
    JOIN dept_manager as man
    ON (emp.emp_no = man.emp_no)
	JOIN departments as dept
	ON (man.dept_no = dept.dept_no)
ORDER BY emp.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, 
--        last name, first name, and department name.

SELECT  demp.emp_no,
        demp.dept_no,
        emp.first_name,
        emp.last_name,
        dept.dept_name
FROM employees as emp
    JOIN dept_emp as demp
    ON (emp.emp_no = demp.emp_no)
	JOIN departments as dept
	ON (demp.dept_no = dept.dept_no)
ORDER BY emp.emp_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules 
--          and whose last name begins with the letter B.

SElECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their 
--          employee number, last name, and first name.

SELECT  demp.emp_no,
        emp.first_name,
        emp.last_name,
        dept.dept_name
FROM employees as emp
    JOIN dept_emp as demp
    ON (emp.emp_no = demp.emp_no)
	JOIN departments as dept
	ON (demp.dept_no = dept.dept_no)
WHERE dept.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their 
--        employee number, last name, first name, and department name.

SELECT  demp.emp_no,
        emp.first_name,
        emp.last_name,
        dept.dept_name
FROM employees as emp
    JOIN dept_emp as demp
    ON (emp.emp_no = demp.emp_no)
	JOIN departments as dept
	ON (demp.dept_no = dept.dept_no)
WHERE dept.dept_name = 'Sales' OR dept.dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names 
--       (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS count_last_name
FROM employees
GROUP BY last_name
ORDER BY count_last_name DESC;

