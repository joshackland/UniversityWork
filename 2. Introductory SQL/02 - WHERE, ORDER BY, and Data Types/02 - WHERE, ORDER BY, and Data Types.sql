USE company

/*
Q1
select last name, job id and salary of employees earning a salary of $12,000
*/
SELECT last_name, job_id, salary
FROM employee
WHERE salary >= 12000;

/*
Q2
select all details of employees who have a job id of 'IT_PROG'
*/
SELECT * 
FROM employee
WHERE job_id = 'IT_PROG';

/*
Q3
select the full name of employees who don't have a gender recorded and order by the first name
*/
SELECT first_name, last_name
FROM employee
WHERE gender IS NULL
ORDER BY first_name;

/*
Q4
select employee id, last name and salary of employees whose salaries are either less than $5,000 or more than $15,000
results are ordered by results with highest at the top
*/
SELECT employee_id, last_name, salary
FROM employee
WHERE salary < 5000 OR salary > 15000
ORDER BY salary DESC;

/*
Q5
select last name, hire data, and salary of employees hire between june 1st 1997 and september 20th 1999 and a salary of over $5,000
*/
SELECT last_name, hire_date, salary
FROM employee
WHERE hire_date >= Convert(datetime, '1997-01-01') AND hire_date <= Convert(datetime, '1999-09-20') AND salary > 5000;

/*
Q6
select last name of employees who have an "a" and a "e" in their last name
order results by last name in descending order
*/
SELECT last_name
FROM employee
WHERE last_name LIKE '%a%' AND last_name LIKE '%e%'
ORDER BY last_name DESC;

/*
Q7
select employees who were either hired before january 1st 1988 or are femalee and also earn a salary of at least $15,000
*/
SELECT *
FROM employee
WHERE (hire_date < Convert(datetime, '1988-01-01') OR gender = 'F') AND salary >= 15000;

/*
Q8
select the first name and job id of all employees who have a job id of either IT_PROG, ST_CLERK, OR SA_REP and have a first name starting either A, B, C  or D
order results by first name
*/
SELECT first_name, job_id
FROM employee
WHERE (job_id = 'IT_PROG' OR job_id = 'ST_CLERK' OR job_id = 'SA_REP')
AND (first_name LIKE 'A%' OR first_name LIKE 'B%' OR first_name LIKE 'C%' OR first_name LIKE 'D%');

/*
Q9
select the last name, salary, and job id of three highest paid employees who have a job id that don't start with AD
*/
SELECT TOP 3 last_name, salary, job_id
FROM employee
WHERE job_id NOT LIKE 'AD%'
ORDER BY salary DESC;

/*
Q10
select full name of employee who works either ST_MAN, ST_CLERK, SA_MAN, or SA_REP
either first or last name contains 'el', is a female and was hired before june 15th 1997
*/
SELECT first_name, last_name
FROM employee
WHERE (job_id = 'ST_MAN' OR job_id = 'ST_CLERK' OR job_id = 'SA_MAN' OR job_id = 'SA_REP')
AND (first_name LIKE '%el%' OR last_name LIKE '%el%') AND gender = 'F'
AND (hire_date < Convert(datetime, '1997-06-15'))
