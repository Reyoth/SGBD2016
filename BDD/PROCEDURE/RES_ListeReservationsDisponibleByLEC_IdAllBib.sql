USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [lecteur].[RES_ListeReservationsDisponibleByLEC_IdAllBib]    Script Date: 06-Jan-17 15:10:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <29/12/2016>
-- Description:	<Procedure qui affiche liste des livres reservés par lecteur et donne leurs disponibilité. >
-- =============================================
CREATE PROCEDURE [lecteur].[RES_ListeReservationsDisponibleByLEC_IdAllBib]
	@IdLecteur int,
	@IdBibliotheque int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT	Reservation.RES_Id AS [ID Réservation], Livre.LIV_Titre AS Titre, Reservation.RES_DateReservation AS [Date de réservation], COUNT(Exemplaire.EXE_Indisponible) AS NombreExemplaireDisponible, 
			Bibliotheque.BIB_Libelle, Exemplaire.EXE_Id, Reservation.LEC_Id
	FROM	Reservation INNER JOIN
			Livre ON Reservation.LIV_Id = Livre.LIV_Id INNER JOIN
			Exemplaire ON Livre.LIV_Id = Exemplaire.LIV_Id INNER JOIN
			Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
	GROUP BY Reservation.RES_Id, Livre.LIV_Titre, Reservation.RES_DateReservation, Bibliotheque.BIB_Libelle, Exemplaire.EXE_Id, Reservation.LEC_Id
	HAVING	(COUNT(Exemplaire.EXE_Indisponible) = 0) AND (Reservation.LEC_Id = @IdLecteur)

END



GO


