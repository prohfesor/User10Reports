<?php

$report = Report::find( $action2 );
if(!$report){
    $env->redirect('/');
}

//flyDebug::dump($report);


$smarty->display("add.tpl");