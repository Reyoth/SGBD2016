USE [SGBD2016_Bibliotheque]
GO
/****** Object:  StoredProcedure [lecteur].[EXE_AllExemplairesByBibId]    Script Date: 10-Jan-17 19:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [lecteur].[EXE_AllExemplairesByBibId]
	@Bib_Id int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        Exemplaire.EXE_Id AS [ID Exemplaire], Exemplaire.EXE_Code AS Exemplaire, Livre.LIV_Titre AS Titre, Livre.LIV_ISBN AS ISBN, Livre.LIV_Auteurs AS Auteurs, Bibliotheque.BIB_Libelle AS Bibliotheque, 
                         Livre.LIV_Image
FROM            Exemplaire INNER JOIN
                         Livre ON Exemplaire.LIV_Id = Livre.LIV_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
WHERE        (Exemplaire.BIB_ID = @Bib_Id)
END









