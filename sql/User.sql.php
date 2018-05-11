<?php
User::addQuery('IS_PSEUDO_USED', 'SELECT PSEUDO FROM user WHERE PSEUDO= :pseudo ;');
User::addQuery('IS_MAIL_USED', 'SELECT EMAIL FROM user WHERE EMAIL= :mail ;');
User::addQuery('CONNECT', 'SELECT COUNT(*) AS compteur FROM USER WHERE USER.EMAIL = :mail AND USER.MOT_DE_PASSE= :password ;');
User::addQuery('CREER_USER', "INSERT INTO user (EMAIL, MOT_DE_PASSE, NOM, PRENOM, PSEUDO, FONCTION) VALUES (:mail,:password,:nom,:prenom,:pseudo,:fonction) ;");
User::addQuery('RECUP_ID', "SELECT IDUSER FROM USER WHERE EMAIL=:mail ;");


//SELECT DE LA TABLE USER
User::addQuery('ISBLOQUED', 'SELECT ISBLOQUED FROM USER WHERE IDUSER = :id');
User::addQuery('SELECT_PRENOM', 'SELECT PRENOM FROM USER WHERE IDUSER = :id');
User::addQuery('SELECT_NOM', 'SELECT NOM FROM USER WHERE IDUSER = :id');
User::addQuery('SELECT_EMAIL', 'SELECT EMAIL FROM USER WHERE IDUSER = :id');
User::addQuery('SELECT_MOT_DE_PASSE', 'SELECT MOT_DE_PASSE FROM USER WHERE IDUSER = :id');
User::addQuery('SELECT_TEL', 'SELECT TEL FROM USER WHERE IDUSER = :id');
User::addQuery('SELECT_NOMBRETRAJETREALISES', 'SELECT NOMBRETRAJETREALISES FROM USER WHERE IDUSER = :id');
User::addQuery('SELECT_AVATAR', 'SELECT AVATAR FROM USER WHERE IDUSER = :id');
User::addQuery('SELECT_PSEUDO', 'SELECT PSEUDO FROM USER WHERE IDUSER = :id');
User::addQuery('SELECT_USER_INFORMATION', 'SELECT INFORMATION FROM USER WHERE IDUSER = :id');
User::addQuery('SELECT_ISADMIN', 'SELECT ISADMIN FROM USER WHERE IDUSER = :id');
User::addQuery('SELECT_UNITE', 'SELECT UNITE FROM USER WHERE IDUSER = :id');
User::addQuery('SELECT_FONCTION', 'SELECT FONCTION FROM USER WHERE IDUSER = :id');
User::addQuery('SELECT_SITE', 'SELECT SITE FROM USER WHERE IDUSER = :id');
User::addQuery('SELECT_PROMOTION', 'SELECT PROMOTION FROM USER WHERE IDUSER = :id');
User::addQuery('SELECT_TYPEPROMOTION', 'SELECT TYPEPROMOTION FROM USER WHERE IDUSER = :id');

//Bloquer et débloquer un utilisateur
User::addQuery('BLOQUER_QQN', "UPDATE `user` SET `ISBLOQUED` = '1' WHERE `user`.`IDUSER` = :id");
User::addQuery('SUPPRIMER_QQN_DE_SES_TRAJETS', "DELETE FROM `reserver` WHERE `reserver`.`IDUSER`= :id");
User::addQuery('SUPPRIMER_LES_TRAJETS_DE_QQN', "DELETE FROM `trajet` WHERE `trajet`.`IDUSER` = :id");
User::addQuery('DEBLOQUER_QQN', "UPDATE `user` SET `ISBLOQUED` = '0' WHERE `user`.`IDUSER` = :id");
User::addQuery('ADMIN_QQN', "UPDATE `user` SET `ISADMIN` = '1' WHERE `user`.`IDUSER` = :id");
User::addQuery('NONADMIN_QQN', "UPDATE `user` SET `ISADMIN` = '0' WHERE `user`.`IDUSER` = :id");

