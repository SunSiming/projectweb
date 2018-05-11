<?php
class Reserver extends Model
{
  //private $id;

  public function __construct(){
     //$id = $IDuser;
  }



  //Constructeur
  public static function create($idtrajet) {	//insère dans la base la réservation de l'utilisateur et retourne une instance de la classe Reserver

      $currentUser=$_SESSION['currentUser'];
      $iduser = $currentUser->getIDUser();
      $reserver = new Reserver();
      parent::executeSansRetour('INSCRIPTION_TRAJET', array(':iduser' => $iduser, ':idtrajet' => $idtrajet));

    return $reserver;
  }

  public static function inscriptionTrajet($idtrajet, $iduser){
    try{
      $reserver = new Reserver();
      parent::executeSansRetour('INSCRIPTION_TRAJET', array(':iduser' => $iduser, ':idtrajet' => $idtrajet));
    } catch (PDOException $error) {
      //echo "ERREUR insertion";
      //$error->getMessage;
    }
    return $reserver;
  }



/*///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


Accesseurs


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/





}


?>
