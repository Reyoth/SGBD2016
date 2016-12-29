USE [SGBD2016_Bibliotheque]
GO

/****** Object:  StoredProcedure [dbo].[RES_ReserverLivre]    Script Date: 28-12-16 10:14:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Farid ID BOURHIM, Simon ENCEV>
-- Create date: <28/12/2016,>
-- Description:	<PROCEDURE POUR EMPRUNTER UN EXEMPLAIRE>
-- =============================================
CREATE PROCEDURE [dbo].[EXE_EmprunterExemplaire] 
	-- Parametres
	@Exe_Id int, 
	@Lec_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 DECLARE @DisponibliteExemplaire bit
	 SELECT @DisponibliteExemplaire EXE_Indispobible FROM Exemplaire WHERE EXE_Id = @Exe_Id
		
		IF(@DisponibliteExemplaire = 1)
			BEGIN
				PRINT 'L"exemplaire que vous essayez d"emprunter est actuellement indisponible'
			END
		ELSE
			BEGIN
				INSERT INTO Emprunt (EMP_DateEmprunt, EXE_Id, LEC_Id) VALUES (GETDATE(), @Exe_Id, @Lec_Id)	
				
			END

END

GO


