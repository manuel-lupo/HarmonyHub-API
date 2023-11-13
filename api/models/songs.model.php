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

    public function getSongs($input, $query_order, $per_page, $start_index, $sorted_by)
    {
        $limit = intval($per_page);
        $offset = intval($start_index);

        $query = $this->db->prepare("SELECT * FROM Songs WHERE title LIKE ? ORDER BY {$sorted_by} {$query_order} LIMIT {$limit} OFFSET {$offset}");
        
        $query->execute(["%$input%"]);
        return $query->fetchAll(PDO::FETCH_CLASS, 'Song');
    }
}