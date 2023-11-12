<?php
require_once './objects/Song.php';
require_once './api/models/table.model.php';
class songs_model extends Table_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table_name = 'Songs';
    }
}