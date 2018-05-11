<?php

class MessageView extends View {
  function __construct($controller,$action, $message){
    parent::__construct($controller,$action);
    $_POST['message'] = $message;
  }

  public function render() {
     $this->loadTemplate($this->templateNames['head'], $this->args);
     $this->loadTemplate($this->templateNames['content'], $this->args);
     //$this->loadTemplate($this->templateNames['foot'], $this->args);
  }


}

?>
