
<?php
/*
* Root class of all my classes
*/
class UserController extends Controller {

  public function __construct(){
       $request = Request::getCurrentRequest();
       parent::__construct($request);
			 Session::startSession();
     }


  public function defaultAction($request) {
    $_SESSION['action']="defaultAction";
		$view = new UserView($this,'index');
		$view->render();
	}

  public function getInformationUser($request){
    $_SESSION['action']="getInformationUser";
    $view = new UserView($this,'User_Information');
		$view->render();
  }

  public function rechercherUser($request){
    $_SESSION['action']="rechercherUser";
    $view = new UserView($this,'User_rechercherqqn');
		$view->render();
  }

  public function voirUnProfil($request){
    $mail = $_GET['mail'];
    $aUser = User::getUserwithMail($mail);
    $_SESSION['otherUser'] = $aUser;
    $currentUser = $_SESSION['currentUser'];
    if($currentUser->isAdmin()){
      $view = new UserView($this,'Admin_VoirAutreUserProfil');
    } else {
      $view = new UserView($this,'User_VoirAutreUserProfil');
    }
    $view->render();
  }

  public function rechercherTrajet($request){
    $_SESSION['action']="rechercherTrajet";
    $currentUser = $_SESSION['currentUser'];
    if($currentUser->isAdmin()){
      $view = new UserView($this,'Admin_chercherTrajet');
    } else {
      $view = new UserView($this,'chercherTrajet');
    }
		$view->render();
  }

  public function creerTrajet($request){
    $_SESSION['action']="creerTrajet";
    $view = new UserView($this,'creationTrajet');
		$view->render();
  }

  public function listeTrajets($request){
    $_SESSION['action']="listeTrajets";
    $view = new UserView($this,'trajetsEffectues');
		$view->render();
  }

  public function modifierProfil(){
  			$view = new UserView($this, 'User_modifierProfil');
  			$view->render();
  		}

  public function validateModificationProfil($request) {
      $currentUser = $_SESSION['currentUser'];
      //$id=UserModel::get_id();
      $password = $request->read('modifPassword');
      if ($password != NULL){
            $confirmPassword = $request->read('confirmModifPassword');

            if($password!=$confirmPassword){
                $view = new MessageView($this, 'message_ModifProfilStop','Le mot de passe rentré et sa confirmation sont différents.');
                $view->setArg('inscErrorText', 'Le mot de passe rentré et sa confirmation sont différents.');
                $view->render();
            }
            else{
              $currentUser->setPassword($password);
            }
      }

				$mail = $request->read('modifMail');
				if($mail!=NULL){
					$currentUser->setMail($mail);}

        $nom = $request->read('modifNom');
				if($nom!=NULL){
					$currentUser->setName($nom);}

				$prenom = $request->read('modifPrenom');
				if($prenom!=NULL) {$currentUser->setFirstname($prenom);}

        $pseudo = $request->read('modifPseudo');
				if($pseudo!=NULL){
					$currentUser->setPseudo($pseudo);}

        $tel = $request->read('modifTel');
  			if($tel!=NULL){
  				$currentUser->setTel($tel);}

        $site = $request->read('modifSite');
        if($site!=NULL){
          $currentUser->setSite($site);}

        $unite = $request->read('modifUnite');
        if($unite!=NULL){
          $currentUser->setUnite($unite);}

        $promo = $request->read('modifPromo');
        if($promo!=NULL){
          $currentUser->setPromotion($promo);}

        $tpromo = $request->read('modifTPromo');
        if($tpromo!=NULL){
          $currentUser->setTypePromotion($tpromo);}

        $info = $request->read('modifInfo');
    		if($info!=NULL){
    			$currentUser->setInfo($info);}

        $view = new UserView($this,'User_Information');
        $view->render();
            //}
		}

/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Admin Action

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

public function bloquerProfil($request){
  $currentUser = $_SESSION['currentUser'];
  if ($currentUser->isAdmin()){
    $user = $_SESSION['otherUser'] ;
    User::bloqueQQN($user->getIDUser());
    $_GET['mail'] = $user->getMail();
    $this->voirUnProfil($request);
  }
}

public function debloquerProfil($request){
  $currentUser = $_SESSION['currentUser'];
  if ($currentUser->isAdmin()){
    $user = $_SESSION['otherUser'] ;
    User::debloqueQQN($user->getIDUser());
    $_GET['mail'] = $user->getMail();
    $this->voirUnProfil($request);
  }
}

public function rendreAdmin($request){
  $currentUser = $_SESSION['currentUser'];
  if ($currentUser->isAdmin()){
    $user = $_SESSION['otherUser'] ;
    User::rendreAdmin($user->getIDUser());
    $_GET['mail'] = $user->getMail();
    $this->voirUnProfil($request);
  }
}

public function rendreNonAdmin($request){
  $currentUser = $_SESSION['currentUser'];
  if ($currentUser->isAdmin()){
    $user = $_SESSION['otherUser'] ;
    User::rendreNonAdmin($user->getIDUser());
    $_GET['mail'] = $user->getMail();
    $this->voirUnProfil($request);
  }
}


public function AdminModifierTrajet($request){
  $id = $request->read('id');
  $trajet = new Trajet();
  $trajet->setId($id);
  $_SESSION['Trajet'] = $trajet;
  $view = new UserView($this,'Admin_modifierTrajet');
  $view->render();
}

public function AdminModificationTrajet($request){
    $this->validateModificationTrajet($request);
    $view = new UserView($this,'Admin_chercherTrajet');
    $view->render();
  }

