USE [SGBD2016_Bibliotheque]
GO

/****** Object:  Trigger [dbo].[TR_NoInsertExemplaireIndisponible]    Script Date: 04-Jan-17 04:05:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Farid ID BOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<TRIGGER QUI EMPECHE L'INSERTION D'UN EMPRUNT DONT L'EXEMPLAIRE N'EST PAS DISPONIBLE>
-- =============================================
CREATE TRIGGER [dbo].[TR_MaxEmprunt]
   ON [dbo].[Emprunt]
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Lec_Id int
	DECLARE @Bib_Id int
	DECLARE @EmpruntBibAnnexe int
	DECLARE @EmpruntBibPrincipale int
	DECLARE @Exe_Id int
	DECLARE @Bib_IdNouvelEmprunt int

	--recup de l'id du lecteur qui fait l'emprunt ainsi que l'id du livre
	select @Lec_Id = LEC_Id, @Exe_Id = EXE_Id FROM inserted

	--recup de l'id de la bibli principale du lecteur qui emprunte
	SELECT	@Bib_Id = Bibliotheque.BIB_ID
	FROM	Bibliotheque INNER JOIN
			Lecteur ON Bibliotheque.BIB_ID = Lecteur.BIB_ID
	WHERE	(Lecteur.LEC_Id = @Lec_Id)

	--recup du Bib_id lié au nouvel emprunt
	SELECT	@Bib_IdNouvelEmprunt = Bibliotheque.BIB_ID
	FROM	Bibliotheque INNER JOIN
			Exemplaire ON Bibliotheque.BIB_ID = Exemplaire.BIB_ID
	WHERE	(Exemplaire.EXE_Id = @Exe_Id)

	
	set @EmpruntBibPrincipale =(
	SELECT	COUNT(Bibliotheque.BIB_ID) AS NbEmpruntBibPrincipale
	FROM	Emprunt INNER JOIN
			Exemplaire ON Emprunt.EXE_Id = Exemplaire.EXE_Id INNER JOIN
			Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
	WHERE	(Emprunt.EMP_DateRetour IS NULL)
	GROUP BY Emprunt.LEC_Id
	HAVING	(Emprunt.LEC_Id = @Lec_Id) AND (COUNT(Bibliotheque.BIB_ID) = @Bib_Id))


	set @EmpruntBibAnnexe =(
	SELECT	COUNT(Bibliotheque.BIB_ID) AS NbEmpruntBibPrincipale
	FROM	Emprunt INNER JOIN
			Exemplaire ON Emprunt.EXE_Id = Exemplaire.EXE_Id INNER JOIN
			Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
	WHERE	(Emprunt.EMP_DateRetour IS NULL)
	GROUP BY Emprunt.LEC_Id
	HAVING	(Emprunt.LEC_Id = @Lec_Id) AND (COUNT(Bibliotheque.BIB_ID) <> @Bib_Id))

	--Test du nombre d'emprunt
	IF(@EmpruntBibAnnexe + @EmpruntBibPrincipale >= 5 OR @EmpruntBibAnnexe >= 3 AND @Bib_IdNouvelEmprunt <> @Bib_Id)
	BEGIN
		RAISERROR('vous avez emprunté trop de livres',15,0)
		ROLLBACK
	END
END


GO

ALTER TABLE [dbo].[Emprunt] ENABLE TRIGGER [TR_NoInsertExemplaireIndisponible]
GO


