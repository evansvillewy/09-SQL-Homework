CREATE TABLE departments 
  ( 
     dept_no   VARCHAR(20) PRIMARY KEY, 
     dept_name TEXT NOT NULL
  ); 

CREATE TABLE employees 
  ( 
     emp_no     SERIAL PRIMARY KEY, 
     birth_date DATE NOT NULL, 
     first_name TEXT, 
     last_name  TEXT, 
     gender     VARCHAR(1), 
     hire_date  DATE 
  ); 

CREATE TABLE dept_emp 
  ( 
     emp_no    INT NOT NULL, 
     dept_no   VARCHAR(20) NOT NULL, 
     from_date DATE NOT NULL, 
     to_date   DATE,
     FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
     FOREIGN KEY (emp_no) REFERENCES employees(emp_no)  
  ); 

CREATE TABLE dept_manager 
  ( 
     dept_no   VARCHAR(20) NOT NULL, 
     emp_no    INT NOT NULL, 
     from_date DATE NOT NULL, 
     to_date   DATE,
     FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
     FOREIGN KEY (emp_no) REFERENCES employees(emp_no) 
  ); 

CREATE TABLE salaries 
  ( 
     emp_no    INT NOT NULL, 
     salary    INT NOT NULL, 
     from_date DATE NOT NULL, 
     to_date   DATE,
     FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
  ); 

CREATE TABLE titles 
  ( 
     emp_no    INT NOT NULL, 
     title     TEXT NOT NULL, 
     from_date DATE NOT NULL, 
     to_date   DATE,
     FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
  ); 
