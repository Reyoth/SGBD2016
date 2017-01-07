USE [SGBD2016_Bibliotheque]
GO

/****** Object:  Trigger [dbo].[TR_MaxEmprunt]    Script Date: 07-Jan-17 13:57:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Farid ID BOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<TRIGGER QUI EMPECHE L'INSERTION D'UN EMPRUNT DONT L'EXEMPLAIRE N'EST PAS DISPONIBLE>
-- =============================================
CREATE TRIGGER [dbo].[TR_MaxRetard]
   ON [dbo].[Emprunt]
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Lec_Id int

	--recup de l'id du lecteur qui fait l'emprunt ainsi que l'id du livre
	select @Lec_Id = LEC_Id FROM inserted

	--recherche si il y a plus de 2 exemplaires de retard pour ce lecteur
	IF((SELECT        COUNT(EMP_Id) AS [Nombre Emprunt]
		FROM            Emprunt
		WHERE        (DATEDIFF(DAY, GETDATE(), EMP_DateEmprunt) > 10)
		GROUP BY EMP_DateRetour, LEC_Id
		HAVING        (EMP_DateRetour IS NULL) AND (LEC_Id = @Lec_Id)) >= 2)

	BEGIN
		RAISERROR('Vous ne pouvez pas emprunter de livre tant que vous n''avez pas reglé vos retards',15,0)
		ROLLBACK
	END

END

GO

ALTER TABLE [dbo].[Emprunt] ENABLE TRIGGER [TR_MaxEmprunt]
GO


