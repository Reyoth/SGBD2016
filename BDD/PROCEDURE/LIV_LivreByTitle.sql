USE [SGBD2016_Bibliotheque]
GO
/****** Object:  StoredProcedure [dbo].[LIV_LivreByTitle]    Script Date: 01-01-17 17:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Simon ENCEV, Farid ID BOURHIM>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI RETOURNE UN LIVRE A PARTIR DE SON Titre>
-- =============================================
ALTER PROCEDURE [dbo].[LIV_LivreByTitle]
	-- Parametres
	@Liv_Title nvarchar(50)
AS
BEGIN
   
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Livre WHERE LIV_Titre LIKE @Liv_Title
END


