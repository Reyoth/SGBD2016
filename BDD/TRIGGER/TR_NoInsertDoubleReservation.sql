USE [SGBD2016_Bibliotheque]
GO

/****** Object:  Trigger [dbo].[TR_NoInsertDoubleReservation]    Script Date: 28-12-16 13:32:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<TRIGGER QUI EMPECHE L"INSERTION D"UNE DOUBLE RESERVATION POUR LE MEME LECTEUR POUR LE MEME LIVRE ET LE MEME JOUR >
-- =============================================
CREATE TRIGGER [dbo].[TR_NoInsertDoubleReservation] 
   ON  [dbo].[Reservation]
   FOR INSERT
AS 
BEGIN
	DECLARE @LectId int, @LivId int
	SELECT @LectId = LEC_Id FROM INSERTED 
	SELECT @LivId = LIV_Id FROM INSERTED

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF EXISTS(SELECT * FROM Reservation WHERE Reservation.LEC_Id = @LectId AND Reservation.LIV_Id = @LivId AND Reservation.RES_Supprimee = 0)
	BEGIN
		RAISERROR ('Action impossible, vous avez déjà reservé ce livre',15,0)
		ROLLBACK
	END
END

GO

ALTER TABLE [dbo].[Reservation] ENABLE TRIGGER [TR_NoInsertDoubleReservation]
GO