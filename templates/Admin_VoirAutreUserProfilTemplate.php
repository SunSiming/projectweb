<?php
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
					Nombre de trajets réalisés :
				</h4>
				<dd>
					<?php
						echo $otherUser->getNbTrajetsRealises();
				?>
				</dd>
			</div>
			<!-- <div class='row'>
				<h4>
					Trajets les plus fréquents:
				</h4>
				<dd>
					<?php
						//echo $otherUser->get();
				?>
				</dd>

			</div> -->

      <div class='row'>
        <?php
          if($otherUser->isBloqued()){
            echo "
						<div class='col-lg-4'>
							<p> Le profil est bloqué </p>
						</div>
						<div class='col-lg-4'>
	              <form action='index.php?c=user' method='post'>
	            		  <table>
	            				  <tr>
	                      <button class='btn btn-primary btn-block' type='submit' href='index.php?c=user' value='debloquerProfil' name='a'>Débloquer le profil</button>
	                      </tr>
	            			 </table>
	              </form>
						</div>";

          } else {
            echo "
						<div class='col-lg-4'>
							<p> Le profil n'est pas bloqué </p>
						</div>
						<div class='col-lg-4'>
	            <form action='index.php?c=user' method='post'>
	            		<table>
	            				<tr>
	                    <button class='btn btn-primary btn-block' type='submit' href='index.php?c=user' value='bloquerProfil' name='a'>Bloquer le profil</button>
	                    </tr>
	            			</table>
	            </form>
						</div>";
          }
         ?>
			 </div>
			 <div class='row'>
				 <?php
           if($otherUser->isAdmin()){
             echo "
						 <div class='col-lg-4'>
						 	<p> Cette personne est un administrateur </p>
						 </div>
						 <div class='col-lg-4'>
							 <form action='index.php?c=user' method='post'>
             		  <table>
             				  <tr>
                       <button class='btn btn-primary btn-block' type='submit' href='index.php?c=user' value='rendreNonAdmin' name='a'>Lui enlever les droits d'adminisatrateur</button>
                       </tr>
             			 </table>
               </form>
							</div>";

           } else {
             echo "
						 <div class='col-lg-4'>
						 	<p> Cette personne n'est pas un administrateur </p>
						 </div>
						 <div class='col-lg-4'>
							 <form action='index.php?c=user' method='post'>
	             		<table>
	             				<tr>
	                     <button class='btn btn-primary btn-block' type='submit' href='index.php?c=user' value='rendreAdmin' name='a'>Lui donner les droits d'adminisatrateur</button>
	                     </tr>
	             			</table>
	             </form>
						 </div>";
           }
          ?>
				</div>
