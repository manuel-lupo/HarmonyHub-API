<?php
require_once("./api/models/album.model.php");
require_once("./api/controller/table.api.controller.php");
require_once("./api/views/json.view.php");

class AlbumApiController extends TableApiController
{

    public function __construct()
    {
        parent::__construct();
        $this->model = new Album_Model();
    }

    private function getDataInAlbum($album, $data)
    {
        if (!empty($data->artist))
            $album->setArtist($data->artist);
        if (!empty($data->title))
            $album->setTitle($data->title);
        if (!empty($data->img_url))
            $album->setImgUrl($data->img_url);
        if (!empty($data->review))
            $album->setReview($data->review);
        if (!empty($data->rel_date))
            $album->setRelDate($data->rel_date);
        if (!empty($data->rating))
            $album->setRating($data->rating);
        if (!empty($data->genre))
            $album->setGenre($data->genre);
    }

    public function getAlbums($params = [])
    {
        $sorted_by = (!empty($_GET['sort_by']) && $this->model->columnExists($_GET['sort_by'])) ? $_GET['sort_by'] : "rel_date";
        $order = (!empty($_GET['order']) && $_GET['order'] == 1) ? "DESC" : "ASC";

        $page = !empty($_GET['page']) ? (int)$_GET['page'] : 1;
        $per_page = !empty($_GET['per_page']) ? (int)$_GET['per_page'] : 10;
        $start_index = ($page - 1) * $per_page;

        $albums = $this->model->getAlbums($order, $sorted_by, $start_index, $per_page);

        if ($albums) {
            if (count($albums) !== 0)
                $this->view->response([
                    'data' => $albums,
                    'status' => 'success'
                ], 200);

            //Si llega hasta este ultimo response por alguna razon la base de datos no contiene albums
            $this->view->response([
                'data'=> "No hay albums en nuestra base de datos",
                "status"=> "error"
            ], 500);  
        }

        $this->view->response([
            "data"=> "Ha ocurrido un error y no se puede completar la busqueda",
            "status"=> "error"
        ], 500);
    }
}