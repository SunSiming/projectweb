<?php
class User extends Model
{
  private $id;

  public function __construct(){
     //$id = $IDuser;
  }

  public function setId($IDUser){
    $this->id = $IDUser;
  }

  // instance-side method to render a User object to HTML
  public function toHtml() {
    echo "<tr>"
      . "<td>". $this->id . "</td>"
      . "<td>". $this->name . "</td>"
      . "<td>" . $this->email . "</td></tr>";
  }

  // class-side method to render an array of users as an HTML table
  public static function showUsersAsTable($users) {
    echo '<table><thead>
        <tr><th>Id</th><th>Nom</th><th>Email</th></tr></thead><tbody>';
    foreach($users as $u)
      $u->toHtml();
    echo '</tbody></table>';
  }

  public static function getId($mail){	//permet de récupérer l'id de l'utilisateur
    $IdTab = parent::execute('RECUP_ID', array(':mail' => $mail));
    $id = $IdTab[0]->IDUSER;
    return $id;
  }



  public static function isPseudoUsed($pseudo){
    return count(parent::execute('IS_PSEUDO_USED', array(':pseudo' => $pseudo))) != 0;
}


  public static function isMailUsed($mail){
    try {
      $result = count(parent::execute('IS_MAIL_USED', array(':mail' => $mail))) != 0;
    } catch (PDOException $erreur) {
          echo 'Désolé cher utilisateur...';
          echo 'Erreur : ' . $erreur->getMessage() . "\n";
          $result = false;
    }
    return $result;
  }

///En Cours
  public static function checkMailPassword($mail,$password){
    try{
      $user = new User();
		  $result = (parent::execute('CONNECT', array(':mail'=> $mail, ':password' =>$password)));
      if($result[0]->compteur == 0){
        return NULL;
      }
      $user->setId(User::getId($mail));
      return $user;

    }catch(PDOException $error){
      echo 'Echec de connexion à MySQL.';
    }
  }

