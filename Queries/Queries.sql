SELECT * FROM departments;

SELECT * FROM employees;

SELECT * FROM public.dept_emp
ORDER BY emp_no ASC, dept_no ASC LIMIT 100

SELECT * FROM public.dept_manager
ORDER BY dept_no ASC, emp_no ASC LIMIT 100

SELECT * FROM public.salaries
ORDER BY emp_no ASC 

SELECT count(*) FROM public.salaries

SELECT count(*) FROM public.titles

SELECT count(*) FROM public.employees

SELECT count(*) FROM public.dept_emp

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';


SELECT count(*)
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Retirement eligibility
SELECT COUNT(*) FROM (
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31') A;

-- Retirement eligibility
SELECT COUNT(*) FROM (
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31') A;

-- Retirement eligibility
SELECT COUNT(*) FROM (
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31') A;

-- Retirement eligibility
SELECT COUNT(*) FROM (
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
AND hire_date BETWEEN '1985-01-01' AND '1988-12-31'
) A

-- Retirement eligibility
SELECT COUNT(*) FROM (
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
) A

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT count(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Retirement eligibility
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


SELECT * FROM retirement_info;
