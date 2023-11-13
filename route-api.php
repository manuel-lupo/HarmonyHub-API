<?php
try {
    require_once('./objects/Router.php');
require_once('./api/config.php');
require_once('./api/controllers/album.api.controller.php');
require_once ('./api/controllers/songs.api.controller.php');
require_once "./api/controllers/auth.api.controller.php";

// CONSTANTES PARA RUTEO
define("BASE_URL", 'http://'.$_SERVER["SERVER_NAME"].':'.$_SERVER["SERVER_PORT"].dirname($_SERVER["PHP_SELF"]).'/');

$router = new Router();

// rutas

$router->addRoute("auth", "POST", "AuthApiController", "login");

$router->addRoute('albums', 'GET', 'AlbumApiController', 'getAlbums');
$router->addRoute('songs', 'GET', 'SongsApiController', 'getSongs');
$router->addRoute("albums/:ID" , "GET" , "AlbumApiController", "getAlbum");
$router->addRoute("songs/:ID", "GET", "SongsApiController", "getSong");
$router->addRoute("albums" , "POST" , "AlbumApiController", "addAlbum");
$router->addRoute("songs", "POST", "SongsApiController", "addSong");
$router->addRoute("songs/:ID", "PUT", "SongsApiController", "updateSong");
$router->addRoute("albums/:ID", "PUT", "AlbumApiController", "updateAlbum");
$router->addRoute('songs/:ID', 'DELETE', 'SongsApiController', 'deleteSong');
$router->addRoute("albums/:ID" , "DELETE" , "AlbumApiController", "deleteAlbum");



//run

$router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']); 

} catch (\Throwable $th) {
    die($th);
}