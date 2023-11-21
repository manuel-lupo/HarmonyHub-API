START TRANSACTION;

CREATE TABLE `Users` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;


INSERT INTO `Users`(`name`, `password`, `role`) VALUES ('webadmin','$2y$10$480tQnUpv7QrZgkJLwS2MO73HPcSDrdMPIRBD/dC1Bk4jiI4rc9Uy','admin');

COMMIT;