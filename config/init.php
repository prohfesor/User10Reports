<?php

//load conf
require_once "config.php";

//frm
require_once "lib/vendor/fastcomet/flyInit.php";

$env = flyEnvironment::getInstance();

$db = flyDb::getInstance();
$db->connect('localhost', DB_USER, DB_PASS, DB_NAME);

//smarty
require_once('lib/vendor/smarty/Smarty.class.php');
$smarty = new Smarty();
//$smarty->debugging = true;
$smarty->template_dir = DIR_ROOT."/views/";
$smarty->compile_dir = DIR_ROOT."/cache/smarty/templates/";
$smarty->config_dir = DIR_ROOT.'/configs/';
$smarty->cache_dir = DIR_ROOT."/cache/smarty/";

//models
require_once('lib/model/report.php');
require_once('lib/model/user.php');
require_once('lib/model/blocks.php');
