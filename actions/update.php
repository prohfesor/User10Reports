<?php

$oReport = json_decode( $env->get('report') );

$result = new stdClass();

if(!$oReport || empty($oReport->name) || empty($oReport->email) || !flyValidate::isEmail($oReport->email))
{
    $result->status = "Error";
    $result->content= "Oops, it looks like you need to tell us more about your report before publishing.";
} else {
    $r = Report::update($oReport);
    $result->status = "Success";
    $result->content = "Your report has been published. Share it with others.";
    $result->object = $r;
}


echo json_encode($result);