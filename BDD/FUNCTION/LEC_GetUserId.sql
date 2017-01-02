-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Farid ID BOURHIM, Simon ENECV>
-- Create date: <27/12/2016>
-- Description:	<Fonction qui retoune l'id du user passé en parametre>
-- =============================================
CREATE FUNCTION LEC_GetUserId 
(
	-- Add the parameters for the function here
	@Username nvarchar (50)
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @UserId int

	-- Add the T-SQL statements to compute the return value here
	SELECT @UserId =  LEC_Id FROM Lecteur WHERE LEC_UserName = @Username

	-- Return the result of the function
	RETURN @UserId

END
GO

