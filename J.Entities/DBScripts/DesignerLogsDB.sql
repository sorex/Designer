ALTER TABLE [dbo].[Logs]DROP CONSTRAINT []
GO

DROP TABLE [dbo].[Logs]
GO

CREATE TABLE [dbo].[Logs] (
[ID] int IDENTITY(1,1) NOT NULL,
[CreateDate] datetime2 NOT NULL,
[LogLevel] varchar(5) NOT NULL,
[CallSite] nvarchar(MAX) NULL DEFAULT NULL,
[Massage] nvarchar(MAX) NULL DEFAULT NULL,
[StackTrace] nvarchar(MAX) NULL DEFAULT NULL,
PRIMARY KEY ([ID]) 
)
GO

