<body class="bg-dark">
  <img src="img/logo.png" height="45" width="300"></img>
  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">Créer un compte</div>
      <div class="card-body">
        <form action="index.php" method="post">
          <div class="form-group">
            <label for="exampleInputEmail1">Pseudo</label>
            <input class="form-control" id="exampleInputEmail1" type="text" name="inscLogin" aria-describedby="emailHelp" placeholder="Entrez un pseudo">
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputName">Prénom</label>
                <input class="form-control" id="exampleInputName" type="text" name="inscFName" aria-describedby="nameHelp" placeholder="Entrez votre prénom">
              </div>
              <div class="col-md-6">
                <label for="exampleInputLastName">Nom</label>
                <input class="form-control" id="exampleInputLastName" type="text" name="inscName" aria-describedby="nameHelp" placeholder="Entrez votre nom">
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Adresse email</label>
            <input class="form-control" id="exampleInputEmail1" type="email" name="inscMail" aria-describedby="emailHelp" placeholder="Entrez votre email">
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputPassword1">Mot de passe</label>
                <input class="form-control" id="exampleInputPassword1" type="password" name="inscPassword" placeholder="Mot de passe">
              </div>
              <div class="col-md-6">
                <label for="exampleConfirmPassword">Confirmer le mot de passe</label>
                <input class="form-control" id="exampleConfirmPassword" type="password" name="inscConfPassword" placeholder="Confirmez votre mot de passe">
              </div>
            </div>
          </div>
          <div class="form-group">
          <th>Fonction :</th>
          <td><input type="radio" name="inscFonction" id="radio" value="agent" />agent
              <input type="radio" name="inscFonction" id="radio" value="student" />étudiant</td>
          </div>
          <button class="btn btn-primary btn-block" data-toggle="modal" data-target="#exampleModal" type="submit" value="validateInscription" name="a">Enregistrer</button>
          <!--
           -->
          <!--<a class="btn btn-primary btn-block" type="submit" value="validateInscription" name="a" >Register</a>-->
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="index.php">Retourner à la page de connexion</a>
          <!--<a class="d-block small" href="forgot-password.php">Forgot Password?</a>-->
        </div>
      </div>
    </div>

    <!-- Apparition d'un message
    <li >
            <a class="nav-link" data-toggle="modal" data-target="#exampleModal">Logout</a>
          </li>
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">New account!</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Your account has been create. Please login.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="index.php">Login</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  Bootstrap core JavaScript-->

  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
  <script type="text/javascript">
        $.backstretch([
        'img/1.jpg',
        'img/2.jpg',
        'img/3.jpg',
        'img/4.jpg',
        'img/5.jpg'
    ], {
        fade : 1000, // 动画时长
        duration : 2000 // 切换延时
});
</script>
</body>
