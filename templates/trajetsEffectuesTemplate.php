<div class='row'>
  <div class='col-lg-4'>
    <h1></h1>
  </div>


</div>
<div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i> Trajets courants</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Trajet encore actif</th>
                  <th>Lieu de départ</th>
                  <th>Horaire de départ</th>
                  <th>Lieu d'arrivée</th>
                  <th>Horaire d'arrivée</th>
                  <th>Nom du conducteur</th>
                  <th>Nombre de places</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>Trajet encore actif</th>
                  <th>Lieu de départ</th>
                  <th>Horaire de départ</th>
                  <th>Lieu d'arrivée</th>
                  <th>Horaire d'arrivée</th>
                  <th>Nom du conducteur</th>
                  <th>Nombre de places</th>
                </tr>
              </tfoot>
                <tbody>
              <?php
                $trajets = Trajet::getTrajetsCourants();
                // $currentUser = $_SESSION['currentUser'];
                // echo "<h1>La classe de new User est ".get_class($newUser)." </h1>";
                // echo "<h1>Le pseudo de new User est ".$newUser->getPseudo()." </h1>";
                // echo "<h1>Le mail de new User est ".$newUser->getMail()." </h1>";
                // echo "<h1>La classe de current User est ".get_class($currentUser)." </h1>";
                foreach ($trajets as $trajet) {
                  $trajet->setId($trajet->IDTRAJET);
                  $horaireDepart = $trajet->getHoraireDepart();
          				$invertedHoraireDepart = Trajet::convertDateToFr($horaireDepart);
          				$horaireArrivee = $trajet->getHoraireArrivee();
          				$invertedHoraireArrivee = Trajet::convertDateToFr($horaireArrivee);

                  echo "
                  <tr>
                    <td>".$trajet->getActif()."</td>
                    <td>".$trajet->getLieuDepart()."</td>
                    <td>".$invertedHoraireDepart."</td>
                    <td>".$trajet->getLieuArrivee()."</td>
                    <td>".$invertedHoraireArrivee."</td>
                    <td>".$trajet->getName()."</td>
                    <td>".$trajet->getNbxPlace()."</td>
                  </tr>
                  ";
                }

              ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>


  <div class="card mb-3">
          <div class="card-header">
            <i class="fa fa-table"></i> Trajets précédents</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>Trajet encore actif</th>
                    <th>Lieu de départ</th>
                    <th>Horaire de départ</th>
                    <th>Lieu d'arrivée</th>
                    <th>Horaire d'arrivée</th>
                    <th>Nom du conducteur</th>
                    <th>Nombre de places</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>Trajet encore actif</th>
                    <th>Lieu de départ</th>
                    <th>Horaire de départ</th>
                    <th>Lieu d'arrivée</th>
                    <th>Horaire d'arrivée</th>
                    <th>Nom du conducteur</th>
                    <th>Nombre de places</th>
                  </tr>
                </tfoot>
                  <tbody>
                <?php
                  $trajets = Trajet::getTrajetsPrecedents();
                  // $currentUser = $_SESSION['currentUser'];
                  // echo "<h1>La classe de new User est ".get_class($newUser)." </h1>";
                  // echo "<h1>Le pseudo de new User est ".$newUser->getPseudo()." </h1>";
                  // echo "<h1>Le mail de new User est ".$newUser->getMail()." </h1>";
                  // echo "<h1>La classe de current User est ".get_class($currentUser)." </h1>";
                  foreach ($trajets as $trajet) {
                    $trajet->setId($trajet->IDTRAJET);
                    $horaireDepart = $trajet->getHoraireDepart();
            				$invertedHoraireDepart = Trajet::convertDateToFr($horaireDepart);
            				$horaireArrivee = $trajet->getHoraireArrivee();
            				$invertedHoraireArrivee = Trajet::convertDateToFr($horaireArrivee);

                    echo "
                    <tr>
                      <td>".$trajet->getActif()."</td>
                      <td>".$trajet->getLieuDepart()."</td>
                      <td>".$invertedHoraireDepart."</td>
                      <td>".$trajet->getLieuArrivee()."</td>
                      <td>".$invertedHoraireArrivee."</td>
                      <td>".$trajet->getName()."</td>
                      <td>".$trajet->getNbxPlace()."</td>
                    </tr>
                    ";
                  }

                ?>
                </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted"></div>
        </div>
</div>
