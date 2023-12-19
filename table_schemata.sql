-- Create the Employees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    hire_date DATE NOT NULL,
    gender CHAR(1) NOT NULL,
    CONSTRAINT unique_emp_no UNIQUE (emp_no)
);

-- Create the Departments table
CREATE TABLE departments (
    dept_no VARCHAR(4) NOT NULL,
    department_name VARCHAR(50) NOT NULL,
    CONSTRAINT unique_dept_no UNIQUE (dept_no)
);

-- Create the Salaries table
CREATE TABLE salaries (
    salary_id SERIAL PRIMARY KEY,
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    CONSTRAINT fk_employee_salary FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- Create the Titles table
CREATE TABLE titles (
    title_id SERIAL PRIMARY KEY,
    emp_no INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    CONSTRAINT fk_employee_title FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- Create the Dept_emp table
CREATE TABLE dept_emp (
    dept_emp_id SERIAL PRIMARY KEY,
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    CONSTRAINT fk_employee_dept FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    CONSTRAINT fk_department_emp FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

-- Create the Dept_manager table
CREATE TABLE dept_manager (
    dept_manager_id SERIAL PRIMARY KEY,
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    CONSTRAINT fk_department_manager FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    CONSTRAINT fk_employee_manager FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);