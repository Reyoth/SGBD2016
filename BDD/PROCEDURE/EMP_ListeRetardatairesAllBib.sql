USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [dbo].[EMP_ListeRetardatairesAllBib]    Script Date: 28-12-16 11:22:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI affiche LA LISTE DES Retardataires et le montant du>
-- =============================================
CREATE PROCEDURE [dbo].[EMP_ListeRetardatairesAllBib]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT	Lecteur.LEC_Id, Lecteur.LEC_Nom, Lecteur.LEC_Prenom, (SUM(Tarif.Tar_Emprunt + dbo.EMP_CalculMontantRetard(Bibliotheque.BIB_ID, YEAR(Emprunt.EMP_DateEmprunt), DATEDIFF(DAY,Emprunt.EMP_DateEmprunt, GETDATE())))) AS Montant_Du
	FROM	Lecteur INNER JOIN
			Bibliotheque ON Lecteur.BIB_ID = Bibliotheque.BIB_ID INNER JOIN
			Emprunt ON Lecteur.LEC_Id = Emprunt.LEC_Id INNER JOIN
			Tarif ON Bibliotheque.BIB_ID = Tarif.BIB_ID
	WHERE	(Emprunt.EMP_DateRetour IS NULL)
	GROUP BY Lecteur.LEC_Id, Lecteur.LEC_Nom, Lecteur.LEC_Prenom

END
GO