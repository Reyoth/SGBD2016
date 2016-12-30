USE [master]
GO
/****** Object:  Database [SGBD2016_Bibliotheque]    Script Date: 30-Dec-16 14:22:27 ******/
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
/****** Object:  UserDefinedFunction [dbo].[ADM_CheckLogin]    Script Date: 30-Dec-16 14:22:28 ******/
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
/****** Object:  UserDefinedFunction [dbo].[EMP_CalculMontantRetard]    Script Date: 30-Dec-16 14:22:28 ******/
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
/****** Object:  UserDefinedFunction [dbo].[LEC_CheckLogin]    Script Date: 30-Dec-16 14:22:28 ******/
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
/****** Object:  Table [dbo].[Administrateuf]    Script Date: 30-Dec-16 14:22:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrateuf](
	[ADM_Id] [int] IDENTITY(1,1) NOT NULL,
	[ADM_UserName] [varchar](50) NOT NULL,
	[ADM_Password] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Auteur]    Script Date: 30-Dec-16 14:22:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auteur](
	[AUT_Id] [int] IDENTITY(1,1) NOT NULL,
	[AUT_Nom] [varchar](25) NOT NULL,
	[AUT_Prenom] [varchar](25) NOT NULL,
	[AUT_DateDeNaissance] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bibliotheque]    Script Date: 30-Dec-16 14:22:28 ******/
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
	[BIB_CodePostal] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ecrire]    Script Date: 30-Dec-16 14:22:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ecrire](
	[LIV_Id] [int] NOT NULL,
	[AUT_Id] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Emprunt]    Script Date: 30-Dec-16 14:22:28 ******/
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
	[LEC_Id] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exemplaire]    Script Date: 30-Dec-16 14:22:28 ******/
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
	[LIV_Id] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lecteur]    Script Date: 30-Dec-16 14:22:28 ******/
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
	[BIB_ID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Livre]    Script Date: 30-Dec-16 14:22:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Livre](
	[LIV_Id] [int] IDENTITY(1,1) NOT NULL,
	[LIV_ISBN] [varchar](50) NOT NULL,
	[LIV_Titre] [varchar](50) NOT NULL,
	[LIV_Image] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 30-Dec-16 14:22:28 ******/
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
/****** Object:  Table [dbo].[Tarif]    Script Date: 30-Dec-16 14:22:28 ******/
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
SET IDENTITY_INSERT [dbo].[Administrateuf] ON 

INSERT [dbo].[Administrateuf] ([ADM_Id], [ADM_UserName], [ADM_Password]) VALUES (1, N'toto', N'toto')
INSERT [dbo].[Administrateuf] ([ADM_Id], [ADM_UserName], [ADM_Password]) VALUES (2, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[Administrateuf] OFF
SET IDENTITY_INSERT [dbo].[Bibliotheque] ON 

INSERT [dbo].[Bibliotheque] ([BIB_ID], [BIB_Code], [BIB_Libelle], [BIB_Adresse], [BIB_Ville], [BIB_CodePostal]) VALUES (2, N'BRU_01', N'Bruxelles Centre', N'Rue du perdu, n°404', N'Bruxelles', 1000)
INSERT [dbo].[Bibliotheque] ([BIB_ID], [BIB_Code], [BIB_Libelle], [BIB_Adresse], [BIB_Ville], [BIB_CodePostal]) VALUES (3, N'BRU_02', N'Bruxelles Sud', N'Rue du retrouvé, n° 1', N'Bruxelles', 1180)
INSERT [dbo].[Bibliotheque] ([BIB_ID], [BIB_Code], [BIB_Libelle], [BIB_Adresse], [BIB_Ville], [BIB_CodePostal]) VALUES (5, N'NAM_01', N'Namur Centre', N'Avenue Baltazar, n°666', N'Namur', 5000)
INSERT [dbo].[Bibliotheque] ([BIB_ID], [BIB_Code], [BIB_Libelle], [BIB_Adresse], [BIB_Ville], [BIB_CodePostal]) VALUES (6, N'CHAR_01', N'Charleroi Sud', N'Boulevard de la Gare, n°4', N'Charleroi', 6000)
SET IDENTITY_INSERT [dbo].[Bibliotheque] OFF
SET IDENTITY_INSERT [dbo].[Exemplaire] ON 

INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (1, N'AED_01', N'1/1/2000', 0, 2, 3)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (2, N'AED_02', N'1/1/2000', 0, 2, 3)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (3, N'AED_03', N'1/1/2000', 0, 2, 3)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (4, N'AED_04', N'1/1/2000', 0, 5, 3)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (5, N'AED_05', N'1/1/2000', 0, 3, 3)
INSERT [dbo].[Exemplaire] ([EXE_Id], [EXE_Code], [EXE_DateAchat], [EXE_Indisponible], [BIB_ID], [LIV_Id]) VALUES (6, N'CI_01', N'1/1/2011', 0, 5, 4)
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
SET IDENTITY_INSERT [dbo].[Exemplaire] OFF
SET IDENTITY_INSERT [dbo].[Lecteur] ON 

INSERT [dbo].[Lecteur] ([LEC_Id], [LEC_Nom], [LEC_Prenom], [LEC_Sexe], [LEC_DateDeNaissance], [LEC_Adresse], [LEC_Ville], [LEC_CodePostal], [LEC_UserName], [LEC_Password], [BIB_ID]) VALUES (1, N'Encev', N'Simon', N'M                        ', N'1/1/1985', N'Rue du bois, n°5', N'Bruxelles', 1000, N'simon', N'simon', 2)
INSERT [dbo].[Lecteur] ([LEC_Id], [LEC_Nom], [LEC_Prenom], [LEC_Sexe], [LEC_DateDeNaissance], [LEC_Adresse], [LEC_Ville], [LEC_CodePostal], [LEC_UserName], [LEC_Password], [BIB_ID]) VALUES (2, N'ID Bourhim', N'Farid', N'M                        ', N'1/12/1983', N'Rue de l''aiguille, n°37', N'Bruxelles', 1070, N'farid', N'farid', 3)
INSERT [dbo].[Lecteur] ([LEC_Id], [LEC_Nom], [LEC_Prenom], [LEC_Sexe], [LEC_DateDeNaissance], [LEC_Adresse], [LEC_Ville], [LEC_CodePostal], [LEC_UserName], [LEC_Password], [BIB_ID]) VALUES (3, N'Jonckers', N'Etienne', N'F                        ', N'1/1/1800', N'Avenue de la chevre, n°1', N'Namur', 5000, N'etienne', N'etienne', 5)
SET IDENTITY_INSERT [dbo].[Lecteur] OFF
SET IDENTITY_INSERT [dbo].[Livre] ON 

INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image]) VALUES (3, N'9783838705927', N'Ange et Demon', N'https://www.google.com/imgres?imgurl=http://t3.gstatic.com/images%3Fq%3Dtbn:ANd9GcQYxHPw9gHnmDHa_E6qBqPiKI-LcpHGtVjHopJBQz1wslw3FgB9&imgrefurl=http://books.google.com/books/about/Angels_And_Demons.html%3Fid%3Dd5xgYw4Ts0gC%26source%3Dkp_cover&h=1080&w=692&tbnid=57ksL8CrCCACHM:&vet=1&tbnh=160&tbnw=102&docid=Hnk_vGfumALfKM&itg=1&usg=__XqXQGKnfMSnGZtxyVQqJx73U8ro=&sa=X&ved=0ahUKEwi23Puu95vRAhVJNFAKHV5NC78Q_B0IvgEwBw')
INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image]) VALUES (4, N'9782226193506', N'Le chemin invisible', N'https://www.maxilivres.fr/6912-large_default/grimpow-le-chemin-invisible-romans.jpg')
INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image]) VALUES (5, N'9782253126379', N'Toubib or not Toubib', N'http://t3.gstatic.com/images?q=tbn:ANd9GcRNoDoAyfdr-bRDAgG6dswb5KEeePPPr4gv088CqgP8vaT72qa9')
INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image]) VALUES (6, N'9782702140864', N'Soirée Sushi', N'http://www.agnesabecassis.com/wp-content/uploads/2010/02/soir%C3%A9e-sushi-grand.jpg')
INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image]) VALUES (7, N'9782070639564', N'Super Hero en Plâtre', N'http://media.paperblog.fr/i/526/5265993/akissi-super-heros-platre-L-DwB9iX.jpeg')
INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image]) VALUES (8, N'9782258114821', N'Ma grand-mère vous passe le bonjour', N'http://extranet.editis.com/it-yonixweb/IMAGES/PC/P3/9782258114821.jpg')
INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image]) VALUES (9, N'9782714454065', N'D''eau et de feu', N'http://extranet.editis.com/it-yonixweb/IMAGES/BLF/P3/9782714454065.jpg')
INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image]) VALUES (10, N'9782714445643', N'Mano a mano', N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ-i1ITSTKEM96ymWzGhMFtlMGtee6kEWXQp96r4TST6uzRKRh0')
INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image]) VALUES (11, N'9782080707475', N'Le Livre de la Jungle', N'https://d2t3xdwbh1v8qy.cloudfront.net/content/B007G6AEF2/resources/39353073')
INSERT [dbo].[Livre] ([LIV_Id], [LIV_ISBN], [LIV_Titre], [LIV_Image]) VALUES (12, N'9782714445209', N'Sans regrets', N'http://www.babelio.com/couv/bm_CVT_Sans-regrets_3168.jpg')
SET IDENTITY_INSERT [dbo].[Livre] OFF
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
/****** Object:  Index [prk_constraint_Administrateuf]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Administrateuf] ADD  CONSTRAINT [prk_constraint_Administrateuf] PRIMARY KEY NONCLUSTERED 
(
	[ADM_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Administ__995EDA7F5DAAD4A5]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Administrateuf] ADD UNIQUE NONCLUSTERED 
(
	[ADM_UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Auteur]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Auteur] ADD  CONSTRAINT [prk_constraint_Auteur] PRIMARY KEY NONCLUSTERED 
(
	[AUT_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Auteur__3298214464E34289]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Auteur] ADD UNIQUE NONCLUSTERED 
(
	[AUT_Prenom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Auteur__644196A2F4BDDE0E]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Auteur] ADD UNIQUE NONCLUSTERED 
(
	[AUT_Nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Bibliotheque]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Bibliotheque] ADD  CONSTRAINT [prk_constraint_Bibliotheque] PRIMARY KEY NONCLUSTERED 
(
	[BIB_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Biblioth__4DC5946CE3A9F299]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Bibliotheque] ADD UNIQUE NONCLUSTERED 
(
	[BIB_Libelle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Biblioth__E906647FCD714EA8]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Bibliotheque] ADD UNIQUE NONCLUSTERED 
(
	[BIB_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Ecrire]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Ecrire] ADD  CONSTRAINT [prk_constraint_Ecrire] PRIMARY KEY NONCLUSTERED 
(
	[LIV_Id] ASC,
	[AUT_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Emprunt]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Emprunt] ADD  CONSTRAINT [prk_constraint_Emprunt] PRIMARY KEY NONCLUSTERED 
(
	[EMP_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Exemplaire]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Exemplaire] ADD  CONSTRAINT [prk_constraint_Exemplaire] PRIMARY KEY NONCLUSTERED 
(
	[EXE_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Exemplai__96E9CA7F569BC017]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Exemplaire] ADD UNIQUE NONCLUSTERED 
(
	[EXE_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Lecteur]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Lecteur] ADD  CONSTRAINT [prk_constraint_Lecteur] PRIMARY KEY NONCLUSTERED 
(
	[LEC_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Lecteur__0E72E8B283DC6479]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Lecteur] ADD UNIQUE NONCLUSTERED 
(
	[LEC_Prenom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Lecteur__7150BA5674BCB956]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Lecteur] ADD UNIQUE NONCLUSTERED 
(
	[LEC_UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Lecteur__9B0826375645F0C9]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Lecteur] ADD UNIQUE NONCLUSTERED 
(
	[LEC_Nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Livre]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Livre] ADD  CONSTRAINT [prk_constraint_Livre] PRIMARY KEY NONCLUSTERED 
(
	[LIV_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Livre__CC8910BF1E44F6CD]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Livre] ADD  CONSTRAINT [UQ__Livre__CC8910BF1E44F6CD] UNIQUE NONCLUSTERED 
(
	[LIV_ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Livre__E5A60452D623BC08]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Livre] ADD  CONSTRAINT [UQ__Livre__E5A60452D623BC08] UNIQUE NONCLUSTERED 
(
	[LIV_Titre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Reservation]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Reservation] ADD  CONSTRAINT [prk_constraint_Reservation] PRIMARY KEY NONCLUSTERED 
(
	[RES_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Tarif]    Script Date: 30-Dec-16 14:22:28 ******/
