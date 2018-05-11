<?php
class Groupe extends Model
{
    public function getNom($nom){
      $name = null;
  		$nom = parent::execute('SELECT_NOM_GROUPE', array(':id' => $nom));
  		$name = $nom[0];
  		return $name->NOM_GROUPE;
    }

    public function getPrive($prive){
      $A = null;
  		$a = parent::execute('SELECT_PRIVE_GROUPE', array(':id' => $prive));
  		$A = $a[0];
  		return $A->PRIVE_GROUPE;
    }


 }

?>
