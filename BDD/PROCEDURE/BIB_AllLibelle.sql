-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Simon ENCEV, Farid ID BOURHIM>
-- Create date: <01/01/2017>
-- Description:	<Affichage des libelles des bibliotheque pour le login et le changement de boibliotheque>
-- =============================================
CREATE PROCEDURE BIB_AllLibelle
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        BIB_Libelle
	FROM            Bibliotheque
END
GO
