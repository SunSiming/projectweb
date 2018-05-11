<?php

class UserView extends View {

/*  public function __construct($controller,$templateName, $args) {
    parent::__construct($controller,$templateName,$args);
    $this->templateNames['contentTemplate'] ='anonymousTemplate';
    $this->templateNames['top'] ='userTop';

    if(!$this->args['user'])
      throw new Exception('a user must be defined');
  }

  public static render(){
    include(./templates/anonymousTemplate);
  }*/

  function __construct($controller,$action){

    parent::__construct($controller,$action);
  }

  public function render(){
    //session_start();
     $this->loadTemplate($this->templateNames['head'], $this->args);
     $this->loadTemplate($this->templateNames['top'], $this->args);
     $this->loadTemplate($this->templateNames['content'], $this->args);
     $this->loadTemplate($this->templateNames['logout'], $this->args);
     //$this->loadTemplate($this->templateNames['side'], $this->args);
     $this->loadTemplate($this->templateNames['foot'], $this->args);
  }
}

?>
