
CREATE PROCEDURE [dbo].[PR_UpdateConfiguration]
    @ConfigurationId INT NOT NULL,
	@ConfigurationKey VARCHAR(255) NOT NULL ,
	@ConfigurationType VARCHAR(255) NOT NULL ,
	@ConfigurationValue VARCHAR(255) NOT NULL 

WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER 
AS BEGIN ATOMIC WITH (
      TRANSACTION ISOLATION LEVEL = SNAPSHOT,
      LANGUAGE = N'English')
		BEGIN TRY

			IF NOT EXISTS ( SELECT 1 FROM [dbo].[Confuguration] WHERE [ConfigurationId] =  @ConfigurationId)
				BEGIN
					RAISERROR ('ConfigurationId does not exists, no update performed', -- Message text.  
						16, -- Severity.  
						1 -- State.  
						);  
				END
			ELSE
				BEGIN
				UPDATE [dbo].[Confuguration] 
				SET    [ConfigurationKey] = @ConfigurationKey 
					  ,[ConfigurationType] =  @ConfigurationType
					  ,[ConfigurationValue] = @ConfigurationValue
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