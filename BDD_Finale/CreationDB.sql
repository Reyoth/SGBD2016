/*------------------------------------------------------------
*        Script SQLSERVER 
------------------------------------------------------------*/
CREATE DATABASE SGBD2016_Bibliotheque
GO

/*------------------------------------------------------------
-- Table: Lecteur
------------------------------------------------------------*/
CREATE TABLE Lecteur(
	LEC_Id              INT IDENTITY (1,1) NOT NULL ,
	LEC_Nom             VARCHAR (25) NOT NULL UNIQUE,
	LEC_Prenom          VARCHAR (25) NOT NULL UNIQUE,
	LEC_Sexe            CHAR (25)  NOT NULL ,
	LEC_DateDeNaissance VARCHAR (25) NOT NULL ,
	LEC_Adresse         VARCHAR (250)  ,
	LEC_Ville           VARCHAR (25) NOT NULL ,
	LEC_CodePostal      INT  NOT NULL ,
	LEC_UserName        VARCHAR (50) NOT NULL UNIQUE,
	LEC_Password        VARCHAR (50) NOT NULL ,
	BIB_ID              INT  NOT NULL ,
	CONSTRAINT prk_constraint_Lecteur PRIMARY KEY NONCLUSTERED (LEC_Id)
);


/*------------------------------------------------------------
-- Table: Bibliothèque
------------------------------------------------------------*/
CREATE TABLE Bibliotheque(
	BIB_ID         INT IDENTITY (1,1) NOT NULL ,
	BIB_Code       VARCHAR (25) NOT NULL UNIQUE,
	BIB_Libelle    VARCHAR (25) NOT NULL UNIQUE,
	BIB_Adresse    VARCHAR (250)  ,
	BIB_Ville      VARCHAR (25) NOT NULL ,
	BIB_CodePostal INT  NOT NULL ,
	CONSTRAINT prk_constraint_Bibliotheque PRIMARY KEY NONCLUSTERED (BIB_ID)
);


/*------------------------------------------------------------
-- Table: Tarif
------------------------------------------------------------*/
CREATE TABLE Tarif(
	TAR_Id               INT IDENTITY (1,1) NOT NULL ,
	TAR_AnneeApplication INT  NOT NULL ,
	TAR_Retard           DECIMAL (25,0)  NOT NULL ,
	TAR_Emprunt          DECIMAL (25,0)  NOT NULL ,
	BIB_ID               INT  NOT NULL ,
	CONSTRAINT prk_constraint_Tarif PRIMARY KEY NONCLUSTERED (TAR_Id)
);


/*------------------------------------------------------------
-- Table: Réservation
------------------------------------------------------------*/
CREATE TABLE Reservation(
	RES_Id              INT IDENTITY (1,1) NOT NULL ,
	RES_DateReservation DATETIME NOT NULL ,
	RES_Supprimee       bit   ,
	LEC_Id              INT  NOT NULL ,
	LIV_Id              INT  NOT NULL ,
	CONSTRAINT prk_constraint_Reservation PRIMARY KEY NONCLUSTERED (RES_Id)
);


/*------------------------------------------------------------
-- Table: Emprunt
------------------------------------------------------------*/
CREATE TABLE Emprunt(
	EMP_Id          INT IDENTITY (1,1) NOT NULL ,
	EMP_DateEmprunt DATETIME NOT NULL ,
	EMP_DateRetour  DATETIME NOT NULL ,
	EMP_MontantPaye DECIMAL (25,0)   ,
	EXE_Id          INT  NOT NULL ,
	LEC_Id          INT  NOT NULL ,
	CONSTRAINT prk_constraint_Emprunt PRIMARY KEY NONCLUSTERED (EMP_Id)
);


/*------------------------------------------------------------
-- Table: Exemplaire
------------------------------------------------------------*/
CREATE TABLE Exemplaire(
	EXE_Id           INT IDENTITY (1,1) NOT NULL ,
	EXE_Code         VARCHAR (20) NOT NULL UNIQUE,
	EXE_DateAchat    VARCHAR (25) NOT NULL ,
	EXE_Indisponible bit   ,
	BIB_ID           INT  NOT NULL ,
	LIV_Id           INT  NOT NULL ,
	CONSTRAINT prk_constraint_Exemplaire PRIMARY KEY NONCLUSTERED (EXE_Id)
);


