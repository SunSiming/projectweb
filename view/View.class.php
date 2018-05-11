<?php

abstract class View extends MyObject {

   protected $args;
   protected $templateNames;
   protected static $currentView = NULL;

   public function __construct($controller, $templateName, $args = array()) {
      // parent::__construct();
      $this->templateNames = array();
      $this->templateNames['head'] = 'head';
      $this->templateNames['top'] = 'top';
      $this->templateNames['login']= 'login';
      $this->templateNames['content'] = $templateName;
      $this->templateNames['validateinscription'] = 'validateinscription';
      // $this->templateNames['side'] = 'side';
      $this->templateNames['logout'] = 'logout';
      $this->templateNames['foot'] = 'foot';
      $this->args = $args;
      $this->args['controller'] = $controller;
      $this->args['view'] = $this;
   }

   public static function getView(){
     if(is_null(static::$currentView)){
       try{
         $view = new UserView($this, 'index');
       }
 			catch(Exception $e){
 				die('Erreur de création de la vue View');
 			}
     }
     return static::$currentView;
   }

   public function getTemplateName(){
     return $this->templateNames['content'];
   }

   public function setArg($key, $val) {
      $this->args[$key] = $val;
   }

   public function templatesSearchPaths() {
		// paths are ordered and will be prefixed by templates/
		return array( '' );
   }

	// load template named $name according the templatesSearchPaths()
   public function loadTemplate($name,$args=NULL) {
		$templateSearchPaths = $this->templatesSearchPaths();
		$templateFileName = null;
		$i = -1;

		do {
			$i++;
			$templateFileName = __ROOT_DIR . '/templates/'. $templateSearchPaths[$i] . $name . 'Template.php';
      //echo "$templateSearchPaths[$i] . $name . 'Template.php'";
		} while(!is_readable($templateFileName) && $i<count($templateSearchPaths));

		if(! is_readable($templateFileName))
			throw new Exception('template non défini : "' . $name .'"');

		$this->log('Chargement du template : ' . $templateSearchPaths[$i] . $name . 'Template.php');

		$this->loadTemplateFileNamed($templateFileName,$args);
   }

	public function loadTemplateFileNamed($templateFileName,$args=NULL) {
		if(isset($args))
			foreach($args as $key => $value)
				$$key = $value;
		require($templateFileName);
	}

   abstract public function render();/*{
      $this->loadTemplate($this->templateNames['head'], $this->args);
      $this->loadTemplate($this->templateNames['top'], $this->args);
      $this->loadTemplate($this->templateNames['content'], $this->args);
      // $this->loadTemplate($this->templateNames['side'], $this->args);
      $this->loadTemplate($this->templateNames['foot'], $this->args);
   }*/
}

?>
