<?php
/*function colorChangeOnClick() {
    for ($j = 0; $j < $lines.length; $j++) {
        $lines[$j].style.background = '#couleurpardefaut';
    }
    this.style.background = '#f00';
}

function colorActiveLine() {
  $lines = document.getElementsByTagName('tr');
  for ($i = 0; $i < $lines.length; $i++) {
      $lines[$i].onclick = colorChangeOnClick;
  }
}
window.onload = colorActiveLine;*/
?>

<?php
	//Session stocke User
	$currentUser = $_SESSION['currentUser'];
?>

<div class='row'>
  <div class='col-lg-4'>
    <h1>Chercher un utilisateur</h1>
  </div>
</div>
<!--<div class='row'>
            <form action="index.php/TODO" class="navbar-form navbar-right" method="post">
              <td>Pseudo : <input type="text" placeholder="Pseudo" name="searchPseudo"/></td>
              <td>Nom : <input type="text" name="searchNom" placeholder="Nom"/></td>
              <td>Prénom : <input type="text" name="searchPrenom" placeholder="Prénom"/></td>
              <td><input type="text" name="searchAgent" placeholder=""/></td>
              <td><button class="btn btn-primary btn-block" type="submit">Rechercher</button></td>
  					</form>
</div>-->
<div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i>Recherche d'utilisateur</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Pseudo</th>
                  <th>Nom</th>
                  <th>Prénom</th>
                  <th>Mail</th>
                  <th></th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>Pseudo</th>
                  <th>Nom</th>
                  <th>Prénom</th>
                  <th>Mail</th>
                  <th></th>
                </tr>
              </tfoot>
                <tbody>
              <?php
                $users = User::getUsersAleatoire();
                // $currentUser = $_SESSION['currentUser'];
                // echo "<h1>La classe de new User est ".get_class($newUser)." </h1>";
                // echo "<h1>Le pseudo de new User est ".$newUser->getPseudo()." </h1>";
                // echo "<h1>Le mail de new User est ".$newUser->getMail()." </h1>";
                // echo "<h1>La classe de current User est ".get_class($currentUser)." </h1>";
                foreach ($users as $user) {
                  $user->setId($user->IDUSER);
                  if ($user->getIDUser() !== $currentUser->getIDUser()){
                    echo "
                    <tr>
                      <td>".$user->getPseudo()."</td>
                      <td>".$user->getName()."</td>
                      <td>".$user->getFirstname()."</td>
                      <td>".$user->getMail()."</td>
                      <td><a class='btn btn-primary btn-block' type='submit' href='index.php?c=user&a=voirUnProfil&mail=".$user->getMail()."'>Voir le profil</a></td>
                    </tr>
                    ";
                  }
                }

              ?>
              </tbody>
            </table>
          </div>
        </div>
        <div class="card-footer small text-muted"></div>
      </div>
    </div>
    <!-- /.container-fluid-->
