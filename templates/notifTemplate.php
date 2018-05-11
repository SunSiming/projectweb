<ul class='navbar-nav sidenav-toggler'>
  <li class='nav-item'>
    <a class='nav-link text-center' id='sidenavToggler'>
      <i class='fa fa-fw fa-angle-left'></i>
    </a>
  </li>
</ul>
<ul class='navbar-nav ml-auto'>
  <!--<li class='nav-item dropdown'>
    <a class='nav-link dropdown-toggle mr-lg-2' id='messagesDropdown' href='#' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
      <i class='fa fa-fw fa-envelope'></i>
      <span class='d-lg-none'>Messages-->
        <!--<span class='badge badge-pill badge-primary'>12 New</span>-->
    <!--  </span>
      <span class='indicator text-primary d-none d-lg-block'>
        <i class='fa fa-fw fa-circle'></i>
      </span>
    </a>
    <div class='dropdown-menu' aria-labelledby='messagesDropdown'>
      <h6 class='dropdown-header'>Nouveaux Messages :</h6>
      <div class='dropdown-divider'></div>
      <a class='dropdown-item' href='#'>
        <strong>David Miller</strong>
        <span class='small float-right text-muted'>11:21 AM</span>
        <div class='dropdown-message small'>Hey there! This new version of SB Admin is pretty awesome! These messages clip off when they reach the end of the box so they don't overflow over to the sides!</div>
      </a>
      <div class='dropdown-divider'></div>
      <a class='dropdown-item small' href='#'>View all messages</a>
    </div>
  </li>-->

<!-- Notification /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////:-->
  <li class='nav-item dropdown'>
    <a class='nav-link dropdown-toggle mr-lg-2' id='alertsDropdown' href='#' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
      <i class='fa fa-fw fa-bell'></i>
      <span class='d-lg-none'>Alertes
        <span class='badge badge-pill badge-warning'>6 New</span>
      </span>
      <span class='indicator text-warning d-none d-lg-block'>
        <i class='fa fa-fw fa-circle'></i>
      </span>
    </a>
    <div class='dropdown-menu' aria-labelledby='alertsDropdown'>
      <h6 class='dropdown-header'>Vos notifications :</h6>

<?php
      $controllerName = Request::getCurrentRequest()->getControllerName();

      $currentUser = $_SESSION['currentUser'];
      $notifications = Notification::getNotificationsAndIDNotification($currentUser);
      foreach ($notifications as $notif){
        echo "<div class='dropdown-divider'></div>
              <a class='dropdown-item' href='#'>
                <span class='text-success'>
                  <strong>
                    <i class='fa fa-long-arrow-up fa-fw'></i>".Notification::getIndication($notif->IDNOTIFICATION)."</strong>
                </span>
                <!--<div class='dropdown-message small'> Départ: ".$notif->IDNOTIFICATION."</div>-->
                <div class='dropdown-message small'>".$notif->NOTIFICATION."</div>

                <form action='index.php?c=".$controllerName."&notifID=".$notif->IDNOTIFICATION."&currentView=".$view->getTemplateName()."&a=deleteNotifier' method='post'>
                		<table>
                				<tr>
                					<button class='btn btn-primary' type='submit' href='index.php?c=".$controllerName."&notifID=".$notif->IDNOTIFICATION."' value='deleteNotifier' name='a' >Vu</button>
                        </tr>
                			</table>
                </form>
              </a>";
      }
 ?>
      <div class='dropdown-divider'></div>
      <a class='dropdown-item small' href='#'>Tout afficher</a>
    </div>
  </li>
<!-- Fin notification  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////:-->



  <li class='nav-item dropdown'>
    <a class='nav-link dropdown-toggle mr-lg-2' id='alertsDropdown' href='#' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
      <img src="img/man-anonyme.png" height="20" weight="25">
      <span class='d-lg-none'>utilisateur</span>
      <span class='indicator text-warning d-none d-lg-block'>

      </span>
    </a>
    <div class='dropdown-menu' aria-labelledby='alertsDropdown'>
      <a class='dropdown-header' href="index.php?c=user&a=getInformationUser">Mes Informations</a>
      <div class='dropdown-divider'></div>
      <a class='dropdown-header' href="index.php?c=user&a=modifierProfil">Modifier Mon Profil</a>
      <div class='dropdown-divider'></div>
      <a class='dropdown-header' href="index.php?c=user&a=Groupe">Mes Groupes</a>
      <div class='dropdown-divider'></div>
      <a class='dropdown-header' href="index.php?c=user&a=VoirMesTrajets">Mes Trajets</a>
    </div>
  </li>
  <li class='nav-item'>
    <a class='nav-link' data-toggle='modal' data-target='#exampleModal'>
      <i class='fa fa-fw fa-sign-out'></i>Se déconnecter</a>
  </li>
</ul>
</div>
</nav></div>
</div>
</div>
<!-- Bootstrap core JavaScript-->

<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Page level plugin JavaScript-->
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="vendor/datatables/jquery.dataTables.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.js"></script>
<!-- Custom scripts for all pages-->
<script src="js/sb-admin.min.js"></script>
<!-- Custom scripts for this page-->
<script src="js/sb-admin-datatables.min.js"></script>
<script src="js/sb-admin-charts.min.js"></script>
</div>
