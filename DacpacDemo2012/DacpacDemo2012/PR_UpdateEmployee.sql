CREATE PROCEDURE [dbo].[PR_UpdateEmployee]
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

			IF NOT EXISTS 
			( SELECT 1 FROM dbo.tbl_Employee WHERE EmployeeId = @EmployeeId )
			BEGIN
			PRINT ' EmployeeId Does Not Exists , Please use another Id '
			END 
			ELSE	
			BEGIN
			UPDATE [dbo].[tbl_Employee]
			   SET [Employee_FirstName] = @Employee_FirstName
				  ,[Employee_LastName] = @Employee_LastName
				  ,[Employee_Gender] = @Employee_Gender
				  ,[Employee_DateofBirth] =@Employee_DateofBirth
				  ,[Employee_HireDate] = @Employee_HireDate
				  ,[Employee_Designation] = @Employee_Designation
				  ,[Employee_DepartmentID] =@Employee_DepartmentID
				  ,[Employee_ManagerID] = @Employee_ManagerID
		   WHERE [EmployeeId] = @EmployeeId
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