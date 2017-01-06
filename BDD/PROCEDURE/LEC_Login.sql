USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [lecteur].[LEC_Login]    Script Date: 06-Jan-17 15:09:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<FUNCTION QUI VERIFIE L''EXISTANCE D''UN ADMINISTRATEUR ET SON PASSWORD POUR LUI PERMETTRE L''ACCESS AU GUI LECTEUR>
-- =============================================

CREATE PROCEDURE [lecteur].[LEC_Login]
	@UserName nvarchar(50),
	@Password nvarchar(50)
AS
BEGIN
	 
	 IF ( dbo.LEC_CheckLogin(@UserName,@Password )=1)
	 BEGIN
		SELECT  LEC_Id, LEC_UserName FROM Lecteur WHERE LEC_UserName = @UserName AND LEC_Password = @Password
	 END
	 ELSE
	 BEGIN
		RAISERROR('Login ou password incorrect',15,0)
	 END
	 
END






GO


