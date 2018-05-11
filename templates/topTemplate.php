<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div>

		<?php
    $this->loadTemplate("menu",$this->args);
  	//require_once(__ROOT_DIR . '/test.php');?>
    <?php $this->loadTemplate("notif",$this->args); ?>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="container-fluid content">
  <div class='content-wrapper'>
    <!--<div class='content-wrapper'>-->
        <div class='container-fluid'>
          <!-- Breadcrumbs-->
          <!--<ol class='breadcrumb'>
            <li class='breadcrumb-item'>
              <a href='index.php?c=user'>Dashboard</a>
            </li>
            <li class='breadcrumb-item active'>Blank Page</li>

          </ol>-->
