<?php

require 'vendor/Doctrine/ORM/Tools/Setup.php';

//autoload
$lib = dirname(__FILE__). "/vendor";
Doctrine\ORM\Tools\Setup::registerAutoloadDirectory($lib);

//obtain entity manager
use Doctrine\ORM\Tools\Setup;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Configuration;

// the connection configuration
$dbParams = array(
    'driver'   => 'pdo_mysql',
    'host' => 'localhost',
    'user'     => DB_USER,
    'password' => DB_PASS,
    'dbname'   => DB_NAME,
);


$applicationMode = "development";
if ($applicationMode == "development") {
    $cache = new \Doctrine\Common\Cache\ArrayCache;
} else {
    $cache = new \Doctrine\Common\Cache\ApcCache;
}

$paths = array(DIR_ROOT.'/config/doctrine');
$isDevMode = true;

$config = Setup::createYAMLMetadataConfiguration($paths, $isDevMode);
$config = new Configuration;
$config->setMetadataCacheImpl($cache);
$driverImpl = $config->newDefaultAnnotationDriver( $paths, 0 );
$config->setMetadataDriverImpl($driverImpl);
$config->setQueryCacheImpl($cache);
$config->setProxyDir(DIR_ROOT.'/lib/model/Proxies');
$config->setProxyNamespace('MyProxies');

if ($applicationMode == "development") {
    $config->setAutoGenerateProxyClasses(true);
} else {
    $config->setAutoGenerateProxyClasses(false);
}
//var_dump($config);


//autoload proxies
use Doctrine\ORM\Proxy\Autoloader;

$proxyDir = DIR_ROOT.'/lib/model/Proxies';
$proxyNamespace = "MyProxies";
Autoloader::register($proxyDir, $proxyNamespace);


//entity manager
$em = \Doctrine\ORM\EntityManager::create($dbParams, $config);

//helper set
$helperSet = new \Symfony\Component\Console\Helper\HelperSet(array(
    'db' => new \Doctrine\DBAL\Tools\Console\Helper\ConnectionHelper($em->getConnection()),
    'em' => new \Doctrine\ORM\Tools\Console\Helper\EntityManagerHelper($em)
));