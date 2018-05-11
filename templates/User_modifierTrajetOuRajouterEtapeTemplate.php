<?php
	//session stock Id de user
	//$currentUser = new User($_SESSION['Id']);//necessaire ou pas ?? V��rifier qu'il n'est pas ��crit plusieur fois dans le code??

	//Session stocke User
	$currentUser = $_SESSION['currentUser'];
	$trajet = $_SESSION['Trajet'];
	//echo "<h2> idtrajet = ".$trajet->getIdTrajet()."</h2>";
?>

<div class='row'>
  <h1>Modifier le trajet ou lui rajouter des étapes</h1>
</div>

<div class='row'>
  <div class='col-lg-6'>
	 			<tr>
					<td>
							 <form action="index.php?c=user&a=modifierTrajet" method="post">
							 <button id="button2" type="submit">Modifier le trajet</button>
							 </form>
					</td>
        </tr>
  </div>
  <div class='col-lg-6'>
	 			<tr>
					<td>
							 <form action="index.php?c=user&a=RajouterEtape" method="post">
							 <button id="button2" type="submit">Rajouter des étapes au trajet</button>
							 </form>
					</td>
        </tr>
  </div>
