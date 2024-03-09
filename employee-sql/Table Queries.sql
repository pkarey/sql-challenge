--Create tables

CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR (10),
	birth_date DATE,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	sex TEXT,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
);

CREATE TABLE departments (
	dept_no VARCHAR (4),
	dept_name TEXT,
	PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR (4),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE managers (
	dept_no VARCHAR (4),
	emp_no INT NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT,
	PRIMARY KEY (emp_no)
);

CREATE TABLE titles (
	title_id VARCHAR (5),
	title TEXT,
	PRIMARY KEY (title_id)
);

--Import csv files into respective tables


--Add functional keys relationships between tables
--Code used below is from ERD export file

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "managers" ADD CONSTRAINT "fk_managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "managers" ADD CONSTRAINT "fk_managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");
