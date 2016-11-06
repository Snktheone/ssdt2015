
CREATE PROCEDURE [dbo].[PR_InsertConfiguruation]
    @ConfigurationId INT NOT NULL,
	@ConfigurationKey VARCHAR(255) NOT NULL ,
	@ConfigurationType VARCHAR(255) NOT NULL ,
	@ConfigurationValue VARCHAR(255) NOT NULL 
WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER 
AS BEGIN ATOMIC WITH (
      TRANSACTION ISOLATION LEVEL = SNAPSHOT,
      LANGUAGE = N'English')
		BEGIN TRY

		IF EXISTS ( SELECT 1 FROM [dbo].[Confuguration] WHERE [ConfigurationId] =  @ConfigurationId)
		BEGIN
			RAISERROR ('ConfigurationId already exists', -- Message text.  
				16, -- Severity.  
				1 -- State.  
				);  
		END
		ELSE
		BEGIN
		INSERT INTO [dbo].[Confuguration] ( [ConfigurationId] , [ConfigurationKey] ,[ConfigurationType] , [ConfigurationValue] )
		SELECT @ConfigurationId , @ConfigurationKey , @ConfigurationType , @ConfigurationValue
	 
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

	    
RETURN 0
END