USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [adminBiblio].[EXE_AllExemplaireByBIB_Id]    Script Date: 08-Jan-17 01:08:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [adminBiblio].[EXE_AllExemplaireByTitre]
	@Bib_Id int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Titre nvarchar(50)
    -- Insert statements for procedure here
	SELECT        Exemplaire.EXE_Id AS ID, Exemplaire.EXE_Code AS Exemplaire, Livre.LIV_Titre AS Titre, Livre.LIV_ISBN AS ISBN, Exemplaire.EXE_DateAchat AS [Date d'achat], Livre.LIV_Auteurs AS Auteurs, 
                         Bibliotheque.BIB_Code AS Exemplaire, Livre.LIV_Image AS Image
FROM            Exemplaire INNER JOIN
                         Livre ON Exemplaire.LIV_Id = Livre.LIV_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
WHERE        (Livre.LIV_Titre LIKE '%' + @Titre + '%')
END





GO


