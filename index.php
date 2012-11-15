<?php

require_once("config/init.php");

// load page
$action = $env->get('action', 'index');

//xhr fix
$action = ("/"!=substr($action,-1)) ? $action."/" : $action;

list($action1, $action2) = explode('/', $action, 2);
if(!is_file("actions/$action1.php")) {
    $env->redirect("/");
} else {

    $smarty->assign("action", $action1);
    include( "actions/$action1.php" );
}