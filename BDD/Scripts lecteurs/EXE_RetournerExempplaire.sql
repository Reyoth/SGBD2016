USE [SGBD2016_Bibliotheque]
GO
/****** Object:  StoredProcedure [adminBiblio].[EXE_RetournerExempplaire]    Script Date: 10-Jan-17 15:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [adminBiblio].[EXE_RetournerExempplaire]
	
	@ExemplaireId int,
	@montant int
	
AS
BEGIN
	
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- MISE A JOUR DE LA TABLE EMPRUNT EN METTANT A JOUR LA DATE RETOUR AVEC LA DATE D'AOUJOURD'HUI
	UPDATE Emprunt
		SET	EMP_DateRetour = GETDATE(), EMP_MontantPaye = @montant
			WHERE Emprunt.EXE_Id = @ExemplaireId AND EMP_DateRetour IS NULL
	-- MISE A JOUR DE LA TABLE EMPRUNT EN METTANT A JOUR LE CHAMPS INDISPONIBLE A FAUX OU '0'
	UPDATE Exemplaire
		SET EXE_Indisponible = 0
			WHERE Exemplaire.EXE_Id = @ExemplaireId
END