  //Constructeur
  public static function create($password,$mail,$nom,$prenom,$pseudo,$fonction) {	//insère dans la base un nouvel utilisateur et retourne une instance de la classe User représentant ce nouvel utilisateur
    try{
      $user = new User();
      parent::executeSansRetour('CREER_USER', array(':mail' => $mail, ':password' => $password, ':nom' => $nom, ':prenom' => $prenom, ':pseudo' => $pseudo, ':fonction' => $fonction));
      $user->setId(User::getId($mail));
      return $user;
    } catch (PDOException $error) {
      //echo "Erreur de création de l'utilisateur";

      //$error->getMessage;
    }
  }


/*///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


Accesseurs


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

  public function isAdmin(){
    $isadmin = null;
    $admin = parent::execute('SELECT_ISADMIN', array(':id' => $this->id));
    $isadmin = $admin[0];
    if ($isadmin->ISADMIN == 0){
      return false;
    } else{
      return true;
    }
  }

  public function isBloqued(){
    $isbloqued = null;
    $bloqued = parent::execute('ISBLOQUED', array(':id' => $this->id));
    $isbloqued = $bloqued[0];
    if ($isbloqued->ISBLOQUED == 0){
      return false;
    } else{
      return true;
    }
  }

  public  function setIsBloqued($isbloqued){
      parent::executeSansRetour('CHANGER_ISBLOQUED', array(':isbloqued' => $isbloqued, ':id' => $this->id));
  }

    public function getIDUser(){
      return $this->id;
    }

    public function getMail(){
      $mail = null;
      $emails = parent::execute('SELECT_EMAIL', array(':id' => $this->id));
      $mail = $emails[0];
      return $mail->EMAIL;
    }

    public  function setMail($email){
        parent::executeSansRetour('CHANGER_MAIL', array(':email' => $email, ':id' => $this->id));
    }

    public function getName(){
      $name = null;
  		$nom = parent::execute('SELECT_NOM', array(':id' => $this->id));
  		$name = $nom[0];
  		return $name->NOM;
    }

    public function setName($nom){
      parent::executeSansRetour('CHANGER_NOM', array(':nom' => $nom, ':id' => $this->id));
    }

    public function getFirstname(){
      $name = null;
  		$nom = parent::execute('SELECT_PRENOM', array(':id' => $this->id));
  		$name = $nom[0];
  		return $name->PRENOM;
    }

    public  function setFirstname($prenom){
        parent::executeSansRetour('CHANGER_PRENOM', array(':prenom' => $prenom, ':id' => $this->id));

    }

    public  function getTel(){
      $tel = null;
      $userTel = parent::execute('SELECT_TEL', array(':id' => $this->id));
      $tel = $userTel[0];
      return $tel->TEL;
    }

    public  function setTel($tel){
        parent::executeSansRetour('CHANGER_TEL', array(':tel' => $tel, ':id' => $this->id));
    }

    public  function getNbTrajetsRealises(){
      $Nb = null;
      $userT = parent::execute('SELECT_NOMBRETRAJETREALISES', array(':id' => $this->id));
      $Nb = $userT[0];
      return $Nb->NOMBRETRAJETREALISES;
    }

    public  function setNbTrajetsRealises($nbTR){
        parent::executeSansRetour('CHANGER_NOMBRETRAJETREALISES', array(':nbTR' => $nbTR, ':id' => $this->id));
    }

    public  function getAvatar(){
        $uniquebd = DatabasePDO::getCurrentDataBasePDO();
        $uniquebd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $request = "SELECT AVATAR FROM user WHERE IDUSER = '".$this->id."';'";
        $result = $uniquebd->query($request);//on execute la requête sql
  			$donnees = $result->fetch(PDO::FETCH_OBJ);	//les résultats de la requete sont stockés dans $donnees

  			$avatar=$donnees->AVATAR;

  			return $avatar;
    }

    public  function setAvatar($avatar){
        parent::executeSansRetour('CHANGER_AVATAR', array(':avatar' => $avatar, ':id' => $this->id));
    }

    public  function getPseudo(){
        $result = null;
        $userT = parent::execute('SELECT_PSEUDO', array(':id' => $this->id));
        $result = $userT[0];
        return $result->PSEUDO;
    }

    public  function setPseudo($pseudo){
        parent::executeSansRetour('CHANGER_PSEUDO', array(':pseudo' => $pseudo, ':id' => $this->id));
    }

    public function getInfo(){
      $result = null;
      $userT = parent::execute('SELECT_USER_INFORMATION', array(':id' => $this->id));
      $result = $userT[0];
      return $result->INFORMATION;
    }

    public  function setInfo($info){
        parent::executeSansRetour('CHANGER_INFOMATION', array(':info' => $info, ':id' => $this->id));
    }

    public  function getIsAdmin(){
      $result = null;
      $userT = parent::execute('SELECT_ISADMIN', array(':id' => $this->id));
      $result = $userT[0];
      return $result->ISADMIN;
    }

    public  function setIsAdmin($isadmin){
        parent::executeSansRetour('CHANGER_ISADMIN', array(':isadmin' => $isadmin, ':id' => $this->id));
    }

    public  function getUnite(){
      $result = null;
      $userT = parent::execute('SELECT_UNITE', array(':id' => $this->id));
      $result = $userT[0];
      return $result->UNITE;
    }

    public  function setUnite($unite){
        parent::executeSansRetour('CHANGER_UNITE', array(':unite' => $unite, ':id' => $this->id));
    }

    public  function getFonction(){
      $result = null;
      $userT = parent::execute('SELECT_FONCTION', array(':id' => $this->id));
      $result = $userT[0];
      return $result->FONCTION;
    }

    public  function setFonction($fct){
        parent::executeSansRetour('CHANGER_FONCTION', array(':fct' => $fct, ':id' => $this->id));
    }

    public  function getSite(){
      $result = null;
      $userT = parent::execute('SELECT_SITE', array(':id' => $this->id));
      $result = $userT[0];
      return $result->SITE;
    }

    public  function setSite($site){
        parent::executeSansRetour('CHANGER_SITE', array(':site' => $site, ':id' => $this->id));
    }

    public  function getPromotion(){
      $result = null;
      $userT = parent::execute('SELECT_PROMOTION', array(':id' => $this->id));
      $result = $userT[0];
      return $result->PROMOTION;
    }

    public  function setPromotion($promo){
        parent::executeSansRetour('CHANGER_PROMOTION', array(':promo' => $promo, ':id' => $this->id));
    }

    public  function getTypePromotion(){
      $result = null;
      $userT = parent::execute('SELECT_TYPEPROMOTION', array(':id' => $this->id));
      $result = $userT[0];
      return $result->TYPEPROMOTION;
    }

    public  function setTypePromotion($typepromo){
        parent::executeSansRetour('CHANGER_TYPEPROMOTION', array(':typepromo' => $typepromo, ':id' => $this->id));
    }

    public  function getPassword(){
        $uniquebd = DatabasePDO::getCurrentDataBasePDO();
        $uniquebd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $request = "SELECT MOT_DE_PASSE FROM user WHERE IDUSER = '".$this->id."';'";
        $result = $uniquebd->query($request);//on execute la requête sql
  			$donnees = $result->fetch(PDO::FETCH_OBJ);	//les résultats de la requete sont stockés dans $donnees

  			$mdp=$donnees->MOT_DE_PASSE;

  			return $mdp;
    }

    public  function setPassword($mdp){
        parent::executeSansRetour('CHANGER_MOT_DE_PASSE', array(':mdp' => $mdp, ':id' => $this->id));
    }

    public function printAllInformation(){
      if(($this->getFonction()) == 'agent'){
        if(($this->getSite()) !== null){
          echo "    <h5> Site:  ".$this->getSite()."</h5>";
        }
        if(($this->getUnite()) !== null){
          echo "    <h5> Unité:  ".$this->getUnite()."</h5>";
        }
      } else {
          if(($this->getPromotion()) !== null){
            echo "    <h5> Promotion:  ".$this->getPromotion()."</h5>";
          }
          if(($this->getTypePromotion()) !== null){
            echo "    <h5> Type de Promotion: ".$this->getTypePromotion()." </h5>";
          }
      }
      if(($this->getInfo()) !== null){
       echo "<dd>".$this->getInfo()."</dd>";
     }
    }

	public function addGroupe($groupeNom,$prive){
    $idGroupe = rand(1,10000);
		parent::executeSansRetour('ADDGROUPE', array(':idGroupe' => $idGroupe, ':idUser' => $this->id, ':groupeNom'=> $groupeNom, ':prive'=> $prive));
		parent::executeSansRetour('ADDAPPARTENIR', array(':idUser' => $this->id, ':idGroupe' => $idGroupe));
	}

  public function getGroupeId(){
    $groupes = parent::execute('SELECT_GROUPE_ID',array(':id' => $this->id));
    return $groupes;
  }

  public function getIdGroupe(){
    $groupes = parent::execute('SELECT_ID_GROUPE',array(':id' => $this->id));
    return $groupes;
  }

  public static function getTousGroupeId(){
    $users = parent::executeSansParams('SELECT__TOUS_IDGROUPE');
    return $users;
  }

  public function getGroupeNom($id){
    $name = null;
    $nom = parent::execute('SELECT_NOM_GROUPE', array(':id' => $id));
    $name = $nom[0];
    return $name->NOM;
  }

  public function getGroupePrive($id){
    $result = null;
    $userT = parent::execute('SELECT_PRIVE_GROUPE', array(':id' => $id));
    $result = $userT[0]->PRIVE;
    if($result==1)
       return "oui";
    else
       return "non";
  }

  public function getGroupeCreateur($id){
    $result = null;
    $userT = parent::execute('SELECT_ID_CREATEUR', array(':id' => $id));
    $result = $userT[0]->IDUSER;
    $nom = User::getCreateur($result);
    return $nom;
  }

  public static function getCreateur($id){
    $name = null;
    $nom = parent::execute('SELECT_PRENOM', array(':id' => $id));
    $name = $nom[0];
    return $name->PRENOM;
  }

  public function getGroupeMembre($id){
    $result = null;
    $userT = parent::execute('SELECT_ID_MEMBRE', array(':id' => $id));
    $k = count($userT);
   for($i=0; $i<$k; $i++){
      $idUser = $userT[$i]->IDUSER;
      $nom = parent::execute('SELECT_PRENOM', array(':id' => $idUser));
      $name = $nom[0]->PRENOM;
      $result = $result.$name.'<br>';
    }
    return $result;
  }

  public function ajouterGroupe($idGroupe){
    parent::executeSansRetour('ADDAPPARTENIR', array(':idGroupe' => $idGroupe, ':idUser' => $this->id));
  }

  public function retirerGroupe($idGroupe){
    parent::executeSansRetour('DELETEUNAPPARTENIR', array(':idGroupe' => $idGroupe, ':idUser' => $this->id));
  }

  public function deleteGroupe($idGroupe){
    parent::executeSansRetour('DELETEAPPARTENIR', array(':idGroupe' => $idGroupe));
    parent::executeSansRetour('DELETEGROUPE', array(':idGroupe' => $idGroupe));
  }

  public function addUnMembre($id,$mail){
    $idUser = User::getId($mail);
    parent::executeSansRetour('ADDAPPARTENIR', array(':idGroupe' => $id, ':idUser' => $idUser));
  }

  public static function dansGroupe($idUser,$idGroupe){
    $result = false;
    $userT = parent::execute('SELECT_ID_MEMBRE', array(':id' => $idGroupe));
    $k = count($userT);
   for($i=0; $i<$k; $i++){
      $id = $userT[$i]->IDUSER;
      if($id == $idUser)
         $result = true;
    }
    return $result;
  }

/*///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


