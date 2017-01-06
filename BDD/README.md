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
- [x] ~~LIV_AjoutLivre~~
- [x] ~~EMP_AllEmpruntsAllBib~~
- [x] ~~EMP_AllEmpruntsByBIB_Id~~
- [ ] ~~procedure qui affiche les emprunts coutrants pour cote administrateur.~~
- [x] ~~EMP_ListeRetardatairesAllBib~~
- [x] ~~EMP_ListeRetardatairesByBIB_Id~~
- [x] ~~EXE_RetournerExemplaire~~
- [ ] LIV_UpdateLivre (@ISBN Nvarchar(13))(Met a jour un livre atravers l'ISBN qui passe en param) l update se fait sur les champs ISBN, Titre, Image, Auteur,puisque l'auteur sera dans la table livre,
- [ ] LEC_UpdateLecteur (@Username nvarchar(50)) Met a jour un lecteur a traver le username passé en param, 
- [ ] EXE_UpdateExemplaire (@Code nvarchar (50)) met a jour un exemplaire a travers son code unique.


### COTE LECTEUR #

 - [ ]  !!!!! Procedure : Modifier EXE_AllExemplaireByBibId en  EXE_AllExemplairesDispoByBibId (input: Id de biblio) (output : IdExemplaire,                TitreLivre, ISBNLivre, CodeExemplaire, Auteurs, Bibliotheque )
 - [ ]  !!!!! Procedure : Modifier EXE_AllExemplaireByTitle en  EXE_AllExemplairesDispoByTitle (input: titre du livre) (output : IdExemplaire,         TitreLivre, ISBNLivre, CodeExemplaire, Auteurs, Bibliotheque ) 
  - [ ]  !!!!! Procedure : Modifier EXE_AllExemplaireByISBN en  EXE_AllExemplairesDispoByISBN (input: ISBN du livre) (output : IdExemplaire,          TitreLivre, ISBNLivre, CodeExemplaire, Auteurs, Bibliotheque ) 
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
