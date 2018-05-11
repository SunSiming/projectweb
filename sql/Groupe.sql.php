
<?php

Groupe::addQuery('SELECT_NOM_GROUPE', 'SELECT NOM FROM GROUPE WHERE IDGROUPE = :id');

Groupe::addQuery('ADDGROUPE', 'INSERT INTO groupe(IDGROUPE, IDUSER, NOM, PRIVE)
                                        VALUES (:idGroupe, :idUser, :groupNom, :prive)');

Groupe::addQuery('SELECT_IDGROUPE','SELECT IDGROUPE FROM APPARTENIR WHERE IDUSER = :id');




Groupe::addQuery('SELECT_GROUPENOM', 'SELECT NOM FROM GROUPE WHERE IDUSER = :id');

User::addQuery('SELECT_IDGROUPE','SELECT IDGROUPE FROM appartenir WHERE IDUSER = :id');
User::addQuery('SELECT_GROUPENOM', 'SELECT NOM FROM GROUPE WHERE IDUSER = :id');
User::addQuery('SELECT_NOM_GROUPE', 'SELECT NOM FROM GROUPE WHERE IDGROUPE = :id');

User::addQuery('ADDGROUPE', 'INSERT INTO groupe(IDGROUPE, IDUSER, NOM, PRIVE)
                                        VALUES (:idGroupe, :idUser, :groupeNom, :prive)');



 ?>
