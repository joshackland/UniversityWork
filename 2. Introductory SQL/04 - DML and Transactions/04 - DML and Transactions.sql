USE company

/*
Q1
insert values
*/
INSERT INTO job
VALUES 
	(
		'GN_SEC',
		'Secretary',
		3500,
		10000
	),
	(
		'GN_JAN',
		'Janitor',
		1500,
		NULL
	),
	(
		'GN_CAF',
		'Cafeteria Worker',
		DEFAULT,
		4500
	);

/*
Q2
update salaries
*/
UPDATE job
SET max_salary = 5000
WHERE job_id = 'GN_SEC' OR job_id = 'GN_JAN'

/*
Q3
insert countries
*/
INSERT INTO country
VALUES
	(
		'CH',
		'China',
		3
	),
	(
		'JP',
		'Japan',
		3
	),
	(
		'EG',
		'Egypt',
		4
	);

/*
Q4
delete countries with region larger than 2
*/

DELETE FROM country
WHERE region_id > 2

/*
Q5
use subquery to update maximum salary
*/
UPDATE job
SET max_salary = (SELECT max_salary
					FROM job
					WHERE job_id = 'GN_SEC')
WHERE job_id = 'GN_CAF'

/*
Q6
create a transaction
*/

BEGIN TRANSACTION

INSERT INTO job
VALUES 
	(
		'GN_SPY',
		'Corporate Spy',
		50000,
		75000
	);

SAVE TRANSACTION after_spy

SELECT * FROM job

ROLLBACK TRANSACTION after_spy

COMMIT TRANSACTION

/*
Q7
delete all job ids starting with 'GN'
*/

DELETE FROM job
WHERE job_id LIKE 'GN%'

/*
Q8
insert from one table to another
*/
CREATE TABLE emp_summary(
	emp_id INT NOT NULL CONSTRAINT emp_id_pk PRIMARY KEY,
	full_name VARCHAR(50) NOT NULL,
	email VARCHAR(75) NULL,
	phone VARCHAR(20) NULL
);

INSERT INTO emp_summary
SELECT employee_id, CONCAT(first_name, ' ', last_name), CONCAT(LOWER(email), '@company.com'), phone_number
FROM employee

SELECT * FROM emp_summary