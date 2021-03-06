USE [SGBD2016_Bibliotheque]
GO
/****** Object:  StoredProcedure [lecteur].[EMP_AllEmpruntsByLEC_Id]    Script Date: 05-Jan-17 21:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI RETOURNE LA LISTE DES EMPRUNTS PAR RAPPORTS A UN LECTEUR>
-- =============================================
ALTER PROCEDURE [lecteur].[EMP_AllEmpruntsByLEC_Id]
	--Parametres
	@Lec_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT        Exemplaire.EXE_Code AS Exemplaire, Livre.LIV_Titre AS Titre, Bibliotheque.BIB_Libelle AS Bibliotheque, Emprunt.EMP_DateEmprunt AS [Date d'emprunt'emprunt]
FROM            Emprunt INNER JOIN
                         Exemplaire ON Emprunt.EXE_Id = Exemplaire.EXE_Id INNER JOIN
                         Livre ON Exemplaire.LIV_Id = Livre.LIV_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
WHERE        (Emprunt.LEC_Id = @Lec_Id) AND (Emprunt.EMP_DateRetour IS NULL)
END




