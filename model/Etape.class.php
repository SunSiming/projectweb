<?php
class Etape extends Model
{
    private $id;
    private $nom;

    public function getId(){
      $id = null;
  		$ids = parent::execute('SELECT_ID_ETAPE', array(':id' => $idEtape));
  		$id = $ids[0];
  		return $id->ID_ETAPE;
    }

    public function getName(){
      $name = null;
  		$nom = parent::execute('SELECT_NOM_ETAPE', array(':id' => $nomEtape));
  		$name = $nom[0];
  		return $name->NOM_ETAPE;
    }

    public function getCodePostal(){
      $code = null;
  		$codes = parent::execute('SELECT_CODEPOSTAL', array(':id' => $codePostal));
  		$code = $codes[0];
  		return $code->CODEPOSTAL;
    }

    public function setName($nomEtape){
      $this->nom = $nomEtape;
    }


    public static function create($nomEtape) {	//insère dans la base une nouvelle étape
      try{
        $etape = new Etape();
        parent::executeSansRetour('CREER_ETAPE', array(':nometape' => $nomEtape));
      } catch (PDOException $error) {
        echo "Erreur de creation d'étape";
      }
      return $etape;
    }

    public static function nombre_etapes($nomEtape){
      try{
        $etape = new Etape();
        $nombreEtapes = parent::execute('NOMBRE_ETAPES', array(':nometape' => $nomEtape));
      } catch (PDOException $error) {
        echo "Erreur dans la récupération du nombre d'étapes";
      }
      return $nombreEtapes[0]->COUNT;
    }



    public static function getEtapei($idtrajet, $i){//retourne les etapes d'un trajet donné
      $result = null;
      $etapes = parent::execute('SELECT_ETAPES', array(':id'=> $idtrajet));
      if ($etapes != null){
        $result = $etapes[$i];
        return $result->NOM_ETAPES;
      }
      return " ";
    }

    public static function nombre_etapes_trajet($idtrajet){
      $res = -1;
      $etape = new Etape();
      $nombreEtapes = parent::execute('SELECT_NOMBRE_ETAPES', array(':id' => $idtrajet));
        if ($nombreEtapes != null){
          $res = $nombreEtapes[0]->COUNT;
        }
      return $res;
    }

    public static function getIdAvecNom($nometape){
      $id = null;
      $nombreEtapes = Etape::nombre_etapes($nometape);
      if ($nombreEtapes == 0){
        $etape = Etape::create($nometape);
      }
  		$ids = parent::execute('SELECT_ID_AVEC_NOM', array(':nometape' => $nometape));
  		return $ids[0]->ID_ETAPE;
    }



}
?>
