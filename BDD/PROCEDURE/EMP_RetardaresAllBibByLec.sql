USE [SGBD2016_Bibliotheque]
GO
/****** Object:  StoredProcedure [lecteur].[EMP_RetardaresAllBibByLec]    Script Date: 05-Jan-17 21:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI affiche LA LISTE DES Retardares du lecteur et le montant du>
-- =============================================
ALTER PROCEDURE [lecteur].[EMP_RetardaresAllBibByLec]
	@Lec_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT	Livre.LIV_ISBN AS ISBN, Livre.LIV_Titre AS Titre, Exemplaire.EXE_Code AS Exemplaire, Emprunt.EMP_DateEmprunt AS "Date d'emprunt",
			Tarif.TAR_Emprunt + dbo.EMP_CalculMontantRetard(Bibliotheque.BIB_ID, YEAR(Emprunt.EMP_DateEmprunt), DATEDIFF(DAY,Emprunt.EMP_DateEmprunt, GETDATE())) AS "Montant Du €",
			Bibliotheque.BIB_Libelle AS Bibliotheque
	FROM	Tarif INNER JOIN
			Bibliotheque ON Tarif.BIB_ID = Bibliotheque.BIB_ID INNER JOIN
			Exemplaire ON Bibliotheque.BIB_ID = Exemplaire.BIB_ID INNER JOIN
			Emprunt ON Exemplaire.EXE_Id = Emprunt.EXE_Id INNER JOIN
			Livre ON Exemplaire.LIV_Id = Livre.LIV_Id
	WHERE	(Emprunt.EMP_DateRetour IS NULL) AND (Emprunt.LEC_Id = @Lec_id) AND (Tarif.TAR_AnneeApplication=YEAR(Emprunt.EMP_DateEmprunt))

END



