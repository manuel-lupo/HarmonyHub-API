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

    public function getAlbumById($id)
    {
        $query = $this->db->prepare('SELECT * FROM Albums WHERE id = ?');
        $query->setFetchMode(PDO::FETCH_CLASS, 'Album');
        $query->execute([$id]);
        return $query->fetch();
    }
    public function createAlbum($album)
    {
        try {
            $query = $this->db->prepare("INSERT INTO `Albums`(`title`, `rel_date`, `review`, `artist`, `genre`, `rating`, `img_url`) VALUES (?,?,?,?,?,?,?)");
            $query->execute(
                [
                    $album->getTitle(),
                    (!empty($album->getRel_date())) ? $album->getRel_date() : null,
                    (!empty($album->getReview())) ? $album->getReview() : null,
                    $album->getArtist(),
                    (!empty($album->getGenre())) ? $album->getGenre() : null,
                    (!empty($album->getRating())) ? $album->getRating() : null,
                    $this->moveTempFile($album->getImgUrl())
                ]
            );
            return $this->db->lastInsertId();
        } catch (\Throwable $th) {
            die($th);
        }
    }

    public function moveTempFile($url)
    {
        if (!empty($url)) {
            $filePath = "img/covers/album_cover_" . uniqid("", true) . "."
                . strtolower(pathinfo($_FILES['img']['name'], PATHINFO_EXTENSION));
            move_uploaded_file($url, $filePath);
            return $filePath;
        } else return " ";
    }
}
