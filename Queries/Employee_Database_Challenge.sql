-- Deliverable 1: # of Retiring Employees by Title
SELECT em.emp_no,
	em.first_name,
	em.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as em
INNER JOIN titles AS ti
ON (em.emp_no = ti.emp_no)
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no;

-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, 
	first_name, 
    last_name, 
    title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

-- Count of employees by title who are about to retire
SELECT COUNT(title), title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;

-- Deliverable 2: Deliverable 2: Employees Eligible for Mentorship Program
SELECT DISTINCT ON (emp_no) em.emp_no, 
	em.first_name, 
	em.last_name, 
	em.birth_date, 
	de.from_date, 
	de.to_date, 
	ti.title
INTO mentorship_eligibility
FROM employees AS em
INNER JOIN department_employees AS de
ON em.emp_no = de.emp_no
INNER JOIN titles AS ti
ON em.emp_no = ti.emp_no
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY em.emp_no;

SELECT * FROM mentorship_eligibility;
