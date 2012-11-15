<?php

//check referer
if(empty($_SERVER['HTTP_REFERER']) || !stripos($_SERVER['HTTP_REFERER'], $_SERVER['SERVER_NAME'])){
    die("HEY! No crossdomain!");
}

//upload pic
$upload = flyImageUpload::getInstance();
$i = $upload->get('image', DIR_ROOT."/uploads/images/");
if($i){
    unlink($i);
}
$upload->oImage->filename = DIR_ROOT."/uploads/images/user10_".rand(100000,999999).".jpg";
$upload->oImage->_resize(200, 200, RESIZE_MODE_CLIP_CENTER, false);
$i = $upload->oImage->save();

$img = "/uploads/images/".basename($i);
//var_dump($img);
//echo "<img src=$img>";

$result = new stdClass();
$result->status = (!empty($i))? "Success" : "Error";
$result->content= (!empty($i))? 'http://'.$_SERVER['SERVER_NAME'].$img : array_pop($upload->oImage->aErrors);

echo json_encode($result);