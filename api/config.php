<?php

define("MYSQL_HOST","localhost");
define("MYSQL_USER","root");
define("MYSQL_DBASE","db_albums");
define("MYSQL_PASS","");
define("ENCODE_KEY","ESTA_PARA_PROMO?");


function DB_table_exists(PDO $db, $table){

    // Try a select statement against the table
    // Run it in try-catch in case PDO is in ERRMODE_EXCEPTION.
    try {
        $result = $db->query("SELECT 1 FROM {$table} LIMIT 1");
    } catch (Exception $e) {
        // We got an exception (table not found)
        return FALSE;
    }
    // Result is either boolean FALSE (no table found) or PDOStatement Object (table found)
    return $result !== FALSE;
}

try {
    $dbh = new PDO("mysql:host=localhost", 'root', '');
    $dbh->exec("CREATE DATABASE IF NOT EXISTS `db_albums`;");
    $dbh = new PDO('mysql:host=localhost;dbname=db_albums;charset=utf8', 'root', '');
    if (!DB_table_exists($dbh, 'Albums'))
        $dbh->exec(file_get_contents('./api/database/Albums.table.sql'));
    if (!DB_table_exists($dbh, 'Songs'))
        $dbh->exec(file_get_contents('./api/database/Songs.table.sql'));
    if (!DB_table_exists($dbh, 'Users'))
        $dbh->exec(file_get_contents('./api/database/Users.table.sql'));
} catch (PDOException $e) {
    if ($e->getCode() != 'HY000') //HY000 Codigo de error cuando la db ya esta creada
        die("DB ERROR: " . $e);
}
