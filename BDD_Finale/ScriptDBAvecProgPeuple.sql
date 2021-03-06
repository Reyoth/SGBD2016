USE [master]
GO
/****** Object:  Database [SGBD2016_Bibliotheque]    Script Date: 08-Jan-17 17:47:56 ******/
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
/****** Object:  User [lecteur]    Script Date: 08-Jan-17 17:47:57 ******/
CREATE USER [lecteur] FOR LOGIN [lecteur] WITH DEFAULT_SCHEMA=[lecteur]
GO
/****** Object:  User [adminBiblio]    Script Date: 08-Jan-17 17:47:57 ******/
CREATE USER [adminBiblio] FOR LOGIN [adminBiblio] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [adminBiblio]    Script Date: 08-Jan-17 17:47:57 ******/
CREATE SCHEMA [adminBiblio]
GO
/****** Object:  Schema [lecteur]    Script Date: 08-Jan-17 17:47:57 ******/
CREATE SCHEMA [lecteur]
GO
/****** Object:  UserDefinedFunction [dbo].[ADM_CheckLogin]    Script Date: 08-Jan-17 17:47:57 ******/
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
/****** Object:  UserDefinedFunction [dbo].[EMP_CalculJoursRetard]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<FUNCTION QUI RETOURNE le nombre de jours de retard>
-- =============================================

CREATE FUNCTION [dbo].[EMP_CalculJoursRetard] (@DateEmprunt datetime)
RETURNS int
AS
BEGIN
	DECLARE @jours int

	SET @jours = (DATEDIFF(DAY,@DateEmprunt,GETDATE()) - 10)

	IF (@jours <=0)
	BEGIN
		SET @jours = 0
	END


	RETURN (@jours)

END





GO
/****** Object:  UserDefinedFunction [dbo].[EMP_CalculMontantRetard]    Script Date: 08-Jan-17 17:47:57 ******/
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
/****** Object:  UserDefinedFunction [dbo].[LEC_CheckLogin]    Script Date: 08-Jan-17 17:47:57 ******/
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
/****** Object:  Table [dbo].[Administrateur]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrateur](
	[ADM_Id] [int] IDENTITY(1,1) NOT NULL,
	[ADM_UserName] [nvarchar](50) NOT NULL,
	[ADM_Password] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bibliotheque]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bibliotheque](
	[BIB_ID] [int] IDENTITY(1,1) NOT NULL,
	[BIB_Code] [nvarchar](50) NOT NULL,
	[BIB_Libelle] [nvarchar](50) NOT NULL,
	[BIB_Adresse] [nvarchar](250) NULL,
	[BIB_Ville] [nvarchar](50) NOT NULL,
	[BIB_CodePostal] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Emprunt]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emprunt](
	[EMP_Id] [int] IDENTITY(1,1) NOT NULL,
	[EMP_DateEmprunt] [datetime] NOT NULL,
	[EMP_DateRetour] [datetime] NULL,
	[EMP_MontantPaye] [decimal](25, 0) NULL,
	[EXE_Id] [int] NOT NULL,
	[LEC_Id] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exemplaire]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exemplaire](
	[EXE_Id] [int] IDENTITY(1,1) NOT NULL,
	[EXE_Code] [nvarchar](50) NOT NULL,
	[EXE_DateAchat] [nvarchar](50) NOT NULL,
	[EXE_Indisponible] [bit] NULL,
	[BIB_ID] [int] NOT NULL,
	[LIV_Id] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lecteur]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecteur](
	[LEC_Id] [int] IDENTITY(1,1) NOT NULL,
	[LEC_Nom] [nvarchar](50) NOT NULL,
	[LEC_Prenom] [nvarchar](50) NOT NULL,
	[LEC_Sexe] [char](1) NOT NULL,
	[LEC_DateDeNaissance] [nvarchar](50) NOT NULL,
	[LEC_Adresse] [nvarchar](250) NULL,
	[LEC_Ville] [nvarchar](50) NOT NULL,
	[LEC_CodePostal] [int] NOT NULL,
	[LEC_UserName] [nvarchar](50) NOT NULL,
	[LEC_Password] [nvarchar](50) NOT NULL,
	[LEC_Photo] [nvarchar](max) NULL,
	[BIB_ID] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Livre]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Livre](
	[LIV_Id] [int] IDENTITY(1,1) NOT NULL,
	[LIV_ISBN] [nvarchar](50) NOT NULL,
	[LIV_Titre] [nvarchar](50) NOT NULL,
	[LIV_Image] [nvarchar](max) NULL,
	[LIV_Auteurs] [nvarchar](250) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[RES_Id] [int] IDENTITY(1,1) NOT NULL,
	[RES_DateReservation] [datetime] NOT NULL,
	[RES_Supprimee] [bit] NULL,
	[LEC_Id] [int] NOT NULL,
	[LIV_Id] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tarif]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarif](
	[TAR_Id] [int] IDENTITY(1,1) NOT NULL,
	[TAR_AnneeApplication] [int] NOT NULL,
	[TAR_Retard] [decimal](25, 0) NOT NULL,
	[TAR_Emprunt] [decimal](25, 0) NOT NULL,
	[BIB_ID] [int] NOT NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Administrateur] ON 

INSERT [dbo].[Administrateur] ([ADM_Id], [ADM_UserName], [ADM_Password]) VALUES (1, N'toto', N'toto')
INSERT [dbo].[Administrateur] ([ADM_Id], [ADM_UserName], [ADM_Password]) VALUES (2, N'admin', N'admin')
INSERT [dbo].[Administrateur] ([ADM_Id], [ADM_UserName], [ADM_Password]) VALUES (4, N'a', N'a')
INSERT [dbo].[Administrateur] ([ADM_Id], [ADM_UserName], [ADM_Password]) VALUES (7, N'b', N'b')
SET IDENTITY_INSERT [dbo].[Administrateur] OFF
SET IDENTITY_INSERT [dbo].[Bibliotheque] ON 

INSERT [dbo].[Bibliotheque] ([BIB_ID], [BIB_Code], [BIB_Libelle], [BIB_Adresse], [BIB_Ville], [BIB_CodePostal]) VALUES (2, N'BRU_01', N'Bruxelles Centre', N'Rue du perdu, n°404', N'Bruxelles', 1000)
INSERT [dbo].[Bibliotheque] ([BIB_ID], [BIB_Code], [BIB_Libelle], [BIB_Adresse], [BIB_Ville], [BIB_CodePostal]) VALUES (3, N'BRU_02', N'Bruxelles Sud', N'Rue du retrouvé, n° 1', N'Bruxelles', 1180)
INSERT [dbo].[Bibliotheque] ([BIB_ID], [BIB_Code], [BIB_Libelle], [BIB_Adresse], [BIB_Ville], [BIB_CodePostal]) VALUES (5, N'NAM_01', N'Namur Centre', N'Avenue Baltazar, n°666', N'Namur', 5000)
INSERT [dbo].[Bibliotheque] ([BIB_ID], [BIB_Code], [BIB_Libelle], [BIB_Adresse], [BIB_Ville], [BIB_CodePostal]) VALUES (6, N'CHAR_01', N'Charleroi Sud', N'Boulevard de la Gare, n°4', N'Charleroi', 6000)
SET IDENTITY_INSERT [dbo].[Bibliotheque] OFF
SET IDENTITY_INSERT [dbo].[Emprunt] ON 

INSERT [dbo].[Emprunt] ([EMP_Id], [EMP_DateEmprunt], [EMP_DateRetour], [EMP_MontantPaye], [EXE_Id], [LEC_Id]) VALUES (1, CAST(N'2017-01-04T16:01:50.207' AS DateTime), NULL, NULL, 6, 2)
INSERT [dbo].[Emprunt] ([EMP_Id], [EMP_DateEmprunt], [EMP_DateRetour], [EMP_MontantPaye], [EXE_Id], [LEC_Id]) VALUES (5, CAST(N'2017-01-04T16:36:18.310' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[Emprunt] ([EMP_Id], [EMP_DateEmprunt], [EMP_DateRetour], [EMP_MontantPaye], [EXE_Id], [LEC_Id]) VALUES (6, CAST(N'2017-01-04T16:45:53.577' AS DateTime), NULL, NULL, 2, 1)
INSERT [dbo].[Emprunt] ([EMP_Id], [EMP_DateEmprunt], [EMP_DateRetour], [EMP_MontantPaye], [EXE_Id], [LEC_Id]) VALUES (7, CAST(N'2016-12-04T16:45:53.577' AS DateTime), NULL, NULL, 7, 4)
SET IDENTITY_INSERT [dbo].[Emprunt] OFF
SET IDENTITY_INSERT [dbo].[Exemplaire] ON 

INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (1, N'AED_01', N'1/1/2000', 1, 2, 3)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (2, N'AED_02', N'1/1/2000', 1, 2, 3)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (3, N'AED_03', N'1/1/2000', 0, 2, 3)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (4, N'AED_04', N'1/1/2000', 0, 5, 3)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (5, N'AED_05', N'1/1/2000', 0, 3, 3)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (6, N'CI_01', N'1/1/2011', 1, 5, 4)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (7, N'CI_02', N'1/1/2011', 0, 2, 4)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (8, N'CI_03', N'1/1/2011', 0, 6, 4)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (9, N'CI_04', N'1/1/2011', 0, 2, 4)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (10, N'TOT_01', N'1/1/2010', 0, 6, 5)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (11, N'SS_01', N'1/1/2010', 0, 5, 6)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (12, N'SHP_01', N'1/1/2014', 0, 2, 7)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (13, N'MGMVPB_01', N'1/1/2014', 0, 3, 8)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (14, N'EEF_01', N'1/1/2016', 0, 5, 9)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (15, N'MAM', N'1/1/2016', 0, 6, 10)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (16, N'LDLJ_01', N'1/1/2017', 0, 2, 11)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (17, N'SR', N'1/1/2017', 0, 3, 12)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (18, N'LDLJ_02', N'2017-01-01', 0, 6, 11)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (20, N'LDLJ_03', N'2015-01-01', 0, 5, 11)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (21, N'LDLJ_04', N'2017-01-01', 0, 5, 11)
SET IDENTITY_INSERT [dbo].[Exemplaire] OFF
SET IDENTITY_INSERT [dbo].[Lecteur] ON 

INSERT [dbo].[Lecteur] ([LEC_Id], [LEC_Nom], [LEC_Prenom], [LEC_Sexe], [LEC_DateDeNaissance], [LEC_Adresse], [LEC_Ville], [LEC_CodePostal], [LEC_UserName], [LEC_Password], [LEC_Photo], [BIB_ID]) VALUES (1, N'Encev', N'Simon', N'M', N'1/1/1985', N'Rue du bois, n°5', N'Bruxelles', 1000, N'simon', N'simon', N'C:\Users\Farid\Documents\SGBDPICS\Simon.jpg', 2)
INSERT [dbo].[Lecteur] ([LEC_Id], [LEC_Nom], [LEC_Prenom], [LEC_Sexe], [LEC_DateDeNaissance], [LEC_Adresse], [LEC_Ville], [LEC_CodePostal], [LEC_UserName], [LEC_Password], [LEC_Photo], [BIB_ID]) VALUES (2, N'ID Bourhim', N'Farid', N'M', N'1/12/1983', N'Rue de l''aiguille, n°37', N'Bruxelles', 1070, N'farid', N'farid', N'C:\Users\Farid\Documents\SGBDPICS\farid.jpg', 3)
INSERT [dbo].[Lecteur] ([LEC_Id], [LEC_Nom], [LEC_Prenom], [LEC_Sexe], [LEC_DateDeNaissance], [LEC_Adresse], [LEC_Ville], [LEC_CodePostal], [LEC_UserName], [LEC_Password], [LEC_Photo], [BIB_ID]) VALUES (3, N'Jonckers', N'Etienne', N'F', N'1/1/1800', N'Avenue de la chevre, n°1', N'Namur', 5000, N'etienne', N'etienne', N'C:\Users\Farid\Documents\SGBDPICS\etienne.jpg', 5)
INSERT [dbo].[Lecteur] ([LEC_Id], [LEC_Nom], [LEC_Prenom], [LEC_Sexe], [LEC_DateDeNaissance], [LEC_Adresse], [LEC_Ville], [LEC_CodePostal], [LEC_UserName], [LEC_Password], [LEC_Photo], [BIB_ID]) VALUES (4, N'Metzmacker', N'Gerard', N'M', N'01/01/1968', N'Boulevard des militants, 5', N'Anvers', 2000, N'gerard', N'gerard', N'C:\Users\Farid\Documents\SGBDPICS\Gerard.jpg', 6)
SET IDENTITY_INSERT [dbo].[Lecteur] OFF
SET IDENTITY_INSERT [dbo].[Livre] ON 

INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image], [LIV_Auteurs]) VALUES (3, N'9782253093008', N'Ange et Demon', N'http://a.decitre.di-static.com/img/200x303/dan-brown-anges-et-demons/9782253093008FS.gif', N'Dan Brown')
INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image], [LIV_Auteurs]) VALUES (4, N'9782226193506', N'Le chemin invisible', N'https://www.maxilivres.fr/6912-large_default/grimpow-le-chemin-invisible-romans.jpg', NULL)
INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image], [LIV_Auteurs]) VALUES (5, N'9782253126379', N'Toubib or not Toubib', N'http://t3.gstatic.com/images?q=tbn:ANd9GcRNoDoAyfdr-bRDAgG6dswb5KEeePPPr4gv088CqgP8vaT72qa9', NULL)
INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image], [LIV_Auteurs]) VALUES (6, N'9782702140864', N'Soirée Sushi', N'http://www.agnesabecassis.com/wp-content/uploads/2010/02/soir%C3%A9e-sushi-grand.jpg', NULL)
INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image], [LIV_Auteurs]) VALUES (7, N'9782070639564', N'Super Hero en Plâtre', N'http://media.paperblog.fr/i/526/5265993/akissi-super-heros-platre-L-DwB9iX.jpeg', NULL)
INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image], [LIV_Auteurs]) VALUES (8, N'9782258114821', N'Ma grand-mère vous passe le bonjour', N'http://extranet.editis.com/it-yonixweb/IMAGES/PC/P3/9782258114821.jpg', NULL)
INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image], [LIV_Auteurs]) VALUES (9, N'9782714454065', N'D''eau et de feu', N'http://extranet.editis.com/it-yonixweb/IMAGES/BLF/P3/9782714454065.jpg', NULL)
INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image], [LIV_Auteurs]) VALUES (10, N'9782714445643', N'Mano a mano', N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ-i1ITSTKEM96ymWzGhMFtlMGtee6kEWXQp96r4TST6uzRKRh0', NULL)
INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image], [LIV_Auteurs]) VALUES (11, N'9782080707475', N'Le Livre de la Jungle', N'https://d2t3xdwbh1v8qy.cloudfront.net/content/B007G6AEF2/resources/39353073', NULL)
INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image], [LIV_Auteurs]) VALUES (12, N'9782714445209', N'Sans regrets', N'http://www.babelio.com/couv/bm_CVT_Sans-regrets_3168.jpg', NULL)
INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image], [LIV_Auteurs]) VALUES (13, N'9783838705927', N'Illuminati', N'https://kbimages1-a.akamaihd.net/6315cdff-fa50-4421-9887-a4bf163118c0/180/1000/False/Illuminati.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Livre] OFF
SET IDENTITY_INSERT [dbo].[Reservation] ON 

INSERT [dbo].[Reservation] ([RES_Id], [RES_DateReservation], [RES_Supprimee], [LEC_Id], [LIV_Id]) VALUES (11, CAST(N'2017-01-04T15:40:45.810' AS DateTime), 0, 3, 3)
INSERT [dbo].[Reservation] ([RES_Id], [RES_DateReservation], [RES_Supprimee], [LEC_Id], [LIV_Id]) VALUES (13, CAST(N'2017-01-04T15:43:13.530' AS DateTime), 1, 2, 3)
INSERT [dbo].[Reservation] ([RES_Id], [RES_DateReservation], [RES_Supprimee], [LEC_Id], [LIV_Id]) VALUES (14, CAST(N'2017-01-04T15:43:38.590' AS DateTime), 1, 1, 3)
INSERT [dbo].[Reservation] ([RES_Id], [RES_DateReservation], [RES_Supprimee], [LEC_Id], [LIV_Id]) VALUES (16, CAST(N'2017-01-04T16:41:56.950' AS DateTime), 1, 1, 3)
SET IDENTITY_INSERT [dbo].[Reservation] OFF
SET IDENTITY_INSERT [dbo].[Tarif] ON 

INSERT [dbo].[Tarif] ([TAR_Id], [TAR_AnneeApplication], [TAR_Retard], [TAR_Emprunt], [BIB_ID]) VALUES (1, 2016, CAST(1 AS Decimal(25, 0)), CAST(3 AS Decimal(25, 0)), 2)
INSERT [dbo].[Tarif] ([TAR_Id], [TAR_AnneeApplication], [TAR_Retard], [TAR_Emprunt], [BIB_ID]) VALUES (2, 2016, CAST(1 AS Decimal(25, 0)), CAST(4 AS Decimal(25, 0)), 3)
INSERT [dbo].[Tarif] ([TAR_Id], [TAR_AnneeApplication], [TAR_Retard], [TAR_Emprunt], [BIB_ID]) VALUES (4, 2016, CAST(1 AS Decimal(25, 0)), CAST(2 AS Decimal(25, 0)), 5)
INSERT [dbo].[Tarif] ([TAR_Id], [TAR_AnneeApplication], [TAR_Retard], [TAR_Emprunt], [BIB_ID]) VALUES (5, 2016, CAST(2 AS Decimal(25, 0)), CAST(3 AS Decimal(25, 0)), 6)
INSERT [dbo].[Tarif] ([TAR_Id], [TAR_AnneeApplication], [TAR_Retard], [TAR_Emprunt], [BIB_ID]) VALUES (6, 2017, CAST(1 AS Decimal(25, 0)), CAST(2 AS Decimal(25, 0)), 2)
INSERT [dbo].[Tarif] ([TAR_Id], [TAR_AnneeApplication], [TAR_Retard], [TAR_Emprunt], [BIB_ID]) VALUES (7, 2017, CAST(2 AS Decimal(25, 0)), CAST(3 AS Decimal(25, 0)), 3)
INSERT [dbo].[Tarif] ([TAR_Id], [TAR_AnneeApplication], [TAR_Retard], [TAR_Emprunt], [BIB_ID]) VALUES (8, 2017, CAST(2 AS Decimal(25, 0)), CAST(2 AS Decimal(25, 0)), 5)
INSERT [dbo].[Tarif] ([TAR_Id], [TAR_AnneeApplication], [TAR_Retard], [TAR_Emprunt], [BIB_ID]) VALUES (9, 2017, CAST(3 AS Decimal(25, 0)), CAST(2 AS Decimal(25, 0)), 6)
SET IDENTITY_INSERT [dbo].[Tarif] OFF
/****** Object:  Index [prk_constraint_Administrateuf]    Script Date: 08-Jan-17 17:47:57 ******/
ALTER TABLE [dbo].[Administrateur] ADD  CONSTRAINT [prk_constraint_Administrateuf] PRIMARY KEY NONCLUSTERED 
(
	[ADM_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Administ__995EDA7F9B7C56AE]    Script Date: 08-Jan-17 17:47:57 ******/
ALTER TABLE [dbo].[Administrateur] ADD  CONSTRAINT [UQ__Administ__995EDA7F9B7C56AE] UNIQUE NONCLUSTERED 
(
	[ADM_UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Bibliotheque]    Script Date: 08-Jan-17 17:47:57 ******/
ALTER TABLE [dbo].[Bibliotheque] ADD  CONSTRAINT [prk_constraint_Bibliotheque] PRIMARY KEY NONCLUSTERED 
(
	[BIB_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Biblioth__4DC5946CFB54CC1F]    Script Date: 08-Jan-17 17:47:57 ******/
ALTER TABLE [dbo].[Bibliotheque] ADD  CONSTRAINT [UQ__Biblioth__4DC5946CFB54CC1F] UNIQUE NONCLUSTERED 
(
	[BIB_Libelle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Biblioth__E906647F21A89147]    Script Date: 08-Jan-17 17:47:57 ******/
ALTER TABLE [dbo].[Bibliotheque] ADD  CONSTRAINT [UQ__Biblioth__E906647F21A89147] UNIQUE NONCLUSTERED 
(
	[BIB_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Emprunt]    Script Date: 08-Jan-17 17:47:57 ******/
ALTER TABLE [dbo].[Emprunt] ADD  CONSTRAINT [prk_constraint_Emprunt] PRIMARY KEY NONCLUSTERED 
(
	[EMP_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Exemplaire]    Script Date: 08-Jan-17 17:47:57 ******/
ALTER TABLE [dbo].[Exemplaire] ADD  CONSTRAINT [prk_constraint_Exemplaire] PRIMARY KEY NONCLUSTERED 
(
	[EXE_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Exemplai__96E9CA7F0FE715CE]    Script Date: 08-Jan-17 17:47:57 ******/
ALTER TABLE [dbo].[Exemplaire] ADD  CONSTRAINT [UQ__Exemplai__96E9CA7F0FE715CE] UNIQUE NONCLUSTERED 
(
	[EXE_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Lecteur]    Script Date: 08-Jan-17 17:47:57 ******/
ALTER TABLE [dbo].[Lecteur] ADD  CONSTRAINT [prk_constraint_Lecteur] PRIMARY KEY NONCLUSTERED 
(
	[LEC_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Lecteur__0E72E8B2C840C090]    Script Date: 08-Jan-17 17:47:57 ******/
ALTER TABLE [dbo].[Lecteur] ADD  CONSTRAINT [UQ__Lecteur__0E72E8B2C840C090] UNIQUE NONCLUSTERED 
(
	[LEC_Prenom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Lecteur__7150BA5616C255A8]    Script Date: 08-Jan-17 17:47:57 ******/
ALTER TABLE [dbo].[Lecteur] ADD  CONSTRAINT [UQ__Lecteur__7150BA5616C255A8] UNIQUE NONCLUSTERED 
(
	[LEC_UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Lecteur__9B08263751BBFD53]    Script Date: 08-Jan-17 17:47:57 ******/
ALTER TABLE [dbo].[Lecteur] ADD  CONSTRAINT [UQ__Lecteur__9B08263751BBFD53] UNIQUE NONCLUSTERED 
(
	[LEC_Nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Livre]    Script Date: 08-Jan-17 17:47:57 ******/
ALTER TABLE [dbo].[Livre] ADD  CONSTRAINT [prk_constraint_Livre] PRIMARY KEY NONCLUSTERED 
(
	[LIV_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Livre__CC8910BF1E44F6CD]    Script Date: 08-Jan-17 17:47:57 ******/
ALTER TABLE [dbo].[Livre] ADD  CONSTRAINT [UQ__Livre__CC8910BF1E44F6CD] UNIQUE NONCLUSTERED 
(
	[LIV_ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Livre__E5A60452D623BC08]    Script Date: 08-Jan-17 17:47:57 ******/
ALTER TABLE [dbo].[Livre] ADD  CONSTRAINT [UQ__Livre__E5A60452D623BC08] UNIQUE NONCLUSTERED 
(
	[LIV_Titre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Reservation]    Script Date: 08-Jan-17 17:47:57 ******/
ALTER TABLE [dbo].[Reservation] ADD  CONSTRAINT [prk_constraint_Reservation] PRIMARY KEY NONCLUSTERED 
(
	[RES_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Tarif]    Script Date: 08-Jan-17 17:47:57 ******/
ALTER TABLE [dbo].[Tarif] ADD  CONSTRAINT [prk_constraint_Tarif] PRIMARY KEY NONCLUSTERED 
(
	[TAR_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[Lecteur]  WITH CHECK ADD  CONSTRAINT [CK_LEC_Sexe] CHECK  (([LEC_Sexe]='M' OR [LEC_Sexe]='F'))
GO
ALTER TABLE [dbo].[Lecteur] CHECK CONSTRAINT [CK_LEC_Sexe]
GO
/****** Object:  StoredProcedure [adminBiblio].[ADM_Login]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<FUNCTION QUI VERIFIE L''EXISTANCE D''UN ADMINISTRATEUR ET SON PASSWORD POUR LUI PERMETTRE L''ACCESS AU GUI LECTEUR>
-- =============================================

CREATE PROCEDURE [adminBiblio].[ADM_Login]
	@UserName nvarchar(50),
	@Password nvarchar(50)
AS
BEGIN
	 
	 IF ( dbo.ADM_CheckLogin(@UserName,@Password )=1)
	 BEGIN
		SELECT  ADM_UserName FROM Administrateur WHERE ADM_UserName = @UserName AND ADM_Password = @Password
	 END
	 ELSE
	 BEGIN
		RAISERROR('Login ou password incorrect',15,0)
	 END
	 
END







GO
/****** Object:  StoredProcedure [adminBiblio].[BIB_AllLibelle]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery20.sql|9|0|C:\Users\Farid\AppData\Local\Temp\~vsB21B.sql


-- =============================================
-- Author:		<Simon ENCEV, Farid ID BOURHIM>
-- Create date: <01/01/2017>
-- Description:	<Affichage des libelles des bibliotheque pour le login et le changement de boibliotheque>
-- =============================================
CREATE PROCEDURE [adminBiblio].[BIB_AllLibelle]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	SELECT        BIB_Libelle AS Libelle
	FROM            Bibliotheque
END






GO
/****** Object:  StoredProcedure [adminBiblio].[EMP_AllEmpruntsEnCours]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Farid IDBOURHIM, Simon SENCEV>
-- Create date: <01/01/2017>
-- Description:	<Liste des empruntes en cours>
-- =============================================
CREATE PROCEDURE [adminBiblio].[EMP_AllEmpruntsEnCours]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        Emprunt.EMP_Id AS Emprunt, Emprunt.EMP_DateEmprunt AS [Date d'emprunt], Exemplaire.EXE_Code AS [Code de l'Exemplaire], Livre.LIV_Titre AS Titre, Bibliotheque.BIB_Libelle AS Bibliotheque, 
                         Lecteur.LEC_Id AS [ID lecteur], Lecteur.LEC_Nom AS Nom, Lecteur.LEC_Prenom AS Prenom, Livre.LIV_Image
FROM            Emprunt INNER JOIN
                         Exemplaire ON Emprunt.EXE_Id = Exemplaire.EXE_Id INNER JOIN
                         Livre ON Exemplaire.LIV_Id = Livre.LIV_Id INNER JOIN
                         Lecteur ON Emprunt.LEC_Id = Lecteur.LEC_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID AND Lecteur.BIB_ID = Bibliotheque.BIB_ID
WHERE        (Emprunt.EMP_DateRetour IS NULL)
END








GO
/****** Object:  StoredProcedure [adminBiblio].[EMP_ListeRetardatairesAllBib]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI affiche LA LISTE DES Retardataires et le montant du>
-- =============================================
CREATE PROCEDURE [adminBiblio].[EMP_ListeRetardatairesAllBib]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT        Lecteur.LEC_Id AS [ID Lecteur], Lecteur.LEC_Nom AS Nom, Lecteur.LEC_Prenom AS Prénom, dbo.EMP_CalculJoursRetard(Emprunt.EMP_DateEmprunt) AS [Nombre de jours de retard], 
                         Tarif.TAR_Emprunt + dbo.EMP_CalculMontantRetard(Bibliotheque.BIB_ID, YEAR(Emprunt.EMP_DateEmprunt), dbo.EMP_CalculJoursRetard(Emprunt.EMP_DateEmprunt)) AS [Montant total du €], 
                         Emprunt.EMP_Id AS [ID Emprunt], Emprunt.EMP_DateEmprunt AS [Date d'emprunt], Emprunt.EXE_Id AS [ID Exemplaire], Exemplaire.EXE_Code AS Exemplaire, Livre.LIV_Titre AS Titre, Livre.LIV_ISBN AS ISBN, 
                         Bibliotheque.BIB_Libelle AS Bibliotheque, Livre.LIV_Image
FROM            Tarif INNER JOIN
                         Bibliotheque ON Tarif.BIB_ID = Bibliotheque.BIB_ID INNER JOIN
                         Exemplaire ON Bibliotheque.BIB_ID = Exemplaire.BIB_ID INNER JOIN
                         Lecteur INNER JOIN
                         Emprunt ON Lecteur.LEC_Id = Emprunt.LEC_Id ON Exemplaire.EXE_Id = Emprunt.EXE_Id AND Tarif.TAR_AnneeApplication = YEAR(Emprunt.EMP_DateEmprunt) INNER JOIN
                         Livre ON Exemplaire.LIV_Id = Livre.LIV_Id
WHERE        (Emprunt.EMP_DateRetour IS NULL) AND (dbo.EMP_CalculJoursRetard(Emprunt.EMP_DateEmprunt) > 0)

END





GO
/****** Object:  StoredProcedure [adminBiblio].[EMP_NbEmpruntsByLEC_ID]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI affiche LA LISTE DES Retardataires et le montant du>
-- =============================================
CREATE PROCEDURE [adminBiblio].[EMP_NbEmpruntsByLEC_ID]
	@Lec_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT        COUNT(Lecteur.LEC_Id) AS Expr1
FROM            Emprunt INNER JOIN
                         Lecteur ON Emprunt.LEC_Id = Lecteur.LEC_Id
WHERE        (Emprunt.EMP_DateRetour IS NULL) AND (dbo.EMP_CalculJoursRetard(Emprunt.EMP_DateEmprunt) = 0) AND (Lecteur.LEC_Id = @Lec_Id)
END






GO
/****** Object:  StoredProcedure [adminBiblio].[EMP_NbRetardByLEC_ID]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI affiche LA LISTE DES Retardataires et le montant du>
-- =============================================
CREATE PROCEDURE [adminBiblio].[EMP_NbRetardByLEC_ID]
	@Lec_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT        COUNT(Lecteur.LEC_Id) AS Expr1
FROM            Emprunt INNER JOIN
                         Lecteur ON Emprunt.LEC_Id = Lecteur.LEC_Id
WHERE        (Emprunt.EMP_DateRetour IS NULL) AND (dbo.EMP_CalculJoursRetard(Emprunt.EMP_DateEmprunt) > 0) AND (Lecteur.LEC_Id = @Lec_Id)
END






GO
/****** Object:  StoredProcedure [adminBiblio].[EXE_AllExemplaireAllBib]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [adminBiblio].[EXE_AllExemplaireAllBib]
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        Exemplaire.EXE_Id AS ID, Exemplaire.EXE_Code AS Exemplaire, Livre.LIV_Titre AS Titre, Livre.LIV_ISBN AS ISBN, Exemplaire.EXE_DateAchat AS [Date d'achat], Livre.LIV_Auteurs AS Auteurs, 
                         Bibliotheque.BIB_Libelle AS Bibliotheque, Livre.LIV_Image AS Image
	FROM            Exemplaire INNER JOIN
							 Livre ON Exemplaire.LIV_Id = Livre.LIV_Id INNER JOIN
							 Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
END







GO
/****** Object:  StoredProcedure [adminBiblio].[EXE_AllExemplaireByBIB_Id]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [adminBiblio].[EXE_AllExemplaireByBIB_Id]
	@Bib_Id int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        Exemplaire.EXE_Id AS ID, Exemplaire.EXE_Code AS Exemplaire, Livre.LIV_Titre AS Titre, Livre.LIV_ISBN AS ISBN, Exemplaire.EXE_DateAchat AS [Date d'achat], Livre.LIV_Auteurs AS Auteurs, 
                         Bibliotheque.BIB_Code AS Exemplaire, Livre.LIV_Image AS Image
FROM            Exemplaire INNER JOIN
                         Livre ON Exemplaire.LIV_Id = Livre.LIV_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
WHERE        (Exemplaire.BIB_ID = @Bib_Id)
END






GO
/****** Object:  StoredProcedure [adminBiblio].[EXE_AllExemplaireByTitre]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [adminBiblio].[EXE_AllExemplaireByTitre]
	@Bib_Id int,
	@Titre nvarchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	SELECT        Exemplaire.EXE_Id AS ID, Exemplaire.EXE_Code AS Exemplaire, Livre.LIV_Titre AS Titre, Livre.LIV_ISBN AS ISBN, Exemplaire.EXE_DateAchat AS [Date d'achat], Livre.LIV_Auteurs AS Auteurs, 
                         Bibliotheque.BIB_Code AS Exemplaire, Livre.LIV_Image AS Image
FROM            Exemplaire INNER JOIN
                         Livre ON Exemplaire.LIV_Id = Livre.LIV_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
WHERE        (Livre.LIV_Titre LIKE '%' + @Titre + '%')
END







GO
/****** Object:  StoredProcedure [adminBiblio].[EXE_CreerExemplaire]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 CREATE PROCEDURE [adminBiblio].[EXE_CreerExemplaire]
	@Code nvarchar (50),
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
/****** Object:  StoredProcedure [adminBiblio].[EXE_RetournerExempplaire]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [adminBiblio].[EXE_RetournerExempplaire]
	
	@ExemplaireId int
	
AS
BEGIN
	
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- MISE A JOUR DE LA TABLE EMPRUNT EN METTANT A JOUR LA DATE RETOUR AVEC LA DATE D'AOUJOURD'HUI
	UPDATE Emprunt
		SET	EMP_DateRetour = GETDATE()
			WHERE Emprunt.EXE_Id = @ExemplaireId AND EMP_DateRetour IS NULL
	-- MISE A JOUR DE LA TABLE EMPRUNT EN METTANT A JOUR LE CHAMPS INDISPONIBLE A FAUX OU '0'
	UPDATE Exemplaire
		SET EXE_Indisponible = 0
			WHERE Exemplaire.EXE_Id = @ExemplaireId
END







GO
/****** Object:  StoredProcedure [adminBiblio].[LEC_AllLecteurs]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Farid ID BOURHIM, Simon ENCEV>
-- Create date: <01/01/2017>
-- Description:	<Liste des lecteurs pour l'administrateur>
-- =============================================
CREATE PROCEDURE [adminBiblio].[LEC_AllLecteurs]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	SELECT * from Lecteur 
END





GO
/****** Object:  StoredProcedure [adminBiblio].[LIV_AjoutLivre]    Script Date: 08-Jan-17 17:47:57 ******/
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
	@ISBN nvarchar (50),
	@titre nvarchar (50),
	@image nvarchar (max),
	@auteur nvarchar(max)	
	
AS
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT OFF;
		

		IF exists (SELECT LIV_ISBN FROM Livre WHERE LIV_ISBN = @ISBN)
		BEGIN
			RAISERROR ('Ce livre existe déjà dans la DB',15,0)
		END
		ELSE
		BEGIN
			INSERT INTO Livre(LIV_ISBN, LIV_Titre, LIV_Image, LIV_Auteurs)	VALUES (@ISBN, @titre, @image, @auteur)
		END
	END



GO
/****** Object:  StoredProcedure [adminBiblio].[LIV_AllLivres]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Simon ENCEV, Farid ID BOURHIM>
-- Create date: <01/01/2017>
-- Description:	<Liste des livres pour l'administrateur>
-- =============================================
CREATE PROCEDURE [adminBiblio].[LIV_AllLivres]	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        Livre.LIV_Id AS "ID Livre", Livre.LIV_ISBN AS ISBN, Livre.LIV_Titre AS Titre, Livre.LIV_Auteurs AS Auteurs, LIV_Image
FROM            Livre
END





GO
/****** Object:  StoredProcedure [adminBiblio].[LIV_DeleteLivre]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Simon ENCEV, Farid ID BOURHIM>
-- Create date: <04/01/2017>
-- Description:	<procedure d'intertion de livre>
-- =============================================
 CREATE PROCEDURE [adminBiblio].[LIV_DeleteLivre]
	@ISBN nvarchar (50)	
	
AS
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
		
		BEGIN
			DELETE FROM   Livre
			WHERE LIV_ISBN = @ISBN
		END
	END




GO
/****** Object:  StoredProcedure [adminBiblio].[LIV_LivreByISBN]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Simon ENCEV, Farid ID BOURHIM>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI RETOURNE UN LIVRE PAR SON ISBN>
-- =============================================
CREATE PROCEDURE [adminBiblio].[LIV_LivreByISBN] 
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
/****** Object:  StoredProcedure [adminBiblio].[LIV_LivreByTitle]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Simon ENCEV, Farid ID BOURHIM>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI RETOURNE UN LIVRE A PARTIR DE SON Titre>
-- =============================================
CREATE PROCEDURE [adminBiblio].[LIV_LivreByTitle]
	-- Parametres
	@Liv_Title nvarchar(50)
AS
BEGIN
   
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT        LIV_Id AS ID, LIV_ISBN AS ISBN, LIV_Titre AS Titre, LIV_Image AS "Image", LIV_Auteurs AS Auteurs
	FROM            Livre
	WHERE        (LIV_Titre LIKE '%' + @Liv_Title + '%')
END







GO
/****** Object:  StoredProcedure [adminBiblio].[LIV_UpdateLivre]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Simon ENCEV, Farid ID BOURHIM>
-- Create date: <04/01/2017>
-- Description:	<procedure d'intertion de livre>
-- =============================================
 CREATE PROCEDURE [adminBiblio].[LIV_UpdateLivre]
	@ISBN nvarchar (50),
	@titre nvarchar (50),
	@image nvarchar (max),
	@auteur nvarchar(max)	
	
AS
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT OFF;
		
		BEGIN
			UPDATE  Livre 
				SET LIV_Titre = @titre,
					LIV_Image = @image,
					LIV_Auteurs = @auteur 
			WHERE LIV_ISBN = @ISBN
		END
	END




GO
/****** Object:  StoredProcedure [adminBiblio].[RES_ListeReservationsEnCours]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [adminBiblio].[RES_ListeReservationsEnCours]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT        Reservation.RES_Id AS "ID Réservation", Livre.LIV_Titre AS TITRE, Reservation.RES_DateReservation AS "Date de réservation", Lecteur.LEC_Nom AS Nom, Lecteur.LEC_Prenom AS Prénom
FROM            Reservation INNER JOIN
                         Livre ON Reservation.LIV_Id = Livre.LIV_Id INNER JOIN
                         Lecteur ON Reservation.LEC_Id = Lecteur.LEC_Id
END








GO
/****** Object:  StoredProcedure [dbo].[EMP_AllEmpruntsAllBib]    Script Date: 08-Jan-17 17:47:57 ******/
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
/****** Object:  StoredProcedure [dbo].[EMP_AllEmpruntsByBIB_Id]    Script Date: 08-Jan-17 17:47:57 ******/
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
/****** Object:  StoredProcedure [dbo].[EMP_AllEmpruntsEnCoursByLEC_Id]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI RETOURNE LA LISTE DES EMPRUNTS PAR RAPPORTS A UN LECTEUR>
-- =============================================
CREATE PROCEDURE [dbo].[EMP_AllEmpruntsEnCoursByLEC_Id]
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
	WHERE Lecteur.LEC_Id = @Lec_Id AND EMP_DateRetour is null
END







GO
/****** Object:  StoredProcedure [dbo].[EXE_AllExemplaireByLIV_Id]    Script Date: 08-Jan-17 17:47:57 ******/
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
/****** Object:  StoredProcedure [dbo].[LEC_GetUserData]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Simon ENCEV, Farid ID BOURHIM>
-- Create date: <25/12/2016>
-- Description:	<Procedures pour afficher les details du lecteur connecté pour un eventuel traiement >
-- =============================================
CREATE PROCEDURE [dbo].[LEC_GetUserData]
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




GO
/****** Object:  StoredProcedure [dbo].[LEC_GetUserId]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Farid ID BOURHIM, Simon ENECV>
-- Create date: <24/12/2016>
-- Description:	<Procedure qui affiche (remet) l'Id du lecteur connecté>
-- =============================================
CREATE PROCEDURE [dbo].[LEC_GetUserId]
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
/****** Object:  StoredProcedure [lecteur].[BIB_AllLibelle]    Script Date: 08-Jan-17 17:47:57 ******/
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
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	SELECT       BIB_ID, BIB_Libelle AS Libelle
	FROM            Bibliotheque
END





GO
/****** Object:  StoredProcedure [lecteur].[EMP_AllEmpruntsByLEC_Id]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI RETOURNE LA LISTE DES EMPRUNTS PAR RAPPORTS A UN LECTEUR>
-- =============================================
CREATE PROCEDURE [lecteur].[EMP_AllEmpruntsByLEC_Id]
	--Parametres
	@Lec_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT        Exemplaire.EXE_Code AS Exemplaire, Livre.LIV_Titre AS Titre, Bibliotheque.BIB_Libelle AS Bibliothèque, Emprunt.EMP_DateEmprunt AS "Date d'emprunt"
FROM            Emprunt INNER JOIN
                         Exemplaire ON Emprunt.EXE_Id = Exemplaire.EXE_Id INNER JOIN
                         Livre ON Exemplaire.LIV_Id = Livre.LIV_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
WHERE        (Emprunt.LEC_Id = @Lec_Id) AND (Emprunt.EMP_DateRetour IS NULL)
END







GO
/****** Object:  StoredProcedure [lecteur].[EMP_RetardsAllBibByLec]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI affiche LA LISTE DES Retardares du lecteur et le montant du>
-- =============================================
CREATE PROCEDURE [lecteur].[EMP_RetardsAllBibByLec]
	@Lec_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT	Lecteur.LEC_Id AS "ID Lecteur", Lecteur.LEC_Nom AS Nom, Lecteur.LEC_Prenom AS Prénom, dbo.EMP_CalculJoursRetard(Emprunt.EMP_DateEmprunt) AS [Nombre de jours de retard], 
			Tarif.TAR_Emprunt + dbo.EMP_CalculMontantRetard(Bibliotheque.BIB_ID, YEAR(Emprunt.EMP_DateEmprunt), dbo.EMP_CalculJoursRetard(Emprunt.EMP_DateEmprunt)) AS "Montant total du €", 
			Emprunt.EMP_Id AS [ID Emprunt], Emprunt.EMP_DateEmprunt AS [Date d'emprunt], Emprunt.EXE_Id AS [ID Exemplaire], Exemplaire.EXE_Code AS Exemplaire, Livre.LIV_Titre AS Titre, Livre.LIV_ISBN AS ISBN, 
			Bibliotheque.BIB_Code AS [Code Bibliotheque], Bibliotheque.BIB_Libelle AS Bibliotheque
	FROM	Tarif INNER JOIN
				Bibliotheque ON Tarif.BIB_ID = Bibliotheque.BIB_ID INNER JOIN
				Exemplaire ON Bibliotheque.BIB_ID = Exemplaire.BIB_ID INNER JOIN
				Lecteur INNER JOIN
				Emprunt ON Lecteur.LEC_Id = Emprunt.LEC_Id ON Exemplaire.EXE_Id = Emprunt.EXE_Id INNER JOIN
				Livre ON Exemplaire.LIV_Id = Livre.LIV_Id
	WHERE        (Emprunt.EMP_DateRetour IS NULL) 
				AND (dbo.EMP_CalculJoursRetard(Emprunt.EMP_DateEmprunt) > 0)
				AND (Tarif.TAR_AnneeApplication = YEAR(Emprunt.EMP_DateEmprunt))
				AND (Lecteur.LEC_Id = @Lec_id)

END





GO
/****** Object:  StoredProcedure [lecteur].[EXE_AllExemplairesDispoByBibByISBN]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [lecteur].[EXE_AllExemplairesDispoByBibByISBN]
	@Bib_Id int,
	@ISBN nvarchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        Exemplaire.EXE_Id AS [ID Exemplaire], Exemplaire.EXE_Code AS Exemplaire, Livre.LIV_Titre AS Titre, Livre.LIV_ISBN AS ISBN, Livre.LIV_Auteurs AS Auteurs, Bibliotheque.BIB_Libelle AS Bibliotheque
FROM            Exemplaire INNER JOIN
                         Livre ON Exemplaire.LIV_Id = Livre.LIV_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
WHERE        (Exemplaire.EXE_Indisponible = 0) AND (Exemplaire.BIB_ID = @Bib_Id) AND (Livre.LIV_ISBN LIKE @ISBN)
END









GO
/****** Object:  StoredProcedure [lecteur].[EXE_AllExemplairesDispoByBibByTitle]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [lecteur].[EXE_AllExemplairesDispoByBibByTitle]
	@Bib_Id int,
	@Titre nvarchar (50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        Exemplaire.EXE_Id, Exemplaire.EXE_Code AS Exemplaire, Livre.LIV_Titre AS Titre, Livre.LIV_ISBN AS ISBN, Livre.LIV_Auteurs AS Auteurs, Bibliotheque.BIB_Libelle AS Bibliothèque
FROM            Exemplaire INNER JOIN
                         Livre ON Exemplaire.LIV_Id = Livre.LIV_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
WHERE        (Exemplaire.BIB_ID = @Bib_Id) AND (Livre.LIV_Titre LIKE '%'+ @Titre + '%') AND (Exemplaire.EXE_Indisponible = 0)
END








GO
/****** Object:  StoredProcedure [lecteur].[EXE_AllExemplairesDispoByBibId]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [lecteur].[EXE_AllExemplairesDispoByBibId]
	@Bib_Id int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        Exemplaire.EXE_Id AS "ID Exemplaire", Exemplaire.EXE_Code AS Exemplaire, Livre.LIV_Titre AS Titre, Livre.LIV_ISBN AS ISBN, Livre.LIV_Auteurs AS Auteurs, Bibliotheque.BIB_Libelle AS Bibliotheque
	FROM            Exemplaire INNER JOIN
                         Livre ON Exemplaire.LIV_Id = Livre.LIV_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
	WHERE        (Exemplaire.EXE_Indisponible = 0) AND (Exemplaire.BIB_ID = @Bib_Id)
END








GO
/****** Object:  StoredProcedure [lecteur].[EXE_EmprunterExemplaire]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Farid ID BOURHIM, Simon ENCEV>
-- Create date: <28/12/2016,>
-- Description:	<PROCEDURE POUR EMPRUNTER UN EXEMPLAIRE>
-- =============================================
CREATE PROCEDURE [lecteur].[EXE_EmprunterExemplaire] 
	-- Parametres
	@Exe_Id int, 
	@Lec_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 DECLARE @DisponibliteExemplaire bit
	 
	 SET @DisponibliteExemplaire =(
	 SELECT  EXE_Indisponible FROM Exemplaire WHERE EXE_Id = @Exe_Id
	 )
		
		IF(@DisponibliteExemplaire = 1)
			BEGIN
				RAISERROR ('L"exemplaire que vous essayez d"emprunter est actuellement indisponible',15,0)
			END
		ELSE
			BEGIN
				INSERT INTO Emprunt (EMP_DateEmprunt, EXE_Id, LEC_Id) VALUES (GETDATE(), @Exe_Id, @Lec_Id)	
				

				/*IF exists(
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
				BEGIN*/
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
				--END

				UPDATE Exemplaire set EXE_Indisponible = 1 where EXE_Id = @Exe_Id

			END

END







GO
/****** Object:  StoredProcedure [lecteur].[LEC_Login]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<FUNCTION QUI VERIFIE L''EXISTANCE D''UN ADMINISTRATEUR ET SON PASSWORD POUR LUI PERMETTRE L''ACCESS AU GUI LECTEUR>
-- =============================================

CREATE PROCEDURE [lecteur].[LEC_Login]
	@UserName nvarchar(50),
	@Password nvarchar(50)
AS
BEGIN
	 
	 IF ( dbo.LEC_CheckLogin(@UserName,@Password )=1)
	 BEGIN
		SELECT  LEC_Id, LEC_UserName FROM Lecteur WHERE LEC_UserName = @UserName AND LEC_Password = @Password
	 END
	 ELSE
	 BEGIN
		RAISERROR('Login ou password incorrect',15,0)
	 END
	 
END








GO
/****** Object:  StoredProcedure [lecteur].[LIV_LivreByISBN]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Simon ENCEV, Farid ID BOURHIM>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI RETOURNE UN LIVRE PAR SON ISBN>
-- =============================================
CREATE PROCEDURE [lecteur].[LIV_LivreByISBN] 
	-- Parametres
	@ISBN nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT        LIV_Id AS ID, LIV_ISBN AS ISBN, LIV_Titre AS Titre, LIV_Image AS "Image", LIV_Auteurs AS Auteurs
FROM            Livre
WHERE        (LIV_ISBN = @ISBN)
END







GO
/****** Object:  StoredProcedure [lecteur].[LIV_LivreByTitle]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Simon ENCEV, Farid ID BOURHIM>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE QUI RETOURNE UN LIVRE A PARTIR DE SON Titre>
-- =============================================
CREATE PROCEDURE [lecteur].[LIV_LivreByTitle]
	-- Parametres
	@Liv_Title nvarchar(50)
AS
BEGIN
   
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT        LIV_Id AS ID, LIV_ISBN AS ISBN, LIV_Titre AS Titre, LIV_Image AS "Image", LIV_Auteurs AS Auteurs
FROM            Livre
WHERE        (LIV_Titre LIKE '%' + @Liv_Title + '%')
END







GO
/****** Object:  StoredProcedure [lecteur].[RES_ListeReservationsByLEC_Id]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Farid ID BOURHIM, Simon ENCEV>
-- Create date: <01/01/2017>
-- Description:	<Liste des reservation en cours>
-- =============================================
CREATE PROCEDURE [lecteur].[RES_ListeReservationsByLEC_Id]
	@Lec_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT        Reservation.RES_Id AS "ID Réservation", Livre.LIV_Titre AS Titre, Reservation.RES_DateReservation AS "Date de réservation"
FROM            Reservation INNER JOIN
                         Livre ON Reservation.LIV_Id = Livre.LIV_Id INNER JOIN
                         Lecteur ON Reservation.LEC_Id = @Lec_Id


END





GO
/****** Object:  StoredProcedure [lecteur].[RES_ListeReservationsDisponibleByLEC_IdAllBib]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <29/12/2016>
-- Description:	<Procedure qui affiche liste des livres reservés par lecteur et donne leurs disponibilité. >
-- =============================================
CREATE PROCEDURE [lecteur].[RES_ListeReservationsDisponibleByLEC_IdAllBib]
	@IdLecteur int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT	Reservation.RES_Id AS [ID Réservation], Livre.LIV_Titre AS Titre, Reservation.RES_DateReservation AS [Date de réservation], COUNT(Exemplaire.EXE_Indisponible) AS NombreExemplaireDisponible, 
			Bibliotheque.BIB_Libelle, Exemplaire.EXE_Id, Reservation.LEC_Id
	FROM	Reservation INNER JOIN
			Livre ON Reservation.LIV_Id = Livre.LIV_Id INNER JOIN
			Exemplaire ON Livre.LIV_Id = Exemplaire.LIV_Id INNER JOIN
			Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
	GROUP BY Reservation.RES_Id, Livre.LIV_Titre, Reservation.RES_DateReservation, Bibliotheque.BIB_Libelle, Exemplaire.EXE_Id, Reservation.LEC_Id
	HAVING	(COUNT(Exemplaire.EXE_Indisponible) = 0) AND (Reservation.LEC_Id = @IdLecteur)

END





GO
/****** Object:  StoredProcedure [lecteur].[RES_ListeReservationsDisponibleByLEC_IdByBib]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <29/12/2016>
-- Description:	<Procedure qui affiche liste des livres reservés par lecteur et donne leurs disponibilité. >
-- =============================================
CREATE PROCEDURE [lecteur].[RES_ListeReservationsDisponibleByLEC_IdByBib]
	@IdLecteur int,
	@IdBibliotheque int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT        Reservation.RES_Id AS [ID Réservation], Livre.LIV_Titre AS Titre, Reservation.RES_DateReservation AS [Date de réservation], COUNT(Exemplaire.EXE_Indisponible) AS NombreExemplaireDisponible, 
                         Bibliotheque.BIB_Libelle, Exemplaire.EXE_Id, Reservation.LEC_Id
FROM            Reservation INNER JOIN
                         Livre ON Reservation.LIV_Id = Livre.LIV_Id INNER JOIN
                         Exemplaire ON Livre.LIV_Id = Exemplaire.LIV_Id INNER JOIN
                         Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
GROUP BY Reservation.RES_Id, Livre.LIV_Titre, Reservation.RES_DateReservation, Bibliotheque.BIB_Libelle, Exemplaire.EXE_Id, Reservation.LEC_Id
HAVING        (COUNT(Exemplaire.EXE_Indisponible) = 0) AND (Reservation.LEC_Id = @IdLecteur) AND (Bibliotheque.BIB_Libelle = @IdBibliotheque)
END







GO
/****** Object:  StoredProcedure [lecteur].[RES_ReserverLivre]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Farid ID BOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<PROCEDURE POUR RESERVER UN LIVRE>
-- =============================================
CREATE PROCEDURE [lecteur].[RES_ReserverLivre]
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
/****** Object:  Trigger [dbo].[TR_MaxEmprunt]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Farid ID BOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<TRIGGER QUI EMPECHE L'INSERTION D'UN EMPRUNT DONT L'EXEMPLAIRE N'EST PAS DISPONIBLE>
-- =============================================
CREATE TRIGGER [dbo].[TR_MaxEmprunt]
   ON [dbo].[Emprunt]
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Lec_Id int
	DECLARE @Bib_Id int
	DECLARE @EmpruntBibAnnexe int
	DECLARE @EmpruntBibPrincipale int
	DECLARE @Exe_Id int

	--recup de l'id du lecteur qui fait l'emprunt ainsi que l'id du livre
	select @Lec_Id = LEC_Id, @Exe_Id = EXE_Id FROM inserted

	--recup de l'id de la bibli principale du lecteur qui emprunte
	SELECT	@Bib_Id = Bibliotheque.BIB_ID
	FROM	Bibliotheque INNER JOIN
			Lecteur ON Bibliotheque.BIB_ID = Lecteur.BIB_ID
	WHERE	(Lecteur.LEC_Id = @Lec_Id)

	
	set @EmpruntBibPrincipale =(
	SELECT	COUNT(Bibliotheque.BIB_ID) AS NbEmpruntBibPrincipale
	FROM	Emprunt INNER JOIN
			Exemplaire ON Emprunt.EXE_Id = Exemplaire.EXE_Id INNER JOIN
			Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
	WHERE	(Emprunt.EMP_DateRetour IS NULL)
	GROUP BY Emprunt.LEC_Id
	HAVING	(Emprunt.LEC_Id = @Lec_Id) AND (COUNT(Bibliotheque.BIB_ID) = @Bib_Id))


	set @EmpruntBibAnnexe =(
	SELECT	COUNT(Bibliotheque.BIB_ID) AS NbEmpruntBibPrincipale
	FROM	Emprunt INNER JOIN
			Exemplaire ON Emprunt.EXE_Id = Exemplaire.EXE_Id INNER JOIN
			Bibliotheque ON Exemplaire.BIB_ID = Bibliotheque.BIB_ID
	WHERE	(Emprunt.EMP_DateRetour IS NULL)
	GROUP BY Emprunt.LEC_Id
	HAVING	(Emprunt.LEC_Id = @Lec_Id) AND (COUNT(Bibliotheque.BIB_ID) <> @Bib_Id))

	--Test du nombre d'emprunt
	IF(@EmpruntBibAnnexe + @EmpruntBibPrincipale > 5 OR @EmpruntBibAnnexe > 3)
	BEGIN
		RAISERROR('vous avez emprunté trop de livres',15,0)
		ROLLBACK
	END
END



GO
ALTER TABLE [dbo].[Emprunt] ENABLE TRIGGER [TR_MaxEmprunt]
GO
/****** Object:  Trigger [dbo].[TR_MaxRetard]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Farid ID BOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<TRIGGER QUI EMPECHE L'INSERTION D'UN EMPRUNT DONT L'EXEMPLAIRE N'EST PAS DISPONIBLE>
-- =============================================
CREATE TRIGGER [dbo].[TR_MaxRetard]
   ON [dbo].[Emprunt]
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Lec_Id int

	--recup de l'id du lecteur qui fait l'emprunt ainsi que l'id du livre
	select @Lec_Id = LEC_Id FROM inserted

	--recherche si il y a plus de 2 exemplaires de retard pour ce lecteur
	IF((SELECT        COUNT(EMP_Id) AS [Nombre Emprunt]
		FROM            Emprunt
		WHERE        (DATEDIFF(DAY, GETDATE(), EMP_DateEmprunt) > 10)
		GROUP BY EMP_DateRetour, LEC_Id
		HAVING        (EMP_DateRetour IS NULL) AND (LEC_Id = @Lec_Id)) >= 2)

	BEGIN
		RAISERROR('Vous ne pouvez pas emprunter de livre tant que vous n''avez pas reglé vos retards',15,0)
		ROLLBACK
	END

END




GO
ALTER TABLE [dbo].[Emprunt] ENABLE TRIGGER [TR_MaxRetard]
GO
/****** Object:  Trigger [dbo].[TR_NoInsertExemplaireIndisponible]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Farid ID BOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<TRIGGER QUI EMPECHE L'INSERTION D'UN EMPRUNT DONT L'EXEMPLAIRE N'EST PAS DISPONIBLE>
-- =============================================
CREATE TRIGGER [dbo].[TR_NoInsertExemplaireIndisponible]
   ON [dbo].[Emprunt]
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Disponibilité bit
	
	SELECT @Disponibilité =  Exemplaire.EXE_Indisponible
	FROM   Emprunt, Exemplaire, inserted
    WHERE  Emprunt.EXE_Id = Exemplaire.EXE_Id
		AND Emprunt.EXE_Id = inserted.EXE_Id
    
	IF(@Disponibilité=1)
	BEGIN	
		RAISERROR ('Emprunt impossible, exemplaire indisponible',15,0)
	ROLLBACK
	END
	
END



GO
ALTER TABLE [dbo].[Emprunt] ENABLE TRIGGER [TR_NoInsertExemplaireIndisponible]
GO
/****** Object:  Trigger [dbo].[TR_NoInsertDoubleReservation]    Script Date: 08-Jan-17 17:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Farid IDBOURHIM, Simon ENCEV>
-- Create date: <28/12/2016>
-- Description:	<TRIGGER QUI EMPECHE L"INSERTION D"UNE DOUBLE RESERVATION POUR LE MEME LECTEUR POUR LE MEME LIVRE ET LE MEME JOUR >
-- =============================================
CREATE TRIGGER [dbo].[TR_NoInsertDoubleReservation] 
   ON  [dbo].[Reservation]
   FOR INSERT
AS 
BEGIN
	DECLARE @LectId int, @LivId int, @NbEmprunt int
	SELECT @LectId = LEC_Id FROM INSERTED 
	SELECT @LivId = LIV_Id FROM INSERTED

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SET @NbEmprunt =(
	SELECT COUNT(RES_Id) FROM Reservation WHERE Reservation.LEC_Id = @LectId AND Reservation.LIV_Id = @LivId AND Reservation.RES_Supprimee = 0
    )

	IF ( @NbEmprunt > 1)
	BEGIN
		RAISERROR ('Action impossible, vous avez déjà reservé ce livre',15,0)
		ROLLBACK
	END

END




GO
ALTER TABLE [dbo].[Reservation] ENABLE TRIGGER [TR_NoInsertDoubleReservation]
GO
USE [master]
GO
ALTER DATABASE [SGBD2016_Bibliotheque] SET  READ_WRITE 
GO
