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
$mailer->from = $report->user->email;
$mailer->replyTo = $report->user->email;
$subject = $report->name . " (" . date("%b, %e, %Y", $report->date_from) . " - " . date("%b, %e, %Y", $report->date_to) . ")";
$smarty->assign("report", $report);
$body = $smarty->fetch('mail.tpl');

$sent = $mailer->send( $email, $subject, $body );

if($sent){
    Share::addShare( $report->id , $email );
}

$env->redirect("/view/{$report->id}/");