<?php
	$currentUser = $_SESSION['currentUser'];
?>
<div class='row'>
  <div class='col-lg-4'>
    <h1>Créer un groupe</h1>
  </div>
  <div class="col-lg-8">
        <form action="index.php?c=user&a=validateCreerUnGroup" method="post">
				<dl>
          <tr>
				        <th>Nom du groupe :</th>
				        <td><input type="text" name="creerNom"  class="form-control"/></td>
		  </tr>
		  <p></p>
      <tr>
				        <th>Privé ?  </th>
				        <td><input type="radio" name="getPrive" id="radio" value="1" />Oui
                    <input type="radio" name="getPrive" id="radio" value="0" />Non</td>
		  </tr>

		  <p></p>
          <button class="btn btn-primary btn-block" type="submit" >Créer le groupe</button>
				</dl>
      </form>

</div>
