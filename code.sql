create table departments (
	dept_no varchar not null,
	dept_name varchar not null
);

create table dept_emp (
	emp_no int not null,
	dept_no varchar not null,
	from_date date not null,
	to_date date not null
);

create table dept_manager (
	dept_no varchar not null,
	emp_no int not null,
	from_date date not null,
	to_date date not null
);

create table employees (
	emp_no int not null,
	birth_date date not null,
	first_name varchar not null,
	last_name varchar not null,
	gender varchar not null,
	hire_date date not null
);

create table salaries (
	emp_no int not null,
	salary int not null,
	from_date date not null,
	to_date date not null
);

create table titles (
	emp_no int not null,
	title varchar not null,
	from_date date not null,
	to_date date not null
);


-- List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary FROM employees
    JOIN salaries
    ON employees.emp_no = salaries.emp_no;
	


-- List employees who were hired in 1986.

SELECT * from employees WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';



-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, dept_manager.dept_no, dept_manager.to_date, departments.dept_name 
FROM employees
    JOIN dept_manager
    ON employees.emp_no = dept_manager.emp_no
	JOIN departments
	ON dept_manager.dept_no = departments.dept_no;



-- List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
	JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
	JOIN departments
	ON departments.dept_no = dept_emp.dept_no;



-- List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM employees WHERE first_name = 'Hercules' AND last_name LIKE 'B%';



-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT * FROM employees
	JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
	WHERE dept_no = 'd007';



-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
	JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
	JOIN departments
	ON departments.dept_no = dept_emp.dept_no
	WHERE dept_emp.dept_no = 'd007';



-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT COUNT(last_name), last_name FROM employees
	GROUP BY last_name
	ORDER BY last_name DESC;

