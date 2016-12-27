USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [dbo].[EXE_AllExemplaireBIB_Id]    Script Date: 27-12-16 15:53:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EXE_AllExemplaireBIB_Id]
	@Bib_Id int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Exemplaire WHERE LIV_Id = @Bib_Id
END

GO
