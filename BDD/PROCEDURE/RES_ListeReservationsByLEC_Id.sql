USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [dbo].[RES_ListeReservationsByLEC_Id]    Script Date: 01-01-17 12:48:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Farid ID BOURHIM, Simon ENCEV>
-- Create date: <01/01/2017>
-- Description:	<Liste des reservation en cours>
-- =============================================
ALTER PROCEDURE [dbo].[RES_ListeReservationsByLEC_Id]
	@Lec_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT        Reservation.RES_Id, Livre.LIV_Titre, Reservation.RES_DateReservation, Lecteur.LEC_Nom, Lecteur.LEC_Prenom
FROM            Reservation INNER JOIN
                         Livre ON Reservation.LIV_Id = Livre.LIV_Id INNER JOIN
                         Lecteur ON Reservation.LEC_Id = @Lec_Id


END
GO