  public function AdminDeleteTrajet($request){
    $currentUser = $_SESSION['currentUser'];
    $id = $request->read('id');
    Trajet::deleteTrajet($id);
    $view = new UserView($this, 'Admin_chercherTrajet');
    $view->render();
  }

/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Fin de Admin Action

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/


public function validateCreationTrajet($request) {
  $lieuDepart = $request->read('lieuD');
  $lieuArrivee = $request->read('lieuA');
  $horaireDepart = $request->read('horaireD');
  $horaireArrivee = $request->read('horaireA');
  $mailConducteur = $request->read('mailC');
  $voiture = $request->read('voiture');
  $nbxplaces = $request->read('nbPlaces');
  $distance = $request->read('distance');
  $informations = $request->read('infos');

  //echo "<h2>Le trajet peut être enregistré</h2>";

  $trajet = Trajet::create($lieuDepart,$lieuArrivee,$horaireDepart,$horaireArrivee,$distance,$nbxplaces,$informations);
  if(!isset($trajet)) {
      $view = new MessageView($this, 'message_errTrajet', 'Erreur, votre trajet n\' a pas pu être créé...');
      $view->render();
      echo 'erreur dans la création de trajet';
  } else {
      $view = new UserView($this,'message_validateCreationTrajet', 'Votre trajet est créé ! ');
      $view->render();
  }
}

public function inscriptionTrajet($request){
  $currentUser = $_SESSION['currentUser'];
  $iduser = $currentUser->getIDUser();
  $idtrajet = $_GET['idtrajet'];
  $actif = $_GET['actif'];
  $nbxplaces = $_GET['$nbxplaces'];
  if($actif=="NON"){ //le trajet n'est plus actif, on ne peut plus s'y inscrire
    echo '<script> alert("Désolé, ce trajet n\' est plus actif !") </script>';
    $view = new UserView($this, 'chercherTrajet');
    $view->render();
  }
  else{
    if($nbxplaces==0){
      echo '<script> alert("Désolé, ce trajet n\' a plus de place !") </script>';
      $view = new UserView($this, 'chercherTrajet');
      $view->render();
    }
    else{
      Reserver::inscriptionTrajet($idtrajet,$iduser);
      $nbxplaces=$nbxplaces-1;
      Trajet::uptateNbxplaces($nbxplaces,$idtrajet);
      echo '<script> alert("Rejoint avec succès!") </script>';
      $view = new UserView($this, 'chercherTrajet');
      $view->render();
  }
  }
}

public function VoirMesTrajets($request){
  $_SESSION['action']="VoirMesTrajets";
  $view = new UserView($this,'User_mesTrajets');
  $view->render();
}

public function modifierTrajet($request){
  //$id = $request->read('id');
  //$trajet = new Trajet();
  //$trajet->setId($id);
  //$_SESSION['Trajet'] = $trajet;
  $view = new UserView($this,'User_modifierTrajet');
  $view->render();
}

public function RajouterEtape($request){
  //$id = $request->read('id');
  //$trajet = new Trajet();
  //$trajet->setId($id);
  //$_SESSION['Trajet'] = $trajet;
  $view = new UserView($this,'User_RajouterEtape');
  $view->render();
}

public function modifierTrajetOuRajouterEtape($request){
  $id = $request->read('id');
  $trajet = new Trajet();
  $trajet->setId($id);
  $_SESSION['Trajet'] = $trajet;
  $view = new UserView($this,'User_modifierTrajetOuRajouterEtape');
  $view->render();
}

public function UserModificationTrajet($request){
  $this->validateModificationTrajet($request);
  $view = new UserView($this,'User_mesTrajets');
  $view->render();
}

public function validateModificationTrajet($request){
  $trajet = $_SESSION['Trajet'];

  $lieuDepart = $request->read('lieuD');
  $lieuArrivee = $request->read('lieuA');
  $horaireDepart = $request->read('horaireD');
  $horaireArrivee = $request->read('horaireA');
  $mailConducteur = $request->read('mailC');
  $voiture = $request->read('voiture');
  $nbxplaces = $request->read('nbPlaces');
  $distance = $request->read('distance');
  $informations = $request->read('infos');
  $actif = $request->read('actif');
  if($lieuDepart!=NULL){
    $trajet->setlieuDepart($lieuDepart);}

  if($lieuArrivee!=null){
    $trajet->setlieuArrive($lieuArrivee);
  }
  if($horaireDepart!=null){
    $trajet->sethoraireDepert($horaireDepart);
  }
  if($horaireArrivee!=null){
    $trajet->sethoraireArrivee($horaireArrivee);
  }
  if($voiture!=null){
    $trajet->setvoiture($voiture);
  }
  if($nbxplaces!=null){
    $trajet->setnbxplaces($nbxplaces);
  }
  if($distance!=null){
    $trajet->setdistance($distance);
  }
  if($informations!=null){
    $trajet->setinformations($informations);
  }
  if($actif!=null){
    $trajet->setactif($actif);
  }

  if($actif!=null || $informations!=null || $distance!=null || $nbxplaces!=null || $voiture!=null || $horaireArrivee!=null || $horaireDepart!=null || $lieuArrivee!=null || $lieuDepart!=NULL){
    //$notification = 'Le trajet a été modifié';
    $horaireDepart = $trajet->getHoraireDepart();
    $invertedHoraireDepart = Trajet::convertDateToFr($horaireDepart);
    $horaireArrivee = $trajet->getHoraireArrivee();
    $invertedHoraireArrivee = Trajet::convertDateToFr($horaireArrivee);
    $lieuDepart = $trajet->getLieuDepart();
    $lieuArrivee = $trajet->getLieuArrivee();
    $notification = "Départ: ".$lieuDepart.", le: ".$invertedHoraireDepart.". Arrivée : ".$lieuArrivee;
    Notification::addNotificationsForTrajet($trajet->getIdTrajet(), 'Modification d\'un trajet', $notification);
  }
}

public function UserAjoutEtapeTrajet($request){
  echo '1';
  $this->validateAjoutEtapeTrajet($request);
  echo '2';
  $view = new UserView($this,'User_mesTrajets');
  echo '3';
  $view->render();
}

public function validateAjoutEtapeTrajet($request){
  echo '0';
  $trajet = $_SESSION['Trajet'];

  $etape1 = $request->read('e1');
  $etape2 = $request->read('e2');
  $etape3 = $request->read('e3');
  $etape4 = $request->read('e4');
  if($etape1!=NULL){echo '11';
    $trajet->ajouteEtape($etape1);
  }

  if($etape2!=null){echo '22';
    $trajet->ajouteEtape($etape2);
  }

  if($etape3!=NULL){echo '33';
    $trajet->ajouteEtape($etape3);
  }

  if($etape4!=null){echo '44';
    $trajet->ajouteEtape($etape4);
  }
  echo 'fin de validate';


}

public function deleteTrajet($request){
  $currentUser = $_SESSION['currentUser'];
  $id = $request->read('id');
  Trajet::deleteTrajet($id);
  $view = new UserView($this, 'User_mesTrajets');
  $view->render();
}

public function deleteReserver($request){
  $currentUser = $_SESSION['currentUser'];
  $nbxplaces = $_GET['$nbxplaces'];
  $id = $request->read('id');
  Trajet::deleteReserver($id);
  $nbxplaces=$nbxplaces+1;
  Trajet::uptateNbxplaces($nbxplaces,$id);
  $view = new UserView($this, 'User_mesTrajets');
  $view->render();
}

/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Section Groupe

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

