USE company

/*
Q1
select full name, salary and department of employees who earn over $10,000
*/

SELECT CONCAT(first_name, ' ', last_name), salary, department_name
FROM employee INNER JOIN department on employee.department_id = department.department_id
WHERE salary > 10000

/*
Q2
show unique list of job titles of employees in department 50
*/

SELECT job_title, department_id
FROM employee INNER JOIN job ON employee.job_id = job.job_id
where department_id = 50

/*
Q3
select last name, commission, department name, and city name of employees who ear a commission
order results by commission in descending order
*/
SELECT last_name, commission_pct, department_name, city
FROM employee INNER JOIN department ON employee.department_id = department.department_id
	INNER JOIN location ON department.location_id = location.location_id
WHERE commission_pct IS NOT NULL

/*
Q4
select country and name of reagion even if none have a match
*/
SELECT country.country_name, region.region_name
FROM country FULL JOIN region ON country.region_id = region.region_id

/*
Q5
select last name, job title and department name of all employees including those who are not in a department
*/
SELECT last_name, job_title, department_name
FROM employee INNER JOIN job ON employee.job_id = job.job_id
	LEFT OUTER JOIN department ON employee.department_id = department.department_id;

/*
Q6
select last name, slary, job title, and minimum salary for employees earning less than minimum salary
*/

SELECT last_name, salary, job_title, min_salary
FROM employee INNER JOIN job ON employee.job_id = job.job_id
WHERE salary < min_salary

/*
Q7
select full name of employees and their manager
order by full nam of employee
include employees who don't have managers
*/
SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee_name, CONCAT(m.first_name, ' ', m.last_name) AS manager_name
FROM employee AS e LEFT OUTER JOIN employee AS m ON  e.manager_id = m.employee_id
ORDER BY manager_name

/*
Q8
display the average minimum salary and average maximum salary
*/
SELECT AVG(min_salary) AS average_minimum, AVG(max_salary) AS average_maximum
FROM job

/*
Q9
display job id, salaray of the lowest paid employee in each job, and the number of employees in each job
*/
SELECT employee.job_id, MIN(salary) AS minimum_salary, COUNT(employee.job_id) AS total_employees
FROM employee
GROUP BY employee.job_id

/*
Q10
display the department name, gender, number of employees, average salary, minimum salary, and maximum salary of employees
grouped by department name, gender
order by department name, gender
*/
SELECT department.department_name, gender, COUNT(employee_id) AS total_employees, AVG(salary) AS average_salary,
	MIN(salary) AS minimum_salary, MAX(salary) AS maximum_salary
FROM employee INNER JOIN department ON employee.department_id = department.department_id
GROUP BY department_name, gender
ORDER BY department_name, gender

/*
Q11
select last name of employees, their departments name and city name, name of country city is in, and region country is in
use full join
*/
SELECT last_name, department_name, city, country_name, region_name
FROM employee FULL OUTER JOIN department ON employee.department_id = department.department_id
	FULL OUTER JOIN location ON department.location_id = location.location_id
	FULL OUTER JOIN country ON location.country_id = country.country_id
	FULL OUTER JOIN region ON country.region_id = region.region_id

/*
Q12
select department name of all departments where the average salary of employees is less than $7,500
*/
SELECT department_name
FROM employee INNER JOIN department ON employee.department_id = department.department_id
GROUP BY department_name
HAVING AVG(salary) < 7500

/*
Q15
select employ last name and their manager's last name for employees who have a salary higher than their manager
include the difference
*/
SELECT e.last_name, m.last_name, e.salary - m.salary AS salary_difference
FROM employee as e INNER JOIN employee as m ON e.manager_id = m.employee_id
WHERE e.salary > m.salary