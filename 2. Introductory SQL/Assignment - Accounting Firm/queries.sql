USE Accounting_Firm;

/*	Query 1 � Accountant Search (2 marks)
	Write a query that selects the staff ID, full name, hire date and branch name for accountants who:
	  � Were hired before the 1st of January 2010.
	  � Work in a branch that contains �Subiaco� in the branch name.
	  � Do not have a mentor.
*/

-- Write Query 1 here
SELECT StaffID, AccountantName, HireDate, BranchName
FROM [Accountant View]
WHERE HireDate < '2010-01-01' AND BranchName LIKE '%Subiaco%' AND Mentor IS NULL





/*	Query 2 � Unspecialised Jobs of Accountant 4 (2 marks)
	Write a query that selects all details of jobs done by the accountant with a staff ID number of 4 that took at least 120 minutes, 
	and had a job type that the accountant is not specialised in.

	Hint:  Consider using a subquery and a �NOT IN� comparison.
*/

-- Write Query 2 here
SELECT JobID, JobDate, Accountant, AccountantName, TFN, ClientName, JobType, JobTypeName, JobDuration, JobCost, AmountPaid
FROM [Job View]
WHERE Accountant = 4 AND JobDuration >= 120 AND JobType NOT IN 
													(SELECT JobTypeID 
													 FROM Specialists
													 WHERE StaffID = 4)



/*	Query 3 � Specialisations Available At Branch 2 (2 marks)
	Write a query that selects a distinct list of the job types specialised in by all accountants who work at branch number 2.
	Since there are only 4 job types, your results should consist of between 1 and 4 job type names, depending on your data.
	The same job type name should not appear multiple times in the results, even if multiple accountants specialise in it.
	Order the results by job type name.
*/

-- Write Query 3 here
SELECT DISTINCT JobTypeName
FROM JobType INNER JOIN Specialists
ON JobType.JobTypeID = Specialists.JobTypeID
INNER JOIN Accountant
ON Specialists.StaffID = Accountant.StaffID
WHERE Branch = 2
ORDER BY JobType.JobTypeName



/*	Query 4 � Most Popular Accountants (3 marks)
	Write a query that selects the staff ID number and full name of the three most popular accountants, based upon how many clients prefer them 
	(i.e.  The three accountants who are most frequently listed by clients as their preferred accountant).
	Your results should include the number of preferences they have received.
*/

-- Write Query 4 here

SELECT TOP 3 StaffID, AccountantName, COUNT(Client.PreferredAccountant) AS Preferences
FROM [Accountant View] 
AS av LEFT JOIN Client
ON StaffID = Client.PreferredAccountant
GROUP BY StaffID, AccountantName
ORDER BY Preferences DESC

SELECT TOP 3 StaffID, AccountantName, COUNT(Client.PreferredAccountant) AS Preferences
FROM [Accountant View] 
AS av LEFT JOIN Client
ON StaffID = Client.PreferredAccountant
GROUP BY StaffID, AccountantName
ORDER BY Preferences DESC

/*	Query 5 � Overpaid Accountants (3 marks)
	Write a query that selects the full name, hire date, pay level name and expected experience of any accountants who have been working at the firm for less than the number of years expected for their pay level.
	For example, an accountant at the �Senior Accountant� pay level who was hired less than 8 years ago would appear in the results of this query.
	Order the results by hire date, descending.
*/

-- Write Query 5 here
SELECT AccountantName, HireDate, PayLevel.PayLevelName, ExpectedExperience
FROM [Accountant View] INNER JOIN PayLevel
ON PayLevel = PayLevel.PayID
WHERE YEAR(DATEADD(YEAR, ExpectedExperience, HireDate)) > YEAR(GETDATE())
ORDER BY HireDate DESC



/*	Query 6 � Branch Staff Overview (3 marks)
	Write a query that selects the branch name, manager name, number of employees and total pay of employees for each branch.
	Order the results by branch name.
*/

-- Write Query 6 here
SELECT BranchName, CONCAT(m.FirstName, ' ', m.LastName) AS ManagerName, COUNT(Accountant.StaffID) AS Employees, SUM(PayLevel.AnnualPay)AS TotalPay
FROM Branch INNER JOIN Accountant as m
ON Branch.Manager = m.StaffID
INNER JOIN Accountant
ON Branch.BranchID = Accountant.Branch
INNER JOIN PayLevel
ON Accountant.PayLevel = PayLevel.PayID
GROUP BY BranchName, m.FirstName, m.LastName
ORDER BY BranchName




/*	Query 7 � Cross Branch Mentoring (4 marks)
	Write a query that selects details of any accountants who are mentored by an accountant that works at a different branch, 
	and concatenates the information to produce a single column in this format:

	�[accountant full name] works at [accountant branch name] but is mentored by [mentor full name name] who works at [mentor branch name].�
*/

-- Write Query 7 here
SELECT CONCAT(a.AccountantName, ' works at ', a.BranchName, ' but is mentored by ', m.AccountantName, ' who works at ', m.BranchName) AS CrossBranchMentor
FROM [Accountant View] AS a INNER JOIN [Accountant View] AS m
ON a.Mentor = m.StaffID
WHERE a.Branch != m.Branch



/*	Query 8 � Jobs Per Month (4 marks)
	Write a query that that selects the name of the month, number of jobs, and total cost of jobs, grouped per month.
	Only include jobs from the years prior to the current year � i.e. do not include jobs from the current year.
	Order the results chronologically (from January to December).

	Hint:  The DATENAME function can obtain the month name, and the MONTH function can obtain the month number.
*/

-- Write Query 8 here

SELECT  DATENAME(MONTH, JobDate) AS JobMonth, COUNT(*) AS JobCount, SUM(JobCost) AS TotalCost
FROM [Job View]
WHERE YEAR(JobDate) != YEAR(GETDATE())
GROUP BY DATENAME(MONTH, JobDate), MONTH(JobDate)
ORDER BY MONTH(JobDate)



/*	Query 9 � Clients Owing Payment (4 marks)
	Write a query that selects the full name, phone number, email address, and total unpaid job costs of any clients who have a total of at least $1000 owing on jobs that occurred more than 6 months ago.
	Order the results so that the largest amount owing is at the top.

	Hint:  This will involve using SUM, WHERE, GROUP BY and HAVING.
*/

-- Write Query 9 here
SELECT ClientName, PhoneNumber, EmailAddress, SUM(JobCost - AmountPaid) AS AmountOwed
FROM [Job View] INNER JOIN Client
ON TFN = Client.TaxFileNumber
--WHERE DATEADD(MONTH, -6, GETDATE()) > JobDate
GROUP BY TFN, ClientName, PhoneNumber, EmailAddress
--HAVING SUM(JobCost - AmountPaid) >= 1000
ORDER BY AmountOwed DESC



