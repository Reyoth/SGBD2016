USE [SGBD2016_Bibliotheque]
GO
/****** Object:  UserDefinedFunction [dbo].[EMP_CalculJoursRetard]    Script Date: 08-Jan-17 00:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<FUNCTION QUI RETOURNE le nombre de jours de retard>
-- =============================================

ALTER FUNCTION [dbo].[EMP_CalculJoursRetard] (@DateEmprunt datetime)
RETURNS int
AS
BEGIN
	DECLARE @jours int

	SET @jours = (DATEDIFF(DAY,@DateEmprunt,GETDATE()) - 10)

	IF (@jours <=0)
	BEGIN
		SET @jours = 0
	END


	RETURN (@jours)

END



