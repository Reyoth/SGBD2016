USE [SGBD2016_Bibliotheque]
GO
/****** Object:  StoredProcedure [adminBiblio].[EXE_AllExemplaireByTitre]    Script Date: 08-Jan-17 12:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [adminBiblio].[EXE_AllExemplaireByTitre]
	@Titre nvarchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        Exemplaire.EXE_Id AS ID, Exemplaire.EXE_Code AS Exemplaire, Livre.LIV_Titre AS Titre, Livre.LIV_ISBN AS ISBN, Exemplaire.EXE_DateAchat AS [Date d'achat], Livre.LIV_Auteurs AS Auteurs, 
                         Bibliotheque.BIB_Code AS Exemplaire, Livre.LIV_Image AS Image
FROM            Exemplaire INNER JOIN
                         Livre ON Exemplaire.LIV_Id = Livre.LIV_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
WHERE        (Livre.LIV_Titre LIKE '%' + @Titre + '%')
END






