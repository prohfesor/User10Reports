<?php

$report = Report::find($action2);
if(!$report){
    $env->redirect('/');
}

//fix lists
foreach($report->blocks as $k=>$block){
    foreach($block->data as $key=>$value){
        if("line"==substr($key,0,4) && is_numeric(substr($key,4)))
        {
            if(!isset($report->blocks[$k]->data['list'])){
                $report->blocks[$k]->data['list'] = array();
            }
            $report->blocks[$k]->data['list'][substr($key,4)] = $value;
            unset( $report->blocks[$k]->data[$key] );
        }
    }
}

//flyDebug::dump($report);

header("Content-type: text/json");
echo json_encode($report);