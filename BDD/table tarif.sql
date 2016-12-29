USE [SGBD2016_Bibliotheque]
GO

ALTER TABLE [dbo].[Tarif] DROP CONSTRAINT [FK_Tarif_BIB_ID]
GO

/****** Object:  Table [dbo].[Tarif]    Script Date: 29-12-16 21:29:15 ******/
DROP TABLE [dbo].[Tarif]
GO

/****** Object:  Table [dbo].[Tarif]    Script Date: 29-12-16 21:29:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tarif](
	[TAR_Id] [int] IDENTITY(1,1) NOT NULL,
	[TAR_AnneeApplication] [int] NOT NULL,
	[TAR_Emprunt] [decimal](4, 2) NOT NULL,
	[TAR_Retard] [decimal](4, 2) NOT NULL,
	[BIB_ID] [int] NOT NULL,
 CONSTRAINT [prk_constraint_Tarif] PRIMARY KEY NONCLUSTERED 
(
	[TAR_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Tarif]  WITH CHECK ADD  CONSTRAINT [FK_Tarif_BIB_ID] FOREIGN KEY([BIB_ID])
REFERENCES [dbo].[Bibliotheque] ([BIB_ID])
GO

ALTER TABLE [dbo].[Tarif] CHECK CONSTRAINT [FK_Tarif_BIB_ID]
GO


