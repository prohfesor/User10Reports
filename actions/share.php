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
$body = $smarty->fetch('mail.tpl');
$subject = "Likely Reports";
$mailer->send( $email, $subject, $body );

$env->redirect("/view/{$report->id}/");