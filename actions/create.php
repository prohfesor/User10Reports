<?php

$oReport = json_decode( $env->get('report') );

$result = new stdClass();

if(!$oReport || empty($oReport->name) || empty($oReport->email) || !flyValidate::isEmail($oReport->email))
{
    $result->status = "Error";
    $result->content= "Please give your report a name and fill correct email";
} else {
    $r = Report::create($oReport);
    $result->status = "Success";
    $result->content = "Created!";
    $result->object = $r;
}


echo json_encode($result);