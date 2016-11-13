CREATE TABLE [dbo].[tbl_Employee]
(
	[EmployeeId] INT NOT NULL PRIMARY KEY,
	[Employee_FirstName] VARCHAR(255) NOT NULL,
	[Employee_LastName] VARCHAR(255) NOT NULL,
	[Employee_Gender] CHAR(1) NOT NULL,
	[Employee_DateofBirth] DATETIME NOT NULL,
	[Employee_HireDate] DATETIME NOT NULL,
	[Employee_Designation] VARCHAR(255) NOT NULL,
	[Employee_DepartmentID] INT NOT NULL,
	[Employee_ManagerID] INT NOT NULL  FOREIGN KEY  REFERENCES  dbo.tbl_Employee( [EmployeeId] )
)
