<?php

class AdminController extends UserController {
  public function voirUnProfil($request){
    $mail = $_GET['mail'];
    $aUser = User::getUserwithMail($mail);
    $_SESSION['otherUser'] = $aUser;
    $view = new UserView($this,'Admin_VoirAutreUserProfil');
    $view->render();
  }

}
?>
