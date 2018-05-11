<?php
	//session stock Id de user
	//$currentUser = new User($_SESSION['Id']);//necessaire ou pas ?? Vérifier qu'il n'est pas écrit plusieur fois dans le code??

	//Session stocke User
	$currentUser = $_SESSION['currentUser'];
?>

  <div class='row'>
		<h1>Information</h1>
	</div>
	<div class='row'>
    <div class='col-lg-4'>
	      <img alt="Bootstrap Image Preview" src="img/man-anonyme.png">
			</div>

			<div class="col-lg-8">
        <form action="index.php?c=user&a=validateModificationProfil" method="post">
				<dl>
          <tr>
				        <th>Nom :</th>
				        <td><input type="text" name="modifNom" placeholder="<?php echo $currentUser->getName();?>" class="form-control" id="inscriptionTd"/></td>
			    </tr>
          <tr>
				        <th>Prénom :</th>
				        <td><input type="text" name="modifPrenom" placeholder="<?php echo $currentUser->getFirstname();?>" class="form-control" id="inscriptionTd"/></td>
			    </tr>
          <tr>
				        <th>Pseudo :</th>
				        <td><input type="text" name="modifPseudo" placeholder="<?php echo $currentUser->getPseudo();?>" class="form-control" id="inscriptionTd"/></td>
			    </tr>
					<tr>
				        <th>Mot de passe :</th>
				        <td><input type="password" name="modifPassword" class="form-control" id="inscriptionTd"/></td>
			    </tr>
					<tr>
				        <th>confirmation du mot de passe :</th>
				        <td><input type="password" name="confirmModifPassword" class="form-control" id="inscriptionTd"/></td>
			    </tr>
          <tr>
				        <th>Téléphone :</th>
				        <td><input type="text" name="modifTel" placeholder="<?php echo $currentUser->getTel();?>" class="form-control" id="inscriptionTd"/></td>
			    </tr>
<?php  	if(($currentUser->getFonction()) === 'agent'){
		        //echo "    <h5> Fonction:  ".$this->getFonction()."</h5>";
		        echo "<tr>
					        	<th>Site :</th>
					        	<td><input type='text' name='modifSite' placeholder=' ".$currentUser->getSite()."' class='form-control' id='inscriptionTd'/></td>
				    			</tr>";
						echo "<tr>
								   <th>Unité :</th>
								   <td><input type='text' name='modifUnite' placeholder='". $currentUser->getUnite()."' class='form-control' id='inscriptionTd'/></td>
							  </tr>";
		      } else {
						echo "<tr>
					        	<th>Promotion :</th>
					        	<td><input type='text' name='modifPromo' placeholder=' ".$currentUser->getPromotion(). " ' class='form-control' id='inscriptionTd'/></td>
				    			</tr>";
						echo "<tr>
								   <th>Type de Promotion :</th>
								   <td><input type='text' name='modifTPromo' placeholder='".$currentUser->getTypePromotion(). " ' class='form-control' id='inscriptionTd'/></td>
							  </tr>";

		      }
?>
          <tr>
				        <th>Information :</th>
				        <td><input type="text" name="modifInfo" placeholder="<?php echo $currentUser->getInfo();?>" class="form-control" id="inscriptionTd"/></td>
			    </tr>

<!--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Trouver qqc pour distinguer eleve et agent .....
href="index.php?c=user" value="validateModificationProfil" name="a"

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
          <button class="btn btn-primary btn-block" type="submit" >Valider les modifications</button>
				</dl>
      </form>
				<!--href="index.php" value="validationConnexion"
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
On est trop dépendant du c=user

Modification
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////			-->

			</div>
			</div>
