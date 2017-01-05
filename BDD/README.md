# ---------- STORED FUNCTIONS ----------------

### COTE LOGIN #
- [x] ~~LEC_CheckLogin~~
- [x] ~~ADM_CheckLogin~~.

# ---------- STORED PRCEDURES ----------------

### COTE ADMINISTRATEUR #
- [x] ~~ADM_Login~~
- [x] ~~EXE_AllExemplaireByLIV_Id~~
- [x] ~~EXE_AllExemplaireBIB_Id~~ Remplacer LIV_Id par le titre du livre et BIB_Id par le libelle
- [x] ~~EXE_CreerExemplaire~~
- [x] LIV_InsererLivre
- [x] ~~EMP_AllEmpruntsAllBib~~
- [x] ~~EMP_AllEmpruntsByBIB_Id~~
- [ ] procedure qui affiche les emprunts coutrants pour cote administrateur.
- [x] ~~EMP_ListeRetardatairesAllBib~~
- [x] ~~EMP_ListeRetardatairesByBIB_Id~~
- [x] ~~EXE_RetournerExemplaire~~



### COTE LECTEUR #
- [x] ~~LEC_Login~~
- [x] ~~BIB_AllLibelle procedure qui affiche les libelles de toute les biliotheques pour la liste des biblio de login~~
- [x] ~~RES_ListeReservationsByLEC_Id~~
- [x] ~~RES_ReserverLivre~~
- [x] ~~LIV_LivreByISBN~~
- [x] ~~LIV_LivreByTitle~~
- [x] ~~EXE_EmprunterExemplaire~~ etsupprime les reservations liées automatiquement 
- [x] ~~EMP_AllEmpruntsByLEC_Id~~
- [x] ~~EMP_RetardaresAllBibByLec~~
- [x] ~~RES_ListeReservationsDisponibleByLEC_Id~~ liste des livres reservés par lecteur et leurs disponibilités.

# ---------- STORED TRIGGERS ----------------
- [x] ~~Trigger qui empeche l'insersion d'un emprunt d'un exemplaire de livre indisponible.~~
- [x] ~~Trigger qui empeche une double reservation d'un livre le meme jour.~~
- [x] ~~trigger qui empeche d'empunter plus que 5 exemplaire dala bibliotheque pricipale et 3 dans la bibliotheque annexe.~~
