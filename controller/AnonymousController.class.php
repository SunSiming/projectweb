<?php

class AnonymousController extends Controller {

   // ==============
   // Actions
   // ==============
	 public function __construct(){
	 			$request = Request::getCurrentRequest();
	 			parent::__construct($request);
	 }


	public function defaultAction($request) {
		$view = new AnonymousView($this,'login');
		$view->render();
	}


	public function inscription($request) {
		$view = new AnonymousView($this,'inscription');
		$view->render();
	}

	public function validateInscription($request) {
		$mail = $request->read('inscMail');
		$pseudo = $request->read('inscLogin');
		if(User::isMailUsed($mail) || User::isPseudoUsed($pseudo)) {
			$view = new MessageView(Request::getCurrentRequest()->getControllerName(), 'message_FailInscription', 'Malheureusement, ce pseudo est déjà attribué.');
			$view->render();
					//echo "<h2> Malheureusement, ce login est déjà attribué.</h2>";
		}

		 else {
					//echo "<h2> Votre login est accessible</h2>";
					$password = $request->read('inscPassword');
					$confPassword = $request->read('inscConfPassword');

					/// Confirmation du mot de passe
					if ($password!==$confPassword){
						$view = new MessageView(Request::getCurrentRequest()->getControllerName(), 'message_FailInscription', ' Les mots de passes ne correspondent pas.');
						$view->render();
					} else {

						$nom = $request->read('inscName');
						$prenom = $request->read('inscFName');
						$fonction = $request->read('inscFonction');
						$user = User::create($password,$mail,$nom,$prenom,$pseudo,$fonction);
						if(!isset($user)) {
							$view = new MessageView(Request::getCurrentRequest()->getControllerName(), 'message_FailInscription', 'Votre adresse mail ou votre mot de passe est trop long !');// il ne faut pas de point dans l'adresse email mais je sais pas pourquoi
							$view->render();
						} else {
							$view = new MessageView($this, 'message_ConfInscription', 'Votre inscription est réussie !');
							$view->render();
						//	$view = new MessageView($this,'validateinscription', 'coucou');
						//	$view->render();
						}
					}
				}
			}

		public function validationConnexion($request){
		    if(!User::isMailUsed($request->read('inscMail'))) {
		      $view = new MessageView($this,'message_loginErreur', "l'adresse email n'est pas dans la base de données");
		      $view->setArg('message',$this->generateErrorMessages('account_not_found'));
		      $view->setArg('pseudo',$request->read('inscLogin'));
		      $view->render();
		    } elseif (!$request->read('inscMail')==null && !$request->read('inscPassword')==null) {
				//On regarde si on nous a bien donné un pseudo et un mot de passe.
					$this->authorizeConnection($request);
		    } else{
		      $view = new AnonymousView($this, 'login');
		      $view->setArg('pseudo',$request->read('pseudo'));
		      $view->setArg('message',$this->generateErrorMessages('fields_missing'));
		      $view->render();
		    }
		  }

		public function authorizeConnection($request){
				$mail = $request->read('inscMail');
				$pwd = $request->read('inscPassword');
				$user= User::checkMailPassword($mail,$pwd);//On regarde si l'identification est ok.
				if (isset($user)) {
					$user->setId(User::getId($mail));

					//On regarde si l'utilisateur est bloqué
					if($user->isBloqued()){
						echo "Echec de connexion";
						$view = new MessageView($this,'message_bloquer', "Vous êtes bloqué ! Désolé !");
						$view->setArg('pseudo',$request->read('inscLogin'));
						$view->setArg('message',$this->generateErrorMessages('wrong_password'));
						$view->render();
					} else {

							try {
								Session::startSession();
								$_SESSION['currentUser'] = $user;
								$_SESSION['id']= User::getId($mail);

								if($user->isAdmin()){
									$newRequest=Request::getCurrentRequest();
									$newRequest->write('c','admin');
									$newRequest->write('a','defaultAction');
									$controller = Dispatcher::dispatch($newRequest);
									$controller->execute();
								}else{
									//On connecte l'user.
									$newRequest=Request::getCurrentRequest();
									$newRequest->write('c','user');
									$newRequest->write('a','defaultAction');
									$controller = Dispatcher::dispatch($newRequest);
									$controller->execute();
								}
							} catch (Exception $e) {
								echo 'Error : ' . $e->getMessage() . "\n";
							}
					}
				} else {
						echo "Failure in connection";
						$view = new MessageView($this,'message_fauxmdp', 'Erreur de mot de passe!');
						$view->setArg('pseudo',$request->read('inscLogin'));
						$view->setArg('message',$this->generateErrorMessages('wrong_password'));
						$view->render();
					}

			}

			public function forgotPassword($request){
				$view = new AnonymousView($this,'forgotPassword');
				$view->render();
			}

			public function deconnection($request){
					Session::startSession();
					session_destroy();
					$view = new AnonymousView($this, 'login');
					$view->render();
				}



/*###############################################################################################################################################################################################################################################################################################################################################################################

Error

###############################################################################################################################################################################################################################################################################################################################################################################*/
			public function generateErrorMessages($keyString){
			  $arrayOfMessages = array('disconnect' =>'<div class="alert alert-info" role="alert"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> Vous êtes maintenant déconnecté</div>'
			, 'wrong_password' => '<div class="alert alert-danger" role="alert"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Vérifiez votre combinaison pseudo/mot de passe.</div>'
			, 'fields_missing'=> '<div class="alert alert-warning" role="alert"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Complétez tous les champs.</div>'
			, 'login_used' => '<div class="alert alert-danger" role="alert"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>Ce pseudo est déjà utilisé. Merci d\'en choisir un autre.</div>'
			, 'inscription_failed' => '<div class="alert alert-warning" role="alert"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>L\'inscription a échoué. Merci de retenter.</div>'
			, 'pseudo_password_failed' => '<div class="alert alert-warning" role="alert"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Merci de saisir un pseudo entre 1 et 12 caractères.<br> Merci de saisir un mot de passe entre 1 et 15 caractères.</div>'
			, 'pseudo_failed' => '<div class="alert alert-warning" role="alert"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Merci de saisir un pseudo entre 1 et 12 caractères.</div>'
			, 'password_failed' => '<div class="alert alert-warning" role="alert"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Merci de saisir un mot de passe entre 1 et 15 caractères.</div>'
			, 'passwords_not_equal' => '<div class="alert alert-danger" role="alert"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Votre mot de passe et sa confirmation ne correspondent pas.</div>'
			, 'passwords_not_equal_failed' => '<div class="alert alert-danger" role="alert"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Votre mot de passe et sa confirmation ne correspondent pas. <br> Merci de saisir un mot de passe entre 1 et 15 caractères.</div>'
			, 'account_not_found' => '<div class="alert alert-danger" role="alert"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Compte inexistant. Merci de créer votre compte.</div>'
			, 'welcome' => '<div class="alert alert-success" role="alert"><span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span> <strong>Bienvenue !</strong> Voici votre page d\'accueil. Vous trouverez <strong>ci-dessous le tableau des parties publiques disponibles</strong>. Lorsque vous commencerez
			à jouer, ce tableau affichera vos parties en cours et les parties auxquelles vous avez été invité. Vous pouvez à l\'aide du menu en haut <a href="index.php?action=createGame" class="alert-link">créer une partie</a>, <a href="index.php?action=readRules&counter=1" class="alert-link">lire les règles</a>, consulter les classements &#8230; Bon jeu !</div>'
			);
			    return $arrayOfMessages[$keyString];
			 }
}

?>
