USE [SGBD2016_Bibliotheque]
GO
/****** Object:  StoredProcedure [adminBiblio].[EXE_CreerExemplaire]    Script Date: 10-Jan-17 21:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 ALTER PROCEDURE [adminBiblio].[EXE_CreerExemplaire]
	@Code nvarchar (50),
	@DateAchat Date,
	@Bib_Libelle nvarchar(50),
	@Liv_Titre  nvarchar(50)
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;
	DECLARE @Bib_Id int, @Liv_Id int

	SELECT  @Bib_Id = Bib_ID FROM  Bibliotheque WHERE (BIB_Libelle = @Bib_Libelle )
	SELECT  @Liv_Id = LIV_Id FROM  Livre WHERE  (LIV_Titre = @Liv_Titre)

    INSERT INTO Exemplaire (EXE_Code, EXE_DateAchat, EXE_Indisponible, BIB_ID, LIV_Id)	VALUES (@Code, @DateAchat, 0, @Bib_Id, @Liv_Id)
END








