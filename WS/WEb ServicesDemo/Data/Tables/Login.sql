CREATE TABLE [dbo].[Login]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [FIrstName] NVARCHAR(50) NOT NULL, 
    [LastName] NVARCHAR(50) NOT NULL, 
    [UserName] NVARCHAR(50) NOT NULL, 
    [CreationDate] TIMESTAMP NOT NULL, 
    [Email] NVARCHAR(50) NOT NULL, 
    [Password] NVARCHAR(10) NOT NULL

)
