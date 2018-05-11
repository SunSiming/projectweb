<?php
class Voiture extends Model
{
    public function getIdProprietaire($id){
      $A = null;
  		$a = parent::execute('SELECT_IDPROPRIETAIRE', array(':id' => $id));
  		$A = $a[0];
  		return $A->IDPROPRIETAIRE;
    }

     public function getMarque($marque){
      $A = null;
  		$a = parent::execute('SELECT_MARQUE_VOITURE', array(':id' => $marque));
  		$A = $a[0];
  		return $A->MARQUE_VOITURE;
    }

	 public function getModele($modele){
      $A = null;
  		$a = parent::execute('SELECT_MODELE_VOITURE', array(':id' => $modele));
  		$A = $a[0];
  		return $A->MODELE_VOITURE;
    }
    
     public function getNbxPlace($nb){
      $A = null;
  		$a = parent::execute('SELECT_NBXPLACE_VOITURE', array(':id' => $nb));
  		$A = $a[0];
  		return $A->NBXPLACE_VOITURE;
    }

	 public function getCouleur($couleur){
      $A = null;
  		$a = parent::execute('SELECT_COULEUR_VOITURE', array(':id' => $couleur));
  		$A = $a[0];
  		return $A->COULEUR_VOITURE;
    }
 }  

?>