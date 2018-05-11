
<?php
      $action=$_SESSION['action'];
    	function renderMenuToHTML($currentPageId) {
    	   // un tableau qui définit la structure du site
    	   $mymenu = array(
    	       // idPage titre
    	        'index' => array( 'index','Accueil' ),
              'information' => array( 'information','Information' ),
              'inscription'=> array ('inscription', 'Inscription'),
              //'creertrajet' => array ('creertrajet','Créer un trajet')
    	        /*'mestrajets' => array( 'mestrajets','Mes trajets' ),
    	        'nouveautrajet' => array('nouveautrajet','Nouveau Trajet'),
    	        'contact'=> array('contact','Contact'),
    	        'gerergrp'=> array ('gerergrp','Gérer mes groupes'),
              'inscription'=> array ('inscription', 'Inscription')*/
            );
          echo "  ";

      	/*foreach($mymenu as $pageId => $pageParameters) {
      		//if ($pageId === $currentPageId){ //cherche currentPageId pour l'identifier
      			//echo "<li class = 'currentpage'><a href='?page=$pageParameters[0]'> $pageParameters[1]</a></li>"; //affiche menu
            //la balise i sert pour la petite image à coté du "bouton"

//En attendant mais du coup ceci est un code sale je changerai après avoir fini le TP
            echo "
              <li class='nav-item' data-toggle='tooltip' data-placement='right' title='Dashboard'>
       	          <!--<a class='nav-link' href='?page=$pageParameters[0]'>-->
                    <a class='nav-link' href='index.php?c=anonymous&amp;a=inscription]'>
                    <i class='fa fa-fw fa-dashboard'></i>
       	            <span class='nav-link-text'>$pageParameters[1]</span>
       	          </a>
       	        </li>
                ";
      	//	}
      		//else {
      	//		echo "<li><a href='?page=$pageParameters[0]> $pageParameters[1]</a></li>"; //affiche menu
          echo "
          <li class='nav-item' data-toggle='tooltip' data-placement='right' title='Dashboard'>
              <!--<a class='nav-link' href='?page=$pageParameters[0]'>-->
              <a class='nav-link' href='index.php?c=anonymous&amp;a=inscription'>
                <!--<i class='fa fa-fw fa-dashboard'></i>-->
                <span class='nav-link-text'>$pageParameters[1]</span>
              </a>
            </li>
            ";
      		//}
      	}*/
      }
?>

<?php
/*  $currentPageId = 'index';
  if (isset ($_GET['page'])){
    $currentPageId = $_GET['page'];
   }
  renderMenuToHTML($currentPageId);*/
  $controllerName = Request::getCurrentRequest()->getControllerName();

?>

<nav class='navbar navbar-expand-lg navbar-dark bg-dark fixed-top' id='mainNav' >
       <a href='index.php?c=<?php echo "$controllerName";?>'><img src="img/logo.png" height="45" width="300"></a>
         <button class='navbar-toggler navbar-toggler-right' type='button' data-toggle='collapse' data-target='#navbarResponsive' aria-controls='navbarResponsive' aria-expanded='false' aria-label='Toggle navigation'>
           <span class='navbar-toggler-icon'></span>
           </button>
           <div class='collapse navbar-collapse' id='navbarResponsive'>
             <ul class='navbar-nav navbar-sidenav' id='exampleAccordion'>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Les onglets du menu

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->



<li class='nav-item' data-toggle='tooltip' data-placement='right' title='Dashboard' style='background-color:<?php if($action=="defaultAction")echo "orange"; ?> '>
         <a class='nav-link' href='index.php?c=<?php echo "$controllerName";?>'>
         <i class='fa fa-fw fa-dashboard'></i>
         <span class='nav-link-text'><font color="white">Accueil</font></span>
       </a>
     </li>




  <li class='nav-item' data-toggle='tooltip' data-placement='right' title='rechercherUser' style='background-color:<?php if($action=="rechercherUser")echo "orange"; ?> '>

             <a class='nav-link' href='index.php?c=user&amp;a=rechercherUser'>
             <i class='fa fa-fw fa-address-book'></i>
             <span class='nav-link-text'><font color="white">Rechercher un utilisateur</font></span>
           </a>
         </li>
         <li class='nav-item' data-toggle='tooltip' data-placement='right' title='Dashboard' style='background-color:<?php if($action=="rechercherTrajet")echo "orange"; ?> '>

               <a class='nav-link' href='index.php?c=user&amp;a=rechercherTrajet'>
               <i class='fa fa-fw fa-blind'></i>
               <span class='nav-link-text'><font color="white">Rechercher un trajet</font></span>
             </a>
           </li>
           <!--<li class='nav-item' data-toggle='tooltip' data-placement='right' title='Dashboard' style='background-color:<?php if($action=="RechercherGroupe")echo "orange"; ?> '>

                 <a class='nav-link' href='index.php?c=user&amp;a=RechercherGroupe'>
                 <i class='fa fa-fw fa-dashboard'></i>
                 <span class='nav-link-text'><font color="white">Rechercher un Groupe</font></span>
               </a>
             </li>-->
           <li class='nav-item' data-toggle='tooltip' data-placement='right' title='Dashboard' style='background-color:<?php if($action=="creerTrajet")echo "orange"; ?> '>

                 <a class='nav-link' href='index.php?c=user&amp;a=creerTrajet'>
                 <i class='fa fa-fw fa-car'></i>
                 <span class='nav-link-text'><font color="white">Créer un trajet</font></span>
               </a>
           </li>

           <li class='nav-item' data-toggle='tooltip' data-placement='right' title='Dashboard' style='background-color:<?php if($action=="VoirMesTrajets")echo "orange"; ?> '>

                   <a class='nav-link' href='index.php?c=user&amp;a=VoirMesTrajets'>
                   <i class='fa fa-fw fa-location-arrow'></i>
                   <span class='nav-link-text'><font color="white">Mes Trajets</font></span>
                 </a>
           </li>




</ul>


<!--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////       -->
