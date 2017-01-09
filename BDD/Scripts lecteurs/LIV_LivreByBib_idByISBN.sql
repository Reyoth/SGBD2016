USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [lecteur].[LIV_LivreByISBN]    Script Date: 10-Jan-17 00:15:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Simon ENCEV, Farid ID BOURHIM>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI RETOURNE UN LIVRE PAR SON ISBN>
-- =============================================
CREATE PROCEDURE [lecteur].[LIV_LivreByBib_idByISBN] 
	-- Parametres
	@BibId int,
	@ISBN nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT        Livre.LIV_Id AS ID, Livre.LIV_ISBN AS ISBN, Livre.LIV_Titre AS Titre, Livre.LIV_Image AS Image, Livre.LIV_Auteurs AS Auteurs
FROM            Livre INNER JOIN
                         Exemplaire ON Livre.LIV_Id = Exemplaire.LIV_Id
GROUP BY Livre.LIV_ISBN, Livre.LIV_Titre, Livre.LIV_Image, Livre.LIV_Auteurs, Exemplaire.BIB_ID, Livre.LIV_Id
HAVING        (Livre.LIV_ISBN = @ISBN) AND (Exemplaire.BIB_ID = @BibId)
END









GO


