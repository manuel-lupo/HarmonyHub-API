<?php
require_once('Router.php');

// CONSTANTES PARA RUTEO
define("BASE_URL", 'http://'.$_SERVER["SERVER_NAME"].':'.$_SERVER["SERVER_PORT"].dirname($_SERVER["PHP_SELF"]).'/');

$router = new Router();

// rutas

$router->addRoute('albums', 'GET', 'AlbumApiController', 'getAlbums');
$router->addRoute('songs', 'GET', 'SongsApiController', 'getSongs');
$router->addRoute("albums/:ID" , "GET" , "AlbumApiController", "getAlbum");
$router->addRoute("songs/:ID", "GET", "songsApiController", "getSong");



//run

$router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']); 
