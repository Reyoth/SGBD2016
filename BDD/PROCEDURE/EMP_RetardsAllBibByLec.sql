USE [SGBD2016_Bibliotheque]
GO
/****** Object:  StoredProcedure [lecteur].[EMP_RetardsAllBibByLec]    Script Date: 08-Jan-17 01:13:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI affiche LA LISTE DES Retardares du lecteur et le montant du>
-- =============================================
ALTER PROCEDURE [lecteur].[EMP_RetardsAllBibByLec]
	@Lec_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT	Lecteur.LEC_Id AS "ID Lecteur", Lecteur.LEC_Nom AS Nom, Lecteur.LEC_Prenom AS Prénom, dbo.EMP_CalculJoursRetard(Emprunt.EMP_DateEmprunt) AS [Nombre de jours de retard], 
			Tarif.TAR_Emprunt + dbo.EMP_CalculMontantRetard(Bibliotheque.BIB_ID, YEAR(Emprunt.EMP_DateEmprunt), dbo.EMP_CalculJoursRetard(Emprunt.EMP_DateEmprunt)) AS "Montant total du €", 
			Emprunt.EMP_Id AS [ID Emprunt], Emprunt.EMP_DateEmprunt AS [Date d'emprunt], Emprunt.EXE_Id AS [ID Exemplaire], Exemplaire.EXE_Code AS Exemplaire, Livre.LIV_Titre AS Titre, Livre.LIV_ISBN AS ISBN, 
			Bibliotheque.BIB_Code AS [Code Bibliotheque], Bibliotheque.BIB_Libelle AS Bibliotheque
	FROM	Tarif INNER JOIN
				Bibliotheque ON Tarif.BIB_ID = Bibliotheque.BIB_ID INNER JOIN
				Exemplaire ON Bibliotheque.BIB_ID = Exemplaire.BIB_ID INNER JOIN
				Lecteur INNER JOIN
				Emprunt ON Lecteur.LEC_Id = Emprunt.LEC_Id ON Exemplaire.EXE_Id = Emprunt.EXE_Id INNER JOIN
				Livre ON Exemplaire.LIV_Id = Livre.LIV_Id
	WHERE        (Emprunt.EMP_DateRetour IS NULL) 
				AND (dbo.EMP_CalculJoursRetard(Emprunt.EMP_DateEmprunt) > 0)
				AND (Tarif.TAR_AnneeApplication = YEAR(Emprunt.EMP_DateEmprunt))
				AND (Lecteur.LEC_Id = @Lec_id)

END



