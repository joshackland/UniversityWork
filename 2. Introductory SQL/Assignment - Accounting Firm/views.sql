USE Accounting_Firm;
GO


/*	Accountant View (2 marks)
	Create a view that selects details of all accountants.
	The view should include all columns from the accountant table, the name of the branch that they work at, the name and annual pay of their pay level, and the name of their mentor (if they have one).
	Instead of selecting the accountant and mentor’s first name and last name columns separately, concatenate them into full name columns.
*/

-- Write your Accountant View here

PRINT 'Creating "Accountant View" View';
GO

CREATE VIEW [Accountant View] AS
SELECT a.StaffID, CONCAT(a.FirstName, ' ', a.LastName) AS AccountantName, a.HireDate, a.Branch, Branch.BranchName, a.PayLevel, PayLevelName,AnnualPay, a.Mentor, CONCAT(m.FirstName, ' ', m.LastName) AS MentorName
FROM Accountant AS a
INNER JOIN Branch ON a.Branch = Branch.BranchID
INNER JOIN PayLevel ON a.PayLevel = PayLevel.PayID
LEFT JOIN Accountant AS m ON a.Mentor = m.StaffID;
GO


/*	Job View (3 marks)
	Create a view that selects details of all jobs.  The view should contain the following columns:
	  • All columns from the job table.
	  • The full name of the accountant and the full name of the client.
	  • The name of the job type.
	  • A “job cost” column, which uses the “job duration” and “cost per 15 minutes columns” to determine the appropriate job cost, as described in the scenario details.
	    Hint: See the Blackboard discussion board for tips regarding how to do this if needed!
*/

-- Write your Job View here
PRINT 'Creating "Job View" View';
GO

CREATE VIEW [Job View] AS
SELECT JobID, JobDate, Accountant, CONCAT(a.FirstName, ' ', a.LastName) AS AccountantName, Client as TFN, CONCAT(c.FirstName, ' ', c.LastName) AS ClientName, 
JobType, jt.JobTypeName, JobDuration, CEILING(JobDuration / 15.0) * jt.CostPer15Minutes AS JobCost, AmountPaid
FROM Job AS j
INNER JOIN Accountant AS a ON J.Accountant = a.StaffID
INNER JOIN Client AS c ON j.Client = c.TaxFileNumber
INNER JOIN JobType AS jt ON j.JobType = jt.JobTypeID;
GO

/*	If you wish to create additional views to use in the queries which follow, include them in this file. */
