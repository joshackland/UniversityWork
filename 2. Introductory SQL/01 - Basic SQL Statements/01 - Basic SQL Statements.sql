USE company;
/*
Q1
retrieve first_name, last_name, and gender of all employees
*/
SELECT first_name, last_name, gender
FROM employee;

/*
Q2
select all collumns from the department table
*/
SELECT *
FROM department;

/*
Q3
select id number, last name, salary, salary * 12, 75% of salary from employee table
give salary * 12 alias of "annual_salary" and 75% of salary alias of "penalty_salary"
*/
SELECT employee_id, last_name, salary, salary * 12 AS 'annual_salary', salary * 0.75 AS 'penalty_salary'
FROM employee;


/*
Q4
concatenate names as "First Last", and "Last, First"
*/
SELECT CONCAT(first_name,' ',last_name), CONCAT(last_name,', ',first_name)
FROM employee

/*
Q5
select unique job IDs from employee table
*/
SELECT DISTINCT job_id
FROM employee;

/*
Q6
retrieve full name of employee and their email
*/
SELECT CONCAT(first_name, ' ', last_name, ' - ', email) AS 'name_and_email'
FROM employee;

/*
Q7
select full name of employee with job id in parenthesis at end of name
email of employee with @COMPANY.COM concatenated at the end
*/
SELECT CONCAT(first_name,' ',last_name,' (',job_id,')') AS 'name_and_job', CONCAT(email,'@COMPANY.COM') AS 'email'
FROM employee;

/*
Q8
select job id followed by hyphen then job title
maximum salary minus minimum salary
*/
SELECT CONCAT(job_id,' - ',job_title) AS 'job_id_and_title', max_salary - min_salary AS 'salary_difference'
FROM job;

/*
Q9
return employee name and email in formation of HTML hyperlink - <a href="mailto:flast@company.com">first LAST</a>
*/
SELECT CONCAT('<a href="mailto:', SUBSTRING(first_name,1,1), last_name, '@company.com">', first_name, UPPER(last_name))
FROM employee;