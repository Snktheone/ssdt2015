CREATE PROCEDURE [dbo].[PR_DeleteConfiguration]
    @ConfigurationId INT NOT NULL
WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER 
AS BEGIN ATOMIC WITH (
      TRANSACTION ISOLATION LEVEL = SNAPSHOT,
      LANGUAGE = N'English')
		BEGIN TRY

			IF NOT EXISTS ( SELECT 1 FROM [dbo].[Confuguration] WHERE [ConfigurationId] =  @ConfigurationId)
				BEGIN
					RAISERROR ('ConfigurationId does not exists, no delete performed', -- Message text.  
						16, -- Severity.  
						1 -- State.  
						);  
				END
			ELSE
				BEGIN
				DELETE [dbo].[Confuguration] 
				WHERE [ConfigurationId] = @ConfigurationId
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