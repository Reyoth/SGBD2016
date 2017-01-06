# ---------- TO DO ----------------

- [x] ~~Binding sql Users -------> schemas execute only~~
- [x] ~~Créer les schémas.~~
- [x] ~~Connecxions à la DB.~~
- [ ] Créer les couches sur le WCF
       <table>
            <tr>
                <td>GUI Admin</td>
                <td>(F)</td>
            </tr>
            <tr>
                <td>GUI Lecteur</td>
                <td>(F),(S)</td>
            </tr>
            <tr>
                <td>BL</td>
                <td>(F)</td>
            </tr>
            <tr>
                <td>ERRORS</td>
                <td>??</td>
            </tr>
            <tr>
                <td>ENTITIES</td>
                <td>(F)</td>
            </tr>
            <tr>
                <td>DALADO</td>
                <td>(F)</td>
            </tr>
            <tr>
                <td>DALEF</td>
                <td>(S)</td>
            </tr>
        </table>
- [ ] Charger le model de la db sur le WCF.
- [x] ~~Stored procedures.~~
- [x] ~~dès que c'est bon, peupler la db.~~
- [x] ~~Créer les users "admin".~~
- [ ] Rapport d'analyse.

#Implementation des fonctionnalités

- [ ] Si 2 livres empruntés en retard, on ne peut plus emprunter de livres… question d’examen 

##Une application d’administration qui permet

- [ ] de rechercher, créer des exemplaires de livres…
- [ ] Nice To have : Ajouter un livre par son ISBN et Amazon…
- [ ] de retrouver la liste des retardataires et le prix qu’ils devraient payer au moment de la consultation de cette liste et cela pour l’ensemble des bibliothèques question d’examen
- [ ] de pouvoir gérer le retour d’un exemplaire d’un emprunteur ( retrouver qui où, l’exemplaire et donner le montant à payer).
- [ ] Nice to Have… Utilisation des Web services d’amazone pour retrouver les infos du livre en fonction de son ISBN… 

##Une application pour le lecteur…

- [ ] Se connecter = Qui et où
- [ ] Avoir la liste des disponibilités des réservations en fonction de la bibliothèque choisie et emprunter en fonction de la bibliothèque choisie
- [ ] Avoir la liste des disponibilités de mes réservations de toute les bibliothèques (afficher la liste complète des disponibilités des exemplaires et le nombre d’exemplaire disponibles dans chaque bibliothèque) -> question d’examen
- [ ] Pouvoir réserver… Recherche d’un livre dans la bibliothèque choisie et réservation si pas disponible…
- [ ] Pouvoir emprunter… Même chose
- [ ] Pouvoir consulter ma liste des retards et combien je dois payer au total et par retard…
- [ ] On garde les informations des livres empruntés, par qui, quand et rentré quand ainsi que le prix payé pour chaque emprunt afin de sortir les statistiques par livre emprunté le CA, par exemplaire…
- [ ] L’emprunteur peut créer une liste de réservation valable dans toute les bibliothèques et lorsqu’un exemplaire est disponible, celui-ci lui est proposé lorsqu’il se connecte à l’application. 