/*Aide SQL
DELETE FROM `reserver` WHERE `reserver`.`IDUSER` = 11
DELETE FROM `trajet` WHERE `trajet`.`IDUSER` = 12

*/


//SELECT pour la recherche d'un User (Sans connaitre IDUSER)
User::addQuery('SELECT_S_IDUSER', 'SELECT IDUSER FROM USER');


//UPDATE de la table user
															User::addQuery('CHANGER_NOM','UPDATE USER
																									SET NOM= :nom
																									WHERE IDUSER= :id');
															User::addQuery('CHANGER_MAIL','UPDATE USER
																									SET MAIL= :email
																									WHERE IDUSER= :id');
															User::addQuery('CHANGER_PRENOM','UPDATE USER
																									SET PRENOM= :prenom
																									WHERE IDUSER= :id');
															User::addQuery('CHANGER_TEL','UPDATE USER
																									SET TEL= :tel
																									WHERE IDUSER= :id');
															User::addQuery('CHANGER_NOMBRETRAJETREALISES','UPDATE USER
																									SET NOMBRETRAJETREALISES= :nbTR
																									WHERE IDUSER= :id');
															User::addQuery('CHANGER_AVATAR','UPDATE USER
																									SET AVATAR= :avatar
																									WHERE IDUSER= :id');
															User::addQuery('CHANGER_PSEUDO','UPDATE USER
																									SET PSEUDO= :pseudo
																									WHERE IDUSER= :id');
															User::addQuery('CHANGER_INFOMATION','UPDATE USER
																									SET INFORMATION= :info
																									WHERE IDUSER= :id');
															User::addQuery('CHANGER_ISADMIN','UPDATE USER
																									SET ISADMIN= :isadmin
																									WHERE IDUSER= :id');
															User::addQuery('CHANGER_ISBLOQUED','UPDATE USER
																									SET ISBLOQUED= :isbloqued
																									WHERE IDUSER= :id');
															User::addQuery('CHANGER_UNITE','UPDATE USER
																									SET UNITE= :unite
																									WHERE IDUSER= :id');
															User::addQuery('CHANGER_FONCTION','UPDATE USER
																									SET FONCTION= :fct
																									WHERE IDUSER= :id');
															User::addQuery('CHANGER_SITE','UPDATE USER
																									SET SITE= :site
																									WHERE IDUSER= :id');
															User::addQuery('CHANGER_PROMOTION','UPDATE USER
																									SET PROMOTION= :promo
																									WHERE IDUSER= :id');
															User::addQuery('CHANGER_TYPEPROMOTION','UPDATE USER
																									SET TYPEPROMOTION= :typepromo
																									WHERE IDUSER= :id');
															User::addQuery('CHANGER_MOT_DE_PASSE','UPDATE USER
																									SET MOT_DE_PASSE= :mdp
																									WHERE IDUSER= :id');


//Select les IDUSER des utilisateur d'un trajet.
User::addQuery('IDUSERS_OF_A_TRAJET', 'SELECT reserver.IDUSER FROM RESERVER JOIN TRAJET ON RESERVER.IDTRAJET = TRAJET.IDTRAJET WHERE TRAJET.IDTRAJET = :idTrajet');




/*

TP SGBD 1:
1) Afficher la liste des utilisateurs triés par ordre aplphabétique
SELECT NOM, PRENOM FROM USER ORDER BY NOM;

2) afficher les trajets créés par un utilisateur (where)
SELECT TRAJET.INFORMATION, LIEUDEPART, LIEUARRIVEE FROM TRAJET JOIN USER ON USER.IDUSER = TRAJET.IDUSER WHERE USER.NOM = 'COLBERE';

3) afficher les différents types de trajets (distinct)
SELECT DISTINCT LIEUDEPART, LIEUARRIVEE FROM TRAJET;

4) lister les utilisateurs d'un trajet
SELECT USER.NOM, USER.PRENOM FROM USER JOIN RESERVER ON USER.IDUSER = RESERVER.IDUSER JOIN TRAJET ON RESERVER.IDUSER = USER.IDUSER WHERE TRAJET.IDTRAJET = 2;

5) lister les trajets auxquels un utilisateur peut s'inscrire aujourd'hui
SELECT TRAJET.INFORMATION, TRAJET.IDTRAJET FROM TRAJET JOIN USER ON USER.IDUSER = TRAJET.IDUSER WHERE TRAJET.ACTIF = 1;

6)compter le nombre d'étapes d'un trajet (group)
//On considère que l'étape d'arrivée est une étape, alors qu'elle n'est pas enregistrée en tant qu'étape dans la BDD
SELECT TRAJET.INFORMATION, TRAJET.IDTRAJET, (COUNT(PASSERPAR.IDTRAJET)+1) FROM TRAJET JOIN PASSERPAR ON TRAJET.IDTRAJET = PASSERPAR.IDTRAJET WHERE TRAJET.IDTRAJET = 2 GROUP BY TRAJET.IDTRAJET;

7) lister les trajets d'un utilisateur avec le nombre d'invités associés (left join)
SELECT TRAJET.INFORMATION, TRAJET.IDTRAJET, COUNT(APPARTENIR.IDUSER) FROM TRAJET LEFT JOIN APPARTENIR ON TRAJET.IDUSER = APPARTENIR.IDUSER WHERE APPARTENIR.IDUSER = 2;

nombre d'invité : nombre de personne paticipants au trajet
SELECT DISTINCT R1.IDTRAJET, count(R2.IDUSER) FROM reserver AS R1 JOIN reserver AS R2 ON R1.IDTRAJET=R2.IDTRAJET WHERE R1.IDUSER = 1 GROUP BY R1.IDTRAJET ;

7bis) lister les trajets d'un utilisateur (en tant que créateur) avec le nombre d'invités associés (left join)
SELECT DISTINCT R1.IDTRAJET, count(R2.IDUSER) FROM reserver AS R1 JOIN trajet AS R2 ON R1.IDTRAJET=R2.IDTRAJET WHERE R2.IDUSER = 1 GROUP BY R1.IDTRAJET ;

8) Select les trajets d'un utilisateurs
SELECT IDTRAJET FROM reserver WHERE reserver.IDUSER = 1;

9)Id des participants d'un trajet
SELECT IDUSER FROM reserver WHERE reserver.IDTRAJET = 2 ;

*/
User::addQuery('SHOW_USERS', 'SELECT NOM, PRENOM FROM USER ORDER BY NOM');
User::addQuery('SHOW_TRAJETS_OF_A_USER', 'SELECT TRAJET.INFORMATION, LIEUDEPART, LIEUARRIVEE FROM TRAJET JOIN USER ON USER.IDUSER = TRAJET.IDUSER WHERE USER.NOM = :id');
User::addQuery('SHOW_DIFFERENTS_TRAJETS', 'SELECT DISTINCT LIEUDEPART, LIEUARRIVEE FROM TRAJET');
User::addQuery('USERS_OF_A_TRAJET', 'SELECT USER.NOM, USER.PRENOM FROM USER JOIN RESERVER ON USER.IDUSER = RESERVER.IDUSER JOIN TRAJET ON RESERVER.IDUSER = USER.IDUSER WHERE TRAJET.IDTRAJET = :id');
User::addQuery('ID_USERS_OF_A_TRAJET', 'SELECT USER.IDUSER FROM USER JOIN RESERVER ON USER.IDUSER = RESERVER.IDUSER JOIN TRAJET ON RESERVER.IDUSER = USER.IDUSER WHERE TRAJET.IDTRAJET = :idTrajet');
User::addQuery('TRAJETS_ACTIFS', 'SELECT TRAJET.INFORMATION, TRAJET.IDTRAJET FROM TRAJET JOIN USER ON USER.IDUSER = TRAJET.IDUSER WHERE TRAJET.ACTIF = 1');
//pour le trajet num 2
User::addQuery('NOMBRES_ETAPES_TRAJET', 'SELECT TRAJET.INFORMATION, TRAJET.IDTRAJET, (COUNT(PASSERPAR.IDTRAJET)+1) FROM TRAJET JOIN PASSERPAR ON TRAJET.IDTRAJET = PASSERPAR.IDTRAJET WHERE TRAJET.IDTRAJET = 2 GROUP BY TRAJET.IDTRAJET');
User::addQuery('TRAJETS_USER_WITH_NB_INVITES', 'SELECT TRAJET.INFORMATION, TRAJET.IDTRAJET, COUNT(APPARTENIR.IDUSER) FROM TRAJET LEFT JOIN APPARTENIR ON TRAJET.IDUSER = APPARTENIR.IDUSER WHERE APPARTENIR.IDUSER = :id');
User::addQuery('TRAJETS_USER', 'SELECT IDTRAJET FROM reserver WHERE reserver.IDUSER = :id');
User::addQuery('IDPARTICIPANTS_TRAJET', 'SELECT IDUSER FROM reserver WHERE reserver.IDTRAJET = :id');

/*
Notification début:
INSERT INTO `notifier` (`IDNOTIFICATION`, `IDUSER`) VALUES ('1', '5');
SELECT USER.IDUSER FROM USER JOIN RESERVER ON USER.IDUSER = RESERVER.IDUSER WHERE RESERVER.IDTRAJET = '7' ;
SELECT RESERVER.IDUSER FROM RESERVER WHERE RESERVER.IDTRAJET = '7' ;
SELECT DISTINCT NOTIFICATION.NOTIFICATION FROM RESERVER JOIN NOTIFICATION ON RESERVER.IDTRAJET = NOTIFICATION.IDTRAJET WHERE NOTIFICATION.IDTRAJET = '7';
SELECT NOTIFICATION FROM NOTIFICATION INNER JOIN NOTIFIER ON NOTIFICATION.IDNOTIFICATION = NOTIFIER.IDNOTIFICATION WHERE NOTIFIER.IDUSER = '5';



TP SGBD 2:
4. On veut afficher les trajets avec leur durée. Ajouter une date/heure de départ et date/heure d’arrivée si besoin.
a) Afficher les trajets avec leurs horaires
SELECT trajet.IDTRAJET, trajet.HORAIREDEPART, trajet.HORAIREARRIVEE FROM trajet;

b) Afficher les trajets avec leurs horaires et les durée
SELECT trajet.IDTRAJET, trajet.HORAIREDEPART, trajet.HORAIREARRIVEE, (trajet.HORAIREARRIVEE - trajet.HORAIREDEPART) AS DUREE FROM trajet;
SELECT trajet.IDTRAJET, trajet.HORAIREDEPART, trajet.HORAIREARRIVEE, TIMESTAMPDIFF(HOUR, trajet.HORAIREDEPART, trajet.HORAIREARRIVEE) AS DUREE FROM trajet;
SELECT trajet.IDTRAJET, trajet.HORAIREDEPART, trajet.HORAIREARRIVEE, (TIMESTAMPDIFF(MINUTE, trajet.HORAIREDEPART, trajet.HORAIREARRIVEE)) AS DUREE FROM trajet;

5.

- Le nombre moyen de personnes par trajet
a) Le nombre de personne par trajet
SELECT trajet.IDTRAJET, COUNT(reserver.IDUSER) FROM reserver LEFT JOIN trajet ON reserver.IDTRAJET = trajet.IDTRAJET GROUP BY trajet.IDTRAJET;
b) nombre moyen


- Le nombre moyen d’étapes par trajet



Exercice TP SGBD 2

__________________________________________________________________________________

1. Lister des trajets qui démarrent de Lille, qui passent par Douai ou par Amiens, qui arrivent à Paris le 21/03/2018 ou le 23/03/2018 et qui ne concernent pas un personnel de l’IMT Lille Douai.
 SELECT TRAJET.INFORMATION, TRAJET.IDTRAJET FROM TRAJET JOIN PASSERPAR ON PASSERPAR.IDTRAJET = TRAJET.IDTRAJET JOIN USER ON TRAJET.IDUSER = USER.IDUSER WHERE (TRAJET.LIEUDEPART = 'LILLE') AND (TRAJET.LIEUARRIVEE = 'PARIS') AND ((TRAJET.HORAIREARRIVEE BETWEEN '2018-03-21 00:00:00' AND '2018-03-21 23:59:59') OR (TRAJET.HORAIREARRIVEE BETWEEN '2018-03-23 00:00:00' AND '2018-03-23 23:59:59')) AND ((PASSERPAR.IDETAPE BETWEEN 50000 AND 50999) OR (PASSERPAR.IDETAPE BETWEEN 34000 AND 34999)) AND (USER.FONCTION != 'agent');

2. On veut afficher 3 listes pour un mois : les grands trajet (>100km), les trajets moyens (entre 50 et 100 km)et les petits trajets (<50km).

//les grands trajet (>100km) pour le mois de Mars
SELECT TRAJET.INFORMATION, TRAJET.DISTANCE, TRAJET.IDTRAJET FROM TRAJET WHERE TRAJET.DISTANCE > 100 AND MONTH(TRAJET.HORAIREDEPART) = '03';

//les trajets moyens (entre 50 et 100 km) pour le mois de Mars
SELECT TRAJET.INFORMATION, TRAJET.DISTANCE, TRAJET.IDTRAJET FROM TRAJET WHERE (TRAJET.DISTANCE BETWEEN 50 AND 100) AND MONTH(TRAJET.HORAIREDEPART) = '03';

//les petits trajets (<50km) pour le mois de Mars
SELECT TRAJET.INFORMATION, TRAJET.DISTANCE, TRAJET.IDTRAJET FROM TRAJET WHERE TRAJET.DISTANCE < 50 AND MONTH(TRAJET.HORAIREDEPART) = '03';

3. On cherche les personnes dont le mail contient ‘imt-lille-douai’ dans la liste des utilisateurs.
SELECT USER.NOM, USER.PRENOM, USER.EMAIL, USER.IDUSER FROM USER WHERE USER.EMAIL LIKE '%imt-lille-douai%';


4. On veut afficher les trajets avec leur durée. Ajouter une date/heure de départ et date/heure d’arrivée si besoin.
a) Afficher les trajets avec leurs horaires
SELECT trajet.IDTRAJET, trajet.HORAIREDEPART, trajet.HORAIREARRIVEE FROM trajet;

b) Afficher les trajets avec leurs horaires et les durée
SELECT trajet.IDTRAJET, trajet.HORAIREDEPART, trajet.HORAIREARRIVEE, (trajet.HORAIREARRIVEE - trajet.HORAIREDEPART) AS DUREE FROM trajet;
SELECT trajet.IDTRAJET, trajet.HORAIREDEPART, trajet.HORAIREARRIVEE, TIMESTAMPDIFF(HOUR, trajet.HORAIREDEPART, trajet.HORAIREARRIVEE) AS DUREE FROM trajet;
SELECT trajet.IDTRAJET, trajet.HORAIREDEPART, trajet.HORAIREARRIVEE, (TIMESTAMPDIFF(MINUTE, trajet.HORAIREDEPART, trajet.HORAIREARRIVEE)) AS DUREE FROM trajet;

*/

User::addQuery('TRAJETS_DEM_LILLE_PASSENT_DOUAI_OU_AMIENS_ARRIVENT_PARIS_2DATES_PAS_AGENT', "SELECT TRAJET.INFORMATION, TRAJET.IDTRAJET FROM TRAJET JOIN PASSERPAR ON PASSERPAR.IDTRAJET = TRAJET.IDTRAJET JOIN USER ON TRAJET.IDUSER = USER.IDUSER WHERE (TRAJET.LIEUDEPART = 'LILLE') AND (TRAJET.LIEUARRIVEE = 'PARIS') AND ((TRAJET.HORAIREARRIVEE BETWEEN '2018-03-21 00:00:00' AND '2018-03-21 23:59:59') OR (TRAJET.HORAIREARRIVEE BETWEEN '2018-03-23 00:00:00' AND '2018-03-23 23:59:59')) AND ((PASSERPAR.IDETAPE BETWEEN 50000 AND 50999) OR (PASSERPAR.IDETAPE BETWEEN 34000 AND 34999)) AND (USER.FONCTION != 'agent')");
User::addQuery('GRANDS_TRAJETS_MARS', "SELECT TRAJET.INFORMATION, TRAJET.DISTANCE, TRAJET.IDTRAJET FROM TRAJET WHERE TRAJET.DISTANCE > 100 AND MONTH(TRAJET.HORAIREDEPART) = '03'");
User::addQuery('MOYENS_TRAJETS_MARS', "SELECT TRAJET.INFORMATION, TRAJET.DISTANCE, TRAJET.IDTRAJET FROM TRAJET WHERE (TRAJET.DISTANCE BETWEEN 50 AND 100) AND MONTH(TRAJET.HORAIREDEPART) = '03'");
User::addQuery('PETITS_TRAJETS_MARS', "SELECT TRAJET.INFORMATION, TRAJET.DISTANCE, TRAJET.IDTRAJET FROM TRAJET WHERE TRAJET.DISTANCE < 50 AND MONTH(TRAJET.HORAIREDEPART) = '03'");
User::addQuery('MAIL_IMT-LILLE-DOUAI', "SELECT USER.NOM, USER.PRENOM, USER.EMAIL, USER.IDUSER FROM USER WHERE USER.EMAIL LIKE '%imt-lille-douai%'");
User::addQuery('TRAJETS_HORAIRES_DUREES',
"SELECT trajet.IDTRAJET, trajet.HORAIREDEPART, trajet.HORAIREARRIVEE, (trajet.HORAIREARRIVEE - trajet.HORAIREDEPART) AS DUREE FROM trajet;
SELECT trajet.IDTRAJET, trajet.HORAIREDEPART, trajet.HORAIREARRIVEE, TIMESTAMPDIFF(HOUR, trajet.HORAIREDEPART, trajet.HORAIREARRIVEE) AS DUREE FROM trajet;
SELECT trajet.IDTRAJET, trajet.HORAIREDEPART, trajet.HORAIREARRIVEE, (TIMESTAMPDIFF(MINUTE, trajet.HORAIREDEPART, trajet.HORAIREARRIVEE)) AS DUREE FROM trajet;");


/*
5. Pour que le site soit complet, on veut afficher quelques statistiques :

Le nombre de trajets par jour, par mois et par année
Nombre de trajets par jour pour le 21/03/2018
SELECT COUNT(TRAJET.IDTRAJET) FROM TRAJET WHERE TRAJET.HORAIREDEPART BETWEEN '2018-03-21 00:00:00' AND '2018-03-21 23:59:59';

Nombre de trajets par mois pour le 03/2018
SELECT COUNT(TRAJET.IDTRAJET) FROM TRAJET WHERE MONTH(TRAJET.HORAIREDEPART) = '03' AND YEAR(TRAJET.HORAIREDEPART) = '2018';

Nombre de trajets par année pour 2018
SELECT COUNT(TRAJET.IDTRAJET) FROM TRAJET WHERE YEAR(TRAJET.HORAIREDEPART) = '2018';



La distance totale parcourue par jour, par mois et par année

distance totale parcourue par jour pour le 21/03/2018
SELECT SUM(TRAJET.DISTANCE) FROM TRAJET WHERE TRAJET.HORAIREDEPART BETWEEN '2018-03-21 00:00:00' AND '2018-03-21 23:59:59';

distance totale parcourue par mois pour le 03/2018
SELECT SUM(TRAJET.DISTANCE) FROM TRAJET WHERE MONTH(TRAJET.HORAIREDEPART) = '03' AND YEAR(TRAJET.HORAIREDEPART) = '2018';


distance totale parcourue par année pour 2018
SELECT SUM(TRAJET.DISTANCE) FROM TRAJET WHERE YEAR(TRAJET.HORAIREDEPART) = '2018';



Le top 10 des personnes créant des trajets
SELECT USER.NOM, USER.PRENOM, USER.IDUSER FROM USER JOIN TRAJET ON USER.IDUSER = TRAJET.IDUSER GROUP BY TRAJET.IDUSER ORDER BY COUNT(TRAJET.IDUSER) DESC LIMIT 10;

Le top 10 des personnes participant à des trajets
SELECT USER.NOM, USER.PRENOM, USER.IDUSER FROM USER JOIN RESERVER ON USER.IDUSER = RESERVER.IDUSER GROUP BY RESERVER.IDUSER ORDER BY COUNT(RESERVER.IDTRAJET) DESC LIMIT 10;

Le top 10 des villes (ou site) départs de trajets
SELECT TRAJET.LIEUDEPART FROM TRAJET  GROUP BY TRAJET.LIEUDEPART ORDER BY COUNT(TRAJET.LIEUDEPART) DESC LIMIT 10;

Le top 10 des villes (ou site) destinations de trajets
SELECT TRAJET.LIEUARRIVEE FROM TRAJET  GROUP BY TRAJET.LIEUARRIVEE ORDER BY COUNT(TRAJET.LIEUARRIVEE) DESC LIMIT 10;


- Le nombre moyen de personnes par trajet
a) Le nombre de personne par trajet
SELECT trajet.IDTRAJET, COUNT(reserver.IDUSER) FROM reserver LEFT JOIN trajet ON reserver.IDTRAJET = trajet.IDTRAJET GROUP BY trajet.IDTRAJET;
b) nombre moyen


Le nombre moyen d’étapes par trajet
//ne donne pas la bonne moyenne
SELECT (COUNT(PASSERPAR.IDETAPE)+COUNT(TRAJET.IDTRAJET))/(COUNT(TRAJET.IDTRAJET)) FROM PASSERPAR JOIN TRAJET ON PASSERPAR.IDTRAJET = TRAJET.IDTRAJET;

//Nombre de trajets par jour pour le 21/03/2018
User::addQuery('NB_TRAJETS_LE_21_03_2018', "SELECT COUNT(TRAJET.IDTRAJET) FROM TRAJET WHERE TRAJET.HORAIREDEPART BETWEEN '2018-03-21 00:00:00' AND '2018-03-21 23:59:59'");
//Nombre de trajets par mois pour le 03/2018
User::addQuery('NB_TRAJETS_LE_03_2018', "SELECT COUNT(TRAJET.IDTRAJET) FROM TRAJET WHERE MONTH(TRAJET.HORAIREDEPART) = '03' AND YEAR(TRAJET.HORAIREDEPART) = '2018'");
//Nombre de trajets par année pour 2018
User::addQuery('NB_TRAJETS_2018', "SELECT COUNT(TRAJET.IDTRAJET) FROM TRAJET WHERE YEAR(TRAJET.HORAIREDEPART) = '2018'");

//distance totale parcourue par jour pour le 21/03/2018
User::addQuery('DISTANCE_PARCOURUE_LE_21_03_2018', "SELECT SUM(TRAJET.DISTANCE) FROM TRAJET WHERE TRAJET.HORAIREDEPART BETWEEN '2018-03-21 00:00:00' AND '2018-03-21 23:59:59'");
//distance totale parcourue par mois pour le 03/2018
User::addQuery('DISTANCE_PARCOURUE_LE_03_2018', "SELECT SUM(TRAJET.DISTANCE) FROM TRAJET WHERE MONTH(TRAJET.HORAIREDEPART) = '03' AND YEAR(TRAJET.HORAIREDEPART) = '2018'");
//distance totale parcourue par année pour 2018
User::addQuery('DISTANCE_PARCOURUE_2018', "SELECT SUM(TRAJET.DISTANCE) FROM TRAJET WHERE YEAR(TRAJET.HORAIREDEPART) = '2018'");

//Le top 10 des personnes créant des trajets
User::addQuery('TOP10_CREATEURS_TRAJETS', "SELECT USER.NOM, USER.PRENOM, USER.IDUSER FROM USER JOIN TRAJET ON USER.IDUSER = TRAJET.IDUSER GROUP BY TRAJET.IDUSER ORDER BY COUNT(TRAJET.IDUSER) DESC LIMIT 10");

//Le top 10 des personnes participant à des trajets
User::addQuery('TOP10_PARTICIPANTS_TRAJETS', "SELECT USER.NOM, USER.PRENOM, USER.IDUSER FROM USER JOIN RESERVER ON USER.IDUSER = RESERVER.IDUSER GROUP BY RESERVER.IDUSER ORDER BY COUNT(RESERVER.IDTRAJET) DESC LIMIT 10");

//Le top 10 des villes (ou site) départs de trajets
User::addQuery('TOP10_VILLES_OU_SITES_DEPARTS_DE_TRAJETS', "SELECT TRAJET.LIEUDEPART FROM TRAJET  GROUP BY TRAJET.LIEUDEPART ORDER BY COUNT(TRAJET.LIEUDEPART) DESC LIMIT 10");

//Le top 10 des villes (ou site) destinations de trajets
User::addQuery('TOP10_VILLES_OU_SITES_DESTINATIONS_DE_TRAJETS', "SELECT TRAJET.LIEUARRIVEE FROM TRAJET  GROUP BY TRAJET.LIEUARRIVEE ORDER BY COUNT(TRAJET.LIEUARRIVEE) DESC LIMIT 10");

//Le nombre moyen de personnes par trajet
//a) Le nombre de personne par trajet
User::addQuery('NB_PERSONNES_PAR_TRAJET', "SELECT trajet.IDTRAJET, COUNT(reserver.IDUSER) FROM reserver LEFT JOIN trajet ON reserver.IDTRAJET = trajet.IDTRAJET GROUP BY trajet.IDTRAJET");
//b) nombre moyen

//Le nombre moyen d’étapes par trajet
//ne donne pas la bonne moyenne
User::addQuery('NB_MOY_ETAPES_PAR_TRAJET', "SELECT (COUNT(PASSERPAR.IDETAPE)+COUNT(TRAJET.IDTRAJET))/(COUNT(TRAJET.IDTRAJET)) FROM PASSERPAR JOIN TRAJET ON PASSERPAR.IDTRAJET = TRAJET.IDTRAJET");
*/
User::addQuery('SELECT_GROUPE_ID','SELECT IDGROUPE FROM groupe WHERE IDUSER = :id');
User::addQuery('SELECT_ID_GROUPE','SELECT IDGROUPE FROM appartenir WHERE IDUSER = :id');
User::addQuery('SELECT__TOUS_IDGROUPE','SELECT IDGROUPE FROM groupe');
User::addQuery('SELECT_NOM_GROUPE', 'SELECT NOM FROM GROUPE WHERE IDGROUPE = :id');
User::addQuery('SELECT_PRIVE_GROUPE','SELECT PRIVE FROM GROUPE WHERE IDGROUPE = :id');
User::addQuery('SELECT_ID_CREATEUR','SELECT IDUSER FROM GROUPE WHERE IDGROUPE = :id');
User::addQuery('SELECT_ID_MEMBRE','SELECT IDUSER FROM APPARTENIR WHERE IDGROUPE = :id');
User::addQuery('ADDGROUPE', 'INSERT INTO groupe(IDGROUPE, IDUSER, NOM, PRIVE)
                                        VALUES (:idGroupe, :idUser, :groupeNom, :prive)');
User::addQuery('ADDAPPARTENIR', 'INSERT INTO `appartenir`(`IDUSER`, `IDGROUPE`)
                                        VALUES (:idUser, :idGroupe)');
User::addQuery('DELETEAPPARTENIR','DELETE FROM `appartenir` WHERE `appartenir`.`IDGROUPE` = :idGroupe');
User::addQuery('DELETEUNAPPARTENIR','DELETE FROM `appartenir` WHERE `appartenir`.`IDUSER` = :idUser AND `appartenir`.`IDGROUPE` = :idGroupe');
User::addQuery('DELETEGROUPE','DELETE FROM `groupe` WHERE `groupe`.`IDGROUPE` = :idGroupe');
User::addQuery('DANSGROUPE', 'SELECT * FROM GROUPE WHERE IDGROUPE = :id and IDUSER = :idUser');
 ?>
