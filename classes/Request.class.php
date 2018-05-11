<?php

class Request extends MyObject {

   protected static $singleton = NULL;

   public static function getCurrentRequest(){
      if(is_null(static::$singleton))
         static::$singleton = new static();
	   return static::$singleton;
   }

   // ==============
   // Public API
   // ==============

	// return the name of the controller that should process this request
	// according to its parameters or 'Anonymous' if none has been passed
   public function getControllerName() {
     if(isset($_POST['c'])){
       return $_POST['c'];
     }
      elseif(isset($_GET['c'])){
 			   return $_GET['c'];
       }
		return "Anonymous";
   }

	// return the name of the action to execute for this request
   public function getActionName() {
     if(isset($_GET['a'])){
 			  return $_GET['a'];
      } elseif(isset($_POST['a'])){
        return $_POST['a'];
      }
		return 'defaultAction';
   }

   public function getidGroupe(){
     if(isset($_GET['a'])){
 			  return $_GET['a'];
      } elseif(isset($_POST['a'])){
        return $_POST['a'];
      }
		return 'defaultAction';
   }


   public function debug() {
      echo "Paramètres de requête : \nGET=";
      print_r($_GET);
      echo "\nPOST=";
      print_r($_POST);
      echo "\n";
   }

   public function read($text){
			//permet de lire les champs rentrés dans inscriptionTemplate
			if(isset($_POST[$text]))
				return $_POST[$text];
		}

   public function write($c, $value){
     // Ecrit dans le POST c la valeur value. Par exemple write('controller', 'user'); change le controller en user.
     $_GET[$c] = $value;
   }

   public function write_post($c, $value){
     $_POST[$c] = $value;
   }

}

?>
