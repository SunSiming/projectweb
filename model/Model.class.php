<?php
/*
* Root class of all my classes
*/
class Model extends MyObject {
	protected static $queries = array();

	function __construct()
	{
    }

	protected static function getCurrentDataBase()
	{
		$uniquebd = DatabasePDO::getCurrentDataBasePDO();
		$uniquebd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		return $uniquebd;
		//Renvoie l'unique instance de PDO vers la base.
	}

	protected static function query($sql)
    {
        $st = static::getCurrentDataBase()->prepare($sql) or die("erreur de sql query ! requête : " . $sql);
        $st->setFetchMode(PDO::FETCH_CLASS | PDO::FETCH_PROPS_LATE, get_called_class());

        return $st;
    }

public static function addQuery($nom, $rqt){
	static::$queries[$nom] = $rqt;
}

public static function execute($id, $params){
	$preparedRqt = static::query(static::$queries[$id]);
	//print_r($params);
			foreach($params as $key => $value)
			{
					if(is_int($value))
							$preparedRqt->bindValue($key, (int) $value, PDO::PARAM_INT);
					else
							$preparedRqt->bindValue($key, $value);
			}
			$preparedRqt->execute();

			return $preparedRqt->fetchAll();
}

public static function executeSansParams($id){
	$preparedRqt = static::query(static::$queries[$id]);

			$preparedRqt->execute();

			return $preparedRqt->fetchAll();
}

public static function executeSansRetour($id, $params){
	$preparedRqt = static::query(static::$queries[$id]);

			foreach($params as $key => $value)
			{
					if(is_int($value))
							$preparedRqt->bindValue($key, (int) $value, PDO::PARAM_INT);
					else
							$preparedRqt->bindValue($key, $value, PDO::PARAM_INT);
			}
			$preparedRqt->execute();

}

// Fonction execute Particulière pour requete multiple / i est le select que l'on veut récupérer
public static function executeMultipleRequete($i, $id, $params){
	$preparedRqt = static::query(static::$queries[$id]);
	//print_r($params);
			foreach($params as $key => $value)
			{
					if(is_int($value))
							$preparedRqt->bindValue($key, (int) $value, PDO::PARAM_INT);
					else
							$preparedRqt->bindValue($key, $value);
			}
			$preparedRqt->execute();

			for ( $x = 1; $x<$i; $x++){
				$preparedRqt->nextRowset();
			}

			return $preparedRqt->fetchAll();
}

}
?>
