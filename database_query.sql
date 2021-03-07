-- 1.

SELECT e.emp_no,e.last_name,e.first_name,e.gender,s.salary FROM employees AS e JOIN salaries AS s ON s.emp_no = e.emp_no;

-- 2.

SELECT first_name || ' ' || last_name AS "Employee", hire_date FROM employees WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

-- 3.
SELECT d.dept_no,d.dept_name,dmselected.emp_no,e.last_name,e.first_name,dmselected.from_date,dmselected.to_date FROM departments AS d 
JOIN 
(
	SELECT dm.dept_no,dm.emp_no,dm.from_date,dm.to_date
	FROM dept_manager dm
	JOIN (
		SELECT dept_no,from_date
		FROM (
			SELECT dept_no ,MAX(from_date) AS "from_date" FROM dept_manager GROUP BY dept_no
		) as temp1 
	) as temp2 
	ON temp2.dept_no = dm.dept_no AND temp2.from_date = dm.from_date
) as dmselected ON (dmselected.dept_no = d.dept_no)
JOIN employees AS e ON (e.emp_no = dmselected.emp_no);

-- 4.

SELECT e.emp_no,e.last_name,e.first_name,d.dept_name FROM employees AS e 
JOIN(
	SELECT de.emp_no,de.dept_no
	FROM dept_emp de
	JOIN (
		SELECT emp_no,from_date
		FROM (
			SELECT emp_no,MAX(from_date) AS "from_date" FROM dept_emp GROUP BY emp_no
		) as temp1
	) as temp2 ON temp2.emp_no = de.emp_no AND temp2.from_date = de.from_date
) AS deselected ON (deselected.emp_no = e.emp_no)
JOIN departments AS d ON (d.dept_no=deselected.dept_no);

-- 5.

SELECT first_name || ' ' || last_name AS "Employee" FROM employees WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6.

SELECT e.emp_no,e.last_name,e.first_name,d.dept_name FROM employees AS e 
JOIN(
	SELECT de.emp_no,de.dept_no
	FROM dept_emp de
	JOIN (
		SELECT emp_no,from_date
		FROM (
			SELECT emp_no,MAX(from_date) AS "from_date" FROM dept_emp GROUP BY emp_no
		) as temp1
	) as temp2 ON temp2.emp_no = de.emp_no AND temp2.from_date = de.from_date
) AS deselected ON (deselected.emp_no = e.emp_no) 
JOIN departments AS d ON (d.dept_no=deselected.dept_no)
WHERE d.dept_name = 'Sales';

-- 7.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name FROM employees AS e 
JOIN(
	SELECT de.emp_no,de.dept_no
	FROM dept_emp de
	JOIN (
		SELECT emp_no,from_date
		FROM (
			SELECT emp_no,MAX(from_date) AS "from_date" FROM dept_emp GROUP BY emp_no
		) as temp1
	) as temp2 ON temp2.emp_no = de.emp_no AND temp2.from_date = de.from_date
) AS deselected ON (deselected.emp_no = e.emp_no) 
JOIN departments AS d ON (d.dept_no=deselected.dept_no) WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- 8 In descending order, list the frequency count of employee last names

SELECT last_name,COUNT(emp_no) AS "Number of employees" FROM employees GROUP BY last_name ORDER BY "Number of employees" DESC;
