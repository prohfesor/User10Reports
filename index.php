<?php

require_once("config/init.php");

// load page
$action = $env->get('action', 'index');
list($action1, $action2) = explode('/', $action, 2);
if(!is_file("actions/$action1.php")) {
    $env->redirect("/");
} else {
    include( "actions/$action1.php" );
}