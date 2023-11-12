<?php

require_once './objects/Album.php';
require_once './api/models/table.model.php';
class Album_model extends Table_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table_name = 'Albums';
    }
}
