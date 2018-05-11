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
                  <th>Etapes</th>
                  <th>Nom du conducteur</th>
                  <th>Nombre de places</th>
                  <th></th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>Trajet encore actif</th>
                  <th>Lieu de départ</th>
                  <th>Horaire de départ</th>
                  <th>Lieu d'arrivée</th>
                  <!--<th>Horaire d'arrivée</th>-->
                  <th>Etapes</th>
                  <th>Nom du conducteur</th>
                  <th>Nombre de places</th>
                  <th></th>
                </tr>
              </tfoot>
                <tbody>
              <?php
                $trajets = Trajet::getTrajetsAleatoire();

                foreach ($trajets as $trajet) {
                  $trajet->setId($trajet->IDTRAJET);
                  $nbetapesencours = 0; //représente l'indice du nombre d'étapes du trajet
                  $nbetapes = Etape::nombre_etapes_trajet($trajet->IDTRAJET); //représente le nombre d'étapes total du trajet
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
                    <td>'.$trajet->getName().'</td>
                    <td><font color="red">'.$trajet->getNbxPlace().'</font></td>

                    <td><a class="btn btn-primary btn-block" type="submit" href="index.php?c=user&a=inscriptionTrajet&idtrajet='.$trajet->getIdTrajet().'&actif='.$trajet->getActif().'&$nbxplaces='.$trajet->getNbxPlace().'">S\'inscrire au trajet</a></td>


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
