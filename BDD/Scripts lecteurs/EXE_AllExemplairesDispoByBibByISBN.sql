USE [SGBD2016_Bibliotheque]
GO
/****** Object:  StoredProcedure [lecteur].[EXE_AllExemplairesDispoByBibByISBN]    Script Date: 09-Jan-17 23:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [lecteur].[EXE_AllExemplairesDispoByBibByISBN]
	@Bib_Id int,
	@ISBN nvarchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        Exemplaire.EXE_Id AS [ID Exemplaire], Exemplaire.EXE_Code AS Exemplaire, Livre.LIV_Titre AS Titre, Livre.LIV_ISBN AS ISBN, Livre.LIV_Auteurs AS Auteurs, Bibliotheque.BIB_Libelle AS Bibliotheque
FROM            Exemplaire INNER JOIN
                         Livre ON Exemplaire.LIV_Id = Livre.LIV_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
WHERE        (Exemplaire.BIB_ID = @Bib_Id) AND (Livre.LIV_ISBN LIKE '%'+ @ISBN + '%')
END










