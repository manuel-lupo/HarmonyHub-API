<?php
require_once './api/models/songs.model.php';
require_once './api/controller/table.api.controller.php';
require_once './api/views/json.view.php';

class songsApiController extends TableApiController
{

    public function __construct()
    {
        parent::__construct();
        $this->model = new songs_model();
    }

}