USE [master]
GO
/****** Object:  Database [SGBD2016_Bibliotheque]    Script Date: 30-Dec-16 13:14:14 ******/
CREATE DATABASE [SGBD2016_Bibliotheque]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SGBD2016_Bibliotheque', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SGBD2016_Bibliotheque.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SGBD2016_Bibliotheque_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SGBD2016_Bibliotheque_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SGBD2016_Bibliotheque].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET ARITHABORT OFF 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET RECOVERY FULL 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET  MULTI_USER 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SGBD2016_Bibliotheque', N'ON'
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET QUERY_STORE = OFF
GO
USE [SGBD2016_Bibliotheque]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SGBD2016_Bibliotheque]
GO
/****** Object:  UserDefinedFunction [dbo].[ADM_CheckLogin]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<FUNCTION QUI VERIFIE L''EXISTANCE D''UN ADMINISTRATEUR ET SON PASSWORD POUR LUI PERMETTRE L''ACCESS AU GUI LECTEUR>
-- =============================================

CREATE FUNCTION [dbo].[ADM_CheckLogin] (@UserName nvarchar(50),
	@Password nvarchar(50))
RETURNS bit
AS
BEGIN
     declare @exist bit
	 SET @exist = 0
	 
	 IF exists( SELECT  ADM_UserName, ADM_Password FROM Administrateur WHERE ADM_UserName = @UserName AND ADM_Password = @Password)
	 BEGIN
		SET @exist = 1
	 END
	 
	 RETURN @exist
END


GO
/****** Object:  UserDefinedFunction [dbo].[EMP_CalculMontantRetard]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<FUNCTION QUI RETOURNE le montant du retard>
-- =============================================

CREATE FUNCTION [dbo].[EMP_CalculMontantRetard] (@Id_Bib int, @Annee int, @JourDeRetard int)
RETURNS decimal
AS
BEGIN
	DECLARE @Tarif decimal
	If (@JourDeRetard < 0)
	BEGIN
		set @JourDeRetard = 0
	END

	SELECT	@Tarif = TAR_Retard
	FROM	Tarif INNER JOIN
			Bibliotheque ON Tarif.BIB_ID = Bibliotheque.BIB_ID
	WHERE	(Bibliotheque.BIB_ID = @Id_Bib) AND (Tarif.TAR_AnneeApplication = @Annee)

	RETURN(
		SELECT	(@Tarif * @JourDeRetard) AS TotalMontant
		FROM	Bibliotheque INNER JOIN
				Tarif ON Bibliotheque.BIB_ID = Tarif.BIB_ID
		GROUP BY Bibliotheque.BIB_ID, Tarif.TAR_AnneeApplication
		HAVING	(Bibliotheque.BIB_ID = @Id_Bib) AND (Tarif.TAR_AnneeApplication = @Annee)
		)
END

GO
/****** Object:  UserDefinedFunction [dbo].[LEC_CheckLogin]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<FUNCTION QUI VERIFIE L''EXISTANCE D''UN LECETEUR ET SON PASSWORD POUR LUI PERMETTRE L''ACCESS AU GUI LECTEUR>
-- =============================================

CREATE FUNCTION [dbo].[LEC_CheckLogin] (@UserName nvarchar(50),
	@Password nvarchar(50))
RETURNS bit
AS
BEGIN
     declare @exist bit
	 SET @exist = 0
	 
	 IF exists( SELECT  LEC_UserName, LEC_Password FROM Lecteur WHERE LEC_UserName = @UserName AND LEC_Password = @Password)
	 BEGIN
		SET @exist = 1
	 END

	 RETURN @exist
END


GO
/****** Object:  Table [dbo].[Administrateuf]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrateuf](
	[ADM_Id] [int] IDENTITY(1,1) NOT NULL,
	[ADM_UserName] [varchar](50) NOT NULL,
	[ADM_Password] [varchar](50) NOT NULL,
 CONSTRAINT [prk_constraint_Administrateuf] PRIMARY KEY NONCLUSTERED 
(
	[ADM_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ADM_UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Auteur]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auteur](
	[AUT_Id] [int] IDENTITY(1,1) NOT NULL,
	[AUT_Nom] [varchar](25) NOT NULL,
	[AUT_Prenom] [varchar](25) NOT NULL,
	[AUT_DateDeNaissance] [datetime] NOT NULL,
 CONSTRAINT [prk_constraint_Auteur] PRIMARY KEY NONCLUSTERED 
(
	[AUT_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[AUT_Prenom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[AUT_Nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bibliotheque]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bibliotheque](
	[BIB_ID] [int] IDENTITY(1,1) NOT NULL,
	[BIB_Code] [varchar](25) NOT NULL,
	[BIB_Libelle] [varchar](25) NOT NULL,
	[BIB_Adresse] [varchar](250) NULL,
	[BIB_Ville] [varchar](25) NOT NULL,
	[BIB_CodePostal] [int] NOT NULL,
 CONSTRAINT [prk_constraint_Bibliotheque] PRIMARY KEY NONCLUSTERED 
(
	[BIB_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[BIB_Libelle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[BIB_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ecrire]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ecrire](
	[LIV_Id] [int] NOT NULL,
	[AUT_Id] [int] NOT NULL,
 CONSTRAINT [prk_constraint_Ecrire] PRIMARY KEY NONCLUSTERED 
(
	[LIV_Id] ASC,
	[AUT_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Emprunt]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emprunt](
	[EMP_Id] [int] IDENTITY(1,1) NOT NULL,
	[EMP_DateEmprunt] [datetime] NOT NULL,
	[EMP_DateRetour] [datetime] NOT NULL,
	[EMP_MontantPaye] [decimal](25, 0) NULL,
	[EXE_Id] [int] NOT NULL,
	[LEC_Id] [int] NOT NULL,
 CONSTRAINT [prk_constraint_Emprunt] PRIMARY KEY NONCLUSTERED 
(
	[EMP_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exemplaire]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exemplaire](
	[EXE_Id] [int] IDENTITY(1,1) NOT NULL,
	[EXE_Code] [varchar](20) NOT NULL,
	[EXE_DateAchat] [varchar](25) NOT NULL,
	[EXE_Indisponible] [bit] NULL,
	[BIB_ID] [int] NOT NULL,
	[LIV_Id] [int] NOT NULL,
 CONSTRAINT [prk_constraint_Exemplaire] PRIMARY KEY NONCLUSTERED 
(
	[EXE_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EXE_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lecteur]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecteur](
	[LEC_Id] [int] IDENTITY(1,1) NOT NULL,
	[LEC_Nom] [varchar](25) NOT NULL,
	[LEC_Prenom] [varchar](25) NOT NULL,
	[LEC_Sexe] [char](25) NOT NULL,
	[LEC_DateDeNaissance] [varchar](25) NOT NULL,
	[LEC_Adresse] [varchar](250) NULL,
	[LEC_Ville] [varchar](25) NOT NULL,
	[LEC_CodePostal] [int] NOT NULL,
	[LEC_UserName] [varchar](50) NOT NULL,
	[LEC_Password] [varchar](50) NOT NULL,
	[BIB_ID] [int] NOT NULL,
 CONSTRAINT [prk_constraint_Lecteur] PRIMARY KEY NONCLUSTERED 
(
	[LEC_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LEC_Prenom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LEC_UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LEC_Nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Livre]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Livre](
	[LIV_Id] [int] IDENTITY(1,1) NOT NULL,
	[LIV_ISBN] [varchar](50) NOT NULL,
	[LIV_Titre] [varchar](50) NOT NULL,
	[LIV_Image] [varbinary](max) NULL,
 CONSTRAINT [prk_constraint_Livre] PRIMARY KEY NONCLUSTERED 
(
	[LIV_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LIV_ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LIV_Titre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[RES_Id] [int] IDENTITY(1,1) NOT NULL,
	[RES_DateReservation] [datetime] NOT NULL,
	[RES_Supprimee] [bit] NULL,
	[LEC_Id] [int] NOT NULL,
	[LIV_Id] [int] NOT NULL,
 CONSTRAINT [prk_constraint_Reservation] PRIMARY KEY NONCLUSTERED 
(
	[RES_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tarif]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarif](
	[TAR_Id] [int] IDENTITY(1,1) NOT NULL,
	[TAR_AnneeApplication] [int] NOT NULL,
	[TAR_Retard] [decimal](25, 0) NOT NULL,
	[TAR_Emprunt] [decimal](25, 0) NOT NULL,
	[BIB_ID] [int] NOT NULL,
 CONSTRAINT [prk_constraint_Tarif] PRIMARY KEY NONCLUSTERED 
(
	[TAR_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Ecrire]  WITH CHECK ADD  CONSTRAINT [FK_Ecrire_AUT_Id] FOREIGN KEY([AUT_Id])
REFERENCES [dbo].[Auteur] ([AUT_Id])
GO
ALTER TABLE [dbo].[Ecrire] CHECK CONSTRAINT [FK_Ecrire_AUT_Id]
GO
ALTER TABLE [dbo].[Ecrire]  WITH CHECK ADD  CONSTRAINT [FK_Ecrire_LIV_Id] FOREIGN KEY([LIV_Id])
REFERENCES [dbo].[Livre] ([LIV_Id])
GO
ALTER TABLE [dbo].[Ecrire] CHECK CONSTRAINT [FK_Ecrire_LIV_Id]
GO
ALTER TABLE [dbo].[Emprunt]  WITH CHECK ADD  CONSTRAINT [FK_Emprunt_EXE_Id] FOREIGN KEY([EXE_Id])
REFERENCES [dbo].[Exemplaire] ([EXE_Id])
GO
ALTER TABLE [dbo].[Emprunt] CHECK CONSTRAINT [FK_Emprunt_EXE_Id]
GO
ALTER TABLE [dbo].[Emprunt]  WITH CHECK ADD  CONSTRAINT [FK_Emprunt_LEC_Id] FOREIGN KEY([LEC_Id])
REFERENCES [dbo].[Lecteur] ([LEC_Id])
GO
ALTER TABLE [dbo].[Emprunt] CHECK CONSTRAINT [FK_Emprunt_LEC_Id]
GO
ALTER TABLE [dbo].[Exemplaire]  WITH CHECK ADD  CONSTRAINT [FK_Exemplaire_BIB_ID] FOREIGN KEY([BIB_ID])
REFERENCES [dbo].[Bibliotheque] ([BIB_ID])
GO
ALTER TABLE [dbo].[Exemplaire] CHECK CONSTRAINT [FK_Exemplaire_BIB_ID]
GO
ALTER TABLE [dbo].[Exemplaire]  WITH CHECK ADD  CONSTRAINT [FK_Exemplaire_LIV_Id] FOREIGN KEY([LIV_Id])
REFERENCES [dbo].[Livre] ([LIV_Id])
GO
ALTER TABLE [dbo].[Exemplaire] CHECK CONSTRAINT [FK_Exemplaire_LIV_Id]
GO
ALTER TABLE [dbo].[Lecteur]  WITH CHECK ADD  CONSTRAINT [FK_Lecteur_BIB_ID] FOREIGN KEY([BIB_ID])
REFERENCES [dbo].[Bibliotheque] ([BIB_ID])
GO
ALTER TABLE [dbo].[Lecteur] CHECK CONSTRAINT [FK_Lecteur_BIB_ID]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_LEC_Id] FOREIGN KEY([LEC_Id])
REFERENCES [dbo].[Lecteur] ([LEC_Id])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_LEC_Id]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_LIV_Id] FOREIGN KEY([LIV_Id])
REFERENCES [dbo].[Livre] ([LIV_Id])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_LIV_Id]
GO
ALTER TABLE [dbo].[Tarif]  WITH CHECK ADD  CONSTRAINT [FK_Tarif_BIB_ID] FOREIGN KEY([BIB_ID])
REFERENCES [dbo].[Bibliotheque] ([BIB_ID])
GO
ALTER TABLE [dbo].[Tarif] CHECK CONSTRAINT [FK_Tarif_BIB_ID]
GO
/****** Object:  StoredProcedure [dbo].[EMP_AllEmpruntsAllBib]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EMP_AllEmpruntsAllBib]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        Emprunt.EMP_Id, Emprunt.EMP_DateEmprunt, Emprunt.EMP_DateRetour, Emprunt.EMP_MontantPaye, Bibliotheque.BIB_Libelle
FROM            Emprunt INNER JOIN
                         Exemplaire ON Emprunt.EXE_Id = Exemplaire.EXE_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
END


GO
/****** Object:  StoredProcedure [dbo].[EMP_AllEmpruntsByBIB_Id]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EMP_AllEmpruntsByBIB_Id]
	@Bib_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        Emprunt.EMP_Id, Emprunt.EMP_DateEmprunt, Emprunt.EMP_DateRetour, Emprunt.EMP_MontantPaye, Bibliotheque.BIB_Libelle
		FROM            Emprunt INNER JOIN
                         Exemplaire ON Emprunt.EXE_Id = Exemplaire.EXE_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
		WHERE Exemplaire.BIB_ID = @Bib_Id
END


GO
/****** Object:  StoredProcedure [dbo].[EMP_AllEmpruntsByLEC_Id]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI RETOURNE LA LISTE DES EMPRUNTS PAR RAPPORTS A UN LECTEUR>
-- =============================================
CREATE PROCEDURE [dbo].[EMP_AllEmpruntsByLEC_Id]
	--Parametres
	@Lec_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT        Emprunt.EMP_Id, Exemplaire.EXE_Code, Livre.LIV_Titre, Bibliotheque.BIB_Libelle, Lecteur.LEC_Nom, Lecteur.LEC_Prenom, Emprunt.EMP_DateEmprunt, Emprunt.EMP_MontantPaye
	FROM            Emprunt INNER JOIN
                         Exemplaire ON Emprunt.EXE_Id = Exemplaire.EXE_Id INNER JOIN
                         Lecteur ON Emprunt.LEC_Id = Lecteur.LEC_Id INNER JOIN
                         Livre ON Exemplaire.LIV_Id = Livre.LIV_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID AND Lecteur.BIB_ID = Bibliotheque.BIB_ID
	WHERE Lecteur.LEC_Id = @Lec_Id
END


GO
/****** Object:  StoredProcedure [dbo].[EMP_ListeRetardatairesAllBib]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI affiche LA LISTE DES Retardataires et le montant du>
-- =============================================
CREATE PROCEDURE [dbo].[EMP_ListeRetardatairesAllBib]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT	Lecteur.LEC_Id, Lecteur.LEC_Nom, Lecteur.LEC_Prenom, (SUM(Tarif.Tar_Emprunt + dbo.EMP_CalculMontantRetard(Bibliotheque.BIB_ID, YEAR(Emprunt.EMP_DateEmprunt), DATEDIFF(DAY,Emprunt.EMP_DateEmprunt, GETDATE())))) AS Montant_Du
	FROM	Lecteur INNER JOIN
			Bibliotheque ON Lecteur.BIB_ID = Bibliotheque.BIB_ID INNER JOIN
			Emprunt ON Lecteur.LEC_Id = Emprunt.LEC_Id INNER JOIN
			Tarif ON Bibliotheque.BIB_ID = Tarif.BIB_ID
	WHERE	(Emprunt.EMP_DateRetour IS NULL)
	GROUP BY Lecteur.LEC_Id, Lecteur.LEC_Nom, Lecteur.LEC_Prenom

END

GO
/****** Object:  StoredProcedure [dbo].[EXE_AllExemplaireBIB_Id]    Script Date: 30-Dec-16 13:14:14 ******/
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
/****** Object:  StoredProcedure [dbo].[EXE_AllExemplaireByLIV_Id]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EXE_AllExemplaireByLIV_Id]
	@Liv_Id int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Exemplaire WHERE LIV_Id = @Liv_Id
END


GO
/****** Object:  StoredProcedure [dbo].[EXE_CreerExemplaire]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 CREATE PROCEDURE [dbo].[EXE_CreerExemplaire]
	@Code varchar (50),
	@DateAchat Date,
	@Indisponible bit,
	@Bib_Id int,
	@Liv_Id int
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Exemplaire (EXE_Code, EXE_DateAchat, EXE_Indisponible, BIB_ID, LIV_Id)	VALUES (@Code, @DateAchat, @Indisponible, @Bib_Id, @Liv_Id)
END


GO
/****** Object:  StoredProcedure [dbo].[EXE_EmprunterExemplaire]    Script Date: 30-Dec-16 13:14:14 ******/
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
				RAISERROR ('L"exemplaire que vous essayez d"emprunter est actuellement indisponible',15,0)
			END
		ELSE
			BEGIN
				INSERT INTO Emprunt (EMP_DateEmprunt, EXE_Id, LEC_Id) VALUES (GETDATE(), @Exe_Id, @Lec_Id)	
				

				IF exists(
				--recherche des reservations par id lecteur et id livre et les supprime si elles existent
				SELECT	Reservation.RES_Id
				FROM	Lecteur INNER JOIN
                         Reservation ON Lecteur.LEC_Id = Reservation.LEC_Id INNER JOIN
                         Livre ON Reservation.LIV_Id = Livre.LIV_Id
				WHERE	(Lecteur.LEC_Id = @Lec_Id) AND (Livre.LIV_Id = (SELECT	Livre.LIV_Id
																		FROM	Livre INNER JOIN
																				Exemplaire ON Livre.LIV_Id = Exemplaire.LIV_Id
																		WHERE	(Exemplaire.EXE_Id = @Exe_Id)
																		)
														)
							)
				BEGIN
					UPDATE Reservation set RES_Supprimee = 1 where RES_Id in (	SELECT	Reservation.RES_Id
																				FROM	Lecteur INNER JOIN
																						 Reservation ON Lecteur.LEC_Id = Reservation.LEC_Id INNER JOIN
																						 Livre ON Reservation.LIV_Id = Livre.LIV_Id
																				WHERE	(Lecteur.LEC_Id = @Lec_Id) AND (Livre.LIV_Id = (SELECT	Livre.LIV_Id
																																		FROM	Livre INNER JOIN
																																				Exemplaire ON Livre.LIV_Id = Exemplaire.LIV_Id
																																		WHERE	(Exemplaire.EXE_Id = @Exe_Id)
																																		)
																														)
																			)
				END

			END

