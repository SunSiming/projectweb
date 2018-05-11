<?php

/*
* A Controller is dedicated to processing a request
* its responsibilities are:
* - analysing the action to be done
* - analysing the parameters
* - acting on the model objects to perform the action
* - processing the data
* - calling the view and giving it the data
* - returning the response
*/

abstract class Controller extends MyObject {

   protected $request;

   public function __construct($request) {
		$this->request = $request;
   }

   // ============
   // = Abstract =
   // ============

   public abstract function defaultAction($request);

   // ==============
   // = Public API =
   // ==============

	public function getActionName() { return $this->request->getActionName(); }

	public function execute() {
		$methodName = $this->request->getActionName();

      if(!method_exists($this,$methodName))
         throw new Exception('Action "' . $methodName . '" does not exists on controller ' . get_class($this) );

	   $this->$methodName($this->request);
   }

}

?>
