-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 21, 2014 at 08:58 
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `praquerumo`
--

-- --------------------------------------------------------

--
-- Table structure for table `atividade`
--

CREATE TABLE IF NOT EXISTS `atividade` (
  `id_atividade` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_us` varchar(45) DEFAULT NULL,
  `descricao_us` text,
  `endereco` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cep` varchar(45) DEFAULT NULL,
  `id_fornecedor` int(11) NOT NULL,
  `data` datetime DEFAULT NULL,
  `participantes_minimo` int(11) DEFAULT NULL,
  `participantes_maximo` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL COMMENT 'Tipo da atvidade\\n\\n1: Atividade cotidiana ofertada com frequencia\\n2: Evento com data específica',
  `valor` float DEFAULT NULL,
  `destaque` tinyint(1) DEFAULT NULL,
  `id_cidade` int(11) NOT NULL,
  `thumbnail` varchar(45) DEFAULT NULL COMMENT 'Nome do arquivo referente ao thumbnail da atividade, esta imagem será exibida para representar a atividade.',
  `id_categoria` int(11) NOT NULL,
  `titulo_br` varchar(45) DEFAULT NULL,
  `titulo_es` varchar(45) DEFAULT NULL,
  `descricao_br` text,
  `descricao_es` text,
  PRIMARY KEY (`id_atividade`),
  KEY `fk_servico_fornecedor1_idx` (`id_fornecedor`),
  KEY `fk_atividade_cidade1_idx` (`id_cidade`),
  KEY `fk_atividade_categoria1_idx` (`id_categoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `atividade`
--

INSERT INTO `atividade` (`id_atividade`, `titulo_us`, `descricao_us`, `endereco`, `numero`, `bairro`, `cep`, `id_fornecedor`, `data`, `participantes_minimo`, `participantes_maximo`, `tipo`, `valor`, `destaque`, `id_cidade`, `thumbnail`, `id_categoria`, `titulo_br`, `titulo_es`, `descricao_br`, `descricao_es`) VALUES
(1, 'Skydiving', 'Parachuting, or skydiving, is the action sport of exiting an aircraft and returning to Earth with the aid of gravity, then slowing down during the last part of the descent by using a parachute (or other means - in 2012, British stuntman Gary Connery used a wing suit and a specially prepared box landing rig for this[1]). It may or may not involve a certain amount of free-fall, a time during which the parachute has not been deployed and the body gradually accelerates to terminal velocity', 'Rua A', '22', 'Centro', '5899403', 1, NULL, NULL, NULL, 1, 50, 1, 1, 'atividade_1_img_thumb.jpg', 1, 'Paraquedismo', 'Paracaidismo', 'Pára-quedismo ou pára-quedismo, é o esporte de sair de um avião e retornar à Terra com a ajuda da gravidade ação, então a abrandar durante a última parte da descida usando um pára-quedas (ou outros meios - em 2012, duble britanico Gary Connery usou um terno asa e uma plataforma de pouso caixa especialmente preparado para isso). Ele pode ou não envolver uma certa quantidade de queda livre, uma vez, durante o qual o pára-quedas não foi implantado e o corpo acelera progressivamente a velocidade terminal', 'Paracaidismo, o el paracaidismo, es el deporte de acción de salir de un avión y regresar a la Tierra con la ayuda de la gravedad, y luego reducir la velocidad durante la última parte de la bajada por el uso de un paracaídas (u otros medios - en 2012, especialista británico Gary Connery un traje de alas y una plataforma de aterrizaje caja especialmente preparada para este [1]). Puede o no puede implicar una cierta cantidad de caída libre, un tiempo durante el cual el paracaídas no se ha desplegado y el cuerpo acelera gradualmente a la velocidad terminal'),
(2, 'Stand Up Paddle', 'Stand up paddle surfing (SUP), stand up paddle boarding, or in the Hawaiian language Hoe he''e nalu, is sport originating in Hawaii, an offshoot of surfing, that enables surfers to paddle farther into the ocean than typically. A 2013 report called it the outdoor sporting activity with the most first-time participants of any in the United States that year.', 'Rua C', '22', 'Centro', '3939403', 1, NULL, 2, 100, 1, 100, 1, 1, 'atividade_2_img_thumb.jpg', 2, 'Stand Up Paddle', 'Stand Up Paddle', 'Stand up paddle surfing (SUP), stand up paddle boarding, ou na língua havaiana Hoe He''e Nalu, é um esporte originário do Havaí, um desdobramento do surf, que permite que os surfistas para remar mais para dentro do oceano do que normalmente. Um relatório de 2013 chamou-lhe a actividade desportiva ao ar livre com os participantes a maioria pela primeira vez de qualquer dos Estados Unidos naquele ano.', 'Stand up paddle surf (SUP), stand up paddle, o en el idioma hawaiano Hoe he''e Nalu, es deporte originario de Hawai, una rama de surf, que permite a los surfistas a remar más lejos en el océano que típicamente. Un informe de 2013 la llamó la actividad deportiva al aire libre con los participantes la mayoría por primera vez de cualquier de los Estados Unidos ese año.'),
(3, 'Mountain Bike', 'Mountain bikes are typically ridden on single track trails, fire roads, logging roads, and other unpaved environments. These types of terrain commonly include rocks, washouts, ruts, loose sand, loose gravel, roots, and steep grades (both inclines and declines)\n', 'Rua c', '22', 'Japiim', '2939203', 1, NULL, NULL, NULL, 1, 30, 1, 1, 'atividade_3_img_thumb.jpg', 3, 'Mountain Bike', 'Mountain Bike', 'As bicicletas de montanha são normalmente montado em trilhas individuais de pista, estradas, estradas de fogo madeireiras e outros ambientes não-pavimentadas. Estes tipos de terreno geralmente incluem rochas, desmoronamentos, sulcos, areia solta, cascalho solto, raízes e rampas íngremes (tanto inclinações e declínios)', 'Las bicicletas de montaña son generalmente montados en los senderos solo carril, caminos de fuego, caminos forestales y otros entornos sin pavimentar. Estos tipos de terreno comúnmente incluyen rocas, derrumbes, surcos, arena suelta, grava suelta, raíces y pendientes pronunciadas (tanto de subida y bajada)'),
(4, 'Bungee Jumping', 'Bungee jumping is an extreme sport practiced by many brave adventurers, consisting of jumping into the emptiness or waist to ankles tied to an elastic rope. Long ago, the sport was a kind of initiation test in which the boys of a village would have to pass before they can start to be called adults.\n', 'Rua B', '22', 'Centro', '839403', 1, NULL, NULL, NULL, 1, 120, 0, 1, 'atividade_4_img_thumb.jpg', 1, 'Bungee Jumping', 'Bungee Jumping', 'Bungee jumping é um desporto radical praticado por muitos aventureiros corajosos, que consiste em saltar para o vázio amarrado aos tornozelos ou cintura a uma corda elástica. Há muito tempo, este desporto era uma espécie de prova Iniciação pela qual os rapazes de uma aldeia teriam de passar para poderem começar a ser chamados de adultos.', 'Puenting é um desporto radical praticado porción muitos aventureiros corajosos, coinci Que saltar em para o Vazio amarrado aos tornozelos ou cintura una uma corda elástica. Há muito tempo, this desporto uma espécie era de prova Iniciação pela qual os Rapazes de uma aldeia teriam de passar párr poderem Começar un servicio chamados de Adultos.'),
(5, 'Adventure Park\n', 'Tree or tree climbing is an extreme sport that is mounted at the crossing between platforms high in the trees, overcoming different obstacles like ladders, suspension bridges, ziplines and other activities that can be created. \n', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 220, 0, 1, 'atividade_5_img_thumb.jpg', 2, 'Arvorismo', 'Escalada', '"Arborismo ou arvorismo é um esporte radical que consiste na travessia entre plataformas montadas no alto das árvores, ultrapassando diferentes tipos de obstáculos como escadas, pontes suspensas, tirolesas e outras atividades que podem ser criadas.\nA atividade é muito utilizada no turismo de aventura, para lazer e recreação, e para estudos de fauna e flora das camadas mais altas da floresta."', 'El árbol o árbol de escalada es un deporte extremo que se monta en el cruce entre las plataformas elevadas en los árboles, superando diferentes obstáculos como escaleras, puentes colgantes, tirolinas y otras actividades que se pueden crear. '),
(6, 'Rafting', '\nThe rafting is the practice of descent rapids team using inflatable rafts and safety equipment. Before you begin any commercial rafting descent, a driver passes the activity to all participants detailed instruction of conduct regarding safety. These instructions are remembered by other drivers during strategic moments of the descent, and compliance is critical for the safety of all', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 40, 0, 1, 'atividade_6_img_thumb.jpg', 3, 'Rafting', 'Rafting', 'O rafting é a prática de descida em corredeiras em equipe utilizando botes infláveis e equipamentos de segurança. Antes de se começar qualquer descida de rafting comercial, um condutor da atividade passa a todos os participantes detalhadas instruções de conduta relativas à segurança. Estas instruções são lembradas pelos demais condutores durante momentos estratégicos da descida, e seu cumprimento é fundamental para a segurança de todos', '\nEl rafting es la práctica de descenso rápidos del equipo utilizando balsas inflables y equipo de seguridad. Antes de comenzar cualquiera de descenso de rafting comercial, un conductor pasa a la actividad a todos los participantes de instrucciones detallado de conducta en materia de seguridad. Estas instrucciones son recordados por otros conductores en los momentos estratégicos de la bajada, y el cumplimiento es fundamental para la seguridad de todos'),
(7, 'Boia Cross', 'The tubing is held seated on the float and the oars are your own hands and arms. At Hotel Park Farm of Dreams, the tubing is held in Rio Cachoeirinha with a total of 1,300 meters long. In the quieter passages, you can enjoy the beautiful scenery around the river, with a beautiful fauna and flora.', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 140, 0, 1, 'atividade_7_img_thumb.jpg', 1, 'Boia Cross', 'Boia Cross', 'O bóia-cross é realizado sentado sobre a bóia e o os remos são suas próprias mãos e braços. No Hotel Fazenda Parque dos Sonhos, o bóia-cross é realizado no Rio Cachoeirinha com um total de 1.300 metros de percurso. Nos trechos mais tranqüilos, é possível apreciar as belas paisagens ao redor do rio, com uma fauna e flora belíssima.', 'El tubo se mantiene sentado en la carroza y los remos son sus propias manos y los brazos. En el Hotel Park Farm de los Sueños, el tubo se celebró en Río Cachoeirinha con un total de 1.300 metros de largo. En los pasajes más tranquilos, se puede disfrutar del hermoso paisaje alrededor del río, con una hermosa fauna y flora.'),
(8, 'Camping', 'O campismo é o lazer para quem procura contato direto com a natureza em todas as suas variações e é uma excelente opção para turismo e apoio a prática de esportes e eventos esportivos.', 'Rua B', '22', 'Centro', '2938293', 2, '2014-03-14 09:31:22', 10, 50, 2, 120, 0, 1, 'atividade_8_img_thumb.jpg', 2, 'Camping', 'Camping', 'O campismo é o lazer para quem procura contato direto com a natureza em todas as suas variações e é uma excelente opção para turismo e apoio a prática de esportes e eventos esportivos.', 'El camping es el ocio para aquellos que buscan el contacto directo con la naturaleza en todas sus variantes y es una excelente opción para el turismo y el apoyo a los deportes y eventos deportivos.'),
(9, 'Cavernismo', 'Cavernismo is a show of a work of art made ??by nature.', 'Rua C.', '22', 'Centro', '93829394', 1, NULL, 1, 100, 1, 80, 0, 1, 'atividade_9_img_thumb.jpg', 1, 'Cavernismo', 'Cavernismo', 'Cavernismo é um show de uma obra de arte feito pela natureza.', 'Cavernismo es una muestra de una obra de arte hecha por la naturaleza.');

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cod_cor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nome`, `cod_cor`) VALUES
(1, 'Água', '#446976'),
(2, 'Terra', '#7A2927'),
(3, 'Ar', '#54762F');

-- --------------------------------------------------------

--
-- Table structure for table `cidade`
--

CREATE TABLE IF NOT EXISTS `cidade` (
  `id_cidade` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `id_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_cidade`),
  KEY `fk_cidade_estado1_idx` (`id_estado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cidade`
--

INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES
(1, 'Manaus', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contato_email`
--

CREATE TABLE IF NOT EXISTS `contato_email` (
  `id_contato_email` int(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `id_fornecedor` int(11) NOT NULL,
  PRIMARY KEY (`id_contato_email`),
  KEY `fk_contato_email_fornecedor1_idx` (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contato_telefone`
--

CREATE TABLE IF NOT EXISTS `contato_telefone` (
  `id_contato_telefone` int(11) NOT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `id_fornecedor` int(11) NOT NULL,
  PRIMARY KEY (`id_contato_telefone`),
  KEY `fk_contato_telefone_fornecedor1_idx` (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `sigla` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `estado`
--

INSERT INTO `estado` (`id_estado`, `nome`, `sigla`) VALUES
(1, 'Amazonas', 'AM');

-- --------------------------------------------------------

--
-- Table structure for table `fornecedor`
--

CREATE TABLE IF NOT EXISTS `fornecedor` (
  `id_fornecedor` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `tipo` int(11) NOT NULL COMMENT 'Tipo do fornecedor\\n1: Guia\\n2: Empresa',
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  PRIMARY KEY (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fornecedor`
--

INSERT INTO `fornecedor` (`id_fornecedor`, `nome`, `tipo`, `login`, `senha`) VALUES
(1, 'SUP Ltda', 1, 'sup', '123'),
(2, 'SUP Ltda', 1, 'sup', '123');

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

CREATE TABLE IF NOT EXISTS `foto` (
  `id_foto` int(11) NOT NULL AUTO_INCREMENT,
  `arquivo` varchar(45) NOT NULL,
  `id_atividade` int(11) NOT NULL,
  `destaque` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_foto`),
  KEY `fk_foto_servico_idx` (`id_atividade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `foto`
--

INSERT INTO `foto` (`id_foto`, `arquivo`, `id_atividade`, `destaque`) VALUES
(1, 'atividade_1_img_1.jpg', 1, 1),
(2, 'atividade_2_img_1.jpg', 2, 1),
(3, 'atividade_3_img_1.jpg', 3, 1),
(4, 'atividade_4_img_1.jpg', 4, NULL),
(5, 'atividade_5_img_1.jpg', 5, NULL),
(6, 'atividade_6_img_1.jpg', 6, NULL),
(7, 'atividade_7_img_1.jpg', 7, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE IF NOT EXISTS `leads` (
  `id` double NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=72 ;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `email`) VALUES
(27, 'aceleradora@fabriq.com.br'),
(26, 'rbbernardino@gmail.com'),
(6, 'goettezinho@gmail.com'),
(25, 'thulioqueiroz@gmail.com'),
(24, 's.f.bruno@gmail.com'),
(9, 'orangemarques@gmail.com'),
(10, 'rafaelsiza@gmail.com'),
(23, 'neyandrade2005@gmail.com'),
(71, 'nivaldo.viana@gmail.com'),
(70, 'ewerton.larry.ferreira@gmail.com'),
(29, 'fredson.encarnacao@gmail.com'),
(35, 'daniel.tadeu@gmail.com'),
(36, 'imanaus@outlook.com'),
(68, 'andbrain@gmail.com'),
(42, 'fabiano.box@gmail.com'),
(43, 'pgquintao@gmail.com'),
(45, 'cabralff@gmail.com'),
(47, 'paulo@futura.ws'),
(48, 'rhedson@gmail.com'),
(49, 'fabiolabess@gmail.com'),
(50, 'amaury.cavalcante@hotmail.com'),
(65, 'taynara.tcb@gmail.com'),
(52, 'the00ball@gmail.com'),
(53, 'ant.aluado@gmail.com'),
(54, 'eulergms@yahoo.com.br'),
(55, 'james_junior@uol.com.br'),
(56, 'cehasli@yahoo.com.br'),
(57, 'hermantony@hotmail.com'),
(58, 'fernandadecastro2013@gmail.com'),
(59, 'claraffer@gmail.com'),
(60, 'felipe.p.barcellos@gmail.com'),
(69, 'awdrenfontao@live.com');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `atividade`
--
ALTER TABLE `atividade`
  ADD CONSTRAINT `fk_atividade_categoria1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_atividade_cidade1` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id_cidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servico_fornecedor1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `fk_cidade_estado1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `contato_email`
--
ALTER TABLE `contato_email`
  ADD CONSTRAINT `fk_contato_email_fornecedor1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `contato_telefone`
--
ALTER TABLE `contato_telefone`
  ADD CONSTRAINT `fk_contato_telefone_fornecedor1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `fk_foto_servico` FOREIGN KEY (`id_atividade`) REFERENCES `atividade` (`id_atividade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
