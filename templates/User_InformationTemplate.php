<?php
	//Session stocke User
	$currentUser = $_SESSION['currentUser'];
?>

  <div class='row'>
		<div class='col-lg-4'>
	    <h1 >Information</h1>
	  </div>
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
							echo $currentUser->getFirstname()." ".$currentUser->getName();
					?>
					</dd>
					<h4>
						Pseudo :
					</h4>
					<dd>
						<?php
							echo $currentUser->getPseudo();
					?>
					</dd>
					<h4>
						Téléphone :
					</h4>
					<dd>
						<?php
							echo $currentUser->getTel();
					?>
					</dd>
					<h4>
						Information :
					</h4>
					<!--//UNITE FONCTION SITE   OU    PROMOTION TYPEPROMOTION-->

						<?php
							echo $currentUser->printAllInformation();
					?>


				</dl>
				<!--href="index.php" value="validationConnexion"
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
On est trop dépendant du c=user
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////			-->



<form action="index.php?c=user" method="post">
		<table>
				<tr>
					<button class="btn btn-primary btn-block" type="submit" href="index.php?c=user" value="modifierProfil" name="a">Modifier votre Profil</button>
        </tr>
			</table>
</form>

			</div>
			</div>
			<!--<div class='row'>
				<h4>
					Nombre de trajets réalisés :
				</h4>
				<dd>
					<?php
						//echo $currentUser->getNbTrajetsRealises();
				?>
				</dd>
			</div>
			<div class='row'>
				<h4>
					Trajets les plus fréquents :
				</h4>
				<dd>
					<?php
						//echo $currentUser->get();
				?>
				</dd>

			</div>-->
			<br>
			<div class='row'>
		    <div class='col-lg-4'>
						<a class="btn btn-primary" href='index.php?c=user&amp;a=Groupe' width= '100%'>
								<span class='nav-link-text'><font color="white">Mes Groupes</font></span>
						</a>
				</div>
			</div>

<br>
<br>

<?php
//Liste des trajets effectués
			$view = new InsertView($this,'trajetsEffectues');
			$view->render();


?>
