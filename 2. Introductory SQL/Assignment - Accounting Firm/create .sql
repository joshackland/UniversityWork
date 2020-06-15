/*	Database Creation & Population Script (6 marks)
	Produce a script to create the database you designed in Task 1 (incorporating any changes you have made since then).  
	Be sure to give your columns the same data types, properties and constraints specified in your data dictionary, and be sure to name tables and columns consistently.  
	Include any logical and correct default values and any check or unique constraints that you feel are appropriate.

	Make sure this script can be run multiple times without resulting in any errors (hint: drop the database if it exists before trying to create it).  
	You can use/adapt the code at the start of the creation scripts of the sample databases available in the unit materials to implement this.

	See the assignment brief for further information. 
*/


-- Write your creation script here
IF DB_ID('Accounting_Firm') IS NOT NULL             
	BEGIN
		PRINT 'Database exists - dropping.';		
		USE master;		
		ALTER DATABASE Accounting_Firm SET SINGLE_USER WITH ROLLBACK IMMEDIATE;		
		DROP DATABASE Accounting_Firm;
	END
GO
--  Now that we are sure the database does not exist, we create it.
PRINT 'Creating database.';
CREATE DATABASE Accounting_Firm;
GO
--  Now that an empty database has been created, we will make it the active one.
--  The table creation statements that follow will therefore be executed on the newly created database.
USE Accounting_Firm;
GO

PRINT 'Creating "PayLevel" Table';
GO
CREATE TABLE PayLevel(
	PayID TINYINT NOT NULL PRIMARY KEY IDENTITY,
	PayLevelName VARCHAR(20) NOT NULL,
	AnnualPay MONEY NOT NULL,
	ExpectedExperience TINYINT NOT NULL
);

PRINT 'Creating "Client" Table';
GO
CREATE TABLE Client(
	TaxFileNumber CHAR(9) NOT NULL PRIMARY KEY,
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	PhoneNumber VARCHAR(20) NOT NULL,
	EmailAddress VARCHAR(50) NOT NULL,
	PreferredAccountant INT NULL
);

PRINT 'Creating "JobType" Table';
GO
CREATE TABLE JobType(
	JobTypeID SMALLINT NOT NULL PRIMARY KEY IDENTITY,
	JobTypeName VARCHAR(50) NOT NULL,
	CostPer15Minutes MONEY NOT NULL
);

PRINT 'Creating "Branch" Table';
GO
CREATE TABLE Branch(
	BranchID TINYINT NOT NULL PRIMARY KEY IDENTITY,
	BranchName VARCHAR(20) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	PhoneNumber VARCHAR(20) NOT NULL,
	Manager INT NOT NULL UNIQUE
);

PRINT 'Creating "Accountant" Table';
GO
CREATE TABLE Accountant(
	StaffID INT NOT NULL PRIMARY KEY IDENTITY,
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	Branch TINYINT NULL FOREIGN KEY REFERENCES Branch(BranchID),
	PayLevel TINYINT NOT NULL FOREIGN KEY REFERENCES PayLevel(PayID),
	HireDate DATE NOT NULL,
	Mentor INT NULL FOREIGN KEY REFERENCES Accountant(StaffID));

PRINT 'Adding "Accountant" Foreign Key to "Client" Table';
GO
ALTER TABLE Client
ADD FOREIGN KEY (PreferredAccountant) REFERENCES Accountant(StaffID);

PRINT 'Adding "Accountant" Foreign Key to "Branch" Table';
GO
ALTER TABLE Branch
ADD FOREIGN KEY (Manager) REFERENCES Accountant(StaffID);

PRINT 'Creating "Specialists" Table';
GO
CREATE TABLE Specialists(
	JobTypeID SMALLINT NOT NULL FOREIGN KEY REFERENCES JobType(JobTypeID),
	StaffID INT NOT NULL FOREIGN KEY REFERENCES Accountant(StaffID)
	CONSTRAINT PK_Specialists PRIMARY KEY (JobTypeID, StaffID)
);

PRINT 'Creating "Job" Table';
GO
CREATE TABLE Job(
	JobID INT NOT NULL PRIMARY KEY IDENTITY,
	Accountant INT NOT NULL FOREIGN KEY REFERENCES Accountant(StaffID),
	JobType SMALLINT NOT NULL FOREIGN KEY REFERENCES JobType(JobTypeID),
	Client CHAR(9) NOT NULL FOREIGN KEY REFERENCES Client(TaxFileNumber),
	JobDate DATETIME NOT NULL,
	JobDuration SMALLINT NOT NULL,
	AmountPaid MONEY NOT NULL
);


