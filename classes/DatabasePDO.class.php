<?php
class DatabasePDO extends PDO
{
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Connect to Database and create User table
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	protected static $mysql_dbname = "bddfinal2";
	protected static $mysql_user = "root";
	protected static $mysql_password = 'root';

	protected static $dsn = "mysql:host=localhost;dbname=bddfinal2";

  protected static $uniquebd = NULL;

  public static function getCurrentDataBasePDO(){
    if(is_null(static::$uniquebd)){
      try{

				static::$uniquebd = new PDO(static::$dsn,static::$mysql_user,static::$mysql_password,array(PDO::MYSQL_ATTR_INIT_COMMAND=>'SET NAMES utf8'));//($this->dsn,$this->mysql_user,$this->mysql_password);
        //echo '<h2>Connection to mysql succeeded!!</h2>';


      }
			catch(Exception $e){
				die('Erreur de connexion à la BDD MySQL<br>');
			}
    }

   return static::$uniquebd;
  }

  public function query($query){ //execution d'une requete sql
		return $this->PDOInstance->query($query);
	}
}

?>
