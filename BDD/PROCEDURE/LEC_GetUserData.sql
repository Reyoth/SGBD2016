USE [SGBD2016_Bibliotheque]
GO
/****** Object:  StoredProcedure [dbo].[LEC_GetUserData]    Script Date: 03-01-17 13:02:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Simon ENCEV, Farid ID BOURHIM>
-- Create date: <25/12/2016>
-- Description:	<Procedures pour afficher les details du lecteur connecté pour un eventuel traiement >
-- =============================================
ALTER PROCEDURE [dbo].[LEC_GetUserData]
	-- Add the parameters for the stored procedure here
	@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  * FROM Lecteur WHERE LEC_Id = @UserId
END