END


GO
/****** Object:  StoredProcedure [dbo].[EXE_RetournerExempplaire]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EXE_RetournerExempplaire]
	
	@ExemplaireId int
	
AS
BEGIN
	
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- MISE A JOUR DE LA TABLE EMPRUNT EN METTANT A JOUR LA DATE RETOUR AVEC LA DATE D'AOUJOURD'HUI
	UPDATE Emprunt
		SET	EMP_DateRetour = GETDATE()
			WHERE Emprunt.EXE_Id = @ExemplaireId
	-- MISE A JOUR DE LA TABLE EMPRUNT EN METTANT A JOUR LE CHAMPS INDISPONIBLE A FAUX OU '0'
	UPDATE Exemplaire
		SET EXE_Indisponible = 0
			WHERE Exemplaire.EXE_Id = @ExemplaireId
END


GO
/****** Object:  StoredProcedure [dbo].[LIV_LivreByISBN]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Simon ENCEV, Farid ID BOURHIM>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI RETOURNE UN LIVRE PAR SON ISBN>
-- =============================================
CREATE PROCEDURE [dbo].[LIV_LivreByISBN] 
	-- Parametres
	@ISBN nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT * FROM Livre WHERE LIV_ISBN = @ISBN
END


GO
/****** Object:  StoredProcedure [dbo].[LIV_LivreByTitle]    Script Date: 30-Dec-16 13:14:14 ******/
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
/****** Object:  StoredProcedure [dbo].[RES_ListeReservationsByLEC_Id]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RES_ListeReservationsByLEC_Id]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT        Reservation.RES_Id, Livre.LIV_Titre, Reservation.RES_DateReservation, Lecteur.LEC_Nom, Lecteur.LEC_Prenom
FROM            Reservation INNER JOIN
                         Livre ON Reservation.LIV_Id = Livre.LIV_Id INNER JOIN
                         Lecteur ON Reservation.LEC_Id = Lecteur.LEC_Id
END


GO
/****** Object:  StoredProcedure [dbo].[RES_ListeReservationsDisponibleByLEC_Id]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <29/12/2016>
-- Description:	<Procedure qui affiche liste des livres reservés par lecteur et donne leurs disponibilité. >
-- =============================================
CREATE PROCEDURE [dbo].[RES_ListeReservationsDisponibleByLEC_Id]
	@IdLecteur int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT        Reservation.RES_Id, Livre.LIV_Titre, Reservation.RES_DateReservation, Lecteur.LEC_Nom, Lecteur.LEC_Prenom, COUNT(Exemplaire.EXE_Indisponible) AS NombreExemplaireDisponible
FROM            Reservation INNER JOIN
                         Livre ON Reservation.LIV_Id = Livre.LIV_Id INNER JOIN
                         Lecteur ON Reservation.LEC_Id = Lecteur.LEC_Id INNER JOIN
                         Exemplaire ON Livre.LIV_Id = Exemplaire.LIV_Id
GROUP BY Reservation.RES_Id, Livre.LIV_Titre, Reservation.RES_DateReservation, Lecteur.LEC_Nom, Lecteur.LEC_Prenom, Lecteur.LEC_Id
HAVING        (COUNT(Exemplaire.EXE_Indisponible) = 0) AND (Lecteur.LEC_Id = @IdLecteur)
END


GO
/****** Object:  StoredProcedure [dbo].[RES_ReserverLivre]    Script Date: 30-Dec-16 13:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Farid ID BOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE POUR RESERVER UN LIVRE>
-- =============================================
CREATE PROCEDURE [dbo].[RES_ReserverLivre]
	-- Parametres
	@Liv_Id int,
	@Lec_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF EXISTS (SELECT EXE_Id FROM Exemplaire WHERE LIV_Id = @Liv_Id AND EXE_Indisponible = 0)
		BEGIN
			PRINT 'Le Livre que vous essqyez de reserver est actuellement disponible à l"emprunt si vous voulez l"emprunter maintenant...'
		END
	
	INSERT INTO Reservation (RES_DateReservation, RES_Supprimee, LEC_Id, LIV_Id) VALUES (GETDATE(), 0, @Lec_Id, @Liv_Id)
		

END


GO
USE [master]
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET  READ_WRITE 
GO
