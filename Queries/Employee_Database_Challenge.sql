
-- 1. Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name FROM employees;

-- 2. Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date FROM titles;

-- 3. Create a new table using the INTO clause.
-- 4. Join both tables on the primary key.
-- 5. Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE e.birth_date between '1952-01-01' and '1955-12-31'
ORDER BY e.emp_no;

-- Retrieve the data from retirement_titles table.
select * from retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title	
INTO unique_titles 
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no,to_date DESC;

-- Retrieve the data from unique_titles table.
select * from unique_titles;

-- Retrieve the number of employees by their most recent job title who are about to retire.
select count(emp_no) as "Employee Count", title into retiring_titles
from unique_titles 
group by title 
order by "Employee Count" desc;

-- Retrieve the data from retiring_titles table.
select * from retiring_titles;

-------------------------------------------------------------------------------------
-- create a Mentorship Eligibility table 
-- that holds the employees who are eligible to participate in a mentorship program.
-------------------------------------------------------------------------------------

-- 1. Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
SELECT emp_no, first_name, last_name, birth_date FROM employees;

-- 2. Retrieve the from_date and to_date columns from the Department Employee table.
SELECT from_date, to_date FROM dept_emp;

-- 3. Retrieve the title column from the Titles table.
SELECT title FROM titles;

-- 4. Create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965.
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, tl.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as tl
ON (e.emp_no = tl.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

-- Retrieve the data from mentorship_eligibilty table.
select * from mentorship_eligibilty;
