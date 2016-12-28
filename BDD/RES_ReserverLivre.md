USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [dbo].[RES_ReserverLivre]    Script Date: 28-12-16 10:39:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Farid ID BOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE POUR RESERVER UN LIVRE>
-- =============================================
CREATE PROCEDURE [dbo].[RES_ReserverLivre]
	-- Parametres
	@Liv_Id int,
	@Lec_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF EXISTS (SELECT EXE_Id FROM Exemplaire WHERE LIV_Id = @Liv_Id AND EXE_Indisponible = 0)
		BEGIN
			PRINT 'Le Livre que vous essqyez de reserver est actuellement disponible à l"emprunt si vous voulez l"emprunter maintenant...'
		END
	
	INSERT INTO Reservation (RES_DateReservation, RES_Supprimee, LEC_Id, LIV_Id) VALUES (GETDATE(), 0, @Lec_Id, @Liv_Id)
		

END

GO



