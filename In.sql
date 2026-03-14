CREATE TABLE [dbo].[In]
(
	[Id] INT NOT NULL PRIMARY KEY identity(1,1), 
    [Sum] MONEY NOT NULL, 
    [Src] NVARCHAR(150) NOT NULL, 
    [Dt] DATE NOT NULL default sysdatetime()
)
