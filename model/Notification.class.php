<?php
class Notification extends Model
{
  /*public static function getNotif($notification){
    $notif = null;
    $notifications = parent::execute('SELECT_NOTIFICATION', array());
    $notif = $notifications[0];
    return $notif->NOTIFICATION;
  }*/

  public static function getNotifications($user){
    $notifications = parent::execute('SELECT_NOTIF_OF_USER', array(':iduser' => $user->getIDUser()));
    return $notifications;
  }

  public static function getIndication($idNotif){
    $result = null;
    $indicationT = parent::execute('SELECT_INDICATION', array(':idNotif' => $idNotif));
    $result = $indicationT[0];
    return $result->INDICATION;
  }

  public static function getNotificationsAndIDNotification($user){
    $notifications = parent::execute('SELECT_NOTIF_AND_IDNOTIFICATION_OF_USER', array(':iduser' => $user->getIDUser()));
    return $notifications;
  }

  public static function addNotificationsForTrajet($idTrajet, $indicationNotification, $notification){
    $idNotif = null;
    //parent::executeSansRetour('CREATE_NOTIF_FOR_TRAJET_AND_RECUP_ID', array(':idTrajet' => $idTrajet, ':notification' => $notification));
    $idNotifTable = parent::executeMultipleRequete(2, 'CREATE_NOTIF_FOR_TRAJET_AND_RECUP_ID', array(':idTrajet' => $idTrajet, ':indication' => $indicationNotification, ':notification' => $notification));
    $idNotif = $idNotifTable[0];
    //echo "<H2> lA CLASSE DE IDnOTIF EST ".get_class($idNotif)." </h2>";
    //echo "<h2>La dernière Idnotif créé est : ".$idNotif->IDNOTIFICATION."</h2>";
    //echo "<h2>Id du trajet concerné est : ".$idTrajet."</h2>";
    //echo "<h2>La dernière Idnotif créé est : ".DatabasePDO::getCurrentDataBasePDO()->lastInsertId()."</h2>";
    $usersConcernedByTheNotification = User::getUsersOfTrajet($idTrajet);
    foreach($usersConcernedByTheNotification as $user){
      $user->setId($user->IDUSER);

      parent::executeSansRetour('NOTIFIER_UN_USER', array('idNotif' => $idNotif->IDNOTIFICATION, 'idUser' => $user->IDUSER));
      //echo "<h2>Le user appelée ".$user->getName()." avec pour ID : ".$user->getIdUser()." est notifier.</h2>";
    }
    //parent::executeSansRetour('NOTIFIER_USERS_OF_TRAJET');
    /*$result = null;
    $trajetT = parent::execute('SELECT_R_TRAJET', array(':id'=> $idTrajet));
    $result = $trajetT[0];
    return $result;
    */
  }

  public static function deleteNotifier($idNotification, $idUser){
    parent::executeSansRetour('DELETE_NOTIFIER', array('idNotif' => $idNotification, 'idUser' => $idUser));
  }


}
?>
