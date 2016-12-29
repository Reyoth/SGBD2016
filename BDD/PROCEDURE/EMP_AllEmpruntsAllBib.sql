USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [dbo].[EMP_AllEmpruntsAllBib]    Script Date: 27-12-16 15:51:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EMP_AllEmpruntsAllBib]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        Emprunt.EMP_Id, Emprunt.EMP_DateEmprunt, Emprunt.EMP_DateRetour, Emprunt.EMP_Montant, Bibliotheque.BIB_Libelle
FROM            Emprunt INNER JOIN
                         Exemplaire ON Emprunt.EXE_Id = Exemplaire.EXE_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
END

GO
