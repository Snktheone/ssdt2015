CREATE PROCEDURE [dbo].[PR_CreateEmployee]
 @EmployeeId INT 
,@Employee_FirstName VARCHAR(255)
,@Employee_LastName VARCHAR(255)
,@Employee_Gender CHAR(1) 
,@Employee_DateofBirth DATETIME 
,@Employee_HireDate DATETIME 
,@Employee_Designation VARCHAR(255) 
,@Employee_DepartmentID INT 
,@Employee_ManagerID INT 

AS
	BEGIN TRY

			IF EXISTS 
			( SELECT 1 FROM dbo.tbl_Employee WHERE EmployeeId = @EmployeeId )
			BEGIN
			PRINT ' EmployeeId Already Exists , Please use another Id '
			END 
			ELSE	
			BEGIN
			INSERT INTO [dbo].[tbl_Employee]
					   ([EmployeeId]
					   ,[Employee_FirstName]
					   ,[Employee_LastName]
					   ,[Employee_Gender]
					   ,[Employee_DateofBirth]
					   ,[Employee_HireDate]
					   ,[Employee_Designation]
					   ,[Employee_DepartmentID]
					   ,[Employee_ManagerID])
				 VALUES
					   (@EmployeeId 
					   ,@Employee_FirstName
					   ,@Employee_LastName
					   ,@Employee_Gender
					   ,@Employee_DateofBirth
					   ,@Employee_HireDate
					   ,@Employee_Designation
					   ,@Employee_DepartmentID
					   ,@Employee_ManagerID
					   )
			END 

	END TRY
	BEGIN CATCH  
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		-- Use RAISERROR inside the CATCH block to return error  
		-- information about the original error that caused  
		-- execution to jump to the CATCH block.  
		RAISERROR (@ErrorMessage, -- Message text.  
					@ErrorSeverity, -- Severity.  
					@ErrorState -- State.  
					);  
	END CATCH;  