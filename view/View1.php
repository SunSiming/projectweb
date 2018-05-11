<?php

class View extends MyObject{

  //$paramAff=NULL;
  protected $args;
  protected $templateNames;

 public function __construct($controller, $templateName, $args = array()) {
	//parent::__construct();
		$this->templateNames = array();
		$this->templateNames['head'] = 'head';
		$this->templateNames['top'] = 'top';
		$this->templateNames['menu'] = 'menu';
		$this->templateNames['foot'] = 'foot';
		$this->templateNames['content'] = $templateName;
		$this->args = $args;
		$this->args['controller'] = $controller;
    $this->args['view'] = $this;
	}

	public function setArg($key, $val) {
		$this->args[$key] = $val;
	}


	public function render() {
		$this->loadTemplate($this->templateNames['head'], $this->args);
		$this->loadTemplate($this->templateNames['top'], $this->args);
		$this->loadTemplate($this->templateNames['menu'], $this->args);
		$this->loadTemplate($this->templateNames['content'], $this->args);
		//$this->loadTemplate($this->templateNames['foot'], $this->args);
	}

  /*public function loadTemplate($name,$args=NULL) {
	$templateFileName = __SITE_PATH . '/templates/'. $name . 'Template.php';
	if(is_readable($templateFileName)) {
		if(isset($args))
			foreach($args as $key => $value)
				$key = $value;
			require_once($templateFileName);
		}
		else
			throw new Exception('undefined template "' . $name .'"');
}*/

  public function templatesSearchPaths() {
   // paths are ordered and will be prefixed by templates/
   return array( '' );
  }

  public function loadTemplate($name,$args=NULL) {
   $templateSearchPaths = $this->templatesSearchPaths();
   $templateFileName = null;
   $i = -1;

   do {
     $i++;
     $templateFileName = __ROOT_DIR . '/templates/'. $templateSearchPaths[$i] . $name . 'Template.php';
   } while(!is_readable($templateFileName) && $i<count($templateSearchPaths));

   if(! is_readable($templateFileName))
     throw new Exception('template non défini : "' . $name .'"');

   $this->log('Chargement du template: ' . $templateSearchPaths[$i] . $name . 'Template.php');

   $this->loadTemplateFileNamed($templateFileName,$args);
 }

 public function loadTemplateFileNamed($templateFileName,$args=NULL) {
   if(isset($args))
     foreach($args as $key => $value)
       $$key = $value;
   require($templateFileName);
 }

}

?>
