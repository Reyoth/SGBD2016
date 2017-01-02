USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [dbo].[EMP_AllEmpruntsAllBib]    Script Date: 01-01-17 12:40:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Farid IDBOURHIM, Simon SENCEV>
-- Create date: <01/01/2017>
-- Description:	<Liste des empruntes en cours>
-- =============================================
CREATE PROCEDURE [dbo].[EMP_AllEmpruntsEnCours]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	    SELECT        Emprunt.EMP_Id, Emprunt.EMP_DateEmprunt, Exemplaire.EXE_Code, Livre.LIV_Titre, Bibliotheque.BIB_Libelle, Lecteur.LEC_Id, Lecteur.LEC_Nom, Lecteur.LEC_Prenom
FROM            Emprunt INNER JOIN
                         Exemplaire ON Emprunt.EXE_Id = Exemplaire.EXE_Id INNER JOIN
                         Livre ON Exemplaire.LIV_Id = Livre.LIV_Id INNER JOIN
                         Lecteur ON Emprunt.LEC_Id = Lecteur.LEC_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID AND Lecteur.BIB_ID = Bibliotheque.BIB_ID
WHERE        (Emprunt.EMP_DateRetour IS NULL)
END



GO


