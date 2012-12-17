<?php

$report = Report::find($action2);
if(!$report){
    $env->redirect('/');
}

//flyDebug::dump($report);

header("Content-type: text/json");
echo json_encode($report);