/*	Database Population Statements
	Following the SQL statements to create your database and its tables, you must include statements to populate the database with sufficient test data.
	Make sure referential integrity is observed – you cannot add data to a column with a foreign key constraint if you do not yet have data in the column it references.

	You may wish to start working on your views and queries and write INSERT statements that add the data needed to test each one as you go.   
	The final create.sql should be able to create your database and populate it with enough data to make sure that all views and queries return meaningful results.

	Since writing sample data is time-consuming and quite tedious, I have provided data for the "job" table below.
*/


-- Write your INSERT statements here

--INSERT values into PayLevel
PRINT 'Populating "PayLevel" Table';
GO
INSERT INTO PayLevel (PayLevelName, AnnualPay, ExpectedExperience)
VALUES ('Trainee',55000,0),
	   ('Junior Accountant',70000,1),
	   ('Accountant',85000,4),
	   ('Senior Accountant',120000,8);

--INSERT values into JobType
PRINT 'Populating "JobType" Table';
GO
INSERT INTO JobType (JobTypeName, CostPer15Minutes)
VALUES ('Tax Return',40),
	   ('Financial Planning',50),
	   ('Litigation Support',70),
	   ('Miscellaneous',65);

--INSERT values into Accountant
PRINT 'Populating "Accountant" Table';
GO
INSERT INTO Accountant(FirstName, LastName, PayLevel, HireDate, Mentor)
VALUES ('Lucy', 'Anderson', 4, '1998-05-19', NULL),
	   ('Chloe', 'Thompson', 3, '2015-01-07', NULL),
	   ('Blake', 'Lee', 3, '2012-03-09', NULL),
	   ('Liam', 'Walker', 1, '2019-09-25', 1),
	   ('Dylan', 'Harris', 1, '2018-12-31', 2),
	   ('Ellie', 'Ryan', 2, '2016-02-14', 2),
	   ('Mikayla', 'Kelly', 1, '2019-09-10', 3),
	   ('Edward', 'Turner', 1, '2019-04-26', 1),
	   ('Caleb', 'Muphey', 2, '2017-11-13', 3),
	   ('Isaaac', 'Morris', 2, '2015-09-24', 1);

--INSERT values into Branch 
PRINT 'Populating "Branch" Table';
GO
INSERT INTO Branch(BranchName, Address, PhoneNumber, Manager)
VALUES ('The Firm (Subiaco)', '1 Branch Road', 80122443, 1),
	   ('The Firm (Joondalup)', '2 Branch Road', 80233445, 2),
	   ('The Firm (Marylands)', '3 Branch Road', 80344556, 3);

UPDATE Accountant
SET Branch = 1
WHERE StaffID IN (1, 4, 6, 8);

UPDATE Accountant
SET Branch = 2
WHERE StaffID IN (2, 5, 9);

UPDATE Accountant
SET Branch = 3
WHERE StaffID IN (3, 7, 10);


--INSERT values into Client
PRINT 'Populating "Client" Table';
INSERT INTO Client (TaxFileNumber, FirstName, LastName, PhoneNumber, EmailAddress, PreferredAccountant)
VALUES (111111101,'John', 'Smith', 90122443, 'JohnSmith@email.com',1),
       (111111102,'Robin', 'Johnson', 90222445, 'RobinJohnson@email.com',NULL),
       (111111103,'Sharen', 'Williams', 90344556,'SharenWilliams@email.com',2),
       (111111104,'Oscar', 'Brown', 90455667,'OscarBrown@email.com',3),
       (111111105,'Emma', 'Jones', 90566778,'EmmaJones@email.com',1),
       (111111106,'Kacy', 'Miller', 90677889,'KacyMiller@email.com',1),
       (111111107,'Darryl', 'Martin', 90788990,'DarrylMartin@email.com',10),
       (111111108,'Thomas', 'Robinson', 90899001,'ThomasRobinson@email.com',10),
       (111111109,'Chris', 'Baker', 90900112,'ChrisBaker@email.com',2),
       (111111110,'Justin', 'Parker', 910111223,'JustinParker@email.com',NULL);

--INSERT values into Specialists
PRINT 'Populating "Specialists" Table';
INSERT INTO Specialists(JobTypeID, StaffID)
VALUES (1, 1),
	   (2, 1),
	   (3, 1),
	   (4, 1),
	   (1, 2),
	   (3, 3),
	   (4, 3),
	   (2, 4),
	   (4, 4),
	   (1 ,5),
	   (2, 6),
	   (3, 7),
	   (2, 8),
	   (4, 9);


