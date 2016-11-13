CREATE TABLE [dbo].[tbl_ServiceMaster]
(
	[ServiceId] INT NOT NULL PRIMARY KEY,
	[ServiceName] VARCHAR(255) NOT NULL,
	[ServiceDependentObjectID] INT NOT NULL 
)