/*------------------------------------------------------------
-- Table: Livre
------------------------------------------------------------*/
CREATE TABLE Livre(
	LIV_Id    INT IDENTITY (1,1) NOT NULL ,
	LIV_ISBN  VARCHAR (50) NOT NULL UNIQUE,
	LIV_Titre VARCHAR (50) NOT NULL UNIQUE,
	LIV_Image VARBINARY(MAX)   ,
	CONSTRAINT prk_constraint_Livre PRIMARY KEY NONCLUSTERED (LIV_Id)
);


/*------------------------------------------------------------
-- Table: Auteur
------------------------------------------------------------*/
CREATE TABLE Auteur(
	AUT_Id              INT IDENTITY (1,1) NOT NULL ,
	AUT_Nom             VARCHAR (25) NOT NULL UNIQUE,
	AUT_Prenom          VARCHAR (25) NOT NULL UNIQUE,
	AUT_DateDeNaissance DATETIME NOT NULL ,
	CONSTRAINT prk_constraint_Auteur PRIMARY KEY NONCLUSTERED (AUT_Id)
);


/*------------------------------------------------------------
-- Table: Administrateuf
------------------------------------------------------------*/
CREATE TABLE Administrateuf(
	ADM_Id       INT IDENTITY (1,1) NOT NULL ,
	ADM_UserName VARCHAR (50) NOT NULL UNIQUE,
	ADM_Password VARCHAR (50) NOT NULL ,
	CONSTRAINT prk_constraint_Administrateuf PRIMARY KEY NONCLUSTERED (ADM_Id)
);


/*------------------------------------------------------------
-- Table: Ecrire
------------------------------------------------------------*/
CREATE TABLE Ecrire(
	LIV_Id INT  NOT NULL ,
	AUT_Id INT  NOT NULL ,
	CONSTRAINT prk_constraint_Ecrire PRIMARY KEY NONCLUSTERED (LIV_Id,AUT_Id)
);



ALTER TABLE Lecteur ADD CONSTRAINT FK_Lecteur_BIB_ID FOREIGN KEY (BIB_ID) REFERENCES Bibliotheque(BIB_ID);
ALTER TABLE Tarif ADD CONSTRAINT FK_Tarif_BIB_ID FOREIGN KEY (BIB_ID) REFERENCES Bibliotheque(BIB_ID);
ALTER TABLE Reservation ADD CONSTRAINT FK_Reservation_LEC_Id FOREIGN KEY (LEC_Id) REFERENCES Lecteur(LEC_Id);
ALTER TABLE Reservation ADD CONSTRAINT FK_Reservation_LIV_Id FOREIGN KEY (LIV_Id) REFERENCES Livre(LIV_Id);
ALTER TABLE Emprunt ADD CONSTRAINT FK_Emprunt_EXE_Id FOREIGN KEY (EXE_Id) REFERENCES Exemplaire(EXE_Id);
ALTER TABLE Emprunt ADD CONSTRAINT FK_Emprunt_LEC_Id FOREIGN KEY (LEC_Id) REFERENCES Lecteur(LEC_Id);
ALTER TABLE Exemplaire ADD CONSTRAINT FK_Exemplaire_BIB_ID FOREIGN KEY (BIB_ID) REFERENCES Bibliotheque(BIB_ID);
ALTER TABLE Exemplaire ADD CONSTRAINT FK_Exemplaire_LIV_Id FOREIGN KEY (LIV_Id) REFERENCES Livre(LIV_Id);
ALTER TABLE Ecrire ADD CONSTRAINT FK_Ecrire_LIV_Id FOREIGN KEY (LIV_Id) REFERENCES Livre(LIV_Id);
ALTER TABLE Ecrire ADD CONSTRAINT FK_Ecrire_AUT_Id FOREIGN KEY (AUT_Id) REFERENCES Auteur(AUT_Id);
