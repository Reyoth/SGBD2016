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
-- Description:	<FUNCTION QUI RETOURNE le montant du retard>
-- =============================================

CREATE FUNCTION [dbo].[EMP_CalculMontantRetard] (@Id_Bib int, @Annee int, @JourDeRetard int)
RETURNS decimal
AS
BEGIN
	DECLARE @Tarif decimal
	If (@JourDeRetard < 0)
	BEGIN
		set @JourDeRetard = 0
	END

	SELECT	@Tarif = TAR_Retard
	FROM	Tarif INNER JOIN
			Bibliotheque ON Tarif.BIB_ID = Bibliotheque.BIB_ID
	WHERE	(Bibliotheque.BIB_ID = @Id_Bib) AND (Tarif.TAR_AnneeApplication = @Annee)

	RETURN(
		SELECT	(@Tarif * @JourDeRetard) AS TotalMontant
		FROM	Bibliotheque INNER JOIN
				Tarif ON Bibliotheque.BIB_ID = Tarif.BIB_ID
		GROUP BY Bibliotheque.BIB_ID, Tarif.TAR_AnneeApplication
		HAVING	(Bibliotheque.BIB_ID = @Id_Bib) AND (Tarif.TAR_AnneeApplication = @Annee)
		)
END
GO