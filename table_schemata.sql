-- Create the Employees table
CREATE TABLE employees (
    employee_number INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    hire_date DATE NOT NULL,
    gender CHAR(1) NOT NULL,
    CONSTRAINT unique_employee_number UNIQUE (employee_number)
);

-- Create the Departments table
CREATE TABLE departments (
    department_number INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    CONSTRAINT unique_department_number UNIQUE (department_number)
);

-- Create the Salaries table
CREATE TABLE salaries (
    salary_id SERIAL PRIMARY KEY,
    employee_number INT NOT NULL,
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    CONSTRAINT fk_employee_salary FOREIGN KEY (employee_number) REFERENCES employees (employee_number)
);

-- Create the Titles table
CREATE TABLE titles (
    title_id SERIAL PRIMARY KEY,
    employee_number INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    CONSTRAINT fk_employee_title FOREIGN KEY (employee_number) REFERENCES employees (employee_number)
);

-- Create the Dept_emp table
CREATE TABLE dept_emp (
    dept_emp_id SERIAL PRIMARY KEY,
    employee_number INT NOT NULL,
    department_number INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    CONSTRAINT fk_employee_dept FOREIGN KEY (employee_number) REFERENCES employees (employee_number),
    CONSTRAINT fk_department_emp FOREIGN KEY (department_number) REFERENCES departments (department_number)
);

-- Create the Dept_manager table
CREATE TABLE dept_manager (
    dept_manager_id SERIAL PRIMARY KEY,
    department_number INT NOT NULL,
    employee_number INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    CONSTRAINT fk_department_manager FOREIGN KEY (department_number) REFERENCES departments (department_number),
    CONSTRAINT fk_employee_manager FOREIGN KEY (employee_number) REFERENCES employees (employee_number)
);