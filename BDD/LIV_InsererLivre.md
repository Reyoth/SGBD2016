USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [dbo].[LIV_InsererLivre]    Script Date: 27-12-16 15:55:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LIV_InsererLivre]
	@ISBN varchar(10),
	@Titre nvarchar(50),
	@Image varbinary(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Livre (LIV_ISBN, LIV_Titre, LIV_Image) VALUES (@ISBN, @Titre, @Image)
END

GO





