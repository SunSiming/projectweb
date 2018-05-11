<?php
class Session extends MyObject
{
protected static $uniqueSession = NULL;
public static function startSession(){

    if (session_status() !== PHP_SESSION_ACTIVE) {session_start();}
  }

}

?>