/*  The following statement inserts 100 rows of data into a table named "job".
    It assumes that the primary key of the table is an auto-incrementing integer, and hence does not specify a primary key valule in the data.
	It specifies the following column data:
      1) Staff ID numbers between 1 and 10.
      2) Client Tax File Numbers between 111111101 and 111111110.
      3) Job Type ID numbers between 1 and 4.
      4) Job Date/Times roughly within business hours over the last couple of years.
      5) Job Durations between 15 and 360.
      6) Amount paid values that are usually for the appropriate amount, with some unpaid, partially paid and overpaid jobs.
  
    You will need to insert details of accountants, clients and job types before you can insert the job details.
    Make sure that the IDs of your accountants, clients and job types match those specified above so that the foreign key relationships are upheld.
    Make sure that the data types of the columns in your job table are able to store the data being inserted.
    Change the column names in the statement below to match the column names in your job table if needed.
*/

PRINT 'Populating "Job" Table';
INSERT INTO Job (Accountant, Client, JobType, JobDate, JobDuration, AmountPaid)
VALUES (5,  111111109, 2, '2017-01-04 12:59:00', 150, 500),
       (3,  111111101, 4, '2017-01-06 15:50:00', 47,  260),
       (5,  111111110, 2, '2017-01-17 10:54:00', 206, 700),
       (9,  111111109, 3, '2017-01-31 14:53:00', 118, 560),
       (7,  111111107, 2, '2017-02-22 10:30:00', 251, 0),
       (7,  111111110, 1, '2017-03-01 16:03:00', 236, 640),
       (1,  111111108, 4, '2017-03-03 14:14:00', 240, 1040),
       (7,  111111108, 4, '2017-03-11 15:52:00', 216, 975),
       (1,  111111102, 4, '2017-03-12 15:24:00', 112, 520),
       (4,  111111102, 2, '2017-03-16 15:49:00', 109, 300),
       (5,  111111103, 2, '2017-03-26 11:35:00', 42,  150),
       (4,  111111105, 1, '2017-04-02 10:43:00', 330, 880),
       (7,  111111101, 1, '2017-04-05 10:04:00', 285, 760),
       (3,  111111107, 2, '2017-04-07 13:40:00', 15,  50),
       (9,  111111101, 3, '2017-04-29 12:32:00', 334, 1610),
       (4,  111111107, 4, '2017-05-03 11:50:00', 321, 1430),
       (6,  111111103, 2, '2017-06-28 13:15:00', 68,  250),
       (8,  111111109, 1, '2017-07-06 11:02:00', 155, 440),
       (4,  111111104, 1, '2017-07-07 10:19:00', 136, 400),
       (6,  111111104, 1, '2017-07-09 13:09:00', 207, 400),
       (8,  111111107, 3, '2017-07-11 10:53:00', 25,  0),
       (2,  111111108, 2, '2017-07-20 12:29:00', 74,  250),
       (5,  111111102, 4, '2017-07-24 13:10:00', 221, 975),
       (4,  111111102, 1, '2017-07-27 11:51:00', 87,  0),
       (7,  111111107, 2, '2017-07-27 12:47:00', 294, 1000),
       (10, 111111109, 2, '2017-07-29 12:25:00', 277, 1000),
       (10, 111111108, 4, '2017-08-06 16:18:00', 272, 1000),
       (10, 111111109, 1, '2017-08-27 12:55:00', 48,  160),
       (3,  111111102, 1, '2017-08-28 17:27:00', 341, 920),
       (7,  111111106, 2, '2017-08-30 12:43:00', 15,  50),
       (3,  111111104, 2, '2017-09-04 15:01:00', 229, 800),
       (7,  111111109, 2, '2017-09-24 17:28:00', 176, 600),
       (9,  111111105, 2, '2017-09-25 13:44:00', 22,  100),
       (8,  111111110, 2, '2017-09-26 10:09:00', 318, 1000),
       (3,  111111104, 1, '2017-10-08 09:36:00', 225, 600),
       (8,  111111103, 3, '2017-10-23 12:59:00', 148, 500),
       (9,  111111108, 1, '2017-10-27 09:48:00', 91,  280),
       (9,  111111105, 2, '2017-10-29 11:42:00', 270, 900),
       (3,  111111107, 4, '2017-10-30 15:15:00', 289, 1500),
       (7,  111111103, 1, '2017-11-02 11:13:00', 113, 320),
       (3,  111111108, 2, '2017-11-02 14:40:00', 47,  200),
       (1,  111111110, 3, '2017-11-02 16:21:00', 173, 0),
       (7,  111111108, 3, '2017-11-19 16:35:00', 91,  490),
       (5,  111111104, 4, '2017-11-24 10:52:00', 26,  130),
       (6,  111111109, 2, '2017-12-12 11:02:00', 337, 1150),
       (8,  111111108, 3, '2017-12-13 12:27:00', 163, 770),
       (4,  111111108, 1, '2017-12-26 09:34:00', 298, 800),
       (1,  111111110, 2, '2017-12-31 09:08:00', 141, 500),
       (4,  111111110, 3, '2018-01-03 10:45:00', 339, 1610),
       (4,  111111109, 2, '2018-01-09 13:20:00', 236, 800),
       (7,  111111107, 3, '2018-01-09 13:43:00', 38,  200),
       (7,  111111110, 3, '2018-01-20 10:29:00', 72,  350),
       (6,  111111108, 3, '2018-02-01 10:50:00', 244, 1190),
       (4,  111111107, 1, '2018-02-01 11:47:00', 52,  150),
       (3,  111111109, 2, '2018-02-08 13:38:00', 313, 1050),
       (1,  111111103, 3, '2018-02-26 09:50:00', 50,  0),
       (9,  111111104, 1, '2018-03-07 12:10:00', 308, 840),
       (9,  111111101, 1, '2018-03-08 17:20:00', 155, 440),
       (9,  111111102, 2, '2018-03-28 16:40:00', 245, 850),
       (9,  111111110, 2, '2018-04-24 16:36:00', 180, 600),
       (9,  111111107, 1, '2018-05-07 11:12:00', 324, 880),
       (6,  111111107, 4, '2018-06-10 09:41:00', 133, 585),
       (4,  111111109, 2, '2018-06-25 15:11:00', 75,  250),
       (9,  111111110, 3, '2018-07-01 10:46:00', 48,  280),
       (10, 111111103, 1, '2018-07-12 16:09:00', 126, 300),
       (7,  111111101, 2, '2018-07-17 12:45:00', 253, 850),
       (3,  111111107, 3, '2018-07-17 15:00:00', 149, 0),
       (6,  111111101, 1, '2018-07-23 09:58:00', 100, 280),
       (10, 111111106, 1, '2018-07-25 16:52:00', 87,  240),
       (7,  111111103, 3, '2018-07-31 17:25:00', 222, 1050),
       (1,  111111102, 3, '2018-08-17 11:34:00', 237, 1120),
       (4,  111111108, 2, '2018-08-18 13:14:00', 59,  200),
       (4,  111111102, 2, '2018-08-25 10:53:00', 119, 400),
       (10, 111111104, 4, '2018-09-13 10:08:00', 158, 700),
       (3,  111111107, 4, '2018-10-05 11:19:00', 359, 1560),
       (5,  111111101, 4, '2018-10-07 16:10:00', 342, 1495),
       (10, 111111102, 1, '2018-10-08 15:28:00', 106, 320),
       (1,  111111102, 1, '2018-10-18 15:41:00', 141, 400),
       (3,  111111110, 2, '2018-10-26 09:03:00', 293, 100),
       (10, 111111110, 1, '2018-11-08 12:41:00', 292, 800),
       (2,  111111109, 2, '2018-11-18 09:58:00', 150, 500),
       (1,  111111102, 3, '2018-11-19 09:18:00', 150, 0),
       (10, 111111102, 3, '2018-12-02 17:08:00', 247, 1000),
       (10, 111111105, 2, '2018-12-23 10:55:00', 163, 550),
       (3,  111111108, 1, '2019-01-04 10:19:00', 265, 720),
       (1,  111111101, 3, '2019-01-12 12:42:00', 253, 1190),
       (4,  111111103, 2, '2019-01-14 14:36:00', 277, 400),
       (5,  111111105, 1, '2019-02-15 17:26:00', 38,  120),
       (6,  111111105, 2, '2019-02-18 09:16:00', 280, 950),
       (4,  111111110, 4, '2019-03-03 11:52:00', 287, 1300),
       (10, 111111107, 4, '2019-03-08 14:37:00', 341, 1495),
       (1,  111111103, 2, '2019-03-23 13:48:00', 347, 1500),
       (7,  111111105, 4, '2019-04-02 17:36:00', 295, 1300),
       (9,  111111105, 1, '2019-04-04 10:19:00', 180, 0),
       (5,  111111106, 1, '2019-04-17 13:34:00', 331, 0),
       (7,  111111110, 3, '2019-05-08 09:29:00', 294, 0),
       (9,  111111110, 3, '2019-05-21 13:07:00', 166, 0),
       (10, 111111104, 2, '2019-06-21 16:53:00', 186, 0),
       (3,  111111104, 2, '2019-06-13 14:48:00', 22,  0),
       (1,  111111101, 4, '2019-07-01 13:14:00', 132, 0);
