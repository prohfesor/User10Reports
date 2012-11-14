<?php
require_once("config/init.php");
require_once("lib/vendor/Doctrine/ORM/Tools/Console/ConsoleRunner.php");

Doctrine\ORM\Tools\Console\ConsoleRunner::run( $helperSet , array() );