USE [SGBD2016_Bibliotheque]
GO
SET IDENTITY_INSERT [dbo].[Bibliotheque] ON 

INSERT [dbo].[Bibliotheque] ([BIB_ID], [BIB_Code], [BIB_Libelle], [BIB_Adresse], [BIB_Ville], [BIB_CodePostal]) VALUES (2, N'BRU_01', N'Bruxelles Centre', N'Rue du perdu, n°404', N'Bruxelles', 1000)
INSERT [dbo].[Bibliotheque] ([BIB_ID], [BIB_Code], [BIB_Libelle], [BIB_Adresse], [BIB_Ville], [BIB_CodePostal]) VALUES (3, N'BRU_02', N'Bruxelles Sud', N'Rue du retrouvé, n° 1', N'Bruxelles', 1180)
INSERT [dbo].[Bibliotheque] ([BIB_ID], [BIB_Code], [BIB_Libelle], [BIB_Adresse], [BIB_Ville], [BIB_CodePostal]) VALUES (5, N'NAM_01', N'Namur Centre', N'Avenue Baltazar, n°666', N'Namur', 5000)
INSERT [dbo].[Bibliotheque] ([BIB_ID], [BIB_Code], [BIB_Libelle], [BIB_Adresse], [BIB_Ville], [BIB_CodePostal]) VALUES (6, N'CHAR_01', N'Charleroi Sud', N'Boulevard de la Gare, n°4', N'Charleroi', 6000)
SET IDENTITY_INSERT [dbo].[Bibliotheque] OFF
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
SET IDENTITY_INSERT [dbo].[Administrateuf] ON 

INSERT [dbo].[Administrateuf] ([ADM_Id], [ADM_UserName], [ADM_Password]) VALUES (1, N'toto', N'toto')
INSERT [dbo].[Administrateuf] ([ADM_Id], [ADM_UserName], [ADM_Password]) VALUES (2, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[Administrateuf] OFF
