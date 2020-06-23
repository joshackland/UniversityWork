USE company

/*
Q1
use a subquery to select the last name and hire date of employees hired after employee with id 17
order by hire date with most recent at top
*/

SELECT last_name, hire_date
FROM employee
WHERE hire_date > (SELECT hire_date
					FROM employee
					WHERE employee_id = 17)
ORDER BY hire_date DESC;

/*
Q2
use subquery to select last name, salary and department name of employees who 
earn less than employee is 18 or are in the same department as employee id 5
*/

SELECT last_name, salary, department_name
FROM employee INNER JOIN department ON employee.department_id = department.department_id
WHERE salary < (SELECT salary
				FROM employee
				WHERE employee_id = 18)
	OR employee.department_id = (SELECT department_id
						FROM employee
						WHERE employee_id = 5);

/*
Q3
use subquery to select employee id, last name and department id of any employees
who work in the same department as employee 19, 18, or 2
*/
SELECT employee_id, last_name, employee.department_id
FROM employee
WHERE department_id IN (SELECT department_id
						FROM employee
						WHERE employee_id = 19 OR employee_id = 18 OR employee_id = 2);

/*
Q4
use a subquery to select the last name and salary of any employee who earns more than
all employees in department 40
*/
SELECT last_name, salary
FROM employee
WHERE salary > (SELECT MAX(salary)
				FROM employee
				WHERE department_id = 40);

/*
Q5
create view called emp_summary_view
should contain employee id named 'emp_id', full name, lower case email, 
phone number, job title, department name
*/
DROP VIEW emp_summary_view
GO
CREATE VIEW emp_summary_view AS
	SELECT employee_id AS emp_id, 
	CONCAT(first_name, ' ', last_name) AS full_name, 
	CONCAT(LOWER(email), '@company.com') AS email, 
	phone_number, job_title, department_name
FROM employee LEFT OUTER JOIN department ON employee.department_id = department.department_id
	INNER JOIN job ON employee.job_id = job.job_id;
GO
SELECT * FROM emp_summary_view

/*
Q6
write a query that displays the following employee details:
their initials, gender collumn with NULL replaced by ?,
email, number of years since they wer ehired, number of characters in job id,
salary multiplied by pi and rounded to two decimal places
*/

SELECT CONCAT(SUBSTRING(first_name,1,1), SUBSTRING(last_name,1,1)) AS initials,
	ISNULL(gender, '?') AS gender, CONCAT(LOWER(email), '@company.com') AS email,
	DATEDIFF(year, hire_date, GETDATE()) AS years_hired, LEN(job_title) AS job_characters,
	ROUND(salary * PI(),2)
	
FROM employee FULL OUTER JOIN job ON employee.job_id = job.job_id

/*
Q7
use row level functions to select last name and commission value of employees
commission must be multiplied by 100, have no decimal places, and show a '%'
*/

SELECT last_name, CONCAT(ROUND(commission_pct * 100, 1), '%')
FROM employee
WHERE commission_pct IS NOT NULL

/*
Q8
use job_history table to create follow results
first_name last_name was a job_title for x years
*/
SELECT CONCAT(first_name, ' ', last_name, ' was a ', job_title, ' for ', DATEDIFF(year, start_date, end_date), ' years')
FROM employee INNER JOIN job_history ON employee.employee_id = job_history.employee_id
	INNER JOIN job ON job_history.job_id = job.job_id