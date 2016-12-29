USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [dbo].[RES_ListeReservationsByLEC_Id]    Script Date: 27-12-16 21:17:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RES_ListeReservationsByLEC_Id]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT        Reservation.RES_Id, Livre.LIV_Titre, Reservation.RES_DateReservation, Lecteur.LEC_Nom, Lecteur.LEC_Prenom
FROM            Reservation INNER JOIN
                         Livre ON Reservation.LIV_Id = Livre.LIV_Id INNER JOIN
                         Lecteur ON Reservation.LEC_Id = Lecteur.LEC_Id
END

GO


