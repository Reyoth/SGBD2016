USE [SGBD2016_Bibliotheque]
GO
/****** Object:  StoredProcedure [adminBiblio].[EXE_AllExemplaireAllBib]    Script Date: 07-Jan-17 13:25:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [lecteur].[EXE_AllExemplairesDispoByTitle]
	@Bib_Id int,
	@Titre nvarchar (50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        Exemplaire.EXE_Id, Exemplaire.EXE_Code AS Exemplaire, Livre.LIV_Titre AS Titre, Livre.LIV_ISBN AS ISBN, Livre.LIV_Auteurs AS Auteurs, Bibliotheque.BIB_Libelle AS Bibliothèque
FROM            Exemplaire INNER JOIN
                         Livre ON Exemplaire.LIV_Id = Livre.LIV_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
WHERE        (Exemplaire.BIB_ID = @Bib_Id) AND (Livre.LIV_Titre LIKE @Titre) AND (Exemplaire.EXE_Indisponible = 0)
END





