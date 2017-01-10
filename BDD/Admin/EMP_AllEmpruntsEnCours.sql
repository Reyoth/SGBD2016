USE [SGBD2016_Bibliotheque]
GO
/****** Object:  StoredProcedure [lecteur].[EMP_AllEmpruntsEnCoursByLEC_Id]    Script Date: 10-Jan-17 20:08:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI RETOURNE LA LISTE DES EMPRUNTS PAR RAPPORTS A UN LECTEUR>
-- =============================================
ALTER PROCEDURE [adminBiblio].[EMP_AllEmpruntsEnCours]
	--Parametres
	@Lec_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT        Emprunt.LEC_Id, Lecteur.LEC_Nom, Lecteur.LEC_Prenom, Exemplaire.EXE_Code, Livre.LIV_Titre, Livre.LIV_ISBN, Bibliotheque.BIB_Libelle, Emprunt.EMP_DateEmprunt, Livre.LIV_Image,
				Tarif.TAR_Emprunt + dbo.EMP_CalculMontantRetard(Bibliotheque.BIB_ID, YEAR(Emprunt.EMP_DateEmprunt), dbo.EMP_CalculJoursRetard(Emprunt.EMP_DateEmprunt)) AS [Montant total du €], 
                         dbo.EMP_CalculJoursRetard(Emprunt.EMP_DateEmprunt) AS Retard
FROM            Emprunt INNER JOIN
                         Exemplaire ON Emprunt.EXE_Id = Exemplaire.EXE_Id INNER JOIN
                         Livre ON Exemplaire.LIV_Id = Livre.LIV_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID INNER JOIN
                         Tarif ON Bibliotheque.BIB_ID = Tarif.BIB_ID INNER JOIN
                         Lecteur ON Emprunt.LEC_Id = Lecteur.LEC_Id
WHERE        (Emprunt.EMP_DateRetour IS NULL)
GROUP BY Exemplaire.EXE_Code, Livre.LIV_Titre, Bibliotheque.BIB_Libelle, Emprunt.EMP_DateEmprunt, Livre.LIV_Image, Tarif.TAR_Emprunt, Tarif.TAR_AnneeApplication, Lecteur.LEC_Nom, Lecteur.LEC_Prenom, 
                         Emprunt.LEC_Id, Livre.LIV_ISBN, Bibliotheque.BIB_ID
HAVING        (Tarif.TAR_AnneeApplication = YEAR(Emprunt.EMP_DateEmprunt)) AND (dbo.EMP_CalculJoursRetard(Emprunt.EMP_DateEmprunt) = 0)
END









