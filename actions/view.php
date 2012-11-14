<?php

$report = Report::find($action2);
if(!$report){
    $env->redirect('/');
}

$smarty->assign("report", $report);
$smarty->display("view.tpl");