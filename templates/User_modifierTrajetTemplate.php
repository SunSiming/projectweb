<?php
	//Session::startSession();
	$currentUser = $_SESSION['currentUser'];
	//print_r($currentUser);
	$trajet = $_SESSION['Trajet'];
	//print_r($trajet);
	//echo "<h2> idtrajet = ".get_class($trajet->getIdTrajet())."</h2>";
?>
<div class='row'>
  <div class='col-lg-4'>
    <h1>Modifier un trajet</h1>
</div>
<div class='col-lg-8'>
            <br><br><!--CHANGE THE TYPE-->
            <form action="index.php?c=user&a=UserModificationTrajet" method="post">
              <div class="form-group">
                <label for="inputLieuDepart">Lieu de départ</label>
                <input class="form-control" id="inputLieuDepart" type="text" name="lieuD" aria-describedby="lieuDHelp" placeholder="<?php echo $trajet->getLieuDepart();?>">
              </div>
              <div class="form-group">
                <label for="inputLieuArrivee">Lieu d'arrivée</label>
                <input class="form-control" id="inputLieuArrivee" type="text" name="lieuA" aria-describedby="lieuAHelp" placeholder="<?php echo $trajet->getLieuArrivee();?>">
              </div>
              <div class="form-group">
                <label for="inputHoraireDepart">Horaire de départ (format AAAA-MM-JJ HH:MM:SS)</label>
                <input class="form-control" id="inputHoraireDepart" type="datetime" name="horaireD" aria-describedby="horaireDHelp" placeholder="<?php echo $trajet->getHoraireDepart();?>">
              </div>
              <div class="form-group">
                <label for="inputHoraireArrivee">Horaire d'arrivée (format AAAA-MM-JJ HH:MM:SS)</label>
                <input class="form-control" id="inputLieuDepart" type="datetime" name="horaireA" aria-describedby="horaireAHelp" placeholder="<?php echo $trajet->getHoraireArrivee();?>">
              </div>
              <div class="form-group">
                <label for="inputVoiture">Voiture utilisée (pour l'instant ça doit être l'ID voiture)</label>
                <input class="form-control" id="inputVoiture" type="number" name="voiture" aria-describedby="voitureHelp" placeholder="<?php echo $trajet->getInformation();?>">
              </div>
              <div class="form-group">
                <label for="inputNbXPlaces">Nombre de places</label>
                <input class="form-control" id="inputNbXPlaces" type="number" name="nbPlaces" aria-describedby="nbPlacesHelp" placeholder="<?php echo $trajet->getNbxPlace();?>">
              </div>
              <div class="form-group">
                <label for="inputDistance">Distance estimée du trajet en km</label>
                <input class="form-control" id="inputDistance" type="number" name="distance" aria-describedby="distanceHelp" placeholder="<?php echo $trajet->getDistance();?>">
              </div><div class="form-group">
                <label for="inputInfos">Informations sur le trajet</label>
                <input class="form-control" id="inputInfos" type="text" name="infos" aria-describedby="infosHelp" placeholder="<?php echo $trajet->getInformation();?>">
              </div>
							<th>Actif : </th>
							<td><input type="radio" name="actif" id="radio" value="1" />Oui
									<input type="radio" name="actif" id="radio" value="0" />Non</td>

							<br><br>
              <button class="btn btn-primary btn-block" data-toggle="modal" data-target="#exampleModal" type="submit" value="validateCreationTrajet" name="a">Valider les modifications</button>

          </form>
          <br><br>

  </div>
</div>
