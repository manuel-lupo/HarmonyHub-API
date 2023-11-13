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

    function getSongs($params = [])
    {   
        $input = !empty($_GET["search_input"]) ? $_GET["search_input"] : "";
        $order = (!empty($_GET['order']) && $_GET['order'] == 1) ? "DESC" : "ASC";
        $sorted_by = (!empty($_GET['sort_by']) && $this->model->columnExists($_GET['sort_by'])) ? $_GET['sort_by'] : "album_id";


        $page = !empty($_GET['page']) ? (int)$_GET['page'] : 1;
        $per_page = !empty($_GET['per_page']) ? (int)$_GET['per_page'] : 10;
        $start_index = ($page - 1) * $per_page;

        $songs = $this->model->getSongs($input, $order, $per_page, $start_index, $sorted_by);

        if($songs){
            $this->view->response([
                'data' => $songs,
                'status' => 'success'], 200);
        }
        $this->view->response([
            'data' => 'la canción no existe',
            'status' => 'error'], 404);
    }

}