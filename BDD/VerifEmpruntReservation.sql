SELECT        Lecteur.LEC_Id, Lecteur.LEC_Nom, Lecteur.LEC_Prenom, Exemplaire.EXE_Id, Exemplaire.EXE_Code, Emprunt.EMP_Id, Emprunt.EMP_DateEmprunt,Emprunt.EMP_DateRetour, Livre.LIV_Id, Livre.LIV_ISBN
FROM            Lecteur INNER JOIN
                         Emprunt ON Lecteur.LEC_Id = Emprunt.LEC_Id INNER JOIN
                         Exemplaire ON Emprunt.EXE_Id = Exemplaire.EXE_Id INNER JOIN
                         Livre ON Exemplaire.LIV_Id = Livre.LIV_Id


SELECT        Lecteur.LEC_Id, Lecteur.LEC_Nom, Lecteur.LEC_Prenom, Reservation.RES_Id, Reservation.RES_DateReservation, Reservation.RES_Supprimee, Livre.LIV_Id, Livre.LIV_ISBN
FROM            Lecteur INNER JOIN
                         Reservation ON Lecteur.LEC_Id = Reservation.LEC_Id INNER JOIN
                         Livre ON Reservation.LIV_Id = Livre.LIV_Id
						 WHERE RES_Supprimee = 0

select * from Exemplaire