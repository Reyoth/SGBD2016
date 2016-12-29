
USE [SGBD2016_Bibliotheque]
GO

/****** Object:  UserDefinedFunction [dbo].[ADM_CheckLogin]    Script Date: 29-Dec-16 13:12:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<FUNCTION QUI VERIFIE L''EXISTANCE D''UN ADMINISTRATEUR ET SON PASSWORD POUR LUI PERMETTRE L''ACCESS AU GUI LECTEUR>
-- =============================================

CREATE FUNCTION [dbo].[ADM_CheckLogin] (@UserName nvarchar(50),
	@Password nvarchar(50))
RETURNS bit
AS
BEGIN
     declare @exist bit
	 SET @exist = 0
	 
	 IF exists( SELECT  ADM_UserName, ADM_Password FROM Administrateur WHERE ADM_UserName = @UserName AND ADM_Password = @Password)
	 BEGIN
		SET @exist = 1
	 END
	 
	 RETURN @exist
END

GO


