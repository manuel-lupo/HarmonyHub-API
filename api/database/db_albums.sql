SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_albums`
--

-- --------------------------------------------------------

--
-- Table structure for table `Albums`
--

CREATE TABLE `Albums` (
  `id` int NOT NULL,
  `title` varchar(45) NOT NULL,
  `rel_date` date DEFAULT NULL,
  `review` text NOT NULL,
  `artist` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `rating` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

INSERT INTO `Albums`(`title`, `img_url` , `rel_date`, `review`, `artist`, `genre`, `rating`) VALUES ('milo j x bzrp', 'https://i.scdn.co/image/ab67616d00001e0244fa31a89a1e549f74908a81' ,'2023/10/9','Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugiat repellendus totam, ipsa cupiditate cum voluptas est hic quis qui optio sit minus ratione. Possimus ducimus aperiam ipsa tempora tempore sint! Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur placeat beatae laudantium rerum modi reiciendis debitis, blanditiis vitae quasi facilis nostrum soluta accusamus ut quod possimus pariatur, dolor sequi minus? Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea, harum. Veniam, quos! Hic eligendi nostrum adipisci deserunt commodi accusamus iste cum, minus est delectus magni qui nemo voluptates voluptas possimus. Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum dolorem, accusantium ex reiciendis ipsa tenetur, cum eaque sint provident rerum dolorum nihil consequuntur sapiente libero maiores amet error aliquid temporibus! Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ipsam vero quidem qui doloribus eaque alias laborum impedit excepturi hic, fuga quis dolorem labore ipsa quo expedita, aut eum, aperiam doloremque. Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi assumenda consequatur nobis officiis quasi hic nostrum ab totam fuga quo itaque praesentium porro animi laboriosam in quidem, mollitia ex ullam? Lorem, ipsum dolor sit amet consectetur adipisicing elit. Laborum facere ex reprehenderit exercitationem hic pariatur corporis quam? Eum, quo quaerat nulla, exercitationem a accusamus saepe perferendis odit eaque unde voluptates? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nisi cupiditate quisquam similique temporibus aperiam! Molestiae hic explicabo ab. Voluptatem, vero! Aliquid, quisquam sunt nam explicabo assumenda vero eum ex fuga.','milo j and bzrp','rap','5');
INSERT INTO `Albums`(`title`, `img_url` , `rel_date`, `review`, `artist`, `genre`, `rating`) VALUES ('oktubre', 'https://i.scdn.co/image/ab67616d00001e02c7c1ffa44473871a6f004786' ,'1985/10/9','asassddsd','patricio rey y sus redonditos de ricota','rock','5');
INSERT INTO `Albums`(`title`, `img_url` , `rel_date`, `review`, `artist`, `genre`, `rating`) VALUES ('In the court of the crimson king', 'https://i.scdn.co/image/ab67616d00001e0246d124df5651c307aee255fd' , '1969/10/9','asasdsddsd','king crimson','progressive rock','5');
INSERT INTO `Albums`(`title`, `img_url` , `rel_date`, `review`, `artist`, `genre`, `rating`) VALUES ('ruido de lluvia en el bosque', 'https://i.scdn.co/image/ab67616d00001e02c38fcb924dd5ef533d3a7bf5' , '2006/10/9','asaxdxdxdsdsd','henry macdonald','ambient','4');
INSERT INTO `Albums`(`title`, `img_url` , `review`, `artist`, `genre`, `rating`) VALUES ('delicate steve','https://i.scdn.co/image/ab67616d00001e022ee8e42b53adfc1b2e3bef06' , 'asasdsdsfsd','steve delicate','r&b','3');


-- --------------------------------------------------------

--
-- Table structure for table `Songs`
--

CREATE TABLE `Songs` (
  `id` int NOT NULL,
  `title` varchar(45) NOT NULL,
  `rel_date` date DEFAULT NULL,
  `album_id` int NOT NULL,
  `lyrics` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Albums`
