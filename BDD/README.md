# ---------- STORED FUNCTIONS ----------------

### COTE LOGIN #
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
- [x] ~~EXE_RetournerExemplaire~~

### COTE LECTEUR #
- [x] ~~RES_ListeReservationsByLEC_Id~~
- [x] ~~RES_ReserverLivre~~
- [x] ~~LIV_LivreByISBN~~
- [x] ~~LIV_LivreByTitle~~
- [x] ~~EXE_EmprunterExemplaire~~ etsupprime les reservations liées automatiquement 
- [x] ~~EMP_AllEmpruntsByLEC_Id~~
- [x] ~~EMP_ListeREtardsByLEC_Id~~
- [x] ~~RES_ListeReservationsDisponibleByLEC_Id~~ liste des livres reservés par lecteur et leurs disponibilités.

# ---------- STORED TRIGGERS ----------------
- [x] ~~Trigger qui empeche l'insersion d'un emprunt d'un exemplaire de livre indisponible.~~
- [x] ~~Trigger qui empeche une double reservation d'un livre le meme jour.~~
 
