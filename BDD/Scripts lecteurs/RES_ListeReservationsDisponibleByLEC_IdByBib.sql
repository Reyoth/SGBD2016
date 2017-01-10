USE [SGBD2016_Bibliotheque]
GO
/****** Object:  StoredProcedure [lecteur].[RES_ListeReservationsDisponibleByLEC_IdByBib]    Script Date: 10-Jan-17 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <29/12/2016>
-- Description:	<Procedure qui affiche liste des livres reservés par lecteur et donne leurs disponibilité. >
-- =============================================
ALTER PROCEDURE [lecteur].[RES_ListeReservationsDisponibleByLEC_IdByBib]
	@IdLecteur int,
	@IdBibliotheque int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT        Livre.LIV_Titre AS Titre, Exemplaire.EXE_Code, Bibliotheque.BIB_Libelle, Exemplaire.EXE_Id, Reservation.LEC_Id, Livre.LIV_Image
FROM            Reservation INNER JOIN
                         Livre ON Reservation.LIV_Id = Livre.LIV_Id INNER JOIN
                         Exemplaire ON Livre.LIV_Id = Exemplaire.LIV_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
WHERE        (Exemplaire.EXE_Indisponible = 0) AND (Reservation.LEC_Id = 2) AND (Bibliotheque.BIB_ID = 5) AND (RES_Supprimee = 0)
GROUP BY Livre.LIV_Titre, Bibliotheque.BIB_Libelle, Exemplaire.EXE_Id, Reservation.LEC_Id, Livre.LIV_Image, Exemplaire.EXE_Code
END







