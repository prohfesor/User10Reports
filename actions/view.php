<?php

$report = Report::find($action2);
if(!$report){
    $env->redirect('/');
}

flyDebug::dump($report);

$smarty->assign("report", $report);
$smarty->display("view.tpl");