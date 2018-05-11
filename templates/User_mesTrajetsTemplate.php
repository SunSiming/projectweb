<?php
	//session stock Id de user
	//$currentUser = new User($_SESSION['Id']);//necessaire ou pas ?? V��rifier qu'il n'est pas ��crit plusieur fois dans le code??

	//Session stocke User
	$currentUser = $_SESSION['currentUser'];
?>
<script>
function _delete()
{
	alert("Vous avez supprimé ce trajet !");
}
</script>

<div class='row'>
  <div class='col-lg-4'>
    <h1 >Mes Trajets</h1>
  </div>
</div>


 <div class='row'>
	 <h2>Trajets publiés :</h2>
	 <table id="mytable" width="100%">
	   <tr>
	 		<th>Nom</th>
			<th>Actif</th>
	 		<th>Horaire de départ</th>
	 		<th>Horiare d'arrivée</th>
      <th>Lieu de départ</th>
      <th>Lieu d'arrivée</th>
      <th>Etapes</th>
      <th>Nombre de place</th>
      <th>Information</th>
			<th>Modifier</th>
			<th>Supprimer</th>
	   </tr>
	 	<?php
	 		$trajets = Trajet::getTrajetsCurrentUserAsCreateur($currentUser->getIDUser());
			if ($trajets==null)
			  echo'
				<td colspan="11"> Aucun ！<td> ' ;
	 		foreach ($trajets as $trajet) {
				$trajet->setId($trajet->IDTRAJET);
				$nbetapesencours = 0; //représente l'indice du nombre d'étapes du trajet
				$nbetapes = Etape::nombre_etapes_trajet($trajet->IDTRAJET); //représente le nombre d'étapes total du trajet
				$horaireDepart = $trajet->getHoraireDepart();
				$invertedHoraireDepart = Trajet::convertDateToFr($horaireDepart);
				$horaireArrivee = $trajet->getHoraireArrivee();
				$invertedHoraireArrivee = Trajet::convertDateToFr($horaireArrivee);

//Attention nombre de place restantes
	 			echo '
	 			<tr>
	 				<td>'.$trajet->getName().'</td>
					<td>'.$trajet->getActif().'</td>
	 				<td>'.$invertedHoraireDepart.'</td>
	 				<td>'.$invertedHoraireArrivee.'</td>
          <td>'.$trajet->getLieuDepart().'</td>
	 				<td>'.$trajet->getLieuArrivee().'</td>
					<td>
					';
					if ($nbetapesencours>=0){
						while ($nbetapesencours < $nbetapes ){
							echo ''.Etape::getEtapei($trajet->IDTRAJET, $nbetapesencours).'';
							echo '<br>';
							$nbetapesencours = $nbetapesencours + 1;
						}
					};

					echo '
					</td>
          <td>'.$trajet->getNbxPlace().'</td>
	 				<td>'.$trajet->getInformation().'</td>
					<td>
							 <form action="index.php?c=user&a=modifierTrajetOuRajouterEtape" method="post">
							 <button id="button1" type="submit" name="id" value='.$trajet->IDTRAJET.'>Modifier</button>
							 </form>
					</td>
          <td>
  						 <form action="index.php?c=user&a=deleteTrajet" method="post">
  						 <button id="button1" type="submit" name="id" value='.$trajet->IDTRAJET.' onclick="_delete()">Supprimer</button>
  						 </form>
  				</td>


  	 			</tr>

       	';
			}

	 	?>

	 </table>

	 <p></P>
	 <p></P>

		 <h2 id="press">Trajets Participants :</h2>
		 <table width="100%">
		 	<tr>
		 	<th>Nom</th>
			<th>Actif</th>
		 	<th>Horaire de départ</th>
		 	<th>Horiare d'arrivée</th>
		 	 <th>Lieu de départ</th>
		 	 <th>Lieu d'arrivée</th>
		 	 <th>Etapes</th>
		 	 <th>Nombre de place</th>
		 	 <th>Information</th>
		 	<th>Supprimer</th>
		  </tr>
		 <?php
		 	$idtrajets = Trajet::getTrajetsParticipants($currentUser->getIDUser());;
			if ($idtrajets==null)
			  echo'
				<td colspan="10"> Aucun ！<td> ' ;
		 	foreach ($idtrajets as $idtrajet) {
		 		$id = $idtrajet->IDTRAJET;
		 		$trajet = Trajet::getUnTrajet($id);
		 		$trajet->setId($id);
				$nbetapesencours = 0; //représente l'indice du nombre d'étapes du trajet
				$nbetapes = Etape::nombre_etapes_trajet($trajet->IDTRAJET); //représente le nombre d'étapes total du trajet
				$horaireDepart = $trajet->getHoraireDepart();
				$invertedHoraireDepart = Trajet::convertDateToFr($horaireDepart);
				$horaireArrivee = $trajet->getHoraireArrivee();
				$invertedHoraireArrivee = Trajet::convertDateToFr($horaireArrivee);
		 //Attention nombre de place restantes
		 		echo '
		 		<tr>
		 			<td>'.$trajet->getName().'</td>
  				 <td>'.$trajet->getActif().'</td>
	 				<td>'.$invertedHoraireDepart.'</td>
	 				<td>'.$invertedHoraireArrivee.'</td>
		 			 <td>'.$trajet->getLieuDepart().'</td>
		 			<td>'.$trajet->getLieuArrivee().'</td>
					<td>
					';
					if ($nbetapesencours>=0){
						while ($nbetapesencours < $nbetapes ){
							echo ''.Etape::getEtapei($trajet->IDTRAJET, $nbetapesencours).'';
							echo '<br>';
							$nbetapesencours = $nbetapesencours + 1;
						}
					};

					echo '
					</td>
		 			 <td>'.$trajet->getNbxPlace().'</td>
		 			<td>'.$trajet->getInformation().'</td>
		 			 <td>
		 					 <form action="index.php?c=user&a=deleteReserver&$nbxplaces='.$trajet->getNbxPlace().'" method="post">
		 					 <button id="button1" type="submit" name="id" value='.$trajet->IDTRAJET.' onclick="_delete()">Supprimer</button>
		 					 </form>
		 			</td>


		 			</tr>

		 			';
		 	}

		 ?>
		 </table>
	<p></p>
 </div>
</div>