ALTER TABLE [dbo].[Tarif] ADD  CONSTRAINT [prk_constraint_Tarif] PRIMARY KEY NONCLUSTERED 
(
	[TAR_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
/****** Object:  StoredProcedure [dbo].[EMP_AllEmpruntsAllBib]    Script Date: 30-Dec-16 14:22:28 ******/
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
/****** Object:  StoredProcedure [dbo].[EMP_AllEmpruntsByBIB_Id]    Script Date: 30-Dec-16 14:22:28 ******/
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
/****** Object:  StoredProcedure [dbo].[EMP_AllEmpruntsByLEC_Id]    Script Date: 30-Dec-16 14:22:28 ******/
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
/****** Object:  StoredProcedure [dbo].[EMP_ListeRetardatairesAllBib]    Script Date: 30-Dec-16 14:22:28 ******/
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
/****** Object:  StoredProcedure [dbo].[EXE_AllExemplaireBIB_Id]    Script Date: 30-Dec-16 14:22:28 ******/
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
/****** Object:  StoredProcedure [dbo].[EXE_AllExemplaireByLIV_Id]    Script Date: 30-Dec-16 14:22:28 ******/
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
/****** Object:  StoredProcedure [dbo].[EXE_CreerExemplaire]    Script Date: 30-Dec-16 14:22:28 ******/
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
/****** Object:  StoredProcedure [dbo].[EXE_EmprunterExemplaire]    Script Date: 30-Dec-16 14:22:28 ******/
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
/****** Object:  StoredProcedure [dbo].[EXE_RetournerExempplaire]    Script Date: 30-Dec-16 14:22:28 ******/
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
/****** Object:  StoredProcedure [dbo].[LIV_LivreByISBN]    Script Date: 30-Dec-16 14:22:28 ******/
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
/****** Object:  StoredProcedure [dbo].[LIV_LivreByTitle]    Script Date: 30-Dec-16 14:22:28 ******/
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
/****** Object:  StoredProcedure [dbo].[RES_ListeReservationsByLEC_Id]    Script Date: 30-Dec-16 14:22:28 ******/
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
/****** Object:  StoredProcedure [dbo].[RES_ListeReservationsDisponibleByLEC_Id]    Script Date: 30-Dec-16 14:22:28 ******/
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
/****** Object:  StoredProcedure [dbo].[RES_ReserverLivre]    Script Date: 30-Dec-16 14:22:28 ******/
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