    Fin des Accesseurs


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

public static function getUsersAleatoire(){ // Rend tous les utilisateurs
  $users = parent::executeSansParams('SELECT_S_IDUSER');
  return $users;
}

public static function getUsersOfTrajet($idTrajet){ // Rend tous les utilisateurs d'un trajet
  $users = parent::execute('IDUSERS_OF_A_TRAJET', array(':idTrajet' => $idTrajet));
  return $users;
}

public static function getUnUserAleatoire(){
  $users = User::getUsersAleatoire();
  $aUser = $users[1];
  $idUser = $aUser->IDUSER;
  $user = new User();
  $user->setId($idUser);
  return $user;
}

public static function getUserwithMail($mail){
  $user = new User();
  $user->setId(User::getId($mail));
  return $user;
}

/*///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


    Admin Action


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

public static function bloqueQQN($id){
  parent::executeSansRetour('BLOQUER_QQN', array(':id' => $id));
  //Supprimer ses trajets
  parent::executeSansRetour('SUPPRIMER_LES_TRAJETS_DE_QQN', array(':id' => $id));
  //Supprimer l'utilisateur de ses trajets
  parent::executeSansRetour('SUPPRIMER_QQN_DE_SES_TRAJETS', array(':id' => $id));
}

public static function debloqueQQN($id){
  parent::executeSansRetour('DEBLOQUER_QQN', array(':id' => $id));
}

public static function rendreAdmin($id){
  parent::executeSansRetour('ADMIN_QQN', array(':id' => $id));
}

public static function rendreNonAdmin($id){
  parent::executeSansRetour('NONADMIN_QQN', array(':id' => $id));
}

/*///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


    Fin des Admin Actions


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/


}

?>