 public function Groupe($request){
     $_SESSION['action']="Groupe";
   	 $view = new UserView($this,'User_Groupe');
	   $view->render();
   }

   public function CreerUnGroupe($request){
     $_SESSION['action']="CreerUnGroupe";
   	   $view = new UserView($this, 'User_CreerUnGroupe');
	   $view->render();
   }

   public function ValidateCreerUnGroup($request){
   	   $currentUser = $_SESSION['currentUser'];

	   $nom = $request->read('creerNom');
	   $prive = $request->read('getPrive');

	   if($nom!=NULL || $prive!=NULL){
	      $currentUser->addGroupe($nom,$prive);
		  }

      $view = new UserView($this,'User_Groupe');
      $view->render();

   }

   public function RechercherGroupe($request){
     $_SESSION['action']="RechercherGroupe";
     $view = new UserView($this, 'User_rechercherGroupe');
     $view->render();
   }

   public function ajouterGroupe($request){
     $currentUser = $_SESSION['currentUser'];
     $id = $_SESSION['id'];
     $idGroupe = $request->read('id');
     $prive = $currentUser->getGroupePrive($idGroupe);
     if($prive=="oui"){
       echo '<script> alert("Échec de la jointure! Ce groupe est privé !") </script>';
       $view = new UserView($this, 'User_rechercherGroupe');
       $view->render();
     }
     elseif ($prive=="non" && User::dansGroupe($id,$idGroupe)) {
       echo '<script> alert("Vous êtes déjà dans le groupe") </script>';
       $view = new UserView($this, 'User_rechercherGroupe');
       $view->render();
     }
     else{
       $currentUser->ajouterGroupe($idGroupe);
       echo '<script> alert("Le groupe a été rejoint avec succès !") </script>';
       $view = new UserView($this, 'User_Groupe');
       $view->render();
     }
   }

