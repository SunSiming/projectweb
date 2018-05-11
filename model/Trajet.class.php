<?php
class Trajet extends Model
{
  private $id;

  public function getIdTrajet(){
    return $this->id;
  }


  public function getIdUser(){
  	$result = null;
  	$trajetT = parent::execute('SELECT_ID_USER', array(':id'=> $this->id));
    print_r ($trajetT);
  	$result = $trajetT;
  	return $result->IDUSER;
  }

  public function getName(){
  	$result = null;
  	$trajetT = parent::execute('SELECT_NOM_TRAJET', array(':id'=> $this->id));
  	$result = $trajetT[0];
  	return $result->NOM;
  }

  public function getHoraireDepart(){
  	$result = null;
  	$trajetT = parent::execute('SELECT_HORAIREDEPART', array(':id'=> $this->id));
  	$result = $trajetT[0];
  	return $result->HORAIREDEPART;
  }

  public function getHoraireArrivee(){
  	$result = null;
  	$trajetT = parent::execute('SELECT_HORAIREARRIVEE', array(':id'=> $this->id));
  	$result = $trajetT[0];
  	return $result->HORAIREARRIVEE;
  }

  public function getLieuDepart(){
  	$result = null;
  	$trajetT = parent::execute('SELECT_LIEUDEPART', array(':id'=> $this->id));
  	$result = $trajetT[0];
  	return $result->LIEUDEPART;
  }

  public function getLieuArrivee(){
  	$result = null;
  	$trajetT = parent::execute('SELECT_LIEUARRIVEE', array(':id'=> $this->id));
  	$result = $trajetT[0];
  	return $result->LIEUARRIVEE;
  }

  public function getNbxPlace(){
  	$result = null;
  	$trajetT = parent::execute('SELECT_NBXPLACE', array(':id'=> $this->id));
  	$result = $trajetT[0];
  	return $result->NBXPLACE;
  }

  public function getCreateur(){
  	$result = null;
  	$trajetT = parent::execute('SELECT_CREATEUR', array(':id'=> $this->id));
  	$result = $trajetT[0];
  	return $result->CREATEUR;
  }

  public function getActif(){
		$result = null;
		$trajetT = parent::execute('SELECT_ACTIF', array(':id'=> $this->id));
		$result = $trajetT[0]->ACTIF;
    if($result==0)
       return "NON";
    else
       return "OUI";
	}

  public function getInformation(){
  	$result = null;
  	$trajetT = parent::execute('SELECT_INFORMATION', array(':id'=> $this->id));
  	$result = $trajetT[0];
  	return $result->INFORMATION;
  }

  public function getIdVoiture(){
  	$result = null;
  	$trajetT = parent::execute('SELECT_IDVOITURE', array(':id'=> $this->id));
  	$result = $trajetT[0];
  	return $result->IDVOITURE;
  }

  public function getDistance(){
  	$result = null;
  	$trajetT = parent::execute('SELECT_DISTANCE', array(':id'=> $this->id));
  	$result = $trajetT[0];
  	return $result->DISTANCE;
  }

  public function setId($IDTrajet){
    $this->id = $IDTrajet;
  }





