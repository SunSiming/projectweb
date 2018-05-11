<?php
	//session stock Id de user
	//$currentUser = new User($_SESSION['Id']);//necessaire ou pas ?? V��rifier qu'il n'est pas ��crit plusieur fois dans le code??

	//Session stocke User
	$currentUser = $_SESSION['currentUser'];
?>

<div class='row'>
  <div class='col-lg-4'>
    <h1>Créer un trajet</h1>
</div>
<div class='col-lg-8'>
            <br><br><!--CHANGE THE TYPE-->
            <form action="index.php?c=user&a=validateCreationTrajet" method="post">
              <div class="form-group">
                <label for="inputLieuDepart">Lieu de départ</label>
                <input class="form-control" id="inputLieuDepart" type="text" name="lieuD" aria-describedby="lieuDHelp" placeholder="Choisir un lieu de départ">
              </div>
              <div class="form-group">
                <label for="inputLieuArrivee">Lieu d'arrivée</label>
                <input class="form-control" id="inputLieuArrivee" type="text" name="lieuA" aria-describedby="lieuAHelp" placeholder="Choisir un lieu d'arrivée">
              </div>
              <div class="form-group">
                <label for="inputHoraireDepart">Horaire de départ (format JJ-MM-AAAA HH:MM:SS)</label>
                <input class="form-control" id="inputHoraireDepart" type="text" name="horaireD" aria-describedby="horaireDHelp" placeholder="Choisir un horaire de départ">
              </div>
              <div class="form-group">
                <label for="inputHoraireArrivee">Horaire d'arrivée (format JJ-MM-AAAA HH:MM:SS)</label>
                <input class="form-control" id="inputHoraireArrivee" type="text" name="horaireA" aria-describedby="horaireAHelp" placeholder="Choisir un horaire d'arrivée">
              </div>
              <!--<div class="form-group">
                <label for="inputVoiture">Voiture utilisée (pour l'instant ça doit être l'ID voiture)</label>
                <input class="form-control" id="inputVoiture" type="number" name="voiture" aria-describedby="voitureHelp" placeholder="Choisir la voiture utilisée">
              </div>-->
              <div class="form-group">
                <label for="inputNbXPlaces">Nombre de places</label>
                <input class="form-control" id="inputNbXPlaces" type="number" name="nbPlaces" aria-describedby="nbPlacesHelp" placeholder="Choisir le nombre de places disponibes pour le trajet">
              </div>
              <div class="form-group">
                <label for="inputDistance">Distance estimée du trajet en km</label>
                <input class="form-control" id="inputDistance" type="number" name="distance" aria-describedby="distanceHelp" placeholder="Indiquer la distance estimée du trajet (km)">
              </div><div class="form-group">
                <label for="inputInfos">Informations sur le trajet</label>
                <input class="form-control" id="inputInfos" type="text" name="infos" aria-describedby="infosHelp" placeholder="Description ou informations sur le trajet">
              </div>
							<br>
              <button class="btn btn-primary btn-block" data-toggle="modal" data-target="#exampleModal" type="submit" value="validateCreationTrajet" name="a">Créer le trajet</button>

          </form>
          <br><br>

  </div>
</div>