   public function retirerGroupe($request){
     $currentUser = $_SESSION['currentUser'];
     $id = $request->read('id');
     $currentUser->retirerGroupe($id);
     $view = new UserView($this, 'User_Groupe');
     $view->render();
   }

   public function deleteGroupe($request){
     $currentUser = $_SESSION['currentUser'];
     $id = $request->read('id');
     $currentUser->deleteGroupe($id);
     $view = new UserView($this, 'User_Groupe');
     $view->render();
   }

   public function addUnMembre($request){
     $currentUser = $_SESSION['currentUser'];
     $idGroupe = $request->read('id');
     $mail = $request->read('mail');
     $idUser = User::getId($mail);
     if(!User::isMailUsed($mail)){
       echo '<script> alert("Cet email n\'est pas valide") </script>';
     }
     elseif (User::isMailUsed($mail) && User::dansGroupe($idUser,$idGroupe)) {
       echo '<script> alert("Vous êtes déjà dans le groupe") </script>';
     }
     else{
       $currentUser->addUnMembre($idGroupe,$mail);
    }
     $view = new UserView($this, 'User_Groupe');
     $view->render();
   }

/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

   Fin Section Groupe

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/


   public function deleteNotifier($request){
     $currentUser = $_SESSION['currentUser'];
     $idNotif = $_GET['notifID'];
     //echo "<h2> View de la notification à supprimer :".$idNotif."</h2> ";
     Notification::deleteNotifier($idNotif, $currentUser->getIDUser());
     $view = new UserView($this, $_GET['currentView']);
     $view->render();
   }

}



?>
