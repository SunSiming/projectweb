<body class="bg-dark">
<div class="container">
  <div class="card card-login mx-auto mt-5">
    <div class="card-header">Nouveau compte</div>
    <div class="card-body">
      <div class="text-center">
        <p>Votre compte n'a pas pu être créé</p>
        <p><?php echo $_POST['message'];?></p>
      </div>
      <a class='btn btn-primary' href='index.php?a=inscription'>Recommencer</a>

    </div>
  </div>
</div>
</body>
