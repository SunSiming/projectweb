<?php

//$controllerName = Request::getCurrentRequest()->getControllerName();
//echo '<h2>Le controller est '.$controllerName.'</h2>';

	/*$uniquebd = DatabasePDO::getCurrentDataBasePDO();
		$uniquebd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$request = "UPDATE user SET EMAIL = '".$email."' WHERE IDUSER = '".$idU."';'";
		$result = $uniquebd->query($request);*/
			<h1>Id de l'utilisateur</h1>
			<p>

    echo 'IDUSER: '.$currentUser->getIDUser().'.'';

      </p>

setName(){
			$uniquebd = DatabasePDO::getCurrentDataBasePDO();
			$uniquebd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$request = "UPDATE user SET NOM = '".$nom."' WHERE IDUSER = '".$this->id."';'";
			$result = $uniquebd->query($request);//on execute la requête sql
} Fonctionnelle

/*$myPDO = DatabasePDO::getCurrentDataBasePDO();
$stmt = $myPDO->prepare("INSERT INTO user (IDUSER, EMAIL, MOT_DE_PASSE, NOM, PRENOM) VALUES (:id, :mail,:password,:nom,:prenom)");
//$stmt->bindParam(':id', $this->id);
$stmt->bindParam(':mail', $mail);
$stmt->bindParam(':password', $password);
$stmt->bindParam(':nom', $nom);
$stmt->bindParam(':prenom', $prenom);
$stmt->execute();*/


