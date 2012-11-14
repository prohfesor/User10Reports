<?php
// test.php
require 'Doctrine/ORM/Tools/Setup.php';

//$lib = "/path/to/doctrine2-orm/lib";
$lib = dirname(__FILE__);
Doctrine\ORM\Tools\Setup::registerAutoloadDirectory($lib);