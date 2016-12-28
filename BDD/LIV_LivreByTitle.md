USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [dbo].[LIV_LivreByTitle]    Script Date: 28-12-16 10:58:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Simon ENCEV, Farid ID BOURHIM>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI RETOURNE UN LIVRE A PARTIR DE SON Titre>
-- =============================================
CREATE PROCEDURE [dbo].[LIV_LivreByTitle]
	-- Parametres
	@Liv_Title nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Livre WHERE LIV_Titre = @Liv_Title
END

GO