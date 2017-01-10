USE [SGBD2016_Bibliotheque]
GO
/****** Object:  StoredProcedure [lecteur].[RES_ListeReservationsByLEC_Id]    Script Date: 10-Jan-17 01:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Farid ID BOURHIM, Simon ENCEV>
-- Create date: <01/01/2017>
-- Description:	<Liste des reservation en cours>
-- =============================================
ALTER PROCEDURE [lecteur].[RES_ListeReservationsByLEC_Id]
	@Lec_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT        Reservation.RES_Id AS [ID Réservation], Livre.LIV_Titre AS Titre, Livre.LIV_ISBN AS ISBN, Reservation.RES_DateReservation AS [Date de réservation], Livre.LIV_Auteurs, Bibliotheque.BIB_Libelle, 
                         Livre.LIV_Image
FROM            Reservation INNER JOIN
                         Livre ON Reservation.LIV_Id = Livre.LIV_Id INNER JOIN
                         Exemplaire ON Livre.LIV_Id = Exemplaire.LIV_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
WHERE        (Reservation.RES_Supprimee =0 ) AND (Reservation.LEC_Id = @Lec_Id)
END






