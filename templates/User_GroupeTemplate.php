<?php
	$currentUser = $_SESSION['currentUser'];
?>
<script>
function _seRetirer()
{
	alert("Vous avez déjà été retiré de ce groupe !");
}
function _delete()
{
	alert("Vous avez supprimé le groupe");
}
</script>

<div class='row'>
  <div class='col-lg-4'>
    <h1 >Mes Groupes</h1>
  </div>


 <div class='col-lg-8'>
	 <h2 id="press">Goupes publiés :</h2>
	 <table id="mytable" cellspacing="0" summary="The technical specifications of the Apple PowerMac G5 series" width="100%">
        <caption> </caption>
	   <tr>
	 		<th>Nom</th>
	 		<th>Privé</th>
	 		<th>Membre</th>
			<th width="15%">Supprimer</th>
	 		<th width="40%">Inviter</th>
	   </tr>
	 	<?php
	 		$Groupes = $currentUser->getGroupeId();
      if ($Groupes==null)
			  echo'
				<td colspan="5"> Aucun ！<td> ' ;
	 		foreach ($Groupes as $groupe) {
	 			$id = $groupe->IDGROUPE;
	 			echo '
	 			<tr>
	 				<td>'.$groupe->getGroupeNom($id).'</td>
	 				<td>'.$groupe->getGroupePrive($id).'</td>
	 				<td>'.$groupe->getGroupeMembre($id).'</td>
	 				<td>
						 <form action="index.php?c=user&a=deleteGroupe" method="post">
						 <button id="button1" type="submit" name="id" value='.$id.' onclick="_delete()">Supprimer</button>
						 </form>
					</td>
					<td>
						 <form action="index.php?c=user&a=addUnMembre" method="post">
						 <input type="text" id='.$id.' name="mail" placeholder="Son Mail" style="width:300px;height:30px;display:block;"/>
             <button id="button1" type="submit" name="id" value='.$id.' >Inviter</button>
						 </form>
	 				</td>

	 			</tr>

       	';
			}

	 	?>

	 </table>

 	<form action="index.php?c=user&amp;a=CreerUnGroupe" method="post">
 	<button class="btn btn-primary btn-block" type="submit" >Créer un Groupe</button>
</form>
	 <p></P>
	 <p></P>
	 <h2 id="press">Groupes Participants :</h2>
	 <table width="100%">
	   <tr>
	 		<th>Nom</th>
	 		<th>Privé</th>
	 		<th>Créateur</th>
	 		<th>Se retirer</th>
	   </tr>
	 	<?php
	 	   $Groupes = $currentUser->getIdGroupe();
			 if ($Groupes==null)
 			  echo'
 				<td colspan="4"> Aucun ！<td> ' ;
	 	   foreach ($Groupes as $groupe) {
	 	   	$id = $groupe->IDGROUPE;
	 	  	echo '
	 	   	<tr>
	 			<td>'.$groupe->getGroupeNom($id).'</td>
	 			<td>'.$groupe->getGroupePrive($id).'</td>
	 			<td>'.$groupe->getGroupeCreateur($id).'</td>
	 			<td>
	 				    <form action="index.php?c=user&a=retirerGroupe" method="post">
	 						<button id="button1" type="submit" name="id" value='.$id.' onclick="_seRetirer()">Se retirer</button>
	 						</form>
	 			</td>
	 			</tr>

	 			';

	 		}

	 	?>
	</table>

	<p></p>
	<form action="index.php?c=user&amp;a=RechercherGroupe" method="post">
	<button class="btn btn-primary btn-block" type="submit" >Rechercher un Groupe</button>
	</form>
 </div>
</div>
