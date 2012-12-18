<?php

$report = Report::find( $env->get('id') );
if(!$report){
    $env->redirect('/');
}

//flyDebug::dump($report);


$smarty->display("add.tpl");