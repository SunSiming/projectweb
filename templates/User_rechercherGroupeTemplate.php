
<div class='row'>
  <div class='col-lg-8'>
    <h1>Rechercher un Groupe</h1>
  </div>
</div>
<div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i> Groupes</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Nom</th>
                  <th>Privé</th>
                  <th>Créateur</th>
                  <th>Joindre</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>Nom</th>
                  <th>Privé</th>
                  <th>Céeateur</th>
                  <th>Joindre</th>
                </tr>
              </tfoot>
                <tbody>
              <?php
              $Groupes = User::getTousGroupeId();

              foreach ($Groupes as $groupe) {
                $id = $groupe->IDGROUPE;

                echo '
                <tr>
                  <td>'.$groupe->getGroupeNom($id).'</td>
                  <td>'.$groupe->getGroupePrive($id).'</td>
                  <td>'.$groupe->getGroupeCreateur($id).'</td>
                  <td><form action="index.php?c=user&a=ajouterGroupe" method="post">
                      <button id="button1" type="submit" name="id" value='.$id.' >Joindre</button>
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
    </div>
