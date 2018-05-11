<div class='row'>
  <div class='col-lg-4'>
    <h1>Chercher un trajet</h1>
  </div>
</div>
<div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i>Trajets recherchés</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Trajet encore actif</th>
                  <th>Lieu de départ</th>
                  <th>Horaire de départ</th>
                  <th>Lieu d'arrivée</th>
                  <!--<th>Horaire d'arrivée</th>-->
                  <th>Conducteur</th>
                  <th>Places restantes</th>
                  <th>S'inscrire</th>
                  <th>Modifier</th>
            			<th>Supprimer</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>Trajet encore actif</th>
                  <th>Lieu de départ</th>
                  <th>Horaire de départ</th>
                  <th>Lieu d'arrivée</th>
                  <!--<th>Horaire d'arrivée</th>-->
                  <th>Conducteur</th>
                  <th>Places restantes</th>
                  <th>S'inscrire</th>
                  <th>Modifier</th>
            			<th>Supprimer</th>
                </tr>
              </tfoot>
                <tbody>
              <?php
                $trajets = Trajet::getTrajetsAleatoire();

                foreach ($trajets as $trajet) {
                  $trajet->setId($trajet->IDTRAJET);
                  $horaireDepart = $trajet->getHoraireDepart();
                  $invertedHoraireDepart = Trajet::convertDateToFr($horaireDepart);
                  $horaireArrivee = $trajet->getHoraireArrivee();
                  $invertedHoraireArrivee = Trajet::convertDateToFr($horaireArrivee);

                  echo '
                  <tr>
                    <td>'.$trajet->getActif().'</td>
                    <td>'.$trajet->getLieuDepart().'</td>
                    <td>'.$invertedHoraireDepart.'</td>
                    <td>'.$trajet->getLieuArrivee().'</td>
                    <!--<td>'.$invertedHoraireArrivee.'</td>-->
                    <td>'.$trajet->getName().'</td>
                    <td>'.$trajet->getNbxPlace().'</td>



                    <td><a class="btn btn-primary btn-block" type="submit" href="index.php?c=user&a=inscriptionTrajet&idtrajet='.$trajet->getIdTrajet().'&actif='.$trajet->getActif().'">S\'inscrire au trajet</a></td>
                    <td>
          							 <form action="index.php?c=user&a=AdminModifierTrajet" method="post">
          							 <button id="button1" type="submit" name="id" value='.$trajet->IDTRAJET.'>Modifier</button>
          							 </form>
          					</td>
                    <td>
            						 <form action="index.php?c=user&a=AdminDeleteTrajet" method="post">
            						 <button id="button1" type="submit" name="id" value='.$trajet->IDTRAJET.'>Supprimer</button>
            						 </form>
            				</td>
                  </tr>
                  ';
                }

              ?>
              </tbody>
            </table>
          </div>
        </div>
        <div class="card-footer small text-muted"></div>
      </div>



      <!--<td><a class='btn btn-primary btn-block' value='inscriptionTrajet' type='submit' href='index.php?c=user&a=inscriptionTrajet&idtrajet=".$trajet->getIdTrajet()."&actif=".$trajet->getActif()."'>S'inscrire à ce trajet</a></td>
-->
    <!-- /.container-fluid-->
    <!--<td><a class='btn btn-primary btn-block' type='submit' href='index.php?c=user&a=message_ConfInscriptionTrajet&idtrajet=".$trajet->getIdTrajet()."'>S'inscrire à ce trajet</a></td>-->
