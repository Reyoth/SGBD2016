USE [SGBD2016_Bibliotheque]
GO

/****** Object:  Trigger [dbo].[TR_NoInsertExemplaireIndisponible]    Script Date: 04-Jan-17 04:36:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Farid ID BOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<TRIGGER QUI EMPECHE L'INSERTION D'UN EMPRUNT DONT L'EXEMPLAIRE N'EST PAS DISPONIBLE>
-- =============================================
CREATE TRIGGER [dbo].[TR_NoInsertExemplaireIndisponible]
   ON [dbo].[Emprunt]
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Disponibilité bit
	
	SELECT @Disponibilité =  Exemplaire.EXE_Indisponible
	FROM   Emprunt, Exemplaire, inserted
    WHERE  Emprunt.EXE_Id = Exemplaire.EXE_Id
		AND Emprunt.EXE_Id = inserted.EXE_Id
    
	IF(@Disponibilité=1)
	BEGIN	
		RAISERROR ('Emprunt impossible, exemplaire indisponible',15,0)
	ROLLBACK
	END
	
END


GO

ALTER TABLE [dbo].[Emprunt] ENABLE TRIGGER [TR_NoInsertExemplaireIndisponible]
GO


