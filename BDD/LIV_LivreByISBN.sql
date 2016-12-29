USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [dbo].[LIV_LivreByISBN]    Script Date: 28-12-16 10:55:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Simon ENCEV, Farid ID BOURHIM>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI RETOURNE UN LIVRE PAR SON ISBN>
-- =============================================
CREATE PROCEDURE [dbo].[LIV_LivreByISBN] 
	-- Parametres
	@ISBN nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT * FROM Livre WHERE LIV_ISBN = @ISBN
END

GO


