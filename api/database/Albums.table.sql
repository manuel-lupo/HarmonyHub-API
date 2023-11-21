START TRANSACTION;

CREATE TABLE `Albums` (
  `id` int NOT NULL,
  `title` varchar(45) NOT NULL,
  `rel_date` date DEFAULT NULL,
  `review` text DEFAULT NULL,
  `artist` varchar(255) NOT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `rating` float NOT NULL,
  `img_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

ALTER TABLE `Albums`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `Albums`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

INSERT INTO `Albums`(`title`, `img_url` , `rel_date`, `review`, `artist`, `genre`, `rating`) VALUES ('milo j x bzrp', 'https://i.scdn.co/image/ab67616d00001e0244fa31a89a1e549f74908a81' ,'2023/10/9','Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugiat repellendus totam, ipsa cupiditate cum voluptas est hic quis qui optio sit minus ratione. Possimus ducimus aperiam ipsa tempora tempore sint! Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur placeat beatae laudantium rerum modi reiciendis debitis, blanditiis vitae quasi facilis nostrum soluta accusamus ut quod possimus pariatur, dolor sequi minus? Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea, harum. Veniam, quos! Hic eligendi nostrum adipisci deserunt commodi accusamus iste cum, minus est delectus magni qui nemo voluptates voluptas possimus. Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum dolorem, accusantium ex reiciendis ipsa tenetur, cum eaque sint provident rerum dolorum nihil consequuntur sapiente libero maiores amet error aliquid temporibus! Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ipsam vero quidem qui doloribus eaque alias laborum impedit excepturi hic, fuga quis dolorem labore ipsa quo expedita, aut eum, aperiam doloremque. Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi assumenda consequatur nobis officiis quasi hic nostrum ab totam fuga quo itaque praesentium porro animi laboriosam in quidem, mollitia ex ullam? Lorem, ipsum dolor sit amet consectetur adipisicing elit. Laborum facere ex reprehenderit exercitationem hic pariatur corporis quam? Eum, quo quaerat nulla, exercitationem a accusamus saepe perferendis odit eaque unde voluptates? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nisi cupiditate quisquam similique temporibus aperiam! Molestiae hic explicabo ab. Voluptatem, vero! Aliquid, quisquam sunt nam explicabo assumenda vero eum ex fuga.','milo j and bzrp','rap','5');
INSERT INTO `Albums`(`title`, `img_url` , `rel_date`, `review`, `artist`, `genre`, `rating`) VALUES ('oktubre', 'https://i.scdn.co/image/ab67616d00001e02c7c1ffa44473871a6f004786' ,'1985/10/9','asassddsd','patricio rey y sus redonditos de ricota','rock','5');
INSERT INTO `Albums`(`title`, `img_url` , `rel_date`, `review`, `artist`, `genre`, `rating`) VALUES ('In the court of the crimson king', 'https://i.scdn.co/image/ab67616d00001e0246d124df5651c307aee255fd' , '1969/10/9','asasdsddsd','king crimson','progressive rock','5');
INSERT INTO `Albums`(`title`, `img_url` , `rel_date`, `review`, `artist`, `genre`, `rating`) VALUES ('ruido de lluvia en el bosque', 'https://i.scdn.co/image/ab67616d00001e02c38fcb924dd5ef533d3a7bf5' , '2006/10/9','asaxdxdxdsdsd','henry macdonald','ambient','4');
INSERT INTO `Albums`(`title`, `img_url` , `review`, `artist`, `genre`, `rating`) VALUES ('delicate steve','https://i.scdn.co/image/ab67616d00001e022ee8e42b53adfc1b2e3bef06' , 'asasdsdsfsd','steve delicate','r&b','3');

COMMIT;
