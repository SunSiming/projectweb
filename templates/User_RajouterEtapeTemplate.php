<?php
	$trajet = $_SESSION['Trajet'];
?>
<div class='row'>
  <div class='col-lg-4'>
    <h1>Rajouter une étape au trajet</h1>
</div>
<div class='col-lg-8'>
            <br><br><!--CHANGE THE TYPE-->
            <form action="index.php?c=user&a=UserAjoutEtapeTrajet" method="post">
              <div class="form-group">
                <label for="inputEtape">Nouvelle étape</label>
                <input class="form-control" id="inputEtape" type="text" name="e1" aria-describedby="e1Help" placeholder="Etape 1">
              </div>
              <div class="form-group">
                <label for="inputLieuArrivee">Nouvelle étape</label>
                <input class="form-control" id="inputEtape" type="text" name="e2" aria-describedby="e2Help" placeholder="Etape 2">
              </div>
              <div class="form-group">
                <label for="inputHoraireDepart">Nouvelle étape</label>
                <input class="form-control" id="inputEtape" type="datetime" name="e3" aria-describedby="e3Help" placeholder="Etape 3">
              </div>
              <div class="form-group">
                <label for="inputHoraireArrivee">Nouvelle étape</label>
                <input class="form-control" id="inputEtape" type="datetime" name="e4" aria-describedby="e4Help" placeholder="Etape 4">
              </div>
							<br><br>
              <button class="btn btn-primary btn-block" data-toggle="modal" data-target="#exampleModal" type="submit" value="validateAjoutEtapesTrajet" name="a">Valider l'ajout des étapes</button>

          </form>
          <br><br>

  </div>

</div>
