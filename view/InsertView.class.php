<?php

class InsertView extends View {
  function __construct($controller,$action){
    parent::__construct($controller,$action);
  }

  public function render() {
     //$this->loadTemplate($this->templateNames['head'], $this->args);
     $this->loadTemplate($this->templateNames['content'], $this->args);
     //$this->loadTemplate($this->templateNames['foot'], $this->args);
  }


}

?>