validateinscription:
	$newRequest = new Request();
	$newRequest->write_post('c','User');
	//$newRequest->write('user',$user->id());
	try {
		$controller = Dispatcher::dispatch($newRequest);
		$controllerName = $newRequest->getControllerName();

		//Mettre une page qui informe que l'incription est réussi!!!!!!!!!!!!!!!! Puis le faire se connecter!!
		//Ou commencer une session !!!!!

		//header('Location: index.php');
		session_start();
		$_SESSION['currentUser'] = $user;
		$_SESSION['id']= User::getId($mail);
		header('Location: index.php?c=user');
		//$view = new UserView($this, 'index');
		//$view->render();
		//echo '<h2>Le controller est '.$controllerName.'</h2>';

	} catch (Exception $e) {
		echo 'Error : ' . $e->getMessage() . "\n";
	}

	public static function getId($mail){	//permet de récupérer l'id de l'utilisateur
    $uniquebd = DatabasePDO::getCurrentDataBasePDO();	//création de l'objet PDO ObjetRandom
    $sql = "SELECT IDUSER FROM USER WHERE EMAIL=:mail";	//récupère le ID de user
    $stmt = $uniquebd->prepare($sql);
    $stmt->bindParam(':mail', $mail);
    $stmt->execute();
    //$reponse = $myPDO->query($sql);	//on exécute la requete sql
    $donnees = $stmt->fetch(PDO::FETCH_OBJ);	//les résultats de la requete sont stockés dans $donnees

    $id=$donnees->IDUSER;
  //  echo "<h1> L'Id du joueur est ".$id."</h1>";
    $stmt->closeCursor();}

		public static function get_Id(){	//permet de récupérer l'id de l'utilisateur depuis le get
					if(isset($_GET['idUser'])){
						$id=$_GET['idUser'];
							return $id;
					}
					else
						return 'anonymous';
				}

				<form action="index.php?c=user" method="post">
						<table>
								<tr>
				          <th>Nom :</th>
				          <td><input type="text" name="name"/></td>
									<button class="btn btn-primary btn-block" type="submit" href="index.php?c=user" value="modifierNom" name="a">Modifier Nom</button>
				        </tr>
							</table>
				</form>


				       <tr>
				             <td><?php echo $newUser->getPseudo(); ?></td>
				            <td><?php echo $newUser->getName();  ?></td>
				            <td><?php echo $newUser->getFirstname(); ?></td>
				            <td><?php echo $newUser->getMail(); ?></td>
				       </tr>

							 /*protected static $users = array(
						 	// login => password
						 	'riri' => 'fifi',
						 	'yoda' => 'maitrejedi' );


						 	public function validateInscription($request) {
						 		// on simule une base de données

						 		$login = $request->read('inscLogin');
						 		$errorText = "";
						 		$successfullyLogged = false;

						 		if(isset($_POST['inscLogin']) && isset($_POST['inscPassword'])) {
						 			$tryLogin=$login;
						 			$tryPwd=$_POST['inscPassword'];
						 		// si login existe et password correspond
						 			if( array_key_exists($tryLogin,static::$users) && static::$users[$tryLogin]==$tryPwd ) {
						 				$successfullyLogged = true;
						 				$login = $tryLogin;
						 			} else
						 				$errorText = "Erreur de login/password";
						 		} else
						 			$errorText = "Merci d'utiliser le formulaire de login";
						 		if(!$successfullyLogged) {
						 			echo $errorText;
						 		} else {
						 			echo "<h1>Bienvenu ".$login."</h1>";

						 			$newRequest = new Request();

						 			$newRequest->write('controller','user');
						 			$controllerName = $newRequest->getControllerName();
						 			echo '<h2>Le controller est '.$controllerName.'</h2>';
						 			//$newRequest->write('user',$user->id());
						 			$controller = Dispatcher::dispatch($newRequest);
						       //$controller->execute();
						 			$controllerName = $newRequest->getControllerName();
						 			echo '<h2>Le controller est '.$controllerName.'</h2>';
						 		}
						 	}*/

	/*						                 <tr>
							                   <td>Garrett Winters</td>
							                   <td>Accountant</td>
							                   <td>Tokyo</td>
							                   <td>63</td>
							                 </tr>
							                 <tr>
							                   <td>Ashton Cox</td>
							                   <td>Junior Technical Author</td>
							                   <td>San Francisco</td>
							                   <td>66</td>
							                 </tr>
							                 <tr>
							                   <td>Cedric Kelly</td>
							                   <td>Senior Javascript Developer</td>
							                   <td>Edinburgh</td>
							                   <td>22</td>
							                 </tr>
							                 <tr>
							                   <td>Airi Satou</td>
							                   <td>Accountant</td>
							                   <td>Tokyo</td>
							                   <td>33</td>
							                 </tr>
							                 <tr>
							                   <td>Brielle Williamson</td>
							                   <td>Integration Specialist</td>
							                   <td>New York</td>
							                   <td>61</td>
							                 </tr>
							                 <tr>
							                   <td>Herrod Chandler</td>
							                   <td>Sales Assistant</td>
							                   <td>San Francisco</td>
							                   <td>59</td>
							                 </tr>
							                 <tr>
							                   <td>Rhona Davidson</td>
							                   <td>Integration Specialist</td>
							                   <td>Tokyo</td>
							                   <td>55</td>
							                 </tr>
							                 <tr>
							                   <td>Colleen Hurst</td>
							                   <td>Javascript Developer</td>
							                   <td>San Francisco</td>
							                   <td>39</td>
							                 </tr>
							                 <tr>
							                   <td>Sonya Frost</td>
							                   <td>Software Engineer</td>
							                   <td>Edinburgh</td>
							                   <td>23</td>
							                 </tr>
							                 <tr>
							                   <td>Jena Gaines</td>
							                   <td>Office Manager</td>
							                   <td>London</td>
							                   <td>30</td>
							                 </tr>
							                 <tr>
							                   <td>Quinn Flynn</td>
							                   <td>Support Lead</td>
							                   <td>Edinburgh</td>
							                   <td>22</td>
							                 </tr>
							                 <tr>
							                   <td>Charde Marshall</td>
							                   <td>Regional Director</td>
							                   <td>San Francisco</td>
							                   <td>36</td>
							                 </tr>
							                 <tr>
							                   <td>Haley Kennedy</td>
							                   <td>Senior Marketing Designer</td>
							                   <td>London</td>
							                   <td>43</td>
							                 </tr>
							                 <tr>
							                   <td>Tatyana Fitzpatrick</td>
							                   <td>Regional Director</td>
							                   <td>London</td>
							                   <td>19</td>
							                 </tr>
							                 <tr>
							                   <td>Michael Silva</td>
							                   <td>Marketing Designer</td>
							                   <td>London</td>
							                   <td>66</td>
							                 </tr>
							                 <tr>
							                   <td>Paul Byrd</td>
							                   <td>Chief Financial Officer (CFO)</td>
							                   <td>New York</td>
							                   <td>64</td>
							                 </tr>
							                 <tr>
							                   <td>Gloria Little</td>
							                   <td>Systems Administrator</td>
							                   <td>New York</td>
							                   <td>59</td>
							                 </tr>
							                 <tr>
							                   <td>Bradley Greer</td>
							                   <td>Software Engineer</td>
							                   <td>London</td>
							                   <td>41</td>
							                 </tr>
							                 <tr>
							                   <td>Dai Rios</td>
							                   <td>Personnel Lead</td>
							                   <td>Edinburgh</td>
							                   <td>35</td>
							                 </tr>
							                 <tr>
							                   <td>Jenette Caldwell</td>
							                   <td>Development Lead</td>
							                   <td>New York</td>
							                   <td>30</td>
							                 </tr>
							                 <tr>
							                   <td>Yuri Berry</td>
							                   <td>Chief Marketing Officer (CMO)</td>
							                   <td>New York</td>
							                   <td>40</td>
							                 </tr>
							                 <tr>
							                   <td>Caesar Vance</td>
							                   <td>Pre-Sales Support</td>
							                   <td>New York</td>
							                   <td>21</td>
							                 </tr>
							                 <tr>
							                   <td>Doris Wilder</td>
							                   <td>Sales Assistant</td>
							                   <td>Sidney</td>
							                   <td>23</td>
							                 </tr>
							                 <tr>
							                   <td>Angelica Ramos</td>
							                   <td>Chief Executive Officer (CEO)</td>
							                   <td>London</td>
							                   <td>47</td>
							                 </tr>
							                 <tr>
							                   <td>Gavin Joyce</td>
							                   <td>Developer</td>
							                   <td>Edinburgh</td>
							                   <td>42</td>
							                 </tr>
							                 <tr>
							                   <td>Jennifer Chang</td>
							                   <td>Regional Director</td>
							                   <td>Singapore</td>
							                   <td>28</td>
							                 </tr>
							                 <tr>
							                   <td>Brenden Wagner</td>
							                   <td>Software Engineer</td>
							                   <td>San Francisco</td>
							                   <td>28</td>
							                 </tr>
							                 <tr>
							                   <td>Fiona Green</td>
							                   <td>Chief Operating Officer (COO)</td>
							                   <td>San Francisco</td>
							                   <td>48</td>
							                 </tr>
							                 <tr>
							                   <td>Shou Itou</td>
							                   <td>Regional Marketing</td>
							                   <td>Tokyo</td>
							                   <td>20</td>
							                 </tr>
							                 <tr>
							                   <td>Michelle House</td>
							                   <td>Integration Specialist</td>
							                   <td>Sidney</td>
							                   <td>37</td>
							                 </tr>
							                 <tr>
							                   <td>Suki Burks</td>
							                   <td>Developer</td>
							                   <td>London</td>
							                   <td>53</td>
							                 </tr>
							                 <tr>
							                   <td>Prescott Bartlett</td>
							                   <td>Technical Author</td>
							                   <td>London</td>
							                   <td>27</td>
							                 </tr>
							                 <tr>
							                   <td>Gavin Cortez</td>
							                   <td>Team Leader</td>
							                   <td>San Francisco</td>
							                   <td>22</td>
							                 </tr>
							                 <tr>
							                   <td>Martena Mccray</td>
							                   <td>Post-Sales support</td>
							                   <td>Edinburgh</td>
							                   <td>46</td>
							                 </tr>
							                 <tr>
							                   <td>Unity Butler</td>
							                   <td>Marketing Designer</td>
							                   <td>San Francisco</td>
							                   <td>47</td>
							                 </tr>
							                 <tr>
							                   <td>Howard Hatfield</td>
							                   <td>Office Manager</td>
							                   <td>San Francisco</td>
							                   <td>51</td>
							                 </tr>
							                 <tr>
							                   <td>Hope Fuentes</td>
							                   <td>Secretary</td>
							                   <td>San Francisco</td>
							                   <td>41</td>
							                 </tr>
							                 <tr>
							                   <td>Vivian Harrell</td>
							                   <td>Financial Controller</td>
							                   <td>San Francisco</td>
							                   <td>62</td>
							                 </tr>
							                 <tr>
							                   <td>Timothy Mooney</td>
							                   <td>Office Manager</td>
							                   <td>London</td>
							                   <td>37</td>
							                 </tr>
							                 <tr>
							                   <td>Jackson Bradshaw</td>
							                   <td>Director</td>
							                   <td>New York</td>
							                   <td>65</td>
							                 </tr>
							                 <tr>
							                   <td>Olivia Liang</td>
							                   <td>Support Engineer</td>
							                   <td>Singapore</td>
							                   <td>64</td>
							                 </tr>
							                 <tr>
							                   <td>Bruno Nash</td>
							                   <td>Software Engineer</td>
							                   <td>London</td>
							                   <td>38</td>
							                 </tr>
							                 <tr>
							                   <td>Sakura Yamamoto</td>
							                   <td>Support Engineer</td>
							                   <td>Tokyo</td>
							                   <td>37</td>
							                 </tr>
							                 <tr>
							                   <td>Thor Walton</td>
							                   <td>Developer</td>
							                   <td>New York</td>
							                   <td>61</td>
							                 </tr>
							                 <tr>
							                   <td>Finn Camacho</td>
							                   <td>Support Engineer</td>
							                   <td>San Francisco</td>
							                   <td>47</td>
							                 </tr>
							                 <tr>
							                   <td>Serge Baldwin</td>
							                   <td>Data Coordinator</td>
							                   <td>Singapore</td>
							                   <td>64</td>
							                 </tr>
							                 <tr>
							                   <td>Zenaida Frank</td>
							                   <td>Software Engineer</td>
							                   <td>New York</td>
							                   <td>63</td>
							                 </tr>
							                 <tr>
							                   <td>Zorita Serrano</td>
							                   <td>Software Engineer</td>
							                   <td>San Francisco</td>
							                   <td>56</td>
							                 </tr>
							                 <tr>
							                   <td>Jennifer Acosta</td>
							                   <td>Junior Javascript Developer</td>
							                   <td>Edinburgh</td>
							                   <td>43</td>
							                 </tr>
							                 <tr>
							                   <td>Cara Stevens</td>
							                   <td>Sales Assistant</td>
							                   <td>New York</td>
							                   <td>46</td>
							                 </tr>
							                 <tr>
							                   <td>Hermione Butler</td>
							                   <td>Regional Director</td>
							                   <td>London</td>
							                   <td>47</td>
							                 </tr>
							                 <tr>
							                   <td>Lael Greer</td>
							                   <td>Systems Administrator</td>
							                   <td>London</td>
							                   <td>21</td>
							                 </tr>
							                 <tr>
							                   <td>Jonas Alexander</td>
							                   <td>Developer</td>
							                   <td>San Francisco</td>
							                   <td>30</td>
							                 </tr>
							                 <tr>
							                   <td>Shad Decker</td>
							                   <td>Regional Director</td>
							                   <td>Edinburgh</td>
							                   <td>51</td>
							                 </tr>
							                 <tr>
							                   <td>Michael Bruce</td>
							                   <td>Javascript Developer</td>
							                   <td>Singapore</td>
							                   <td>29</td>
							                 </tr>
							                 <tr>
							                   <td>Donna Snider</td>
							                   <td>Customer Support</td>
							                   <td>New York</td>
							                   <td>27</td>
							                 </tr>
*/
 ?>
