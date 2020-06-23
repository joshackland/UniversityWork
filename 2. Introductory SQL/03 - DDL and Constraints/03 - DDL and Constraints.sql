USE company

/*
Q1
create table 'project'
*/


DROP TABLE project_work;
DROP TABLE project;
DROP TABLE item;

CREATE TABLE project(
	project_id CHAR(5) NOT NULL CONSTRAINT project_id_pk PRIMARY KEY,
	project_leader INT NOT NULL CONSTRAINT project_leader_fk REFERENCES employee(employee_id),
	project_name VARCHAR(50) NOT NULL UNIQUE,
	project_desc TEXT,
	creation_date SMALLDATETIME NOT NULL DEFAULT GETDATE(),
);

/*
Q2
create 'project_work' table
*/
CREATE TABLE project_work(
	employee_id INT NOT NULL CONSTRAINT employee_id_fk REFERENCES employee(employee_id),
	project_code CHAR(5) NOT NULL CONSTRAINT project_code_fk REFERENCES project(project_id),
);

/*
Q3
create 'item' table
*/
CREATE TABLE item(
	item_id INT IDENTITY NOT NULL CONSTRAINT item_id_pk PRIMARY KEY,
	item_name VARCHAR(50) NOT NULL UNIQUE DEFAULT 'No name',
	item_desc VARCHAR(250) NOT NULL CHECK (LEN(item_desc) >= 40),
	initial_stock SMALLINT NOT NULL DEFAULT 100,
	reorder_level SMALLINT NOT NULL DEFAULT 25,
	created_by INT NULL CONSTRAINT created_by_fk REFERENCES item(item_id)
);

/*
Q4
enter test data into 'item'
*/
INSERT INTO item
VALUES(
	'This Is The Item Name',
	'This is an item description which is long enough.',
	75,
	15,
	NULL
);

/*
Q5
select test item
*/
SELECT * FROM item