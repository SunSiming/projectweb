<body class="bg-dark">
  <img src="img/logo.png" height="45" width="300"></img>
  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Se connecter</div>
      <div class="card-body">
        <form action="index.php" method="post">
          <div class="form-group">
            <label for="exampleInputEmail1">Adresse email</label>
            <input class="form-control" id="exampleInputEmail1" name="inscMail" type="email" aria-describedby="emailHelp" placeholder="Entrez votre email">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Mot de passe</label>
            <input class="form-control" id="exampleInputPassword1" type="password" name='inscPassword' placeholder="Entrez votre mot de passe">
          </div>
          <!--<div class="form-group">
            <div class="form-check">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox"> Remember Password</label>
            </div>
          </div>-->
          <button class="btn btn-primary btn-block" type="submit" href="index.php" value="validationConnexion" name="a">Se connecter</button>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="index.php?a=inscription">Créer un compte</a>
          <!--<a class="d-block small" href="index.php?a=forgotPassword">Forgot Password?</a>-->
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
<!--  <script src="vendor/jquery/jquery.min.js"></script>  -->
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
  <script type="text/javascript">
        $.backstretch([
        'img/no1.jpg',
        'img/no2.jpg',
        'img/no3.jpg',
        'img/no4.jpg',
        'img/no5.jpg'
    ], {
        fade : 1000, // 动画时长
        duration : 2000 // 切换延时
});
</script>
</body>