--
ALTER TABLE `Albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Songs`
--
ALTER TABLE `Songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album_id` (`album_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Albums`
--
ALTER TABLE `Albums`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Songs`
--
ALTER TABLE `Songs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Songs`
--
ALTER TABLE `Songs`
  ADD CONSTRAINT `Songs_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `Albums` (`id`);


COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


ALTER TABLE `Songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album_id` (`album_id`);

ALTER TABLE `Songs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Songs`
  ADD CONSTRAINT `Songs_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `Albums` (`id`);

INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('FRUTO','2023/10/9','1', "El día de mi suerte, yeah <br>
Sé que antes de mi muerte<br>
Seguro que mi suerte cambiará<br>
<br>
Soy el fruto del hustle del oeste<br>
Y no niego extrañar un poco el ante'<br>
Debo buscar la paz en quien no reste<br>
Quien no me reste, yeah-eh<br>
<br>
Me cansé, odio tantas pregunta'<br>
Cambié, pero no me disgusta<br>
Sabía que iba a pasar desde los doce<br>
Y, desde entonce', al gloria y hasta nunca<br>
<br>
Me cansé, odio tantas pregunta'<br>
Cambié, pero no me disgusta<br>
Sabía que iba a pasar desde los doce<br>
Y, desde entonce', al gloria y hasta nunca<br>
<br>
Right now<br>
Mis manos si caen, se levantan<br>
Vi hermanos mostrar cómo cambian<br>
Aldana llorando en mi show<br>
Abrazos que tocan el alma<br>
Cuando no encontraba el color (yeah)<br>
Mi mente pintó como un arma<br>
Vi perra', rata' y larva'<br>
Pero vi un destino mejor<br>
<br>
Cuál hay si quisiera una vida sana<br>
Y económicamente buena<br>
Salir un rato de las mala'<br>
A unos cuanto guacho' por sapos
Los hicieron saltar cual rana<br>
Me cansé de escuchar los cortes<br>
Los socorro y también las bala'<br>
<br>
Cuál hay si quisiera una vida sana<br>
Y económicamente buena<br>
Salir un rato de las mala'<br>
A unos cuanto guacho' por sapos<br>
Los hicieron saltar cual rana<br>
Me cansé de escuchar los cortes<br>
Los socorro y también las bala'<br>
<br>
Me cansé, odio tantas pregunta'<br>
Cambié, pero no me disgusta<br>
Sabía que iba a pasar desde los doce<br>
Y, desde entonce', al gloria y hasta nunca<br>
<br>
Me cansé, odio tantas pregunta'<br>
Cambié, pero no me disgusta<br>
Sabía que iba a pasar desde los doce<br>
Y, desde entonce', al gloria y hasta nunca<br>
<br>
(Bizarrap)<br>
<br>
Soy el fruto del hustle del oeste<br>
Y no niego extrañar un poco el ante'<br>
Debo buscar la paz en quien no reste<br>
Quien no me reste, yeah-eh");
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('No soy eterno','2023/10/9','1', "(Fuiste mala, baby)<br>
(No soy eterno, baby)<br>
<br>
Mi amor, solo pido paz mental, porque<br>
Estoy perdiendo la fe y no me ayudas a olvidar<br>
Tu pasado oscuro me hace mal y juro<br>
Que estoy perdiendo la fe y no me ayudas a olvidar<br>
<br>
Yo no soy tan fuerte para amarte y menos<br>
Descifrar tu corazón<br>
Eso no es excusa para tus excusas<br>
Ante mi preocupación<br>
<br>
Me mentiste, baby<br>
No estoy bien, baby<br>
Fuiste mala, baby<br>
No soy eterno, baby<br>
<br>
Me mentiste, baby<br>
No estoy bien, baby<br>
Fuiste mala, baby<br>
No soy etеrno, baby<br>
<br>
Sinceramente, apague еl wifi, no quiero escucharte<br>
En este estado, no puedo contestar<br>
Confío en usted, pero no en lo que no puedo ver<br>
Y disocio de la realidad<br>
<br>
No estoy tan loco, mai<br>
Quiero entenderte, mai
Pero sos la culpable de mi dudar al mirarte<br>
Inseguridad por tú antes y tú ahora<br>
<br>
Miro tu rostro y dudo si te conozco como yo pensaba<br>
Tengo ese monstruo que me dice que hay otro enfrente de mi cara<br>
Y también ese ángel que sabe, en el fondo, que vos no sos mala<br>
Pero 'tás rara (pero 'tás rara, eh-eh)<br>
<br>
Yo no soy tan fuerte para amarte y menos<br>
Descifrar tu corazón<br>
Eso no es excusa para tus excusas<br>
Ante mi preocupación<br>
<br>
Me mentiste, baby<br>
No estoy bien, baby<br>
Fuiste mala, baby<br>
No soy eterno, baby<br>
<br>
Me mentiste, baby<br>
No estoy bien, baby<br>
Fuiste mala, baby<br>
No soy etеrno, baby");
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('TOY EN EL MIC','2023/10/9','1', "Y ahora 'toy en el mic<br>
Paco y cocaine, ese no es el huss<br>
Pero estuve al la'o siempre<br>
Vida mala en los diente', pero tuve otro plan<br>
<br>
Y ahora 'toy en el mic<br>
Paco y cocaine, ese no es el huss<br>
Pero estuve al la'o siempre<br>
Vida mala en los dientes, pero tuve otro plan<br>
<br>
Tengo el peso de mis ñeris en el barrio de colgantе<br>
Por eso no hay espacio para la chain de diamantе'<br>
Los guacho' terminaron siendo lo que vieron desde chico'<br>
Por eso, conozco a más rastreros' que cantante'<br>
Apenas tengo dieciséis, pero sé bien que los momentos<br>
Más felices que pasé nada tienen que ver con plata<br>
Hoy escribo esto en otro vuelo<br>
Pero aún no olvido el suelo y menos jugar en pata<br>
<br>
Perdóname, mami<br>
No siempre fui sincero<br>
Quería ser perfecto<br>
Ni que ando con una forty<br>
<br>
Perdóname, mami<br>
No creo en lo correcto<br>
Sueño con conciertos<br>
No voy a andar de running<br>
<br>
Y ahora 'toy en el mic<br>
Paco y cocaine, ese no es el huss<br>
Pero estuve al la'o siempre<br>
Vida mala en los diente', pero tuve otro plan<br>
<br>
Y ahora 'toy en el mic<br>
Paco y cocaine, ese no es el huss<br>
Pero estuve al la'o siempre<br>
Vida mala en los dientes, pero tuve otro plan<br>
<br>
'Toy en el top, dudo de mi alrededor<br>
Pero mis reales la suben<br>
Vivo mejor, pero aún no salí de Morón<br>
Y mi mente está en las nube'<br>
Pero es así, el tiempo me lo va decir<br>
Quién se fue y quién se quedó<br>
Vivo en el mood de vivir y antes de morirme<br>
<br>
'Toy en el mic<br>
Paco y cocaine, ese no es el huss<br>
Pero estuve al la'o siempre<br>
Vida mala en los diente', pero tuve otro plan<br>
<br>
Y ahora 'toy en el mic<br>
Paco y cocaine, ese no es el huss<br>
Pero estuve al la'o siempre<br>
Vida mala en los dientes, pero tuve otro plan");
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('Bzrp music session','2023/10/9','1', "Miré mi tarifa, pasé de mil a cien mil<br>
Aunque ahora lo mido en base a cuánto sufrí<br>
Todavía falta ver, también descubrir<br>
Escupo lo que antes no podía decir<br>
<br>
Errores que logré corregir<br>
Perra, me hice solo a bondi y dos pe<br>
Antes de que me llame el Gonza, era fan del Bi (¡Biza!)<br>
<br>
Hoy me voy al sol, porque Dios me llamó desde el downtown<br>
Debo despertar, porque no se acalora mi alma<br>
Pero me salvé, en la neblina logré ver el alba<br>
Le hice honor a la J en mi nombre, y mis valore' me cubren la espalda<br>
<br>
Hoy me voy al sol, porque Dios me llamó desde el downtown<br>
Debo despertar, porque no se acalora mi alma<br>
Pero me salvé, en la neblina logré ver el alba<br>
Le hice honor a la J en mi nombre, y mis valore' me cubren la espalda<br>
<br>
Mezclo flows, estilos y concepto'<br>
Los pasé a plata y me pone contento<br>
'Toy feliz, aunque parezca más muerto<br>
Llamó la muerte, pero hoy no contesto<br>
<br>
Le doy gracias a quien me traicionó<br>
Y me vi en situaciones que espantan<br>
Ahora, el negro catinga te canta<br>
Y tuve suerte, el camino me apilló<br>
<br>
Los flows no se desgastan<br>
Entre caídas y astucia, me hice cabida de industria'<br>
Y otras parecen de gangsta<br>
Money maker, hit maker en punga<br>
<br>
'Toy con mis reales ahora más que nunca<br>
El tiempo de a poco respondió un par de preguntas<br>
Sigo con quien, en las últimas, fue un buen segunda, je<br>
<br>
Hoy me voy al sol, porque Dios me llamó desde el downtown<br>
Debo despertar, porque no se acalora mi alma<br>
Pero me salvé, en la neblina logré ver el alba<br>
Le hice honor a la J en mi nombre, y mis valore' me cubren la espalda<br>
<br>
Yo no soy rico ni me siento por salir del barrio<br>
Me siento bien, mis dos abuelas siguen respirando<br>
De niño, pensé que, a los dieciséis, iba a morirme<br>
Y, con dieciséis, creo que llego a los veinte millonario<br>
<br>
O por lo menos en paz, sabiendo por lo que pasé<br>
Ojalá pudiera mostrarle a mis ángeles lo que logré<br>
Por eso, un comentario no me afecta<br>
Mi vida está perfecta, pero<br>
<br>
Me pusieron de enemigo' a mis hermanos, cuando los que me robaron fueron ello'<br>
Pegué un tema top global y todavía no veo un peso<br>
Vi cómo lloró mamá, angustiada, por no haberse rescatado del puñal que me clavaron en mis ojo'<br>
Ahora, por San José me miran de reojo<br>
Porque lo logré antes de poder terminar el colegio<br>
Sin tomar ni doparme, pagar ni plagiar o plaguiar me hice grande, por eso<br>
<br>
Hoy me voy al sol, porque Dios me llamó desde el downtown<br>
Debo despertar, porque no se acalora mi alma<br>
Pero me salvé, en la neblina logré ver el alba<br>
Le hice honor a la J en mi nombre, y mis valores me cubren la espalda<br>
<br>
Hoy me voy al sol, porque Dios me llamó desde el downtown<br>
Debo despertar, porque no se acalora mi alma<br>
Pero me salvé, en la neblina logré ver el alba<br>
Le hice honor a la J en mi nombre, y mis valore' me cubren la espalda<br>
<br>
Hoy me voy al sol, porque Dios me llamó desde el downtown<br>
Debo despertar, porque no se acalora mi alma<br>
Pero me salvé, en la neblina logré ver el alba<br>
Le hice honor a la J en mi nombre, y los valore' me cubren la espalda");
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('21st century schizoid man','2023/10/9','3', "A-one, two, three, four<br>
Two, two, three<br>
Cat's foot, iron claw<br>
Neurosurgeons scream for more<br>
Paranoia's poison door<br>
21st century schizoid man<br>
Blood rack, barbed wire<br>
Politicians funeral pyre<br>
Innocents raped with napalm fire<br>
21st century schizoid man<br>
Death seed, blind man's greed<br>
Poets starving, children bleed<br>
Nothing he's got, he really needs<br>
21st century schizoid man");
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('THE COURT OF THE CRIMSON KING','2023/10/9','3', "… The rusted chains of prison moons<br>
Are shattered by the sun<br>
I walk a road horizons change<br>
The tournament's begun<br>
The purple piper plays his tune<br>
The choir softly sing<br>
Three lullabies in an ancient tongue<br>
For the court of the crimson king<br>
<br>
… The keeper of the city keys<br>
Puts shutters on the dreams<br>
I wait outside the pilgrim's door<br>
With insufficient schemes<br>
The black queen chants the funeral march<br>
The cracked brass bells will ring<br>
To summon back the fire witch<br>
To the court of the crimson king<br>
<br>
… The gardener plants an evergreen<br>
Whilst trampling on a flower<br>
I chase the wind of a prism ship<br>
To taste the sweet and sour<br>
The pattern juggler lifts his hand<br>
The orchestra begin<br>
As slowly turns the grinding wheel<br>
In the court of the crimson king<br>
<br>
… On soft grey mornings widows cry<br>
The wise men share a joke<br>
I run to grasp divining signs<br>
To satisfy the hoax<br>
The yellow jester does not play<br>
But gently pulls the strings<br>
And smiles as the puppets dance<br>
In the court of the crimson king");
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('epitaph','2023/10/9','3', "The wall on which the prophets wrote<br>
Is cracking at the seams<br>
Upon the instruments of death<br>
The sunlight brightly gleams<br>
<br>
When every man is torn apart<br>
With nightmares and with dreams<br>
Will no one lay the laurel wreath<br>
When silence drowns the screams<br>
<br>
Confusion will be my epitaph<br>
As I crawl a cracked and broken path<br>
If we make it, we can all sit back and laugh<br>
But I fear tomorrow I'll be crying<br>
Yes, I fear tomorrow I'll be crying<br>
Yes, I fear tomorrow I'll be crying<br>
<br>
Between the iron gates of fate<br>
The seeds of time were sown<br>
And watered by the deeds of those<br>
Who know and who are known<br>
<br>
Knowledge is a deadly friend<br>
If no one sets the rules<br>
The fate of all mankind, I see<br>
Is in the hands of fools<br>
<br>
The wall on which the prophets wrote<br>
Is cracking at the seams<br>
Upon the instruments of death<br>
The sunlight brightly gleams<br>
<br>
When every man is torn apart<br>
With nightmares and with dreams<br>
Will no one lay the laurel wreath<br>
When silence drowns the screams?<br>
<br>
Confusion will be my epitaph<br>
As I crawl a cracked and broken path<br>
If we make it, we can all sit back and laugh<br>
But I fear tomorrow I'll be crying<br>
Yes, I fear tomorrow I'll be crying<br>
Yes, I fear tomorrow I'll be crying<br>
<br>
Crying<br>
Crying<br>
<br>
Yes, I fear tomorrow I'll be crying<br>
Yes, I fear tomorrow I'll be crying<br>
Yes, I fear tomorrow I'll be crying<br>
Crying");
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('moonchild','2023/10/9','3');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('POWER','2023/10/9','3', "I'm living in that 21st century<br>
Doing something mean to it<br>
Do it better than anybody you ever seen do it<br>
Screams from the haters, got a nice ring to it<br>
I guess every superhero need his theme music<br>
<br>
No one man should have all that power<br>
The clock's ticking, I just count the hours<br>
Stop tripping, I'm tripping off the power<br>
(21st-century schizoid man)<br>
<br>
The system broken, and the school's closed, the prisons open<br>
We ain't got nothin' to lose, ma'fucka, we rollin'<br>
Huh? Ma'fucka, we rollin'<br>
With some light-skinned girls and some Kelly Rowlands<br>
In this white man's world, we the ones chosen<br>
So goodnight, cruel world, I'll see you in the mornin'<br>
Huh? I'll see you in the mornin'<br>
This is way too much, I need a moment<br>
<br>
No one man should have all that power<br>
The clock's ticking, I just count the hours<br>
Stop tripping, I'm tripping off the power<br>
'Til then, fuck that, the world's ours<br>
<br>
And they say, and they say<br>
And they say, and they say<br>
And they say, and they say<br>
(21st-century schizoid man)<br>
<br>
Fuck SNL and the whole cast<br>
Tell 'em Yeezy said they can kiss my whole ass<br>
More specifically, they can kiss my asshole<br>
I'm an asshole? You niggas got jokes<br>
You short-minded niggas thoughts is Napoleon<br>
My furs is Mongolian, my ice brought the goalies in<br>
Now I embody every characteristic of the egotistic<br>
He knows he so fuckin' gifted<br>
I just needed time alone, with my own thoughts<br>
Got treasures in my mind but couldn't open up my own vault<br>
My childlike creativity, purity and honesty<br>
Is honestly being crowded by these grown thoughts<br>
Reality is catching up with me<br>
Taking my inner child, I'm fighting for custody<br>
With these responsibilities that they entrusted me<br>
As I look down at my diamond encrusted piece<br>
<br>
Thinkin', no one man should have all that power<br>
The clock's ticking, I just count the hours<br>
Stop tripping, I'm tripping off the powder<br>
'Til then, fuck that, the world's ours<br>
<br>
And they say, and they say<br>
And they say, and they say<br>
And they say, and they say<br>
(21st-century schizoid man)<br>
<br>
Colin Powells, Austin Powers<br>
Lost in translation with a whole fuckin' nation<br>
They say I was the abomination of Obama's nation<br>
Well that's a pretty bad way to start the conversation<br>
At the end of the day, goddammit, I'm killin' this shit<br>
I know damn well y'all feeling this shit<br>
I don't need your pussy, bitch, I'm on my own dick<br>
I ain't gotta power trip, who you goin' home with?<br>
How 'Ye doing? I'm surviving<br>
I was drinking earlier, now I'm driving<br>
Where the bad bitches, huh? Where y'all hiding?<br>
I got the power make your life so exciting<br>
<br>
Now this will be a beautiful death<br>
I'm jumping out the window<br>
I'm letting everything go<br>
I'm letting everything go<br>
Mmm, now this will be a beautiful death<br>
I'm jumping out the window<br>
I'm letting everything go<br>
I'm letting everything go<br>
Now this will be a beautiful death<br>
Jumping out the window<br>
Letting everything go<br>
Letting everything go<br>
You got the power to let power go?<br>
(21st-century schizoid man)");
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('Jijiji','2023/10/9','2', "En este film velado en blanca noche<br>
El hijo tenaz de tu enemigo<br>
El muy verdugo cena distinguido<br>
Una noche de cristal que se hace añicos<br>
<br>
No lo soñé<br>
Se enderezó y brindó a tu suerte<br>
<br>
No lo soñé<br>
Y se ofreció mejor que nunca<br>
<br>
No mires, por favor<br>
Y no prendas la luz<br>
La imagen te desfiguró<br>
<br>
Este film da una imagen exquisita<br>
Esos chicos son como bombas pequeñitas<br>
El peor camino a la cueva del perico<br>
Para tipos que no duermen por la noche<br>
<br>
No lo soñé<br>
Ibas corriendo a la deriva<br>
<br>
No lo soñé<br>
Los ojos ciegos bien abiertos<br>
<br>
No mires, por favor<br>
Y no prendas la luz<br>
La imagen te desfiguró<br>
¡Uh!<br>
(solo de guitarra super epico)<br>
<br>
El montaje final es muy curioso<br>
Es en verdad realmente entretenido<br>
Vas en la oscura multitud, desprevenido<br>
Tiranizando a quienes te han querido<br>
<br>
No lo soñé<br>
Se enderezó y brindó a tu suerte<br>
<br>
No lo soñé<br>
Y se ofreció mejor que nunca<br>
<br>
No lo soñé<br>
Ibas corriendo a la deriva<br>
<br>
No lo soñé<br>
Los ojos ciegos bien abiertos<br>
<br>
No mires, por favor<br>
Y no prendas la luz<br>
La imagen te desfiguró<br>
<br>
¡Chernobil, Chernobil, Chernobil!<br>
<br>
¡Chernobil, es Chernobil!<br>
<br>
¡Chernobil!");
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('fuegos de oktubre','2023/10/9','2');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('noticias de ayer','2023/10/9','2');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('vamos los redo','2023/10/9','2', "vamos los redooooo <br>
 vamos los redooooo <br>
 vamos los redooooo <br>
 vamos los redooooo <br>
<br>
 vamos los redooooo <br> 
 vamos los redooooo <br> 
 vamos los redooooo <br>
 vamos los redooooo <br>
<br>
(solo de guitarra)");
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('Ruido de lluvia en el bosque','2023/10/9','4');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('Delicate steve','2023/10/9','5');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('scooby galletas','2023/10/9','5');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('outro','2023/10/9','5');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('THE END','2023/10/9','5', "Oh yeah, all right<br>
Are you going to be in my dreams<br>
Tonight?<br>
And in the end<br>
The love you take<br>
Is equal to the love you make");

COMMIT;

