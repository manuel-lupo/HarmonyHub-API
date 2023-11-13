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

    public function getAlbums(float $rating, $input, $order, $sorted_by, $start_index, $per_page)
    {

        $limit = intval($per_page);
        $offset = intval($start_index);

        $query = $this->db->prepare("SELECT * FROM Albums WHERE rating > ? AND title LIKE ? ORDER BY {$sorted_by} {$order} LIMIT {$limit} OFFSET {$offset}");

        $query->execute([$rating, ("%" . $input . "%")]);

        return $query->fetchAll(PDO::FETCH_CLASS, 'Album');
    }
}
