USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [dbo].[EXE_CreerExemplaire]    Script Date: 27-12-16 15:54:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 CREATE PROCEDURE [dbo].[EXE_CreerExemplaire]
	@Code varchar (50),
	@DateAchat Date,
	@Indisponible bit,
	@Bib_Id int,
	@Liv_Id int
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Exemplaire (EXE_Code, EXE_DateAchat, EXE_Indisponible, BIB_ID, LIV_Id)	VALUES (@Code, @DateAchat, @Indisponible, @Bib_Id, @Liv_Id)
END

GO


