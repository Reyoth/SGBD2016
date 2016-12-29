USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [dbo].[EMP_ListeREtardsByLEC_Id]    Script Date: 28-12-16 11:18:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI RETOURNE LA LISTE DES EMPRUNTS PAR RAPPORTS A UN LECTEUR>
-- =============================================
CREATE PROCEDURE [dbo].[EMP_ListeRetardatairesByBIB_Id]
	--Parametres
	@Bib_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT			Emprunt.EMP_Id, Exemplaire.EXE_Code, Livre.LIV_Titre, Bibliotheque.BIB_Libelle, Lecteur.LEC_Nom, Lecteur.LEC_Prenom, Emprunt.EMP_DateEmprunt, Emprunt.EMP_Montant
	FROM            Emprunt INNER JOIN
                         Exemplaire ON Emprunt.EXE_Id = Exemplaire.EXE_Id INNER JOIN
                         Lecteur ON Emprunt.LEC_Id = Lecteur.LEC_Id INNER JOIN
                         Livre ON Exemplaire.LIV_Id = Livre.LIV_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID AND Lecteur.BIB_ID = Bibliotheque.BIB_ID
	WHERE			Lecteur.LEC_Id = @Bib_Id AND (DATEDIFF(day, Emprunt.EMP_DateEmprunt, GETDATE())>10)
END


GO
