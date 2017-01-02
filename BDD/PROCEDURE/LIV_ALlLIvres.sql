-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Simon ENCEV, Farid ID BOURHIM>
-- Create date: <01/01/2017>
-- Description:	<Liste des livres pour l'administrateur>
-- =============================================
CREATE PROCEDURE LIV_AllLivres	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        Livre.LIV_Id, Livre.LIV_ISBN, Livre.LIV_Titre, Auteur.AUT_Id, Auteur.AUT_Nom, Auteur.AUT_Prenom
FROM            Livre INNER JOIN
                         Ecrire ON Livre.LIV_Id = Ecrire.LIV_Id INNER JOIN
                         Auteur ON Ecrire.AUT_Id = Auteur.AUT_Id
END
GO
