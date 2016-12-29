# ---------- STORED FUNCTIONS ----------------

### COTE LGIN #
- [x] ~~LEC_CheckLogin~~
- [x] ~~ADM_CheckLogin~~

# ---------- STORED PRCEDURES ----------------

### COTE ADMINISTRATEUR #
- [x] ~~EXE_AllExemplaireByLIV_Id~~
- [x] ~~EXE_AllExemplaireBIB_Id~~
- [x] ~~EXE_CreerExemplaire~~
- [x] ~~LIV_InsererLivre~~
- [x] ~~EMP_AllEmpruntsAllBib~~
- [x] ~~EMP_AllEmpruntsByBIB_Id~~
- [x] ~~EMP_ListeRetardatairesAllBib~~
- [x] ~~EMP_ListeRetardatairesByBIB_Id~~
- [x] ~~EXE_RetournerExempplaire~~

### COTE LECTEUR #
- [x] ~~RES_ListeReservationsByLEC_Id~~
- [x] ~~RES_ReserverLivre~~
- [x] ~~LIV_LivreByISBN~~
- [x] ~~LIV_LivreByTitle~~
- [x] ~~EXE_EmprunterExemplaire~~
- [x] ~~EMP_AllEmpruntsByLEC_Id~~
- [x] ~~EMP_ListeREtardsByLEC_Id~~
- [ ] procedure qui affiche liste des livres reservés et donne leurs disponibilité.

# ---------- STORED TRIGGERS ----------------
- [ ] Trigger qui, lors de l'emprunt d'un livre, verifie si il a eu reservation et la supprime.
- [x] ~~Trigger qui empeche l'insersion d'un emprunt d'un exemplaire de livre indisponible.~~
- [x] ~~Trigger qui empeche une double reservation d'un livre le meme jour.~~
 
