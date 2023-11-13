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

        if ($songs) {
            $this->view->response([
                'data' => $songs,
                'status' => 'success'
            ], 200);
        }
        $this->view->response([
            'data' => 'la canción no existe',
            'status' => 'error'
        ], 404);
    }

    function getSong($params = [])
    {
        $id = $params[":ID"];

        if (empty($id))
            $this->view->response([
                'data' => "no se proporcionó un id",
                'status' => "error"
            ], 400);

        $song = $this->model->getSongById($id);

        if ($song)
            $this->view->response([
                'data' => $song,
                'status' => 'success',
            ], 200);

        $this->view->response([
            'data' => 'la canción solicitada no existe',
            'status' => 'error'
        ], 404);

        $this->view->response($song, 200);
    }

    public function deleteSong($params = [])
    {
        $this->verifyToken();

        $song_id = $params[':ID'];
        if (empty($song_id)) {
            $this->view->response([
                'data' => 'no se ingresó un id',
                'status' => 'error'
            ], 400);
        }
        $song = $this->model->getSongById($song_id);
        if ($song) {
            if ($this->model->deleteSong($song_id)) {
                $this->view->response([
                    'data' => "la canción con id= $song_id se eliminó con éxito",
                    'status' => 'success'
                ], 200);
            } else
                $this->view->response([
                    'data' => 'la canción no se pudo eliminar',
                    'status' => 'error'
                ], 500);
        } else
            $this->view->response([
                'data' => "la canción con id= $song_id no existe",
                'status' => 'error'
            ], 404);
    }
}
