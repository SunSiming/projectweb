<?php

Trajet::addQuery('SELECT_ID_TRAJET', 'SELECT IDTRAJET FROM TRAJET WHERE IDTRAJET = :id');
Trajet::addQuery('SELECT_ID_USER', 'SELECT IDUSER FROM TRAJET WHERE IDTRAJET = :id');
Trajet::addQuery('SELECT_NOM_TRAJET', 'SELECT NOM FROM TRAJET WHERE IDTRAJET = :id');
Trajet::addQuery('SELECT_HORAIREDEPART', 'SELECT HORAIREDEPART FROM TRAJET WHERE IDTRAJET = :id');
Trajet::addQuery('SELECT_HORAIREARRIVEE', 'SELECT HORAIREARRIVEE FROM TRAJET WHERE IDTRAJET = :id');
Trajet::addQuery('SELECT_LIEUDEPART', 'SELECT LIEUDEPART FROM TRAJET WHERE IDTRAJET = :id');
Trajet::addQuery('SELECT_LIEUARRIVEE', 'SELECT LIEUARRIVEE FROM TRAJET WHERE IDTRAJET = :id');
Trajet::addQuery('SELECT_NBXPLACE', 'SELECT NBXPLACE FROM TRAJET WHERE IDTRAJET = :id');
Trajet::addQuery('SELECT_CREATEUR', 'SELECT CREATEUR FROM TRAJET WHERE IDTRAJET = :id');
Trajet::addQuery('SELECT_ACTIF', 'SELECT ACTIF FROM TRAJET WHERE IDTRAJET = :id');
Trajet::addQuery('SELECT_INFORMATION', 'SELECT INFORMATION FROM TRAJET WHERE IDTRAJET = :id');
Trajet::addQuery('SELECT_IDVOITURE', 'SELECT IDVOITURE FROM TRAJET WHERE IDTRAJET = :id');
Trajet::addQuery('SELECT_DISTANCE', 'SELECT DISTANCE FROM TRAJET WHERE IDTRAJET = :id');
//donner l'ID du conducteur à partir de son email
Trajet::addQuery('GET_ID_CONDUCTEUR', 'SELECT TRAJET.CONDUCTEUR FROM TRAJET JOIN RESERVER ON TRAJET.IDTRAJET = RESERVER.IDTRAJET JOIN USER ON USER.IDUSER = RESERVER.IDUSER WHERE USER.EMAIL LIKE :email');

//SELECT pour la recherche d'un Trajet (Sans connaitre IDTRAJET)
User::addQuery('SELECT_S_IDTRAJET', 'SELECT IDTRAJET FROM TRAJET');
//Select pour les trajets d'un utilisateur non actifs (précédents)
//POUR USER = 4735 A MODIFIER
//?et le nçmbre de participants?
User::addQuery('SELECT_TRAJETS_PRECEDENTS', 'SELECT TRAJET.IDTRAJET FROM TRAJET LEFT JOIN RESERVER ON TRAJET.IDTRAJET = RESERVER.IDTRAJET WHERE RESERVER.IDUSER = :id AND TRAJET.ACTIF = 0');
//Select pour les trajets d'un utilisateur actifs (courants)
//?et le nombre de participants?
User::addQuery('SELECT_TRAJETS_COURANTS', 'SELECT TRAJET.IDTRAJET FROM TRAJET LEFT JOIN RESERVER ON TRAJET.IDTRAJET = RESERVER.IDTRAJET WHERE RESERVER.IDUSER = :id AND TRAJET.ACTIF = 1');

//Insert un trajet
User::addQuery('CREER_TRAJET', 'INSERT INTO TRAJET (IDTRAJET,IDUSER, NOM, HORAIREDEPART, HORAIREARRIVEE, LIEUDEPART, LIEUARRIVEE, DISTANCE, NBXPLACE, CREATEUR, ACTIF, INFORMATION, IDVOITURE) VALUES (NULL,:iduser, :nom, :horairedepart, :horairearrivee, :lieudepart, :lieuarrivee, :distance, :nbxplace, :createur, :actif, :information, :idvoiture)');
//Insert un trajet en récupérant l'ID qui vient d'être créé
User::addQuery('CREER_TRAJET_RECUPID', 'INSERT INTO TRAJET (IDTRAJET,IDUSER, NOM, HORAIREDEPART, HORAIREARRIVEE, LIEUDEPART, LIEUARRIVEE, DISTANCE, NBXPLACE, CREATEUR, ACTIF, INFORMATION) VALUES (NULL,:iduser, :nom, :horairedepart, :horairearrivee, :lieudepart, :lieuarrivee, :distance, :nbxplace, :createur, :actif, :information); SELECT LAST_INSERT_ID() AS TRAJID');

//Ajoute au trajet l'étape dont le nom est donné
User::addQuery('AJOUTE_ETAPE', 'INSERT INTO PASSERPAR (IDTRAJET, IDETAPE) VALUES (:id, :idetape)');


/*//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Mes trajets
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

Trajet::addQuery('SELECT_IDTRAJET_USER_CREATEUR',"SELECT * FROM `trajet` WHERE `IDUSER` = :id");

//Supprimer un TRAJET
Trajet::addQuery('DELETETRAJET', "DELETE FROM `trajet` WHERE `trajet`.`IDTRAJET` = :id");

//Inscrire le user au trajet dont l'id est donné
User::addQuery('INSCRIPTION_TRAJET', 'INSERT INTO RESERVER (IDUSER, IDTRAJET) VALUES (:iduser, :idtrajet)');

Trajet::addQuery('SELECT_R_IDTRAJST', 'SELECT IDTRAJET FROM RESERVER WHERE IDUSER = :id');

Trajet::addQuery('SELECT_R_TRAJET',"SELECT * FROM `trajet` WHERE `IDTRAJET` = :id");

Trajet::addQuery('DELETERESERVER', "DELETE FROM `reserver` WHERE `reserver`.`IDTRAJET` = :id");

Trajet::addQuery('CHANGER_LIEUDEPART','UPDATE TRAJET
                                        SET LIEUDEPART= :lieu
                                        WHERE IDTRAJET= :id');
Trajet::addQuery('CHANGER_LIEUARRIVE','UPDATE TRAJET
                                        SET LIEUARRIVEE= :lieu
                                        WHERE IDTRAJET= :id');
Trajet::addQuery('CHANGER_HORAIREDEPART','UPDATE TRAJET
                                        SET HORAIREDEPART= :horaire
                                        WHERE IDTRAJET= :id');
Trajet::addQuery('CHANGER_HORAIREARRIVEE','UPDATE TRAJET
                                         SET HORAIREARRIVEE= :horaire
                                        WHERE IDTRAJET= :id');
Trajet::addQuery('CHANGER_VOITURE','UPDATE TRAJET
                                         SET IDVOITURE= :voiture
                                        WHERE IDTRAJET= :id');
Trajet::addQuery('CHANGER_NBXPLACES','UPDATE TRAJET
                                        SET NBXPLACE= :nbxplace
                                        WHERE IDTRAJET= :id');
Trajet::addQuery('CHANGER_DISTANCE','UPDATE TRAJET
                                        SET DISTANCE= :distance
                                        WHERE IDTRAJET= :id');
Trajet::addQuery('CHANGER_INFORMATIONS','UPDATE TRAJET
                                        SET INFORMATION= :info
                                        WHERE IDTRAJET= :id');
Trajet::addQuery('CHANGER_ACTIF','UPDATE TRAJET
                                        SET ACTIF= :actif
                                        WHERE IDTRAJET= :id');


 ?>
