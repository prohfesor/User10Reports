<?php 
	require_once('flyFunc.php');
	
	require_once('flyEnv.php');

	require_once('flySession.php');
	
	require_once('flyDb.php');

	require_once('flyDbTableQuery.php');
	
	require_once('flyMail.php');

    ini_set('magic_quotes_gpc', 'Off');
	if (get_magic_quotes_gpc()) {
		new flyError("Magic quotes are on!");
	}
?>