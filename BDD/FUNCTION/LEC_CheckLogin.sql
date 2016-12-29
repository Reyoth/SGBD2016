USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [dbo].[LEC_CheckLogin]    Script Date: 28-12-16 11:47:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<FUNCTION QUI VERIFIE L''EXISTANCE D''UN LECETEUR ET SON PASSWORD POUR LUI PERMETTRE L''ACCESS AU GUI LECTEUR>
-- =============================================

CREATE FUNCTION [dbo].[ADM_CheckLogin] (@UserName nvarchar(50),
	@Password nvarchar(50))
RETURNS bit
AS
BEGIN
     declare @exist bit

	 IF exists( SELECT  LEC_UserName, LEC_Password FROM Lecteur WHERE LEC_UserName = @UserName AND LEC_Password = @Password)
	 SET @exist = 1

	 ELSE
	 SET @exist = 0

	 RETURN @exist
END

GO
