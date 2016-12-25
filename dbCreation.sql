USE [master]
GO

/****** Object:  Database [Bibliotheque]    Script Date: 25-12-16 13:13:52 ******/
CREATE DATABASE [Bibliotheque]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bibliotheque', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Bibliotheque.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bibliotheque_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Bibliotheque_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE [Bibliotheque] SET COMPATIBILITY_LEVEL = 130
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bibliotheque].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Bibliotheque] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Bibliotheque] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Bibliotheque] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Bibliotheque] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Bibliotheque] SET ARITHABORT OFF 
GO

ALTER DATABASE [Bibliotheque] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Bibliotheque] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Bibliotheque] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Bibliotheque] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Bibliotheque] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Bibliotheque] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Bibliotheque] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Bibliotheque] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Bibliotheque] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Bibliotheque] SET  ENABLE_BROKER 
GO

ALTER DATABASE [Bibliotheque] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Bibliotheque] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Bibliotheque] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Bibliotheque] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Bibliotheque] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Bibliotheque] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Bibliotheque] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Bibliotheque] SET RECOVERY FULL 
GO

ALTER DATABASE [Bibliotheque] SET  MULTI_USER 
GO

ALTER DATABASE [Bibliotheque] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Bibliotheque] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Bibliotheque] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Bibliotheque] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [Bibliotheque] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Bibliotheque] SET QUERY_STORE = OFF
GO

USE [Bibliotheque]
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

ALTER DATABASE [Bibliotheque] SET  READ_WRITE 
GO


