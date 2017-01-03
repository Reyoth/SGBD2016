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
-- Author:		<Farid ID BOURHIM, Simon ENECV>
-- Create date: <24/12/2016>
-- Description:	<Procedure qui affiche (remet) l'Id du lecteur connecté>
-- =============================================
CREATE PROCEDURE LEC_GetUserId
	-- Add the parameters for the stored procedure here
	@Username varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT LEC_Id FROM Lecteur WHERE LEC_UserName = @Username
END
GO
