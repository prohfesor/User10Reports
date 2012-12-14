<?php

$email = $env->get('email');
$email = trim($email);
$report = Report::find( $env->getInt('id') );

$result = new stdClass();

if(!$report){
    $result->status = "Error";
    $result->content= "Oops, wrong report id.";
    die( json_encode($result) );
}

if(!flyValidate::isEmail($email)){
    $result->status = "Error";
    $result->content= "Oops, email incorrect.";
    die( json_encode($result) );
}

//if(Share::findByEmail($report->id, $email)){
//    $result->status = "Error";
//    $result->content= "Oops, this email already shared.";
//    die( json_encode($result) );
//}

$mailer = new flyMail();
$mailer->type = "html";
$mailer->from = $report->user->email;
$mailer->replyTo = $report->user->email;
$subject = $report->name . " (" . date("M. j, Y", strtotime($report->date_from)) . " - " . date("M. j, Y", strtotime($report->date_to)) . ")";
$smarty->assign("report", $report);
$body = $smarty->fetch('mail.tpl');

$sent = $mailer->send( $email, $subject, $body );

if($sent){
    Share::addShare( $report->id , $email );
    $result->status = "Success";
    $result->content= $email;
} else {
    $result->status = "Error";
    $result->content= "Oops, this email already shared.";
}

die( json_encode($result) );