USE [GC2]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 1/22/2021 11:35:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(11,1) NOT NULL,
	[FName] [nvarchar](40) NULL,
	[LName] [nvarchar](40) NULL,
	[CAddress] [nvarchar](40) NULL,
	[City] [nvarchar](40) NULL,
 CONSTRAINT [CLUSTERED] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[NewClient]    Script Date: 1/22/2021 11:35:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NewClient] 

	@FName nvarchar(40),
	@LName nvarchar(40),
	@CAddress nvarchar(40),
	@City nvarchar(40)
AS
BEGIN

	INSERT INTO Client (FName,LName,CAddress,City) VALUES (@FName,@LName,@CAddress,@City)

END
GO
/****** Object:  StoredProcedure [dbo].[SelectByCity]    Script Date: 1/22/2021 11:35:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[SelectByCity] 

	@City nvarchar(40)
	
	
AS
BEGIN

	SELECT * FROM Client WHERE City = @City;

END
GO
/****** Object:  StoredProcedure [dbo].[SelectClient]    Script Date: 1/22/2021 11:35:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[SelectClient] 

	@FName nvarchar(40),
	@LName nvarchar(40)
	
AS
BEGIN

	SELECT * FROM Client WHERE FName = @FName and LName = @LName

END
GO
/****** Object:  StoredProcedure [dbo].[SelectClientToUpadate]    Script Date: 1/22/2021 11:35:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[SelectClientToUpadate] 

	@ID int
	
	
AS
BEGIN

	SELECT * FROM Client WHERE ID = @ID;

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateClient]    Script Date: 1/22/2021 11:35:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateClient] 
	@ID int,
	@FName nvarchar(40),
	@LName nvarchar(40),
	@CAddress nvarchar(40),
	@City nvarchar(40)
AS
BEGIN

	UPDATE Client
	set 
	FName = @FName,
	LName = @LName,
	CAddress = @CAddress,
	City = @City
	WHERE ID = @ID
END
GO
