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

- [x] Si 2 livres empruntés en retard, on ne peut plus emprunter de livres… **question d’examen** 

##Une application d’administration qui permet

- [x] de rechercher, créer des exemplaires de livres…
- [x] Nice To have : Ajouter un livre par son ISBN et Amazon…
- [x] de retrouver la liste des retardataires et le prix qu’ils devraient payer au moment de la consultation de cette liste et cela pour l’ensemble des bibliothèques **question d’examen**
- [ ] de pouvoir gérer le retour d’un exemplaire d’un emprunteur ( retrouver qui où, l’exemplaire et donner le montant à payer).
- [x] Nice to Have… Utilisation des Web services d’amazone pour retrouver les infos du livre en fonction de son ISBN… 
- [ ] lors d'un emprunt, si le l'exemplaire est **indisponible**, proposer de faire une réservation
- [ ] lors d'une reservation, si le l'exemplaire est **disponible**, proposer de faire un emprunt

##Une application pour le lecteur…

- [ ] Se connecter = Qui et où
- [ ] Dans emprunt : avoir la liste des disponibilités des réservations en fonction de la bibliothèque ou on est connectée et emprunter en fonction de cette bibliotheque
- [ ] Dans reservation : avoir la liste de mes réservations avec leurs disponibilités pour toute les bibliothèques -> **question d’examen**
- [ ] Pouvoir réserver… Recherche d’un livre dans la bibliothèque choisie et réservation si pas disponible…
- [ ] Pouvoir emprunter… Même chose
- [ ] Pouvoir consulter ma liste des retards et combien je dois payer au total et par retard…
- [ ] On garde les informations des livres empruntés, par qui, quand et rentré quand ainsi que le prix payé pour chaque emprunt afin de sortir les statistiques par livre emprunté le CA, par exemplaire…
- [ ] L’emprunteur peut créer une liste de réservation valable dans toute les bibliothèques et lorsqu’un exemplaire est disponible, celui-ci lui est proposé lorsqu’il se connecte à l’application. 
