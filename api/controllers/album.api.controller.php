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
}