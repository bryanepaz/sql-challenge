CREATE TABLE departments (
    dept_no varchar(4)  PRIMARY KEY NOT NULL,
    dept_name varchar UNIQUE NOT NULL
);

CREATE TABLE employees (
    emp_no int PRIMARY KEY NOT NULL,
    birth_date varchar(10)   NOT NULL,
    first_name varchar   NOT NULL,
    last_name varchar   NOT NULL,
    gender varchar(1)   NOT NULL,
    hire_date varchar(10)   NOT NULL
);

CREATE TABLE dept_manager (
    dept_no varchar(4)   NOT NULL,
    emp_no int   NOT NULL,
    from_date varchar(10)   NOT NULL,
    to_date varchar(10)   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no,from_date)
);

CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
    dept_no varchar(4)   NOT NULL,
    from_date varchar(10)   NOT NULL,
    to_date varchar(10)   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no,dept_no,from_date)

);

CREATE TABLE titles (
    emp_no int   NOT NULL,
    title varchar   NOT NULL,
    from_date varchar(10)   NOT NULL,
    to_date varchar(10)   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no,from_date)
);

CREATE TABLE salaries (
    emp_no int PRIMARY KEY  NOT NULL,
    salary int   NOT NULL,
    from_date varchar(10)   NOT NULL,
    to_date varchar(10)   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);



