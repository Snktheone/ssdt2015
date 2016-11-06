/*
The bucket count should be set to about two times the 
maximum expected number of distinct values in the 
index key, rounded up to the nearest power of two.
*/

CREATE TABLE [dbo].[Confuguration]
(
	[ConfigurationId] INT NOT NULL PRIMARY KEY NONCLUSTERED HASH WITH (BUCKET_COUNT = 131072),
	[ConfigurationKey] VARCHAR(255) NOT NULL ,
	[ConfigurationType] VARCHAR(255) NOT NULL ,
	[ConfigurationValue] VARCHAR(255) NOT NULL 

) WITH (MEMORY_OPTIMIZED = ON)

GO

/*
Do not change the database path or name variables.
Any sqlcmd variables will be properly substituted during 
build and deployment.
*/

ALTER DATABASE [$(DatabaseName)]
	ADD FILEGROUP [Confuguration_FG] CONTAINS MEMORY_OPTIMIZED_DATA