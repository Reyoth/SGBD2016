USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [dbo].[RES_ListeReservationsByLEC_Id]    Script Date: 29-12-16 15:17:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <29/12/2016>
-- Description:	<Procedure qui affiche liste des livres reservés par lecteur et donne leurs disponibilité. >
-- =============================================
CREATE PROCEDURE [dbo].[RES_ListeReservationsDisponibleByLEC_Id]
	@IdLecteur int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT        Reservation.RES_Id, Livre.LIV_Titre, Reservation.RES_DateReservation, Lecteur.LEC_Nom, Lecteur.LEC_Prenom, COUNT(Exemplaire.EXE_Indisponible) AS NombreExemplaireDisponible
FROM            Reservation INNER JOIN
                         Livre ON Reservation.LIV_Id = Livre.LIV_Id INNER JOIN
                         Lecteur ON Reservation.LEC_Id = Lecteur.LEC_Id INNER JOIN
                         Exemplaire ON Livre.LIV_Id = Exemplaire.LIV_Id
GROUP BY Reservation.RES_Id, Livre.LIV_Titre, Reservation.RES_DateReservation, Lecteur.LEC_Nom, Lecteur.LEC_Prenom, Lecteur.LEC_Id
HAVING        (COUNT(Exemplaire.EXE_Indisponible) = 0) AND (Lecteur.LEC_Id = @IdLecteur)
END

GO