  /*///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


      Fin des Accesseurs


  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

  public static function getTrajetsAleatoire(){
    //$name = null;
    $trajets = parent::executeSansParams('SELECT_S_IDTRAJET');
    //$name = $nom[0];
    return $trajets;
  }

  public static function getTrajetsCurrentUserAsCreateur($idCurrentUser){
    $trajets = parent::execute('SELECT_IDTRAJET_USER_CREATEUR', array(':id'=> $idCurrentUser));
    return $trajets;
  }

  public static function getTrajetsParticipants($idCurrentUser){
    $idtrajets = parent::execute('SELECT_R_IDTRAJST', array(':id'=> $idCurrentUser));
    return $idtrajets;
  }

  public static function getUnTrajet($idTrajet){//Ne fonctionne pas A quoi sert-elle déjà?
    $result = null;
    $trajetT = parent::execute('SELECT_R_TRAJET', array(':id'=> $idTrajet));
    $result = $trajetT[0];
    return $result;
  }

  public static function deleteTrajet($idTrajet){
    try{
      $trajet = new Trajet();
      $trajet->setId($idTrajet);
      $horaireDepart = $trajet->getHoraireDepart();
      $invertedHoraireDepart = Trajet::convertDateToFr($horaireDepart);
      $horaireArrivee = $trajet->getHoraireArrivee();
      $invertedHoraireArrivee = Trajet::convertDateToFr($horaireArrivee);
      $lieuDepart = $trajet->getLieuDepart();
      $lieuArrivee = $trajet->getLieuArrivee();
      $notification = "Départ: ".$lieuDepart.", le: ".$invertedHoraireDepart." Arrivée : ".$lieuArrivee;
      Notification::addNotificationsForTrajet($idTrajet, 'Suppression d\'un Trajet', $notification);
      parent::executeSansRetour('DELETETRAJET', array(':id' => $idTrajet));
    } catch (PDOException $error) {
      echo "ERREUR suppression";
    }
  }

  public static function deleteReserver($id){
    parent::executeSansRetour('DELETERESERVER', array(':id' => $id));
  }

  public static function getUnTrajetAleatoire(){
    $trajets = Trajet::getTrajetsAleatoire();
    $aTrajet = $trajets[1];
    $idTrajet = $aTrajet->IDTRAJET;
    $trajet = new Trajet();
    $trajet->setId($idTrajet);
    return $trajet;
  }

  public static function getTrajetsPrecedents(){
    //$name = null;
    $iduser = $_SESSION['currentUser'];
    $trajets = parent::executeSansParams('SELECT_TRAJETS_PRECEDENTS', array(':id' => $iduser));
    //$name = $nom[0];
    return $trajets;
  }

  public static function getUnTrajetPrecedent(){
    $trajets = Trajet::getTrajetsPrecedents();
    $aTrajet = $trajets[1];
    $idTrajet = $aTrajet->IDTRAJET;
    $trajet = new Trajet();
    $trajet->setId($idTrajet);
    return $trajet;
  }

  public static function getTrajetsCourants(){
    //$name = null;
    $iduser = $_SESSION['currentUser'];
    $trajets = parent::executeSansParams('SELECT_TRAJETS_COURANTS', array(':id' => $iduser));
    //$name = $nom[0];
    return $trajets;
  }

  public static function getUnTrajetCourant(){
    $trajets = Trajet::getTrajetsCourants();
    $aTrajet = $trajets[1];
    $idTrajet = $aTrajet->IDTRAJET;
    $trajet = new Trajet();
    $trajet->setId($idTrajet);
    return $trajet;
  }


//retourne l'ID du trajet créé
  public static function create($lieuDepart,$lieuArrivee,$horaireDepart,$horaireArrivee,$distance,$nbxplaces,$informations) {	//insère dans la base un nouveau trajet et retourne une instance de la classe Trajet représentant ce nouveau trajet
    $res=0;
    try{
      $trajet = new Trajet();
      $currentUser=$_SESSION['currentUser'];
      $iduser = $currentUser->getIDUser();
      $nom = $currentUser->getName();
      $invertedHoraireDepart = Trajet::convertDateToSql($horaireDepart);
      $invertedHoraireArrivee = Trajet::convertDateToSql($horaireArrivee);

      $nombreEtapesD = Etape::nombre_etapes($lieuDepart);
      if ($nombreEtapesD == 0){
        $etapeD = Etape::create($lieuDepart);
      }

      $nombreEtapesA = Etape::nombre_etapes($lieuArrivee);
      if ($nombreEtapesA == 0){
        $etapeA = Etape::create($lieuArrivee);
      }

      $trajetID = parent::executeMultipleRequete(2, 'CREER_TRAJET_RECUPID', array(':iduser' => $iduser, ':nom' => $nom, ':horairedepart' => $invertedHoraireDepart,
      ':horairearrivee' => $invertedHoraireArrivee, ':lieudepart' => $lieuDepart, ':lieuarrivee' => $lieuArrivee, ':distance' => $distance, ':nbxplace' => $nbxplaces, ':createur' => $iduser,
      ':actif' => '1', ':information' => $informations));

      $res=$trajetID[0]->TRAJID;
      Reserver::create($res);

      $trajet->setId($res);
      $_SESSION['Trajet'] = $trajet;

    } catch (PDOException $error) {
      echo "ERREUR de creation de trajet";
    }
    return $res;
  }

  public function inscriptionTrajet($idtrajet, $iduser){
    parent::executeSansRetour('INSCRIPTION_TRAJET', array(':idUser' => $iduser, ':$idTrajet' => $idtrajet));
  }


  public  function setlieuDepart($lieuDepart){
      parent::executeSansRetour('CHANGER_LIEUDEPART', array(':lieu' => $lieuDepart, ':id' => $this->id));
  }

  public  function setlieuArrive($lieuArrivee){
      parent::executeSansRetour('CHANGER_LIEUARRIVE', array(':lieu' => $lieuArrivee, ':id' => $this->id));
  }

  public  function sethoraireDepert($horaireDepart){
      parent::executeSansRetour('CHANGER_HORAIREDEPART', array(':horaire' => $horaireDepart, ':id' => $this->id));
  }

  public  function sethoraireArrivee($horaireArrivee){
      parent::executeSansRetour('CHANGER_HORAIREARRIVEE', array(':horaire' => $horaireArrivee, ':id' => $this->id));
  }

  public  function setvoiture($voiture){
      parent::executeSansRetour('CHANGER_VOITURE', array(':voiture' => $voiture, ':id' => $this->id));
  }


  public  function setnbxplaces($nbxplaces){
      parent::executeSansRetour('CHANGER_NBXPLACES', array(':nbxplace' => $nbxplaces, ':id' => $this->id));
  }

  public  function setdistance($distance){
      parent::executeSansRetour('CHANGER_DISTANCE', array(':distance' => $distance, ':id' => $this->id));
  }

  public  function setinformations($informations){
      parent::executeSansRetour('CHANGER_INFORMATIONS', array(':info' => $informations, ':id' => $this->id));
  }

  public function setactif($actif){
      parent::executeSansRetour('CHANGER_ACTIF', array(':actif'=> $actif, ':id'=> $this->id));
  }

  public static function convertDateToFr($date) {
    date_default_timezone_set('Europe/Paris');
    $dateFr = date_create($date);
    return date_format($dateFr, 'd/m/Y H:i');
  }

  public static function convertDateToSql($date) {
    date_default_timezone_set('Europe/Paris');
    $dateSql = date_create($date);
    return date_format($dateSql, 'Y-m-d H:i:s');
  }

  public static function uptateNbxplaces($nbxplaces,$id){
    parent::executeSansRetour('CHANGER_NBXPLACES', array(':nbxplace' => $nbxplaces, ':id' => $id));
  }

  public function ajouteEtape($nometape){
  	$result = null;echo 'getid';
    $idetape = Etape::getIdAvecNom($nometape);echo 'hasgotid';
  	$trajetT = parent::executeSansRetour('AJOUTE_ETAPE', array(':id'=> $this->id, ':idetape' => $idetape));
  }

/*
public static function setTrajets(){
    //$name = null;
    $trajets = parent::executeSansParams('SET_TRAJETS');
    //$name = $nom[0];
    return $trajets;
  }

public static function setUnTrajet(){
    $trajets = Trajet::setTrajets();
    $aTrajet = $trajets[1];
    $idTrajet = $aTrajet->IDTRAJET;
    $trajet = new Trajet();
    $trajet->setId($idTrajet);
    return $trajet;
  }*/

}

?>
