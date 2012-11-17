<?php

$email = $env->get('email');
$report = Report::find( $env->getInt('id') );

if(!$report){
    $env->redirect("/");
}

if(!flyValidate::isEmail($email)){
    $env->redirect("/view/{$report->id}/");
}

$mailer = new flyMail();
$mailer->type = "html";

$subject = "Likely Reports";
$smarty->assign("report", $report);
$body = $smarty->fetch('mail.tpl');

$sent = $mailer->send( $email, $subject, $body );

if($sent){
    Share::addShare( $report->id , $email );
}

$env->redirect("/view/{$report->id}/");