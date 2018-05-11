<?php



//Inscrire le user à un trajet donné
User::addQuery('INSCRIPTION_TRAJET', 'INSERT INTO RESERVER (IDUSER, IDTRAJET) VALUES (:iduser, :idtrajet)');


 ?>
