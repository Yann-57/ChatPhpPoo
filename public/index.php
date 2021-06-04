<?php
define('BASE_DIR','../');
include BASE_DIR.'app/Autoloader.php';
Autoloader::register();

// // ON LANCE NOTRE ROUTEUR ET LA MAGIE OPERE 🪄
$router = new Router($_SERVER['REQUEST_URI']);
$router->execute();



