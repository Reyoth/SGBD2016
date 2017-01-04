USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [dbo].[EXE_CreerExemplaire]    Script Date: 04-Jan-17 11:26:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Simon ENCEV, Farid ID BOURHIM>
-- Create date: <04/01/2017>
-- Description:	<procedure d'intertion de livre>
-- =============================================
 CREATE PROCEDURE [adminBiblio].[LIV_AjoutLivre]
	@ISBN varchar (50),
	@titre varchar (50),
	@image nvarchar (max)	
	
AS
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
		

		IF exists (SELECT LIV_ISBN FROM Livre WHERE LIV_ISBN = @ISBN)
		BEGIN
			RAISERROR ('Ce livre existe déjà dans la DB',15,0)
		END
		ELSE
		BEGIN
			INSERT INTO Livre(LIV_ISBN, LIV_Titre, LIV_Image)	VALUES (@ISBN, @titre, @image)
		END
	END
GO


