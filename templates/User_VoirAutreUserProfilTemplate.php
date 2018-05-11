<?php
	//session stock Id de user
	//$otherUser = new User($_SESSION['Id']);//necessaire ou pas ?? Vérifier qu'il n'est pas écrit plusieur fois dans le code??

	//Session stocke User
	$otherUser = $_SESSION['otherUser'];
?>

  <div class='row'>
		<h1>Information</h1>
	</div>
	<div class='row'>
    <div class='col-lg-4'>
	      <img alt="Bootstrap Image Preview" src="img/man-anonyme.png">
			</div>

			<div class="col-lg-8">
				<dl>
					<h4>
						Nom et Prénom :
					</h4>
					<dd>
						<?php
							echo $otherUser->getFirstname()." ".$otherUser->getName();
					?>
					</dd>
					<h4>
						Pseudo :
					</h4>
					<dd>
						<?php
							echo $otherUser->getPseudo();
					?>
					</dd>
					<h4>
						Téléphone :
					</h4>
					<dd>
						<?php
							echo $otherUser->getTel();
					?>
					</dd>
					<h4>
						Information :
					</h4>
					<!--//UNITE FONCTION SITE   OU    PROMOTION TYPEPROMOTION-->

						<?php
							echo $otherUser->printAllInformation();
					?>


				</dl>
				<!--href="index.php" value="validationConnexion"
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
On est trop dépendant du c=user
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////			-->

			</div>
			</div>
			<div class='row'>
				<h4>
					Nombre de trajet réalisés :
				</h4>
				<dd>
					<?php
						echo $otherUser->getNbTrajetsRealises();
				?>
				</dd>
			</div>
			<div class='row'>
				<h4>
					Trajets les plus fréquents :
				</h4>
				<dd>
					<?php
						//echo $otherUser->get();
				?>
				</dd>

			</div>
