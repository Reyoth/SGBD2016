USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [adminBiblio].[EMP_NbRetardByLEC_ID]    Script Date: 08-Jan-17 00:52:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI affiche LA LISTE DES Retardataires et le montant du>
-- =============================================
CREATE PROCEDURE [adminBiblio].[EMP_NbRetardByLEC_ID]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Lec_Id int

   SELECT        COUNT(Lecteur.LEC_Id) AS Expr1
FROM            Emprunt INNER JOIN
                         Lecteur ON Emprunt.LEC_Id = Lecteur.LEC_Id
WHERE        (Emprunt.EMP_DateRetour IS NULL) AND (dbo.EMP_CalculJoursRetard(Emprunt.EMP_DateEmprunt) > 0)
HAVING        (COUNT(Lecteur.LEC_Id) = @Lec_Id)
END





GO


