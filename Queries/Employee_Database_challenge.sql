SELECT 	*
  FROM employees where emp_no = 10663;

SELECT 	* 
  FROM dept_emp where emp_no = 33722;

SELECT 	*  
  FROM titles;

---- **** DELIVERABEL 1 **** ----  
--drop the table if already exists.
DROP TABLE retirement_titles;

--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
--Retrieve the title, from_date, and to_date columns from the Titles table.
--Create a new table using the INTO clause.
--Join both tables on the primary key.
--Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number..
SELECT  a.emp_no,
		a.first_name,
		a.last_name,
		b.title,
		b.from_date,
		b.to_date
  INTO	retirement_titles
  FROM	employees a
  JOIN	titles b
    ON	a.emp_no = b.emp_no
 WHERE	a.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
 ORDER BY a.emp_no;
 
--drop the table if already exists.
DROP TABLE unique_titles;
 
--Use Distinct with Orderby to remove duplicate rows
--Exclude those employees that have already left the company by filtering on to_date to keep only those dates that are equal to '9999-01-01'.
--Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e., to_date) of the most recent title.
SELECT	DISTINCT ON (emp_no)
		emp_no,
		first_name,
		last_name,
		title
  INTO unique_titles
  FROM	retirement_titles
 WHERE	to_date = '9999-01-01' 
 ORDER BY emp_no,
 		  from_date DESC;

--Query to retrieve the number of employees by their most recent job title who are about to retire.
--First, retrieve the number of titles from the Unique Titles table.
--Then, create a Retiring Titles table to hold the required information.
--Group the table by title, then sort the count column in descending order.
SELECT	title, COUNT(*) as cnt
  --INTO	retiring_titles
  FROM	unique_titles
 GROUP BY title
 ORDER BY cnt DESC;

---- **** DELIVERABEL 2 **** ----  

--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
--Retrieve from_date, and to_date columns from the Department Employees table.
--Retrieve the title column from the Titles table.
--Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
--Create a new table using the INTO clause.
--Join the Employees and the Department Employee tables on the primary key.
--Filter the data on the to_date column to all the current employees, 
--then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
--Order the table by the employee number.
--drop the table if already exists.
DROP TABLE mentorship_eligibilty;

SELECT  DISTINCT ON(a.emp_no)
		a.emp_no,
		a.first_name,
		a.last_name,
		b.from_date,
		b.to_date,
		c.title
  INTO	mentorship_eligibilty
  FROM	employees a
  JOIN	dept_emp b
  	ON	a.emp_no = b.emp_no
  JOIN	titles c
    ON	b.emp_no = c.emp_no
 WHERE	b.to_date = '9999-01-01'
   AND	c.to_date = '9999-01-01'
   AND	a.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
 ORDER BY a.emp_no;
 