USE [SGBD2016_Bibliotheque]
GO

/****** Object:  Trigger [dbo].[TR_NoInsertExemplaireIndisponible]    Script Date: 28-12-16 13:35:08 ******/
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
	DECLARE @Disponibilité bit, @insertedExeId int
	SELECT @insertedExeId = EXE_Id FROM inserted
	SELECT @Disponibilité =  Exemplaire.EXE_Indisponible
	FROM            Emprunt INNER JOIN
                         Exemplaire ON Emprunt.EXE_Id = @insertedExeId
    IF(@Disponibilité=1)
	BEGIN	
		PRINT 'Emprunt impossible puisque l"esemplaire que vous essayez d"emprunter n"est pas disponible'
	END
	ROLLBACK
END

GO

ALTER TABLE [dbo].[Emprunt] ENABLE TRIGGER [TR_NoInsertExemplaireIndisponible]
GO


