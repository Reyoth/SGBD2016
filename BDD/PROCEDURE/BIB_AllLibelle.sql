USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [lecteur].[BIB_AllLibelle]    Script Date: 08-Jan-17 20:47:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Simon ENCEV, Farid ID BOURHIM>
-- Create date: <01/01/2017>
-- Description:	<Affichage des libelles des bibliotheque pour le login et le changement de boibliotheque>
-- =============================================
CREATE PROCEDURE [lecteur].[BIB_AllLibelle]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        BIB_ID, BIB_Libelle
	FROM            Bibliotheque
END

GO


