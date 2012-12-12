<?php

$smarty->assign('reports', Report::getList());
$smarty->display('index.tpl');