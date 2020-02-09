--List the employee number, last name, first name, gender, and salary of each employee
SELECT e.emp_no employee_number, 
       e.last_name, 
       e.first_name, 
       e.gender,
	   s.salary
FROM   employees e 
       JOIN salaries s 
         ON e.emp_no = s.emp_no 
ORDER  BY e.emp_no; 

--List employees who were hired in 1986. 
SELECT e.*, 
       Extract(year FROM e.hire_date) 
FROM   employees e 
WHERE  Extract(year FROM e.hire_date) = 1986; 

--List the manager of each department with the following information:  
--department number, department name, the manager's employee number, last name, first name,  
--and start and end employment dates. 
SELECT d.dept_no, 
       d.dept_name, 
       dm.emp_no dept_manager_emp_no, 
       e.last_name, 
       e.first_name, 
       dm.from_date, 
       dm.to_date 
FROM   departments d 
       JOIN dept_manager dm 
         ON dm.dept_no = d.dept_no 
       JOIN employees e 
         ON e.emp_no = dm.emp_no 
ORDER  BY d.dept_no, 
          dm.from_date 

--List the department of each employee with the following information: employee number,  
--last name, first name, and department name. 
SELECT e.emp_no employee_number, 
       e.last_name, 
       e.first_name, 
       d.dept_name department_name
FROM   employees e 
       JOIN dept_emp de 
         ON e.emp_no = de.emp_no 
       JOIN departments d 
         ON de.dept_no = d.dept_no 
ORDER  BY e.emp_no, 
          de.dept_no 

--List all employees whose first name is "Hercules" and last names begin with "B" 
SELECT * 
FROM   employees s 
WHERE  Upper(first_name) = 'HERCULES' 
       AND Upper(last_name) LIKE 'B%' 

--List all employees in the Sales department, including their employee number,  
--last name, first name, and department name. 
SELECT e.emp_no employee_number, 
       e.last_name, 
       e.first_name, 
       d.dept_name department_name, 
       de.from_date, 
       de.to_date 
FROM   employees e 
       JOIN dept_emp de 
         ON e.emp_no = de.emp_no 
       JOIN departments d 
         ON de.dept_no = d.dept_no 
WHERE  Upper(d.dept_name) = 'SALES' 
       AND Now() BETWEEN de.from_date AND de.to_date 
ORDER  BY e.emp_no, 
          de.dept_no 

--List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name. 
SELECT e.emp_no employee_number, 
       e.last_name, 
       e.first_name, 
       d.dept_name department_name, 
       de.from_date, 
       de.to_date 
FROM   employees e 
       JOIN dept_emp de 
         ON e.emp_no = de.emp_no 
       JOIN departments d 
         ON de.dept_no = d.dept_no 
WHERE  Upper(d.dept_name) IN( 'SALES', 'DEVELOPMENT' ) 
       AND Now() BETWEEN de.from_date AND de.to_date 
ORDER  BY e.emp_no, 
          de.dept_no 

--In descending order, list the frequency count of employee last names,  
--i.e., how many employees share each last name. 
SELECT e.last_name, 
       Count(*) frequency
FROM   employees e 
GROUP  BY e.last_name 
ORDER  BY e.last_name DESC 