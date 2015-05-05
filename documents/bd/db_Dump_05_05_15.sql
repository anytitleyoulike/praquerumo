-- phpMyAdmin SQL Dump
-- version 3.3.10.4
-- http://www.phpmyadmin.net
--
-- Host: mysql.praquerumo.com.br
-- Generation Time: May 05, 2015 at 08:02 AM
-- Server version: 5.1.56
-- PHP Version: 5.4.37

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `praquerumo`
--

-- --------------------------------------------------------

--
-- Table structure for table `acompanhamentos`
--

CREATE TABLE IF NOT EXISTS `acompanhamentos` (
  `itens_id` int(11) NOT NULL,
  `atividade_codigo` int(11) NOT NULL,
  PRIMARY KEY (`itens_id`,`atividade_codigo`),
  KEY `fk_itens_has_atividade_atividade1_idx` (`atividade_codigo`),
  KEY `fk_itens_has_atividade_itens1_idx` (`itens_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acompanhamentos`
--

INSERT INTO `acompanhamentos` (`itens_id`, `atividade_codigo`) VALUES
(2, 1),
(3, 1),
(5, 1),
(11, 1),
(1, 2),
(2, 2),
(3, 2),
(1, 3),
(2, 3),
(2, 4),
(1, 5),
(3, 5),
(4, 5),
(5, 5),
(2, 6),
(3, 6),
(23, 6),
(24, 6),
(9, 7),
(10, 7),
(11, 7),
(12, 7),
(2, 8),
(13, 8),
(14, 8),
(15, 8),
(16, 8),
(1, 10),
(2, 10),
(3, 10),
(4, 10),
(5, 11),
(1, 12),
(2, 12),
(3, 12),
(1, 13),
(2, 13),
(5, 14),
(6, 14),
(7, 14),
(8, 14),
(18, 14),
(19, 14),
(20, 15),
(21, 15),
(22, 15),
(2, 17),
(5, 17),
(6, 17),
(7, 17),
(8, 17),
(18, 17),
(19, 17),
(23, 17),
(25, 17),
(1, 18),
(2, 18),
(5, 18),
(1, 19),
(2, 19),
(17, 19),
(1, 20),
(2, 20),
(17, 20),
(2, 22),
(7, 22),
(8, 22),
(26, 22),
(2, 23),
(3, 23),
(8, 23),
(11, 23),
(11, 24),
(27, 24),
(2, 25),
(9, 25),
(14, 25),
(2, 26),
(28, 26),
(30, 26),
(31, 26),
(2, 27),
(7, 27),
(12, 27);

-- --------------------------------------------------------

--
-- Table structure for table `atividade`
--

CREATE TABLE IF NOT EXISTS `atividade` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `vendivel` tinyint(1) NOT NULL,
  `disponivel` tinyint(1) NOT NULL,
  `destaque` tinyint(1) NOT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `comissao` float NOT NULL,
  `dt_criacao` datetime DEFAULT NULL,
  `dt_atualizacao` datetime DEFAULT NULL,
  `fig_01` varchar(64) NOT NULL,
  `fig_02` varchar(64) NOT NULL,
  `fig_03` varchar(64) NOT NULL,
  `fig_04` varchar(64) NOT NULL,
  `fig_destaque` varchar(64) NOT NULL,
  `fig_thumbnail` varchar(64) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `elemento_id` int(11) NOT NULL,
  `modalidade_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`codigo`,`categoria_id`,`elemento_id`,`modalidade_id`,`usuario_id`),
  UNIQUE KEY `slug_UNIQUE` (`slug`),
  KEY `fk_atividade_categoria1_idx` (`categoria_id`),
  KEY `fk_atividade_elemento1_idx` (`elemento_id`),
  KEY `fk_atividade_modalidade1_idx` (`modalidade_id`),
  KEY `fk_atividade_usuario1_idx` (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Atividade que será anunciada' AUTO_INCREMENT=28 ;

--
-- Dumping data for table `atividade`
--

INSERT INTO `atividade` (`codigo`, `slug`, `vendivel`, `disponivel`, `destaque`, `latitude`, `longitude`, `comissao`, `dt_criacao`, `dt_atualizacao`, `fig_01`, `fig_02`, `fig_03`, `fig_04`, `fig_destaque`, `fig_thumbnail`, `categoria_id`, `elemento_id`, `modalidade_id`, `usuario_id`) VALUES
(1, 'sup-no-rio-taruma', 1, 1, 0, '-3.0272028', '-60.10192222222222', 20, '2014-10-09 21:22:45', '2014-11-19 13:09:55', '594e1-imagem-1.png', 'b51a1-imagem-3.png', '12fdc-imagem-2.png', 'e95f1-imagem-4.png', 'd2ee0-destaque.jpg', '75448-imagem-3.png', 1, 1, 1, 2),
(2, 'dia-de-aventura', 1, 1, 0, '-3.0686111', '-60.02472222222222', 20, '2014-10-09 21:24:18', '2015-05-04 14:03:40', '61638-imagem-2.png', '336f8-imagem-3.png', '2f07c-imagem-1---copia.png', '39ef5-2.jpg', '3e90e-destaque.jpg', 'bb3d6-imagem-1.png', 1, 2, 5, 5),
(3, 'adptacao-na-selva', 0, 0, 0, NULL, NULL, 20, '2014-10-11 08:28:12', '2015-02-11 07:05:39', '75f8e-imagem-1.png', '1980f-imagem-2.png', '0cd8e-imagem-3.png', 'b3404-imagem-4.png', 'd9a8d-185117297-2.jpg', '5522a-imagem-2.png', 1, 2, 6, 16),
(4, 'parque-ecoforest', 0, 0, 0, NULL, NULL, 20, '2014-10-11 11:01:53', '2015-02-11 07:05:50', 'cdd44-imagem-1.jpg', 'cc992-imagem-2.jpg', '885a2-imagem-3.jpg', 'e5d66-imagem-4.jpg', '7bcf0-imagem-2---copia.jpg', '7246a-imagem-1.jpg', 1, 2, 5, 5),
(5, 'kayak-no-janauari', 0, 0, 0, NULL, NULL, 20, '2014-10-11 11:09:31', '2014-12-27 05:13:21', '60834-imagem-3.png', '09149-imagem-1.png', '2568d-imagem-4.png', '93bed-imagem-2.png', '59540-imagem-1.png', '3ef6b-imagem-3.png', 1, 1, 2, 15),
(6, 'escalada-no-taruma', 1, 1, 0, '-3.0172222', '-60.06666666666667', 20, '2014-10-27 09:41:41', '2015-01-21 08:25:32', 'ee371-imagem-1.png', '1b889-imagem-2.png', '9f576-imagem-3.png', '8b8f4-imagem-4.png', '79394-imagem-1.png', 'af1a2-imagem-1.png', 1, 2, 5, 35),
(7, 'canoagem-para-o-rio-branco', 1, 1, 0, '0', '0', 20, '2014-10-29 17:25:02', '2014-10-29 17:43:44', '890cb-canoagem.jpg', '3c7a0-canoagem.jpg', 'b05f9-canoagem.jpg', '4ed66-canoagem.jpg', '', 'c4043-canoagem-thumb.jpg', 1, 1, 2, 13),
(8, 'monte-roraima', 1, 0, 0, NULL, NULL, 12, '2014-11-01 12:26:10', '2014-11-09 14:52:52', '711fc-monte_roraima_expeditie_img2.jpg', '50861-monte-roraima.jpg', '64a44-monte-roraima-cume.jpg', 'f1434-monte-roraima-lendas-e-aventura_04.jpg', '4da1d-monte-roraima1.jpg', '1b3ba-thumbnail.jpg', 1, 2, 4, 13),
(9, 'salto-angel', 1, 0, 0, NULL, NULL, 12, '2014-11-01 12:50:57', '2014-11-09 14:53:16', 'd7588-images.jpg', '39ee7-salto-do-anjo-venezuela-5.jpg', '97adb-af.jpg', '7ef5a-salto-angel.jpg', 'c9274-salto-do-anjo-venezuela-5.jpg', 'b51a2-thumb.jpg', 1, 2, 4, 13),
(10, 'caiaque-rio-preto-da-eva', 1, 1, 0, '-2.7001778', '-59.704727777777784', 20, '2014-11-08 13:28:32', '2014-12-08 10:23:35', 'dbfc9-imagem-2.png', '12666-imagem-3.png', '9e146-imagen-1.png', '96297-imagen-4.png', '8a238-destaque.png', 'a7838-imagen-4.png', 1, 1, 2, 1),
(11, 'yoga-natureza', 1, 0, 0, NULL, NULL, 20, '2014-11-09 15:15:24', '2014-11-09 19:07:44', 'ce6d3-4.jpg', 'ee445-3.jpg', 'ae9be-2.jpg', '8320c-1.jpg', '5289e-3.jpg', 'b3f32-thumbnail.jpg', 1, 2, 3, 4),
(12, 'taruma-acu-explorer', 1, 1, 0, NULL, NULL, 20, '2014-11-23 09:42:23', '2015-02-16 12:02:39', '8b1c0-imagem-3.png', '4ea1c-imagem-1.png', '8046c-imagem-2.png', '0b793-imagem-4.png', 'c8f87-imagem-1.png', '1a7d5-tumbnail.png', 1, 1, 2, 1),
(13, 'trekking-camping-rapel', 1, 1, 0, NULL, NULL, 20, '2014-11-27 21:06:43', '2015-03-16 14:27:12', '87d19-imagem-2.png', '1526d-imagem-1.png', '2efa9-imagem-4.png', '523dd-imagem-3.png', 'a3cac-destaque.png', 'd459e-destaque.png', 1, 2, 5, 5),
(14, 'kayak-adventure-rio-preto-da-eva', 1, 1, 0, '-2.6995722', '-59.706136111111114', 20, '2014-12-03 11:18:43', '2014-12-03 11:33:03', '1ab9e-imagem-1.png', '9af84-imagem-2.png', '95e7c-imagem-3.png', 'd399f-imagem-4.png', 'c4bba-tunbnail.png', '83821-imagem-1.png', 1, 1, 2, 15),
(15, 'um-dia-com-os-botos-vermelhos', 0, 0, 0, NULL, NULL, 20, '2014-12-03 12:25:10', '2015-04-07 16:39:31', '64a29-imagem-2.png', '5246b-imagem-3.png', 'a0fd6-imagem-4.png', '1deed-imagem-1.png', '073a3-imagem-1.png', 'b40dc-imagem-1.png', 2, 2, 5, 34),
(16, 'teste', 1, 0, 0, '0', '0', 20, '2014-12-10 16:48:49', '2014-12-10 16:48:49', 'c6de3-image003.png', 'ad75a-image001.png', '8278c-image003.png', 'e4839-image001.png', '51511-image003.png', '1170b-image003.png', 1, 1, 6, 11),
(17, 'a-grande-arvore', 1, 1, 0, NULL, NULL, 20, '2014-12-23 14:39:46', '2015-03-16 14:23:00', '5206b-imagem-2.png', '67f2f-imagem-3.png', '0f2db-imagem-5.png', 'a26ea-imagem-6.png', '30590-imagem-1.png', 'ec6b6-imagem-1.png', 1, 1, 5, 54),
(18, 'rapel-cachoeira-da-neblina', 1, 1, 0, NULL, NULL, 20, '2015-02-11 06:24:22', '2015-02-11 06:56:42', '3301c-destaque1.jpg', '925a6-destaque2.jpg', '916cf-destaque3.jpg', '92c7b-destaque4.jpg', '4387d-principal_home.jpg', 'bbefd-principal_home.jpg', 1, 2, 5, 5),
(19, 'rapel-salto-do-ipy', 1, 1, 0, NULL, NULL, 20, '2015-02-11 06:32:47', '2015-02-11 06:56:52', 'dee1b-destaque1.jpeg', '2491c-destaque2.jpg', 'eeb82-destaque3.jpg', 'b3db4-destaque4.jpeg', '19ef2-principal_home.jpg', '1fafa-principal_home.jpg', 1, 2, 5, 5),
(20, 'rapel-cachoeira-do-santuario', 1, 1, 0, NULL, NULL, 20, '2015-02-11 06:39:40', '2015-02-11 06:57:02', '2e290-destaque1.jpg', '42d79-destaque2.jpg', 'da35f-destaque3.jpg', '657c7-destaque4.jpg', '36034-principal_home.jpg', '5037b-principal_home.jpg', 1, 2, 5, 5),
(21, 'circuito-la-ventana', 1, 1, 1, NULL, NULL, 20, '2015-03-09 15:20:36', '2015-03-09 16:29:17', '7e194-imagem-1.png', 'a36b5-imagem-2.png', '23a6f-imagem-3.png', '0335e-imagem-4.png', '70744-destaque-1---copia.png', '7ca7a-tumbnail.png', 1, 2, 8, 78),
(22, 'rafting-presidente-figueiredo', 1, 1, 0, NULL, NULL, 20, '2015-03-16 13:45:30', '2015-03-16 15:00:22', '5348c-imagem-descricao1.png', '0cb76-imagem-descricao2.png', '8c479-imagem-descricao3.png', '392b5-imagem-descricao4.png', 'cd486-banner-destaque.png', '99cd5-imagem_home_atividade.png', 1, 1, 5, 3),
(23, 'rafting-figueiredo', 1, 1, 0, NULL, NULL, 20, '2015-03-16 13:52:44', '2015-03-16 13:56:58', 'f0a00-dsc03622.jpg', 'a0c32-dsc03622.jpg', 'a28c0-dsc03622.jpg', '106e9-dsc03622.jpg', '5014d-dsc03622.jpg', '44904-dsc03622.jpg', 1, 1, 5, 3),
(24, 'barco-hacker', 1, 1, 0, '-3.0633972', '-60.10915', 10, '2015-03-17 05:24:38', '2015-03-17 06:36:19', '6af32-imagem-descricaobh.png', 'e2056-imagem-descricaobh2.png', '316d0-imagem-descricaobh3.png', 'e3b31-imagem-descricaobh4.png', 'b0fcc-imagem_home_atividade_barcohacker.png', '05900-imagem_home_atividade_barcohacker.png', 2, 1, 5, 83),
(25, 'turismo-rural-pedagogico', 1, 1, 0, NULL, NULL, 20, '2015-04-01 14:02:41', '2015-04-01 14:02:41', '95d96-imagem-descricao-biotur.png', 'ed0aa-imagem-descricao-2biotur.png', '295f7-imagem-descricao3.png', '190fc-imagem-descricao4.png', '6dd16-banner-destaque-biotur.png', 'ab221-imagem_home_atividade_biotur.png', 2, 2, 4, 103),
(26, 'expedicao-jau', 1, 1, 0, NULL, NULL, 20, '2015-04-10 10:59:51', '2015-04-10 11:19:03', '9ba85-imagem-1.png', 'b0fc6-imagem-2.png', '61e4e-imagem-3.png', '20aad-imagem-4.png', 'b2e5b-destaque.png', '0e1d6-destaque.png', 1, 2, 5, 110),
(27, 'caiaque-no-lago-do-puraquequara', 1, 1, 0, NULL, NULL, 20, '2015-04-28 15:31:47', '2015-04-28 15:31:47', 'bdea4-imagem-1.png', '755dc-imagem-2.png', '3c07e-imagem-3.png', 'a968c-imagem-4.png', 'a4774-destaque.png', '351b4-destaque.png', 2, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `avaliacao_atividade`
--

CREATE TABLE IF NOT EXISTS `avaliacao_atividade` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `atividade_codigo` int(11) NOT NULL,
  `nota` tinyint(4) NOT NULL,
  `recomenda` tinyint(1) NOT NULL,
  PRIMARY KEY (`codigo`,`usuario_id`,`atividade_codigo`),
  KEY `fk_usuario_has_evento_usuario1_idx` (`usuario_id`),
  KEY `fk_avaliacao_atividade_atividade1_idx` (`atividade_codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `avaliacao_atividade`
--

INSERT INTO `avaliacao_atividade` (`codigo`, `usuario_id`, `atividade_codigo`, `nota`, `recomenda`) VALUES
(1, 6, 2, 5, 1),
(2, 6, 3, 5, 1),
(3, 6, 4, 5, 1),
(4, 6, 1, 5, 1),
(5, 6, 12, 5, 1),
(6, 6, 10, 5, 1),
(7, 6, 13, 5, 1),
(8, 6, 14, 5, 1),
(9, 6, 15, 5, 1),
(10, 6, 6, 5, 1),
(11, 6, 17, 5, 1),
(12, 6, 22, 5, 1),
(13, 6, 19, 5, 1),
(14, 6, 20, 4, 1),
(15, 6, 18, 5, 1),
(16, 6, 24, 5, 1),
(17, 6, 14, 5, 1),
(18, 6, 27, 5, 1),
(19, 6, 13, 5, 1),
(20, 6, 26, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `avaliacao_usuario`
--

CREATE TABLE IF NOT EXISTS `avaliacao_usuario` (
  `usuario_id` int(11) NOT NULL,
  `usuario_destino` int(11) NOT NULL,
  `nota` tinyint(4) NOT NULL,
  PRIMARY KEY (`usuario_id`,`usuario_destino`),
  KEY `fk_usuario_has_usuario_usuario4_idx` (`usuario_destino`),
  KEY `fk_usuario_has_usuario_usuario3_idx` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `avaliacao_usuario`
--


-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pt` varchar(9) NOT NULL,
  `nome_en` varchar(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Categorias da atividade = { aventura, turismo }' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`id`, `nome_pt`, `nome_en`) VALUES
(1, 'Aventura', 'Adventure'),
(2, 'Turismo', 'Tourism');

-- --------------------------------------------------------

--
-- Table structure for table `comentario_atividade`
--

CREATE TABLE IF NOT EXISTS `comentario_atividade` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `atividade_codigo` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`codigo`,`atividade_codigo`,`usuario_id`),
  KEY `fk_usuario_has_evento_usuario2_idx` (`usuario_id`),
  KEY `fk_comentario_evento_atividade1_idx` (`atividade_codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `comentario_atividade`
--

INSERT INTO `comentario_atividade` (`codigo`, `atividade_codigo`, `usuario_id`, `comentario`, `data`) VALUES
(1, 4, 4, '<p>\n	Muito bom!!</p>\n<p>\n	&nbsp;</p>\n', '2014-10-24 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `comentario_usuario`
--

CREATE TABLE IF NOT EXISTS `comentario_usuario` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `usuario_destino` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`codigo`,`usuario_id`,`usuario_destino`),
  KEY `fk_usuario_has_usuario_usuario2_idx` (`usuario_destino`),
  KEY `fk_usuario_has_usuario_usuario1_idx` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `comentario_usuario`
--


-- --------------------------------------------------------

--
-- Table structure for table `cuidados`
--

CREATE TABLE IF NOT EXISTS `cuidados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pt` varchar(255) NOT NULL,
  `nome_en` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Exceções = { Acima de 10 anos e etc...}' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `cuidados`
--

INSERT INTO `cuidados` (`id`, `nome_pt`, `nome_en`) VALUES
(1, 'Restrição para menores de 16 anos sem acompanhamento dos pais', 'Restrição para menores de 16 anos sem acompanhamento dos pais'),
(2, 'Cédula de Identidade (RG) ou passaporte, e Cartão Internacional de Vacina contra Febre Amarela em dia são necessários.', 'blabla'),
(3, 'Não inclui traslado', 'Não inclui traslado'),
(4, 'Não inclui alimentação', 'Não inclui alimentação'),
(5, 'Não inclui equipamento para camping', 'Não inclui equipamento para camping'),
(6, 'Esses itens são de responsabilidade de cada participante.', 'Esses itens são de responsabilidade de cada participante.'),
(7, 'Esses itens são de responsabilidade de cada participante.', 'Esses itens são de responsabilidade de cada participante.'),
(8, 'As atividades são contraindicadas para gestantes', 'As atividades são contraindicadas para gestantes'),
(9, 'Essa atividade é contraindicadas para crianças de colo', 'Essa atividade é contraindicadas para crianças de colo'),
(10, 'Contraindicada para adultos e/ou idosos com limitações que dependem de autorização médica', 'Contraindicada para adultos e/ou idosos com limitações que dependem de autorização médica'),
(11, 'As atividades são contraindicadas para gestantes, crianças de colo, adultos e/ou idosos com limitações que dependem de autorização médica.  ', 'As atividades são contraindicadas para gestantes, crianças de colo, adultos e/ou idosos com limitações que dependem de autorização médica.  '),
(12, 'Escute atentamente as instruções e recomendações do condutor', 'Escute atentamente as instruções e recomendações do condutor'),
(13, 'Faça o alongamento antes da remada ( braços e lombar e trapézio )', 'Faça o alongamento antes da remada ( braços e lombar e trapézio )'),
(14, 'Reme no seu ritmo e não faça mais do que pode', 'Reme no seu ritmo e não faça mais do que pode'),
(15, 'Traga todo o lixo que produzir, não jogue lixo no rio', 'Traga todo o lixo que produzir, não jogue lixo no rio'),
(16, 'Não mate nada além do tempo, Não leve nada além de lembrança, Não deixe nada além de boas impressões!', 'Não mate nada além do tempo, Não leve nada além de lembrança, Não deixe nada além de boas impressões!');

-- --------------------------------------------------------

--
-- Table structure for table `descricao_atividade`
--

CREATE TABLE IF NOT EXISTS `descricao_atividade` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `lingua_id` int(11) NOT NULL,
  `atividade_codigo` int(11) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `apresentacao` text NOT NULL,
  `esforco_fisico` tinyint(4) NOT NULL,
  `conforto` tinyint(4) NOT NULL,
  `dificuldade_tecnica` tinyint(4) NOT NULL,
  `descricao` text NOT NULL,
  `cidade` varchar(80) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `ponto_encontro` varchar(255) NOT NULL,
  `duracao` varchar(10) NOT NULL,
  `roteiro` text,
  `termo_consentimento` text,
  PRIMARY KEY (`codigo`,`lingua_id`,`atividade_codigo`),
  KEY `fk_lingua_has_atividade_atividade1_idx` (`atividade_codigo`),
  KEY `fk_lingua_has_atividade_lingua1_idx` (`lingua_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `descricao_atividade`
--

INSERT INTO `descricao_atividade` (`codigo`, `lingua_id`, `atividade_codigo`, `titulo`, `apresentacao`, `esforco_fisico`, `conforto`, `dificuldade_tecnica`, `descricao`, `cidade`, `estado`, `ponto_encontro`, `duracao`, `roteiro`, `termo_consentimento`) VALUES
(11, 1, 1, 'SUP no rio Tarumã', '<p>\n	Um passeio de stand up paddle sobre os rios da Amaz&ocirc;nia, em uma experi&ecirc;ncia de tirar o f&ocirc;lego...</p>\n', 3, 3, 3, '<p>\n	A floresta amaz&ocirc;nica sempre foi muito conhecida pela diversidade de suas esp&eacute;cies animais e vegetais. E nada mais extraordin&aacute;rio que conhecer os rios que alimentam a vida dessa imensa selva.</p>\n<p>\n	&nbsp;</p>\n<p>\n	A AMAZONSUP convida voc&ecirc; a conhecer atrav&eacute;s do Stand Up Paddle um dos principais rios que banham a cidade.</p>\n<p>\n	&nbsp;</p>\n<p>\n	O Stand Up Paddle pode ser praticado por mulheres, homens e crian&ccedil;as com faixa et&aacute;ria de 4 a 64 anos, e com pouco condicionamento f&iacute;sico. A nossa inten&ccedil;&atilde;o &eacute; disponibilizar para pessoas n&atilde;o esportistas, a inicia&ccedil;&atilde;o em uma modalidade simplesmente fascinante.</p>\n<p>\n	Este passeio &eacute; uma oportunidade de ter contato direto com a natureza e de praticar um esporte que contempla essa imensid&atilde;o Amaz&ocirc;nica</p>\n', 'Manaus', 'Amazonas', 'Avenida Litorânea, s/ número, Marina Rio Negro – Tarumã.', '2hs', '<p>\n	O local de encontro &eacute; na Marina do Rio Negro, dentro da cidade de Manaus, onde iniciaremos nossa atividade. Depois de um alongamento e algumas instru&ccedil;&otilde;es, atravessaremos o rio Tarum&atilde; em dire&ccedil;&atilde;o a um igap&oacute;.</p>\n<p>\n	&nbsp;</p>\n<p>\n	Ao chegar a esse pequeno rio, poderemos contemplar a beleza e soberania da natureza amaz&ocirc;nica, interagir com a floresta e experimentar uma sensa&ccedil;&atilde;o maravilhosa de liberdade e respeito a biodiversidade da regi&atilde;o</p>\n', NULL),
(12, 1, 10, 'Caiaque Rio Preto da Eva', '<p>\n	A beleza e a tranquilidade dos rios da Amaz&ocirc;nia j&aacute; est&atilde;o &agrave; sua espera.</p>\n', 3, 3, 3, '<p>\n	A Floresta Amaz&ocirc;nica &eacute; imponente a qualquer aventureiro. Seu tamanho, sua biodiversidade, seus mist&eacute;rios e suas hist&oacute;rias merecem muito respeito. Mas poucos conhecem o seu encantamento, sua harmonia e tranquilidade. Para mostrar esse lado pouco explorado a WR Loca&ccedil;&otilde;es convida voc&ecirc; a navegar pelas calmas &aacute;guas do Rio Preto da Eva em uma maravilhosa expedi&ccedil;&atilde;o de caiaque.</p>\n<p>\n	&nbsp;</p>\n<p>\n	Venha sentir as positivas vibra&ccedil;&otilde;es da floresta e seus diversos aromas em um completo passeio pelos seus rios.</p>\n', 'Rio Preto da Eva', 'Amazonas', 'Centro de Atendimento ao Turista (CAT) de Rio Preto da Eva - AM', '4,5hs', '<p>\n	O hor&aacute;rio de encontro ser&aacute; &agrave;s 8hs no CAT - Centro de Atendimento ao Turista &agrave; 79km de Manaus, pr&oacute;ximo ao in&iacute;cio da Cidade de Rio Preto da Eva.</p>\n<p>\n	&nbsp;</p>\n<p>\n	Juntos sairemos em comboio em uma estrada de 10 km rio acima, at&eacute; chegar no balne&aacute;rio &ldquo;Encanto da Mata&rdquo;, onde iniciaremos nossa expedi&ccedil;&atilde;o. Antes de partirmos, todos receber&atilde;o orienta&ccedil;&atilde;o sobre a navega&ccedil;&atilde;o em caiaque e alguns princ&iacute;pios b&aacute;sicos de seguran&ccedil;a e conforto. Logo ap&oacute;s, partiremos para esse passeio &uacute;nico pela exuberante floresta Amaz&ocirc;nica</p>\n', NULL),
(13, 1, 2, 'Dia de Aventura', '<p>\n	Saia da rotina e venha viver um dia de aventura com a Ecoforest</p>\n', 3, 3, 3, '<p style="margin: 0cm 0cm 7.5pt; text-align: justify; line-height: 15pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\n	<span style="font-size:\n10.5pt;font-family:">As atividades de aventura proporcionam momentos de valoriza&ccedil;&atilde;o dos elementos essenciais da vida, podendo ser praticado por qualquer pessoa que queira fugir da rotina, superar desafios, explorar trajetos, contemplar a natureza.<o:p></o:p></span></p>\n<p style="margin: 0cm 0cm 7.5pt; text-align: justify; line-height: 15pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\n	<span style="font-size:\n10.5pt;font-family:">A Ecoforest Adventure uniu as modalidades de arco e flecha, slackline, canoagem e trekking para proporcionar incr&iacute;veis momentos de lazer e divers&atilde;o ao cliente.<o:p></o:p></span></p>\n<p style="margin: 0cm 0cm 7.5pt; text-align: justify; line-height: 15pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\n	<span style="font-size:\n10.5pt;font-family:">A pr&aacute;tica de canoagem e trekking ocasionam momentos de integra&ccedil;&atilde;o e contempla&ccedil;&atilde;o da natureza, sendo grandes oportunidades de conhecer a floresta Amaz&ocirc;nica e fugir da rotina. Arco e flecha, e slackline s&atilde;o esportes que lhe permitem desenvolver coordena&ccedil;&atilde;o motora, concentra&ccedil;&atilde;o e equil&iacute;brio f&iacute;sico. Al&eacute;m de auxiliarem no combate ao stress, j&aacute; que s&atilde;o pr&aacute;ticas divertidas e relaxantes.<o:p></o:p></span></p>\n', 'Manaus', 'Amazonas', 'Parque de aventura da Ecoforest Adventure, a apenas 39 quilômetros de Manaus, na rodovia BR-174 Km-923 (que antes era o Km-39).', '6 horas', '<p style="margin: 0cm 0cm 7.5pt; text-align: justify; line-height: 15pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\n	<span style="font-size:\n10.5pt;font-family:">A atividade come&ccedil;ar&aacute; no parque de aventura da Ecoforest Adventure, a apenas 39 quil&ocirc;metros de Manaus, na rodovia BR-174 Km-923 (que antes era o Km-39).<o:p></o:p></span></p>\n<p style="margin: 0cm 0cm 7.5pt; text-align: justify; line-height: 15pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\n	<span style="font-size:\n10.5pt;font-family:">Inicialmente ser&aacute; dado instru&ccedil;&otilde;es gerais de seguran&ccedil;a e alongamento, daremos inicio as atividades com o trekking de 40min, ao final do trekking iremos iniciar a canoagem com um percurso de 500m. Em seguida ser&aacute; dado intervalo para descanso.<o:p></o:p></span></p>\n<p style="margin: 0cm 0cm 7.5pt; text-align: justify; line-height: 15pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\n	<span style="font-size:\n10.5pt;font-family:">No per&iacute;odo da tarde ser&atilde;o realizadas instru&ccedil;&otilde;es b&aacute;sicas para a pr&aacute;tica de slackline e tiro com arco e ser&aacute; liberada a pr&aacute;tica das atividades e acesso &agrave; nossa maravilhosa e refrescante &aacute;rea de banho.<o:p></o:p></span></p>\n<p style="margin: 0cm 0cm 7.5pt; text-align: justify; line-height: 15pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\n	<span style="font-size:\n10.5pt;font-family:">09:00h - Caminhada na selva<o:p></o:p></span></p>\n<p style="margin: 0cm 0cm 7.5pt; text-align: justify; line-height: 15pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\n	<span style="font-size:\n10.5pt;font-family:">10:00h &ndash; Instru&ccedil;&atilde;o de Canoagem<o:p></o:p></span></p>\n<p style="margin: 0cm 0cm 7.5pt; text-align: justify; line-height: 15pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\n	<span style="font-size:\n10.5pt;font-family:">Tempo Livre<o:p></o:p></span></p>\n<p style="margin: 0cm 0cm 7.5pt; text-align: justify; line-height: 15pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\n	<span style="font-size:\n10.5pt;font-family:">14:00h &ndash; Instru&ccedil;&atilde;o de Slackline<o:p></o:p></span></p>\n<p style="margin: 0cm 0cm 7.5pt; text-align: justify; line-height: 15pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\n	<span style="font-size:\n10.5pt;font-family:">15:00h &ndash; Instru&ccedil;&atilde;o de Arco-flecha<o:p></o:p></span></p>\n<p style="margin: 0cm 0cm 7.5pt; text-align: justify; line-height: 15pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\n	<span style="font-size:\n10.5pt;font-family:">16:00h- Retorno<o:p></o:p></span></p>\n<p style="margin: 0cm 0cm 7.5pt; text-align: justify; line-height: 15pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\n	<span style="font-size:\n10.5pt;font-family:">*N&atilde;o incluso transporte</span></p>\n<p style="margin: 0cm 0cm 7.5pt; text-align: justify; line-height: 15pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\n	<span style="font-size:\n10.5pt;font-family:"><o:p>*N&atilde;o inclui alimenta&ccedil;&atilde;o</o:p></span></p>\n', NULL),
(14, 1, 3, 'Adaptação na Selva', '<p>\n	Aprenda a sobreviver em um ambiente de selva utilizando os recursos naturais dispon&iacute;veis.</p>\n', 3, 3, 3, '<p>\n	<span style="font-size: 12.222222328186px;">Vez ou outra ocorrem situa&ccedil;&otilde;es de pessoas que se viram fora de rota ou perdido durante um passeio, uma trilha, uma pescaria, escalada ou em acampamento, por exemplo, tendo que permanecer por horas, dias ou noites, aguardando o resgate de equipes de busca. E nessas horas saber como proceder de forma correta aumenta suas possibilidades de sair bem e em alguns casos, at&eacute; mesmo ileso. O curso de adapta&ccedil;&atilde;o ao ambiente de selva visa oferecer um contato mais pr&oacute;ximo &agrave; natureza e ensinar no&ccedil;&otilde;es b&aacute;sicas de adapta&ccedil;&atilde;o a ambientes hostis.</span></p>\n<p>\n	&nbsp;</p>\n<div>\n	<p style="font-size: 12.222222328186px;">\n		O que levar?</p>\n	<p style="font-size: 12.222222328186px;">\n		1 cal&ccedil;a jeans;</p>\n	<p style="font-size: 12.222222328186px;">\n		1 cal&ccedil;a tactel;</p>\n	<p style="font-size: 12.222222328186px;">\n		1 camisa de mangas compridas;</p>\n	<p style="font-size: 12.222222328186px;">\n		2 camisas de meia;</p>\n	<p style="font-size: 12.222222328186px;">\n		2 pares de meia;</p>\n	<p style="font-size: 12.222222328186px;">\n		3 pe&ccedil;as &iacute;ntimas;</p>\n	<p style="font-size: 12.222222328186px;">\n		Roupa de banho;</p>\n	<p style="font-size: 12.222222328186px;">\n		Len&ccedil;ol;</p>\n	<p style="font-size: 12.222222328186px;">\n		Rede;</p>\n	<p style="font-size: 12.222222328186px;">\n		Toalha de banho;</p>\n	<p style="font-size: 12.222222328186px;">\n		Bon&eacute;/ chap&eacute;u;</p>\n	<p style="font-size: 12.222222328186px;">\n		Cantil ou garrafinha (300ml)</p>\n	<p style="font-size: 12.222222328186px;">\n		T&ecirc;nis confort&aacute;vel;</p>\n	<p style="font-size: 12.222222328186px;">\n		M&aacute;quina fotogr&aacute;fica (opcional)</p>\n	<p style="font-size: 12.222222328186px;">\n		Repelente;</p>\n	<p style="font-size: 12.222222328186px;">\n		Protetor solar;</p>\n</div>\n<p>\n	&nbsp;</p>\n', 'Manaus', 'Amazonas', 'Praça da polícia, Centro, Manaus - Amazonas', '19hs', '<p style="font-size: 12.222222328186px;">\n	<span style="font-size: 12.222222328186px;">Conte&uacute;do program&aacute;tico do curso:</span></p>\n<p style="font-size: 12.222222328186px;">\n	&bull; Armadilhas;</p>\n<p style="font-size: 12.222222328186px;">\n	&bull; Trilha na selva: caminhada noturna;</p>\n<p style="font-size: 12.222222328186px;">\n	&bull; Conten&ccedil;&atilde;o de Of&iacute;dios: manuseio correto do animal;</p>\n<p style="font-size: 12.222222328186px;">\n	&bull; Cozinha mateira;</p>\n<p style="font-size: 12.222222328186px;">\n	&bull; Encontro para local de descanso dentro da selva;</p>\n<p style="font-size: 12.222222328186px;">\n	&bull; Espera do ca&ccedil;ador;</p>\n<p style="font-size: 12.222222328186px;">\n	&bull; Fogos;</p>\n<p style="font-size: 12.222222328186px;">\n	&bull; Orienta&ccedil;&atilde;o com b&uacute;ssola;</p>\n<p style="font-size: 12.222222328186px;">\n	&bull; Simula&ccedil;&atilde;o de resgate em selva;</p>\n<p style="font-size: 12.222222328186px;">\n	&bull; Sinais de Trilhas;</p>\n<p style="font-size: 12.222222328186px;">\n	&bull; Tipos de Abrigos: com acess&oacute;rios artificiais e naturais;</p>\n<p style="font-size: 12.222222328186px;">\n	&bull; Transposi&ccedil;&atilde;o com cordas;</p>\n<p style="font-size: 12.222222328186px;">\n	&bull; Rem&eacute;dios naturais</p>\n<p style="font-size: 12.222222328186px;">\n	&nbsp;</p>\n', NULL),
(15, 1, 4, 'Parque Ecoforest', '<p>\n	Explore a magn&iacute;fica floresta amaz&ocirc;nica e viva uma incr&iacute;vel experi&ecirc;ncia com a pr&aacute;tica de escalada em &aacute;rvore, arco e flecha, trekking, canoagem e tirolesa.</p>\n', 3, 3, 3, '<p>\n	As atividades de aventura proporcionam momentos de valoriza&ccedil;&atilde;o dos elementos essenciais da vida, podendo ser praticado por qualquer pessoa que queira fugir da rotina, superar desafios, explorar trajetos, contemplar a natureza.</p>\n<p>\n	<span style="font-size: 12px;">A Ecoforest Adventure ir&aacute; lhe proporcionar um final de semana de momentos incr&iacute;veis de conhecimento, lazer e divers&atilde;o com a pr&aacute;tica de escalada em &aacute;rvore, arco-flecha, slackline, canoagem e trekking.</span></p>\n<p>\n	<span style="font-size: 12px;">Explore o topo das gigantes &aacute;rvores amaz&ocirc;nicas, onde est&aacute; concentrado 70% de toda a sua biodiversidade, com uso de t&eacute;cnicas verticais para escalada em &aacute;rvore, total seguran&ccedil;a e instrutores qualificados, possibilitando observa&ccedil;&atilde;o da fauna e flora pouco conhecidas, de um &acirc;ngulo diferente.</span></p>\n<p>\n	<span style="font-size: 12px;">A pr&aacute;tica de canoagem e trekking proporcionam momentos de integra&ccedil;&atilde;o e contempla&ccedil;&atilde;o da natureza, sendo uma grande oportunidade de conhecer a floresta Amaz&ocirc;nica e fugir da rotina. Arco e Flecha e slackline s&atilde;o esportes que lhe permite desenvolver a coordena&ccedil;&atilde;o motora, a concentra&ccedil;&atilde;o e o equil&iacute;brio f&iacute;sico. Auxilia tamb&eacute;m no combate ao stress, equilibrando assim a nossa mente e o nosso corpo. Al&eacute;m disso, &eacute; desafiador e super divertido.</span></p>\n', 'Manaus', 'Amazonas', 'Parque de aventura da Ecoforest Adventure, a apenas 39 quilômetros de Manaus, na rodovia BR-174 Km-923 (que antes era o Km-39).', '30hs', '<p>\n	O local de encontro ser&aacute; no parque de aventura da Ecoforest Adventure, a apenas 39 quil&ocirc;metros de Manaus, na rodovia BR-174 Km-923 (antigo Km-39).</p>\n<p>\n	<span style="font-size: 12px;">Inicialmente ser&aacute; dado instru&ccedil;&otilde;es gerais de seguran&ccedil;a e alongamento, ent&atilde;o iniciaremos as atividades com o trekking de 40min, ao final do trekking iremos iniciar a canoagem com um percurso de 500m. Em seguida ser&aacute; dado intervalo para descanso e almo&ccedil;o.</span></p>\n<p>\n	<span style="font-size: 12px;">No per&iacute;odo da tarde ser&atilde;o realizadas instru&ccedil;&otilde;es b&aacute;sicas para a pr&aacute;tica de slackline e tiro com arco e ser&aacute; liberada a pr&aacute;tica das atividades e acesso &agrave; nossa maravilhosa e refrescante &aacute;rea de banho.</span></p>\n<p>\n	<span style="font-size: 12px;">No dia seguinte iniciaremos nossas atividades bem cedo as 7:30h da manh&atilde;, com a escalada de uma &aacute;rvore de cerca de 30m de altura. Ao final da escalada teremos uma pausa para descanso e almo&ccedil;o. Ap&oacute;s o almo&ccedil;o vamos encarar uma tirolesa de 100 metros de extens&atilde;o.</span></p>\n<p>\n	&nbsp;</p>\n<p>\n	<span style="font-size: 12px;">09:00-10:00 - Caminhada na selva</span></p>\n<p>\n	<span style="font-size: 12px;">10:00-11:00 &ndash; Instru&ccedil;&atilde;o de Canoagem</span></p>\n<p>\n	<span style="font-size: 12px;">Tempo livre</span></p>\n<p>\n	<span style="font-size: 12px;">14:00 &ndash; Instru&ccedil;&atilde;o de Slackline</span></p>\n<p>\n	<span style="font-size: 12px;">15:00 &ndash; Instru&ccedil;&atilde;o de Arco-flecha</span></p>\n<p>\n	16:00- Retorno</p>\n<p>\n	<span style="font-size: 12px;">Pernoite no local</span></p>\n<p>\n	<span style="font-size: 12px;">7:30 - Escalada em &aacute;rvore</span></p>\n<p>\n	<span style="font-size: 12px;">13:00 - 15:00 - Tirolesa, descanso, banho</span></p>\n<p>\n	<span style="font-size: 12px;">15:45 - Retorno</span></p>\n', NULL),
(16, 1, 5, 'Kayak no Janauari', '<p>\n	A Kayak Adventure vive essa experi&ecirc;ncia junto com voc&ecirc; !&nbsp; Nosso objetivo &eacute; proporcionar condi&ccedil;&otilde;es e um clima favor&aacute;vel para que qualquer pessoa que goste de esporte e aventura sinta-se amparada e motivada a enfrentar o desafio de realizar uma travessia, sem a preocupa&ccedil;&atilde;o com o seu desempenho. Nos rios, lagos e igarap&eacute;s visamos turismo de aventura, lazer e a divers&atilde;o sobre as &aacute;guas, explorando de forma ecol&oacute;gica os belos rios e paisagens da regi&atilde;o amaz&ocirc;nica. A Remada com caiaque desenvolve sua espiritualidade, renova suas energias, transmite a mensagem da preserva&ccedil;&atilde;o dos rios e lagos , faz bem para o corpo ,para mente e para alma, cultiva novas amizades e prepara cada um para sermos pessoas melhores, saud&aacute;veis, de bem com a vida e com o meio ambiente. Se voc&ecirc; tem o esp&iacute;rito leve e n&atilde;o dispensa um aventura seja bem vindo!</p>\n', 3, 3, 3, '<p>\n	Poucas pessoas tem o privil&eacute;gio de estar em contato direto com a natureza, sentir as sensa&ccedil;&otilde;es divinas e a paz de espir&iacute;to proporcionada por ela, e poder interagir sem causar estrago. Juntos sairemos em comboio do munic&iacute;pio de Cacau Pirera at&eacute; a entrada do ramal no km 7 da rodovia Manoel Urbano ( estrada de Manacapuru ) em seguida vamos por uma estrada de 20 km , at&eacute; chegar a vila Janauaril&acirc;ndia, onde iniciaremos nossa expedi&ccedil;&atilde;o. Antes de partirmos, todos receber&atilde;o orienta&ccedil;&atilde;o sobre a navega&ccedil;&atilde;o em caiaque e alguns princ&iacute;pios b&aacute;sicos de seguran&ccedil;a e conforto. Logo ap&oacute;s, as 9hs em ponto partiremos para esse passeio &uacute;nico pelo exuberante Parque Ecol&oacute;gico do Janauari</p>\n<p>\n	O Parque Ecol&oacute;gico Janauari Com uma &aacute;rea de 9.000 ha, concentra v&aacute;rios ecossistemas da regi&atilde;o. Possui matas de terra firme, de v&aacute;rzea e ig&aacute;pos (floresta inundada). Nesse roteiro A kayak Adventure leva voc&ecirc; atrav&eacute;s da belezas naturais do lago com suas &aacute;guas cristalinas, numa remada em grupo de aprox. 5km ao flutuante Ipixuna, onde existe um belo criat&oacute;rio de pirarucu ( peixe gigante da regi&atilde;o ), ao igap&oacute; ( floresta inundada ) onde se encontra a rainha soberana da floresta - A Sama&uacute;ma gigante, e durante o percurso a visualiza&ccedil;&atilde;o da fauna e flora local como macacos, aves e outros animais habitantes da regi&atilde;o.</p>\n<p>\n	Se o tempo e as condi&ccedil;&otilde;es f&iacute;sicas do grupo permitirem, podemos nos estender por mais 4km, ao Lago de Vit&oacute;rias-R&eacute;gias - planta que abre sua folha redonda sobre as &aacute;guas rasas e sem correnteza e chega a medir 1,8 m de di&acirc;metro. No mesmo local encontram-se um flutuante restaurante e uma grande feira de artesanato flutuante mantida pelos moradores do lago onde o aventureiro pode adquirir uma lembran&ccedil;a em forma de arte.</p>\n', 'Manaus', 'Amazonas', 'Centro de Atendimento ao Turista - CAT (Município de Iranduba/AM) - Endereço: Rodovia Manoel Urbano (AM-080) Km 2 á direita.', '5hs', '<p>\n	-Concentra&ccedil;&atilde;o: 7:15hs no Centro de Atendimento ao Turista - CAT (Munic&iacute;pio de Iranduba/AM) - Endere&ccedil;o: Rodovia Manoel Urbano (AM-080) Km 2 &aacute; direita.</p>\n<p>\n	-Partida para Janauaril&acirc;ndia: 08h00</p>\n<p>\n	-In&iacute;cio da atividade com prele&ccedil;&atilde;o: 09h00</p>\n<p>\n	-Parada para lanche: 10h30 (local a definir)</p>\n<p>\n	-Retorno: 13h</p>\n', NULL),
(17, 1, 12, 'Tarumã Açú Explorer', '<p>\n	Que tal aumentar um pouco mais suas habilidades no caiaque?</p>\n', 3, 3, 3, '<p>\n	O Tarum&atilde; A&ccedil;&uacute; Explorer &eacute; mais um roteiro organizado pela WR Loca&ccedil;&otilde;es.</p>\n<p>\n	Indicado para amadores no esporte, com experi&ecirc;ncia no roteiro Caiaque Rio Preto da Eva e que buscam uma r&uacute;stica aventura.</p>\n<p>\n	&nbsp;</p>\n<p>\n	Detalhes importantes:</p>\n<p>\n	Possibilidade de encontrar com diversos obst&aacute;culos;</p>\n<p>\n	&Aacute;rea selvagem, isolada com pouca habita&ccedil;&atilde;o e recursos;</p>\n', 'Manaus', 'Amazonas', 'Posto de Gasolina BR, ao lado da DAFRA motos, antes da Barreira da AM 010 e BR 174', '5hs', '<p>\n	8:00&nbsp;&nbsp; &nbsp;&ndash; Encontro e&nbsp;Sa&iacute;da de Manaus para BR 174 at&eacute; o Km 28;</p>\n<p>\n	8:30 &nbsp;&nbsp;&nbsp;&ndash; Caf&eacute; Regional;</p>\n<p>\n	9:30&nbsp;&nbsp; &nbsp;&ndash; Entrada no Ramal;</p>\n<p>\n	10:00 &ndash; Chegada na ponte de inicio;</p>\n<p>\n	11:00 &ndash; Sa&iacute;da, in&iacute;cio da explora&ccedil;&atilde;o (Percorre dois igarap&eacute;s em &aacute;rea de mata densa e pouco contato com s&iacute;tios;)</p>\n<p>\n	16:00 &ndash; Chegada&nbsp;em ponto espec&iacute;fica do ramal do Km 22.</p>\n', NULL),
(18, 1, 13, 'Trekking x Camping x Rapel', '<p>\n	Voc&ecirc; &eacute; um aventureiro amador e procura um grande desafio? Essa atividade &eacute; pra voc&ecirc;...</p>\n', 4, 2, 2, '<p>\n	Presidente figueiredo &eacute; um dos munic&iacute;pios do Amazonas mais ricos em recursos naturais. Localizado a apenas 100km de Manaus,&nbsp; o munic&iacute;pio reune mais de 150 cachoeiras e muitos segredos. Neste passeio voc&ecirc; vai descobrir alguma das belezas da Floresta Amaz&ocirc;nica. Mas, a floresta exige um pouco de prepara&ccedil;&atilde;o...</p>\n<p>\n	Para essa atividade s&atilde;o:</p>\n<p>\n	2 dias e 1 noite</p>\n<p>\n	24km de caminhada</p>\n<p>\n	20m de rapel vertical em cachoeira</p>\n<p>\n	&nbsp;</p>\n<p>\n	&nbsp;</p>\n<p>\n	Dia 1</p>\n<p>\n	Voc&ecirc; vai conhecer a Cachoeira da Neblina, atrav&eacute;s de uma caminhada inesquec&iacute;vel pela floresta amaz&ocirc;nica.</p>\n<p>\n	S&atilde;o 8 km de trilhas at&eacute; chegarmos &agrave; cachoeira. No trajeto, n&atilde;o &eacute; dif&iacute;cil encontrar &aacute;rvores com mais de 30 metros de comprimento e &eacute; poss&iacute;vel notar a exuber&acirc;ncia de nossa fauna e flora. Nos &uacute;ltimos trechos do percurso, pode-se ouvir o som de &aacute;gua corrente &agrave; dist&acirc;ncia, o que apenas causa mais empolga&ccedil;&atilde;o ao aventureiro. A viagem culmina com a chegada &agrave; Cachoeira da Neblina, que forma um imenso pared&atilde;o de &aacute;gua. A queda d&acute;&aacute;gua resulta na forma&ccedil;&atilde;o de got&iacute;culas que se espalham por toda a &aacute;rea, dando a impress&atilde;o de que est&aacute; chovendo levemente.</p>\n<p>\n	Ao final desse dia, vamos preparar as barracas para o pernoite no cora&ccedil;&atilde;o da floresta.</p>\n<p>\n	Dura&ccedil;&atilde;o de Trekking: aproximadamente 1:30hs</p>\n<p>\n	Dist&acirc;ncia: 8km at&eacute; a cachoeira</p>\n<p>\n	&nbsp;</p>\n<p>\n	Dia 2</p>\n<p>\n	Logo ao amanhecer levantaremos nosso acampamento: &nbsp;ainda estaremos na metade da aventura. Voltaremos 8km de trilhas para iniciar o nosso trekking para o Salto do Ypi.</p>\n<p>\n	O Salto do Ypi fica localizado no Km 57 da Estrada de Balbina. O tempo m&eacute;dio de caminhada para chegar na cachoeira &eacute; de 1:30 hora, sendo uma trilha levemente inclinada com baixo grau de dificuldade. Ao longo do percurso contemplaremos de perto a Floresta Amaz&ocirc;nica, conhecendo aspectos do seu ecossistema singular.</p>\n<p>\n	Ao chegar na cachoeira, ser&aacute; feito uma pausa para contempla&ccedil;&atilde;o de sua exuberante paisagem e ser&atilde;o dadas instru&ccedil;&otilde;es quanto aos procedimentos de seguran&ccedil;a e uso dos equipamento para que se possa realizar o rapel.&nbsp;</p>\n<p>\n	Em seguida, o instrutor demonstrar&aacute; a t&eacute;cnica do rapel a fim de que os aventureiros estejam aptos a realiz&aacute;-lo. Ao longo do percurso &eacute; poss&iacute;vel sentir a sensa&ccedil;&atilde;o de liberdade e pura adrenalina enquanto descemos a incr&iacute;vel queda d&rsquo;&aacute;gua. Ao final do rapel poderemos explorar um pouco das complexas forma&ccedil;&otilde;es rochosas e grutas, al&eacute;m de pinturas rupestres locais.</p>\n<p>\n	Dura&ccedil;&atilde;o de Trekking: aproximadamente 5:30hs</p>\n<p>\n	Dist&acirc;ncia: 16 km</p>\n<p>\n	Altura: 20m</p>\n', 'Presidente Figueiredo', 'Amazonas', 'Centro de Atendimento  ao Turista (CAT) de Presidente Figueiredo, localizado logo após a entrada da cidade', '2 dias', '<p>\n	Dia 1</p>\n<p>\n	08:00hs &ndash; Sa&iacute;da do Ponto de Encontro</p>\n<p>\n	09:00hs &ndash; In&iacute;cio da trilha para a Cachoeira da Neblina</p>\n<p>\n	11:30hs &ndash; Chegada &agrave; cachoeira, descanso, contempla&ccedil;&atilde;o e arma&ccedil;&atilde;o do acampamento para pernoite no local.</p>\n<p>\n	&nbsp;</p>\n<p>\n	Dia 2</p>\n<p>\n	07:30hs &ndash; Levantar acampamento</p>\n<p>\n	08:30hs &ndash; Retorno Trilha Cachoeira da Neblina</p>\n<p>\n	10:00hs &ndash; Inicio da Trilha salto do Ypi</p>\n<p>\n	12:00hs &ndash; Descanso e contempla&ccedil;&atilde;o</p>\n<p>\n	13:00hs &ndash; Descida de Rapel</p>\n<p>\n	15:00hs &ndash; Retorno a Trilha Salto do Ypi</p>\n', NULL),
(19, 1, 14, 'Kayak Adventure Rio Preto da Eva', '<p>\n	Viver &eacute; a coisa mais rara do mundo. A maioria das pessoas apenas existe . Venha curtir o melhor do turismo Aventura com a Kayak Adventure ! Seguran&ccedil;a, adrenalina, Natureza, esporte e Lazer.Viver &eacute; a coisa mais rara do mundo. A maioria das pessoas apenas existe .</p>\n', 3, 3, 3, '<p>\n	Nessa aventura vamos conhecer o Munic&iacute;pio de Rio Preto da Eva. Este &eacute; um roteiro de m&eacute;dia dura&ccedil;&atilde;o com aproximadamente 13 km de descida do rio. A navega&ccedil;&atilde;o ser&aacute; feita descendo o Rio Preto at&eacute; a ponte que corta a cidade, remando pr&oacute;ximo a vegeta&ccedil;&atilde;o densa caracter&iacute;stica do local. Vamos passar pela Comunidade Jerusal&eacute;m numa descida calma e agrad&aacute;vel, com visuais incr&iacute;veis, toda flora e fauna da regi&atilde;o fazem parte desse cen&aacute;rio maravilhoso e relaxante. Com fundo raso e de areia, a &aacute;gua avermelhada &eacute; um convite ao mergulho. Vamos fazer algumas paradas estrat&eacute;gicas para um banho refrescante e visualiza&ccedil;&atilde;o de animais e natureza exuberante e superar alguns obst&aacute;culos deixados pela m&atilde;e natureza para dar mais emo&ccedil;&atilde;o ao passeio.</p>\n<p>\n	&nbsp;</p>\n<p>\n	RECOMENDA&Ccedil;&Otilde;ES</p>\n<p>\n	Escute atentamente as instru&ccedil;&otilde;es e recomenda&ccedil;&otilde;es do condutor</p>\n<p>\n	Fa&ccedil;a o alongamento antes da remada ( bra&ccedil;os e lombar e trap&eacute;zio )</p>\n<p>\n	Reme no seu ritmo e n&atilde;o fa&ccedil;a mais do que pode</p>\n<p>\n	Traga todo o lixo que produzir, n&atilde;o jogue lixo no rio</p>\n<p>\n	N&atilde;o mate nada al&eacute;m do tempo, N&atilde;o leve nada al&eacute;m de lembran&ccedil;a, N&atilde;o deixe nada al&eacute;m de boas impress&otilde;es!</p>\n', 'Rio Preto da Eva', 'Amazonas', 'Posto de gasolina Equador na entrada da cidade de Rio Preto da Eva - lado direito da rotátoria.', '3h30min', '<p>\n	<span style="font-size: 12px;">Concentra&ccedil;&atilde;o: 07h30 - Posto Equador na entrada da cidade.</span></p>\n<p>\n	Partida para ponto de descida: 08h00 - 13 km de ramal em condu&ccedil;&atilde;o da Kayak Adventure.</p>\n<p>\n	In&iacute;cio da atividade com prele&ccedil;&atilde;o: 10h00</p>\n<p>\n	Parada para lanche: 12h00 (local a definir)</p>\n<p>\n	Retorno: 15h00</p>\n<p>\n	&nbsp;</p>\n<p>\n	&nbsp;</p>\n', NULL),
(20, 1, 15, 'Um dia com os botos vermelhos', '<p>\n	Venha viver um dia de aventuras onde a emo&ccedil;&atilde;o vai falar mais alto!</p>\n', 3, 3, 3, '<p>\n	Neste passeio voc&ecirc; ter&aacute; a oportunidade de conhecer nossa charmosa pousada, conhecer e nadar com um dos mais ador&aacute;veis mam&iacute;feros dos rios amaz&ocirc;nicos, o famoso boto cor de rosa, ou boto vermelho como &eacute; mais conhecido localmente.</p>\n', 'Manaus', 'Amazonas', 'Estrada Manoel Urbano, KM 47 Aterro do Ubim', '7h', '<p>\n	&Agrave;s 08h00 - Sa&iacute;da de Manaus com destino ao KM 47 Aterro do Ubim ( transporte terrestre por conta do participante )</p>\n<p>\n	&Agrave;s09h00 - Sa&iacute;da do local de encontro em canoa motorizada pelo lago Ubim at&eacute; o Lago Acajatuba onde est&aacute; localizada a pousada Manati Lodge. Na chegada, um refrescante suco de Boas-Vindas ser&aacute; servido.</p>\n<p>\n	No restante da manh&atilde; faremos um tour de canoa &agrave; remo nos arredores para pousada para reconhecimento, h&aacute; uma grande possibilidade de avistamento de animais como pregui&ccedil;as e macacos.</p>\n<p>\n	&Agrave;s 12h30 - Almo&ccedil;o tipicamente regional com peixes e frutas de sobremesa.</p>\n<p>\n	&Aacute;s 13h30 - Saida de canoa motorizada para a parte mais emocionante do passeio, vamos finalmente conhecer e nadar com os botos. N&atilde;o esque&ccedil;a de levar sua m&aacute;quina fotogr&aacute;fica e prepare o cora&ccedil;&atilde;o para a emo&ccedil;&atilde;o.</p>\n<p>\n	&Agrave;s 15h00 - Como tudo o que &eacute; bom dura pouco, &eacute; hora de partir de volta &agrave; estrada para pegar o carro e voltar &agrave; Manaus.</p>\n', NULL),
(21, 1, 6, 'Escalada no Tarumã', '<p>\n	Venha se divertir com sua fam&iacute;lia e seus amigos em um parque de Arvorismo inovador, dentro da &aacute;rea urbana de Manaus, em uma &aacute;rea verde particular a menos de 5 minutos do Aeroporto Eduardo Gomes.</p>\n', 3, 3, 3, '<p>\n	A APA do Tarum&atilde; &eacute; um dos poucos fragmentos verdes que ainda resistem no entorno de Manaus. Neste lugar, em uma&nbsp; &aacute;rea particular de floresta secund&aacute;ria ainda &eacute; poss&iacute;vel encontrar &aacute;rvores de quase 40 metros de altura e um dos &uacute;ltimos iguarap&eacute;s n&atilde;o polu&iacute;dos na &aacute;rea urbana de Manaus. Um lugar repleto de verde, com abundante presen&ccedil;a de esp&eacute;cimes da fauna e flora locais.</p>\n<p>\n	A atividade de Arvorismo desenvolvida no local, traz a proposta de oferecer uma op&ccedil;&atilde;o ecol&oacute;gica, sustent&aacute;vel, prazerosa e segura para o lazer e recrea&ccedil;&atilde;o ao ar livre, tamb&eacute;m para turistas, mas especialmente para o p&uacute;blico manauara que ama a intera&ccedil;&atilde;o com a natureza, seja em fam&iacute;lia ou entre amigos, e n&atilde;o dispensa esfor&ccedil;os para celebrar a vida praticando esportes e atividades ao ar livre (outdoor).</p>\n<p>\n	Dentre as modalidades e op&ccedil;&otilde;es de aparelhos para divers&atilde;o, em primeiro momento, at&eacute; o final de dezembro deste ano 2014, temos a escalada em &aacute;rvores recreativa, muito popular no estrangeiro, e que h&aacute; mais de 8 anos j&aacute; vem sendo desenvolvida e oferecida por nossa empresa Amazon Tree Climbing em Manaus e em outros lugares das Amaz&ocirc;nia, em passeios tur&iacute;sticos como uma atividade ultra-inovadora, sendo muito requisitada pelo receptivo tur&iacute;stico local, e muito bem recomendada por grandes operadoras nacionais e internacionais que enviam seus clientes/turistas para a Amaz&ocirc;nia.</p>\n<p>\n	Tal atividade, agora tamb&eacute;m concebida pelo g&ecirc;nero do Arvorismo, pois consiste em ascens&atilde;o em corda ao topo de uma &aacute;rvore (3 op&ccedil;&otilde;es de &aacute;rvores sendo uma maior que a outra, tendo a menor 15 e a maior 35 metros de altura). Acomoda&ccedil;&atilde;o, contempla&ccedil;&atilde;o e fotos na copa da &aacute;rvore. Terminando com a descida/Rapel.</p>\n<p>\n	OBS: A atividade de escalada em &aacute;rvore da Amazon Tree Climbing, em todas as suas fases &eacute; certificada pela ABNT/INMETRO (&Oacute;rg&atilde;o regulador do governo federal que tamb&eacute;m regula as atividades de Turismo de Aventura e Ecoturismo). S&atilde;o utilizados os melhores e mais conceituados equipamentos, al&eacute;m condutores experientes e devidamente qualificados.</p>\n<p>\n	A partir de janeiro de 2015, estaremos inaugurando a Tiroleza, que dever&aacute; alcan&ccedil;ar os 150 metros de dist&acirc;ncia, al&eacute;m de outros aparelhos.</p>\n', 'Manaus', 'Amazonas', 'Rua Caravelle, 22 A. Tarumã, Manaus (única rua entrando para o lado esquerdo pela Estrada do Tarumã, a partir da confluência das Avenidas Santos Dumont, com Av. do Turismo, no sentido Centro - Bairro, passando cerca de 300 m, pelo SINDACTA IV (antigo SIVA', '4h', '<p>\n	Turma da manh&atilde;</p>\n<p>\n	08:00hs In&iacute;cio da Atividade</p>\n<p>\n	09:00hs Preparativos e in&iacute;cio da escalada</p>\n<p>\n	11:00hs Caminhada na Selva com banho em igarap&eacute;</p>\n<p>\n	12:00hs Retorno e termino da atividade</p>\n<p>\n	&nbsp;</p>\n<p>\n	Turma da tarde</p>\n<p>\n	14:00hs In&iacute;cio da Atividade</p>\n<p>\n	15:00hs Preparativos e in&iacute;cio da escalada</p>\n<p>\n	17:00hs Caminhada na Selva com banho em igarap&eacute;</p>\n<p>\n	18:00hs Retorno e termino da atividade</p>\n<p>\n	&nbsp;</p>\n', NULL),
(22, 1, 16, 'Teste', '<p>\n	Ponta Negra</p>\n', 1, 2, 3, '<p>\n	Ponta Negra</p>\n', 'Manaus', 'Amazonas', 'Ponta Negra', '2hs', NULL, NULL),
(23, 1, 17, 'A grande árvore', '<p>\n	Venha descobrir e se surpreender com o encanto do Paran&aacute; do Aria&uacute; em um roteiro cheio de aventuras!Venha descobrir e se surpreender com o encanto do Paran&aacute; do Aria&uacute; em um roteiro cheio de aventuras!</p>\n', 3, 3, 3, '<p>\n	Nesta excurs&atilde;o voc&ecirc; ter&aacute; a oportunidade de navegar pelo Paran&aacute; do Aria&uacute;, que liga o majestoso Rio Solim&otilde;es com o misterioso Rio Negro. Um lugar de uma beleza c&ecirc;nica inigual&aacute;vel, com fauna e flora abundantes e onde ainda se pode encontrar as lend&aacute;rias Samaumeiras. &Aacute;rvore &iacute;cone da nossa flora amaz&ocirc;nica, que vem sendo um de nossos principais atrativos e instrumento natural, para o nosso trabalho levando a nossa mensagem de conscientiza&ccedil;&atilde;o ecol&oacute;gica e de sustentabilidade atrav&eacute;s das boas pr&aacute;ticas para atividades ao ar livre.</p>\n<p>\n	&nbsp;A navega&ccedil;&atilde;o ser&aacute; feita descendo o Rio Arai&uacute;, remando pr&oacute;ximo a vegeta&ccedil;&atilde;o densa caracter&iacute;stica do local. Vamos passar pelas Comunidades ribeirinhas numa descida calma e agrad&aacute;vel, com visuais incr&iacute;veis, toda flora e fauna da regi&atilde;o fazem parte desse cen&aacute;rio maravilhoso e relaxante.</p>\n<p>\n	Como o Paran&aacute; do Aria&uacute; &eacute; uma liga&ccedil;&atilde;o entre os dois maiores rios da regi&atilde;o amaz&ocirc;nica a observa&ccedil;&atilde;o de botos &eacute; incessante durante a remada. Vamos fazer algumas paradas estrat&eacute;gicas para um banho refrescante e visualiza&ccedil;&atilde;o de animais e natureza exuberante e superar alguns obst&aacute;culos deixados pela m&atilde;e natureza para dar mais emo&ccedil;&atilde;o ao passeio.</p>\n', 'Iranduba', 'Amazonas', 'Posto Ipiranga de Cacau Pireira - Final da estrada da Ponte sobre o Rio Negro.  Estrada Manuel Urbano, s/n km  Município de Cacau Pireira.', '5hs', '<p>\n	Concentra&ccedil;&atilde;o: 07h00 - Posto Ipiranga em Cacau Pereira ( Final da estrada da ponte )</p>\n<p>\n	Partida para ponto de descida: 07h15 - 39 km da estrada Manoel Urbano ( Am-070) em condu&ccedil;&atilde;o da pr&oacute;pria.</p>\n<p>\n	In&iacute;cio da atividade com prele&ccedil;&atilde;o: 08h00</p>\n<p>\n	Parada para escalada e lanche r&aacute;pido: 10h30</p>\n<p>\n	Retorno: 13h00</p>\n', NULL),
(24, 1, 18, 'Rapel na Cachoeira da Neblina', '<p>\n	Est&aacute; disposto a enfrentar barreiras e superar limites e um lugar incr&iacute;vel? Ent&atilde;o venha com a viver essa aventura</p>\n', 3, 3, 3, '<p>\n	O munic&iacute;pio de Presidente Figueiredo &eacute; conhecido por abrigar dezenas de cachoeiras e muitas delas ainda s&atilde;o pouco conhecidas. Neste passeio vamos te apresentar a cachoeira da Neblina que &eacute; definitivamente uma das mais altas e mais bonitas cachoeiras da regi&atilde;o. Sua dificuldade de acesso e seus 8 km de trilha tornam essa cachoeira ainda mais especial.</p>\n<p>\n	<span style="font-size: 12px;">A cachoeira tem uma altura de cerca de 30m, o que possibilita a pr&aacute;tica do rapel em cachoeira ou cachoeirismo, essa pr&aacute;tica proporciona um turbilh&atilde;o de sensa&ccedil;&otilde;es e adrenalina em contato direto com a natureza. Qualquer pessoa pode praticar, sendo que acompanhada por profissionais qualificados com treinamento em t&eacute;cnicas verticais, assim com resgate em ambiente natural.</span></p>\n<p>\n	<span style="font-size: 12px;">Para chegar at&eacute; a cachoeira fica localizada no Km-53 da estrada de Balbina, &eacute; necess&aacute;rio fazer um trekking de 8 km. No percurso, encontramos &aacute;rvores com mais de 30metros de altura sendo not&aacute;vel a exuber&acirc;ncia da fauna e flora amaz&ocirc;nica. Nos &uacute;ltimos trechos do percurso, pode-se ouvir o som de &aacute;gua corrente &agrave; dist&acirc;ncia, o que causa ainda mais ansiedade pela chegada.</span></p>\n<p>\n	<span style="font-size: 12px;">Dura&ccedil;&atilde;o de Trekking: aproximadamente 2:30hs</span></p>\n<p>\n	<span style="font-size: 12px;">Dist&acirc;ncia: 8km at&eacute; a cachoeira</span></p>\n<p>\n	<span style="font-size: 12px;">Ao chegar a cachoeira ser&aacute; realizada a pratica do rapel. A equipe da Ecoforest Adventure inicialmente ir&aacute; dar instru&ccedil;&otilde;es de seguran&ccedil;a e os procedimentos do rapel em cachoeira, para que os aventureiros possam estar aptos a realizar o rapel. Finalizaremos nossas atividades &agrave;s 15h.</span></p>\n', 'Presidente Figueiredo', 'Amazonas', 'Centro de Atendimento ao Turista (CAT) de Presidente Figueiredo, localizado logo após a entrada da cidade.', '7 horas', '<p>\n	08:00hs &ndash; Sa&iacute;da do Ponto de Encontro</p>\n<p>\n	09:00hs &ndash; In&iacute;cio da trilha para a Cachoeira da Neblina</p>\n<p>\n	11:30hs &ndash; Realiza&ccedil;&atilde;o do Rapel</p>\n<p>\n	15:00hs &ndash; Retorno</p>\n', NULL),
(25, 1, 19, 'Rapel no Salto do Ipy', '<p>\n	Venha viver momentos incr&iacute;veis de muita adrenalina e emo&ccedil;&atilde;o em meio ao para&iacute;so das cachoeiras, rodeado pela exuberante floresta amaz&ocirc;nica.</p>\n', 3, 3, 3, '<p>\n	Largar o estresse da vida urbana por um final de semana e conectar-se com a natureza pela pr&aacute;tica de rapel em cachoeira, poder ser uma incr&iacute;vel e memor&aacute;vel experi&ecirc;ncia com muita emo&ccedil;&atilde;o e adrenalina.</p>\n<p>\n	<span style="font-size: 12px;">A adrenalina, assim como em outros esportes radicais &eacute; o maior atrativo para os praticantes do rapel em cachoeira. A pr&aacute;tica do rapel pode ser realizada por qualquer pessoa, sendo que com acompanhamento de profissionais qualificados.&nbsp;</span></p>\n<p>\n	<span style="font-size: 12px;">A cachoeira do Salto do Ipy &eacute; um ambiente perfeito para a pr&aacute;tica do rapel, com uma queda d&rsquo;agua de aproximadamente 20m de altura. Localizado no Km 57 da Estrada de Balbina. O tempo de caminhada at&eacute; a cachoeira &eacute; de 1:30 hora, sendo uma trilha levemente inclinada com baixo grau de dificuldade. Ao longo do percurso contemplaremos de perto a Floresta Amaz&ocirc;nica, conhecendo aspectos do seu ecossistema singular.</span></p>\n<p>\n	<span style="font-size: 12px;">Ao chegar a cachoeira, ser&aacute; feito uma pausa para contempla&ccedil;&atilde;o de sua exuberante paisagem e ser&atilde;o dadas instru&ccedil;&otilde;es quanto aos procedimentos de seguran&ccedil;a e uso dos equipamento para que se possa realizar o rapel.</span></p>\n<p>\n	<span style="font-size: 12px;">Em seguida, o instrutor demonstrar&aacute; a t&eacute;cnica do rapel a fim de que os aventureiros estejam aptos a realiz&aacute;-lo. Ao longo do percurso &eacute; poss&iacute;vel sentir a sensa&ccedil;&atilde;o de liberdade e pura adrenalina enquanto descemos a incr&iacute;vel queda d&rsquo;agua.&nbsp;</span></p>\n', 'Presidente Figueiredo', 'Amazonas', 'Entrada da Cachoeira Salto do Ipy, km 57 da Estrada de Balbina - Presidente Figueiredo', '5 horas', '<p>\n	10:00hs &ndash; Inicio da Trilha salto do Ypi</p>\n<p>\n	<span style="font-size: 12px;">12:00hs &ndash; Descanso e contempla&ccedil;&atilde;o</span></p>\n<p>\n	<span style="font-size: 12px;">13:00hs &ndash; Descida de Rapel</span></p>\n<p>\n	<span style="font-size: 12px;">15:00hs &ndash; Retorno a Trilha Salto do Ypi</span></p>\n', NULL),
(26, 1, 20, 'Rapel na Cachoeira do Santuário', '<p>\n	Descubra a emo&ccedil;&atilde;o de fazer rapel em uma das mais belas cachoeiras de Presidente Figueiredo!</p>\n', 3, 3, 3, '<p>\n	O complexo tur&iacute;stico da cachoeira do santu&aacute;rio possibilita a pr&aacute;tica de esportes radicais, assim como o rapel em cachoeira. Que &eacute; uma atividade em que &eacute; necess&aacute;rio superar a barreira do medo de altura e gera uma incr&iacute;vel sensa&ccedil;&atilde;o de adrenalina e liberdade. Pode ser realizada por qualquer pessoa, sendo que com acompanhamento de profissionais qualificados.&nbsp;</p>\n<p>\n	<span style="font-size: 12px;">A EcoForest Adventure disp&otilde;e de uma equipe qualificada de instrutores e monitores, que ir&atilde;o proporcionar momentos incr&iacute;veis com conforto e seguran&ccedil;a.</span></p>\n<p>\n	<span style="font-size: 12px;">O ponto de encontro ser&aacute; na Cachoeira do Santu&aacute;rio no munic&iacute;pio de Presidente Figueiredo na Estrada de Balbina Km-13. Chegando ao local realizaremos instru&ccedil;&otilde;es de seguran&ccedil;a e demonstra&ccedil;&atilde;o dos procedimentos do rapel.</span></p>\n', 'Presidente Figueiredo', 'Amazonas', 'Cachoeira do Santuário - Estrada de Balbina km-13 - Presidente Figueiredo', '3 hs', NULL, NULL);
INSERT INTO `descricao_atividade` (`codigo`, `lingua_id`, `atividade_codigo`, `titulo`, `apresentacao`, `esforco_fisico`, `conforto`, `dificuldade_tecnica`, `descricao`, `cidade`, `estado`, `ponto_encontro`, `duracao`, `roteiro`, `termo_consentimento`) VALUES
(27, 1, 21, 'Monte Roraima - Circuito La Ventana', '<p>\n	Quanto mais se caminha no topo do Monte Roraima, mais aumenta o desejo de ficar um tempo maior por l&aacute;.</p>\n', 3, 3, 3, '<p>\n	Embora muitos n&atilde;o conhe&ccedil;am, o Monte Roraima &eacute; uma forma&ccedil;&atilde;o erguida ainda quando a Am&eacute;rica do Sul e a &Aacute;frica formavam um &uacute;nico continente chamado Godnwana, h&aacute; 2 bilh&otilde;es de anos atr&aacute;s.</p>\n<p>\n	Ainda hoje existe a especula&ccedil;&atilde;o de que sua fauna, flora e geologia n&atilde;o evoluem desde a extin&ccedil;&atilde;o dos dinossauros, durante a era mesozoica. Essas caracter&iacute;sticas e a poss&iacute;vel exist&ecirc;ncia de esp&eacute;cies muito antigas e at&eacute; dinossauros nos topos dos tepuis, chamou a aten&ccedil;&atilde;o do escritor Arthur Conan Doyle, inspirando-o a escrever o famoso livro &ldquo;O Mundo Perdido&rdquo; aumentando o clima de aventura e mist&eacute;rio &agrave; regi&atilde;o.</p>\n<p>\n	Por toda essa aura, muitos aventureiros buscam o reencontro consigo mesmo e com a origem da vida na terra. Por&eacute;m, mais do que isso, encontram um universo paralelo, uma terra perdida repleta de belezas escondidas por detr&aacute;s das nuvens.</p>\n<p>\n	Chegar ao topo do Monte Roraima &eacute; uma conquista por precisar passar por algumas provas onde as regras e dificuldades s&atilde;o definidas na hora e mudam para cada pessoa conforme o desejo de Makunaima, o Deus para os &iacute;ndios locais.</p>\n<p>\n	E &eacute; pra l&aacute; que vamos, em busca de novas experi&ecirc;ncias.</p>\n', 'Boa Vista', 'Roraima', 'Hotel Aipana Plaza – Boa Vista - Roraima', '07d06n', '<p>\n	No dia 18abr15, temos um Briefing &agrave;s 15h00 no Hotel Aipana Plaza. Tarde livre &ndash; Consulte sugest&atilde;o de passeios na cidade.</p>\n<p>\n	Temperatura: entre 28&ordm;C e 35&ordm;C, aproximadamente.</p>\n<p>\n	&nbsp;</p>\n<p>\n	A partir deste dia inicia o trekking.</p>\n<p>\n	1&ordm; dia &ndash; 19abr15: Boa Vista 86mt / Santa Elena de Uair&eacute;n 900mt / Comunidade Ind&iacute;gena Paraitepuy 1300mt / Acampamento rio Tek 1100mt.</p>\n<p>\n	&nbsp;</p>\n<p>\n	Sa&iacute;da de Boa Vista &agrave;s 05h00 com destino a Santa Elena de Uair&eacute;n (220 km), com chegada prevista para 09h00. Caf&eacute; da manh&atilde; e sa&iacute;da imediata para Paraitepuy (100km). Distribui&ccedil;&atilde;o e pesagem da bagagem para in&iacute;cio do trekking. Tempo de caminhada prevista em 4,5 horas at&eacute; o acampamento no Tek, num percurso de 15km. Montar acampamento, reconhecimento da &aacute;rea, fotos, descanso, algumas reflex&otilde;es e informa&ccedil;&otilde;es sobre o pr&oacute;ximo dia de trekking. Jantar e pernoite.</p>\n<p>\n	Temperatura: 25&ordm;C, aproximadamente.</p>\n<p>\n	&nbsp;</p>\n<p>\n	2&ordm; dia &ndash; 20abr15: Rio Tek / Base do Mt Roraima &ndash; 1850mt</p>\n<p>\n	Caf&eacute; da manh&atilde; e sa&iacute;da por volta das 08h00 rumo &agrave; base da montanha. Percurso de 8km com caminhada entre 4 e 5 horas. Apesar de o percurso ser menor, o esfor&ccedil;o ser&aacute; bem maior devido a ser 70% de subida. Na chegada, montar acampamento e alimentar-se, tomar um banho nas &aacute;guas frias, reconhecimento da &aacute;rea para fotos, medita&ccedil;&atilde;o, e informa&ccedil;&otilde;es sobre o dia seguinte. Jantar e pernoite.</p>\n<p>\n	Temperatura: 20&ordm;C, aproximadamente.</p>\n<p>\n	&nbsp;</p>\n<p>\n	3&ordm; dia &ndash; 21abr15: Base do Mt Roraima / Topo 2734mt</p>\n<p>\n	Caf&eacute; da manh&atilde; e sa&iacute;da &agrave;s 08h00 rumo ao topo. Trilha de aproximadamente 4,5km com dura&ccedil;&atilde;o entre 4 e 5 horas de subida. Este ser&aacute; um dos momentos mais bonitos do trekking, com paradas durante o trajeto para fotos, descanso, contempla&ccedil;&atilde;o da paisagem, flores como orqu&iacute;deas de diversas esp&eacute;cies e pequenos p&aacute;ssaros. Passa-se por v&aacute;rios igarap&eacute;s e sob uma cachoeira. Breve parada para recuperar o f&ocirc;lego, reunir o grupo e seguir para o local do acampamento. Tarde de descanso. Jantar e pernoite. Primeira noite no topo.</p>\n<p>\n	Temperatura no topo: 10&ordm;C durante o dia - 05&ordm;C &agrave; noite, podendo ficar em ZERO, se chover.</p>\n<p>\n	&nbsp;</p>\n<p>\n	4&ordm; dia &ndash; 22abr15: Pedra Maverick / Piscinas Jacuzzi / Mirante La Ventana / Salto Catedral</p>\n<p>\n	Ap&oacute;s caf&eacute; da manh&atilde;, sa&iacute;da para um dia de caminhada leve (aproximadamente 6km), com ida a Pedra Maverick (ponto mais alto do Monte Roraima, com 2875mt), de onde se avista a vastid&atilde;o da Gran Sabana (inclusive toda a trilha que foi feita para chegar &agrave; base). Depois, caminhada at&eacute; as Banheiras Jacuzzi (piscinas naturais onde se pode tomar banho) e ao Mirante La Ventana, onde &eacute; poss&iacute;vel admirar a impon&ecirc;ncia do Monte Kukenan, com suas diversas quedas d&rsquo;&aacute;guas, inclusive o imenso vale de florestas que h&aacute; entre os dois tepuys. As imagens s&atilde;o de tirar o f&ocirc;lego, &eacute; uma verdadeira janela com vista ao para&iacute;so, momento apropriado para ficar quieto e deixar a brisa tocar a alma. Ap&oacute;s esta experi&ecirc;ncia, ida ao Paso de Los Cristales, local adequado para a reposi&ccedil;&atilde;o de energias para os pr&oacute;ximos dias de trekking. No retorno para a o acampamento, parada no Salto</p>\n<p>\n	Catedral, onde voc&ecirc;, literalmente, se sentir&aacute; dentro de um Santu&aacute;rio. Jantar e Pernoite. Segunda noite no topo.</p>\n<p>\n	&nbsp;</p>\n<p>\n	5&ordm; dia &ndash; 23abr15: Vale dos Cristais / Ponto Triplo / El Foso</p>\n<p>\n	Caf&eacute; da manh&atilde; e sa&iacute;da com destino ao Vale dos Cristais, Ponto Triplo e El Foso, num percurso total de 24 km, sendo 4 horas de caminhada na ida e 3,5 horas de retorno, com intervalo de 1,5 horas no local para fotos, reconhecimento da &aacute;rea, descanso e alimenta&ccedil;&atilde;o. Chegada ao acampamento de origem no final da tarde. Para este dia n&atilde;o se leva todo o equipamento, apenas o essencial para usar durante o trekking. Jantar e pernoite. Terceira noite no topo.</p>\n<p>\n	&nbsp;</p>\n<p>\n	6&ordm; dia &ndash; 24abr15: Topo / Base / Acampamento rio Tek</p>\n<p>\n	Hora de retornar &agrave; civiliza&ccedil;&atilde;o. Ap&oacute;s o caf&eacute;, levantar acampamento e iniciar a descida por volta das 08h00. Descida prevista em 4 horas at&eacute; a base, com parada de aproximadamente 40 minutos para descanso e alimenta&ccedil;&atilde;o, em seguida ir para acampamento do rio Tek, com chegada prevista para as 16h00 (14km). Depois de toda a caminhada, este ser&aacute; o acampamento mais agrad&aacute;vel, pois acabaram os perrengues com o frio, molhaceiros e o c&eacute;u estrelado proporcionar&aacute; um deslumbramento. Aproveitar o restante do dia para descanso, tomar banho e produzir mais fotos. Jantar e pernoite.</p>\n<p>\n	Temperatura: 25&ordm;C, aproximadamente.</p>\n<p>\n	&nbsp;</p>\n<p>\n	7&ordm; dia &ndash;25abr15: Acampamento rio Tek / Paraitepuy / Santa Elena de Uair&eacute;n / Boa Vista</p>\n<p>\n	&Uacute;ltima etapa. Caf&eacute; da manh&atilde; e iniciar caminhada rumo &agrave; aldeia que ser&aacute; no mesmo hor&aacute;rio dos dias anteriores. Trecho de 15km com dura&ccedil;&atilde;o de 4 horas, inspe&ccedil;&atilde;o de rotina pela guarda do Inparques, e retorno para Santa Elena de Uair&eacute;n (100km), e depois para Boa Vista (220km), com previs&atilde;o de chegada &agrave;s 20h00. Todos ser&atilde;o acomodados no hotel em que tiverem reserva.</p>\n', NULL),
(28, 1, 22, 'Rafting em Presidente Figueiredo [em Grupo]', '<p>\n	Experimente essa divertida aventura em uma das principais corredeiras de Presidente Figueiredo...</p>\n', 3, 3, 3, '<p>\n	<strong style="font-size: 11.9999990463257px;">Observa&ccedil;&atilde;o: O valor dessa atividade &eacute; para o grupo formados de at&eacute; 4 pessoas.</strong></p>\n<p>\n	&nbsp;</p>\n<p>\n	O rafting &eacute; um esporte que utiliza botes infl&aacute;veis para descer rios, enfrentando corredeiras, pedras e muita &aacute;gua. Sua origem foi no Estados Unidos, quando surgiu a necessidade de explorar a Regi&atilde;o Central do Grand Canyon.</p>\n<p>\n	&nbsp;</p>\n<p>\n	Por ser um esporte que proporciona a integra&ccedil;&atilde;o do praticante &agrave; natureza sem agredi-la, e por ter diversos n&iacute;veis o esporte &eacute; muito explorado em diversas regi&otilde;es do planeta.</p>\n<p>\n	&nbsp;</p>\n<p>\n	Com isso a Eco Space Adventure leva voc&ecirc; com toda seguran&ccedil;a a sentir uma pequena dose de adrenalina nas corredeiras do Igarap&eacute; do Urubu&iacute; em Presidente Figueiredo.</p>\n<p>\n	&nbsp;</p>\n<p>\n	A atividade come&ccedil;a no Igarap&eacute; das Lages 5km rio a cima. Antes do in&iacute;cio os instrutores nos ensinam a utilizar os equipamentos e as t&eacute;cnicas de seguran&ccedil;a. E ent&atilde;o partimos para o treino que dura em m&eacute;dia 20 minutos at&eacute; uma lagoa de &aacute;gua mineral em plena floresta.</p>\n<p>\n	&nbsp;</p>\n<p>\n	Depois de alguns minutos de descanso e algumas fotos, retornamos ao igarap&eacute; e remamos at&eacute; ao encontro com o Igarap&eacute; Urubu&iacute; respons&aacute;vel pela maior divers&atilde;o do passeio.</p>\n<p>\n	&nbsp;</p>\n<p>\n	As corredeiras desse trecho s&atilde;o classificadas como N&iacute;vel III. Ondas pequenas, talvez uma pequena queda, mas sem perigo. Pode requerer habilidades de manobra significativas que ser&atilde;o coordenadas pelo instrutor.</p>\n<p>\n	&nbsp;</p>\n<p>\n	O passeio dura em torno 1h e 20min e finaliza na Corredeira do Urubu&iacute; uma das principais atra&ccedil;&otilde;es de Presidente Figueiredo</p>\n<p>\n	&nbsp;</p>\n<p>\n	<strong>Observa&ccedil;&atilde;o: O valor dessa atividade &eacute; para o grupo formados de at&eacute; 4 pessoas.</strong></p>\n', 'Presidente Figueiredo', 'Amazonas', 'CAT - Centro de Atendimento ao Turista de Presidente Figueiredo - BR 174 Km 107 s/nº - Bairro Centro', '01:20hs', '<p>\n	09:00hs &ndash; Sa&iacute;da do Ponto de Encontro</p>\n<p>\n	09:30hs &ndash; Chegado ao Igarap&eacute; de Lajes</p>\n<p>\n	10:30hs &ndash; Inicio da atividade</p>\n<p>\n	12:00hs &ndash; Chegada a Corredeira do Urubu&iacute; e finaliza&ccedil;&atilde;o da atividade</p>\n', NULL),
(29, 1, 11, 'Teste Barco Hacker', '<p>\n	<span style="font-size: 10.5pt; line-height: 115%; font-family: Calibri, sans-serif; color: rgb(20, 24, 35); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">Um projeto de cidadania, tecnologia e acesso a informa&ccedil;&atilde;o pelas ilhas e munic&iacute;pios da Amaz&ocirc;nia.</span></p>\n', 3, 3, 3, '<p>\n	Convidamos voc&ecirc; para embarque imediato dia 11 de Abril no Barco Hacker,&nbsp;um espa&ccedil;o m&oacute;vel de cidadania, tecnologia e informa&ccedil;&atilde;o que circula pelos rios da Amaz&ocirc;nia com intuito de compartilhar as melhores experi&ecirc;ncias tecnol&oacute;gicas, culturais e empreendedoras entre o p&uacute;blico a bordo e comunidades por onde passa.</p>\n<p>\n	&nbsp;</p>\n<p>\n	Nessa expedi&ccedil;&atilde;o nossos Marujos ter&atilde;o a presen&ccedil;a de Tr&ecirc;s convidados nacionais propondo oficina de Web Tv, Debates sobre Cultura Digital, Empreendedorismo nas redes sociais e m&uacute;ltiplos debates para gerar networking, trocar experi&ecirc;ncias. Garantimos horas intensas de atividades a bordo, &nbsp;com din&acirc;micas de integra&ccedil;&atilde;o, coquetel, passeios pela Orla de Manaus, pelos principais pontos trur&iacute;sticos da cidade.</p>\n<p>\n	&nbsp;</p>\n<p>\n	Forma de pagamento:</p>\n<p>\n	Boleto Banc&aacute;rio (solicitamos o envio do comprovante para comercial@praquerumo.com.br)</p>\n<p>\n	Cart&atilde;o de Cr&eacute;dito</p>\n<p>\n	&nbsp;</p>\n<p>\n	Patroc&iacute;nio&nbsp;<span style="font-size: 12px;">Ouro:</span></p>\n<p>\n	BEMOL</p>\n<p>\n	<span style="font-size: 11.9999990463257px;">Patroc&iacute;nio&nbsp;</span><span style="font-size: 12px;">Prata:</span></p>\n<p>\n	Laborat&oacute;rio SABIN</p>\n<p>\n	<span style="font-size: 12px;">Realiza&ccedil;&atilde;o: Barco Hacker e FabriQ Aceleradora</span></p>\n<p>\n	&nbsp;</p>\n<p>\n	<a href="http://www.barcohacker.com.br/" target="_blank">http://www.barcohacker.com.br/</a></p>\n<p>\n	D&uacute;vidas ou Informa&ccedil;&otilde;es: <a href="mailto:barcohacker@gmail.com">barcohacker@gmail.com</a>&nbsp;ou 9 8112 1280 (com whatsapp)</p>\n<p>\n	Quer Patrocinar essa viagem? <a href="http://goo.gl/kexpEy">http://goo.gl/kexpEy</a></p>\n', 'Manaus', 'Amazonas', 'Pier do Tropical Hotel, Ponta Negra', '07hs', '<p>\n	Embarque: Pier do Hotel</p>\n<p>\n	Dia da Expedi&ccedil;&atilde;o: 11 de Abril (S&aacute;bado)</p>\n<p>\n	Hor&aacute;rio de Embarque: 8:00hs</p>\n<p>\n	Previs&atilde;o de Chegada: 17:00hs&nbsp;</p>\n', NULL),
(30, 1, 24, 'Barco Hacker', '<p>\n	<span style="font-size:14px;">Um projeto de cidadania, tecnologia e acesso a informa&ccedil;&otilde;es pelas ilhas e munic&iacute;pios da Amaz&ocirc;nia.</span></p>\n', 3, 3, 3, '<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:14px;">Convidamos voc&ecirc; para embarque imediato dia 11 de Abril no Barco Hacker,&nbsp;um espa&ccedil;o m&oacute;vel de cidadania, tecnologia e informa&ccedil;&atilde;o que circula pelos rios da Amaz&ocirc;nia com intuito de compartilhar as melhores experi&ecirc;ncias tecnol&oacute;gicas, culturais e empreendedoras entre o p&uacute;blico a bordo e comunidades por onde passa.</span></p>\n<p style="font-size: 11.9999990463257px;">\n	&nbsp;</p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:14px;">Nessa expedi&ccedil;&atilde;o nossos Marujos ter&atilde;o a presen&ccedil;a de Tr&ecirc;s convidados nacionais propondo oficina de Web Tv, Debates sobre Cultura Digital, Empreendedorismo nas redes sociais e m&uacute;ltiplos debates para gerar networking, trocar experi&ecirc;ncias. Garantimos horas intensas de atividades a bordo, &nbsp;com din&acirc;micas de integra&ccedil;&atilde;o, coquetel, passeios pela Orla de Manaus, pelos principais pontos tur&iacute;sticos da cidade.</span></p>\n<p style="font-size: 11.9999990463257px;">\n	&nbsp;</p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:14px;">Forma de pagamento:</span></p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:14px;">Boleto Banc&aacute;rio (solicitamos o envio do comprovante para comercial@praquerumo.com.br)</span></p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:14px;">Cart&atilde;o de Cr&eacute;dito</span></p>\n<p style="font-size: 11.9999990463257px;">\n	&nbsp;</p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:14px;">Patroc&iacute;nio&nbsp;Ouro:</span></p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:14px;">BEMOL</span></p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:14px;">Patroc&iacute;nio&nbsp;Prata:</span></p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:14px;">Laborat&oacute;rio SABIN</span></p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:14px;">Realiza&ccedil;&atilde;o: Barco Hacker e FabriQ Aceleradora</span></p>\n<p style="font-size: 11.9999990463257px;">\n	&nbsp;</p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:14px;"><a href="http://www.barcohacker.com.br/" target="_blank">http://www.barcohacker.com.br/</a></span></p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:14px;">D&uacute;vidas ou Informa&ccedil;&otilde;es:&nbsp;<a href="mailto:barcohacker@gmail.com">barcohacker@gmail.com</a>&nbsp;ou 9 8112 1280 (com whatsapp)</span></p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:14px;">Quer Patrocinar essa viagem?&nbsp;<a href="http://goo.gl/kexpEy">http://goo.gl/kexpEy</a></span></p>\n', 'Manaus', 'Amazonas', 'Pier do Tropical Hotel Manaus', '07hs', '<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:14px;">Embarque: Pier do Hotel</span></p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:14px;">Dia da Expedi&ccedil;&atilde;o: 11 de Abril (S&aacute;bado)</span></p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:14px;">Hor&aacute;rio de Embarque: 8:00hs</span></p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:14px;">Previs&atilde;o de Chegada: 17:00hs&nbsp;</span></p>\n', NULL),
(31, 1, 25, 'Turismo Rural Pedagógico', '<p>\n	O turismo rural pedag&oacute;gico ou estudo do meio, nada mais &eacute; que uma pr&aacute;tica de ensino constitu&iacute;do como um elemento fundamental na interdisciplinaridade e intera&ccedil;&atilde;o do aluno com um meio ambiente. &nbsp;</p>\n', 3, 3, 3, '<p>\n	O Munic&iacute;pio de Presidente Figueiredo, estar situado a cerca de 107 km ao norte da cidade de Manaus no Estado do Amazonas &eacute; um destino com importante potencial tur&iacute;stico, consideradas por suas caracter&iacute;sticas, tais como: presen&ccedil;a de s&iacute;tios arqueol&oacute;gicos com inscri&ccedil;&otilde;es rupestres, cavernas, grutas, pared&otilde;es, lagos, igarap&eacute;s, cachoeiras, corredeiras e locais prop&iacute;cios para a pr&aacute;tica de rafting, canoagem, boia-cross, escaladas, rapel, cascading, espeleologia, trilhas contemplativas e educacionais, birdwatching entre outras atividades no mesmo seguimento tur&iacute;stico.</p>\n<p>\n	&nbsp;</p>\n<p>\n	O turismo pedag&oacute;gico &eacute; semelhante &agrave; atividade tur&iacute;stica, em que o estudo do meio visa transformar as aulas, em atividades extraclasse transportando os alunos para diferentes locais com finalidades de estudos. Estas atividades colocam os alunos em intera&ccedil;&atilde;o com o meio ambiente, gerando um circulo de rela&ccedil;&otilde;es sociais, econ&ocirc;micas e culturais interligadas as quais permitem caracterizar este tipo de atividade como uma forma de lazer e turismo aplicada &agrave; educa&ccedil;&atilde;o.</p>\n', 'Presidente Figueiredo', 'Amazonas', 'BR 174, km 107, Centro -  LOCAL DE SAIDA: CAT- CENTRO DE ATENDIMENTO AO TURISTA.', '01 Dia', '<p>\n	Nossos roteiros pedag&oacute;gicos s&atilde;o relacionados &agrave; cultura e ao estudo da natureza, onde consistem em visitas monitoradas a locais ligadas &agrave; difus&atilde;o e a biologia dos seres vivos, educa&ccedil;&atilde;o ambiental, ecologia e geol&oacute;gica e etc.</p>\n<p>\n	&nbsp;</p>\n<p>\n	SA&Iacute;DA: As 08:30hs - CAT- Centro de Atendimento ao Turista;</p>\n<p>\n	&nbsp;</p>\n<p>\n	09:00hs- Caverna do Maroaga e gruta da Judeia;</p>\n<p>\n	&nbsp;</p>\n<p>\n	13:00hs- Almo&ccedil;o- Sitio Salto do IPY;</p>\n<p>\n	&nbsp;</p>\n<p>\n	14:00hs- Fazenda Balbina;</p>\n<p>\n	&nbsp;</p>\n<p>\n	17:00hs - Retorno cidade.</p>\n', NULL),
(32, 1, 26, 'Expedição Pq. Nacional do Jaú', '<p>\n	Aventura ao cora&ccedil;&atilde;o da Selva Amaz&ocirc;nica, sua oportunidade de experimentar uma pouco do mist&eacute;rio da maior floresta tropical do mundo.</p>\n', 4, 3, 3, '<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:12px;">O Parque Nacional do Ja&uacute; &eacute; uma unidade de preserva&ccedil;&atilde;o ambiental com &aacute;rea de 2 milh&otilde;es de hectares, &eacute; a quarta maior reserva&nbsp;florestal&nbsp;do&nbsp;Brasil&nbsp;e o terceiro maior parque do mundo em&nbsp;floresta tropical&nbsp;&uacute;mida intacta.</span></p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:12px;">Certamente o Ja&uacute; reserva muitas surpresas, que pesquisadores e cientistas j&aacute; est&atilde;o tentando descobrir. Esp&eacute;cies raras de animais e plantas e fen&ocirc;menos desconhecidos n&atilde;o s&atilde;o os &uacute;nicos interesses desses cientistas. A sabedoria cabocla colabora com a ci&ecirc;ncia, pois &eacute; o melhor instrumento para se penetrar nesta fascinante regi&atilde;o.</span></p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:12px;">Em parceria com a Vermelho Anavilhanas Tours a Pra Que Rumo leva voc&ecirc; a desbravar o parque e seus principais atrativos. Como o Igarap&eacute; Preto, corredeiras do Rio Carabinani, trilha e cachoeira do Ita&uacute;bal e muitos outros.</span></p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:12px;">Esteja preparado por que ser&atilde;o dois dias de muitas aventuras e disposi&ccedil;&atilde;o.</span></p>\n<p style="font-size: 11.9999990463257px;">\n	&nbsp;</p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:12px;">Aten&ccedil;&atilde;o: As vendas dessa atividade ser&atilde;o encerradas na ter&ccedil;a-feira &agrave;s 18hs. &Eacute; necess&aacute;rio o envio do nome completo, RG e telefone celular,&nbsp;</span><span style="font-size: 11.9999990463257px;">para o email contato@praquerumo.com.br,&nbsp;</span><span style="font-size: 12px;">para solicitarmos a autoriza&ccedil;&atilde;o de acesso ao parque para a ICMBIO.</span></p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:12px;">Para a forma de pagamento via boleto banc&aacute; &eacute; necessario o envio do comprovante de pagamento para o email contato@praquerumo.com.br</span></p>\n<p style="font-size: 11.9999990463257px;">\n	<span style="font-size:12px;">Outras d&uacute;vidas e informa&ccedil;&otilde;es &nbsp;atrav&eacute;s do telefone 9 8112 1280.</span></p>\n', 'Novo Airão', 'Amazonas', 'CAT - Novo Airão, Av. Ajuricaba s/n - próximo à Delegacia do município', '2 dias', '<p>\n	Dia 1</p>\n<p>\n	Reconhecimento do Arquip&eacute;lago de Anavilhanas</p>\n<p>\n	Gruta do Madad&aacute;</p>\n<p>\n	Praia do Jauari: Praia do Sobrado, Praia do Camale&atilde;o (em conformidade do n&iacute;vel da &aacute;guas)</p>\n<p>\n	Praia da Camutirana</p>\n<p>\n	Ruinas de Velho Air&atilde;o</p>\n<p>\n	Petroglifes</p>\n<p>\n	Cachoeira do S&atilde;o Domingos</p>\n<p>\n	Final de tarde &ndash; Por do Sol nas Anavilhanas</p>\n<p>\n	&nbsp;</p>\n<p>\n	Dia 2</p>\n<p>\n	Parque Nacional do Ja&uacute;</p>\n<p>\n	Visita&ccedil;&atilde;o do Igarap&eacute; Preto para a observa&ccedil;&atilde;o da Fauna e Flora</p>\n<p>\n	Corredeira do Carabinane</p>\n<p>\n	Trilhas de florestas primaira e observa&ccedil;&atilde;o de &aacute;rvores centen&aacute;rias</p>\n<p>\n	Trilha e cachoeira do Itaubal</p>\n<p>\n	Visita&ccedil;&atilde;o de uma casa de caboclo</p>\n<p>\n	&nbsp;</p>\n<p>\n	Pernoite</p>\n<p>\n	Selva &ndash; Corredeiras do Carabinane(rede ou barraca)</p>\n<p>\n	&nbsp;</p>\n<p>\n	Alimenta&ccedil;&atilde;o</p>\n<p>\n	Almo&ccedil;o &ndash; Peixe, arroz, molho e farinha.</p>\n', NULL),
(33, 1, 27, 'Caiaque no Lago do Puraquequara', '<p>\n	O Lago do Puraquequara ainda &eacute; pouco foi explorado por atividades de ecoturismo, mas l&aacute; existe um tesouro que queremos te mostra...&nbsp;</p>\n', 3, 3, 3, '<p>\n	Em um dos extremos da cidade existe um lugar que durante um per&iacute;odo do ano, nos surpreende com sua grande transforma&ccedil;&atilde;o. Localizado pr&oacute;ximo de uma das principais atra&ccedil;&otilde;es tur&iacute;sticas da cidade o Lago do Puraquequara possui uma das mais lindas paisagens ainda pouco conhecida dentro da cidade de Manaus.</p>\n<p>\n	Antes do fim do per&iacute;odo da cheia, queremos te levar a conhecer este lugar que poucos tiveram a oportunidade de conhecer.</p>\n', 'Manaus', 'Amazonas', 'Rua Beira Rio – Puraquequara, próximo a Peixaria Canto da Peixada', '1,5hs', '<p>\n	<span style="font-size:14px;">Nosso roteiro tem in&iacute;cio &agrave;s margens do lago onde teremos instru&ccedil;&otilde;es de seguran&ccedil;a e de condu&ccedil;&atilde;o dos caiaques que ser&atilde;o nosso meio de transporte para esse passeio. Durante os primeiros minutos estaremos aprendendo algumas habilidades, nas &aacute;guas tranquilas desse lago e com uma linda vista.</span></p>\n<p>\n	<span style="font-size:14px;">Para recompensar esse treino atravessaremos o lago at&eacute; o rio negro por dentro de um igap&oacute;. Nesse trecho, observaremos como a vida sobrevive &agrave; inundada floresta durante a grande cheia dos rios.</span></p>\n<p>\n	<span style="font-size:14px;">Chegando ao Rio Negro a paisagem muda bastante e teremos como fundo o encontro das &aacute;guas com o Rio Solim&otilde;es. Seguiremos em sua dire&ccedil;&atilde;o, por sua margem durante alguns minutos at&eacute; encontrarmos a maior esp&eacute;cie de &aacute;rvore da floresta amaz&ocirc;nica, conhecida como a m&atilde;e da floresta, a grande sama&uacute;ma. Esp&eacute;cie que marca o meio do nosso passeio e onde descansaremos &nbsp;por alguns instantes contemplado sua beleza e o ambiente que a cerca.</span></p>\n<p>\n	<span style="font-size:14px;">Com o fim do descanso retornaremos ao nosso ponto de partida por dentro do Lago do Puraquequara.</span></p>\n', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dicas`
--

CREATE TABLE IF NOT EXISTS `dicas` (
  `informacoes_id` int(11) NOT NULL,
  `atividade_codigo` int(11) NOT NULL,
  PRIMARY KEY (`informacoes_id`,`atividade_codigo`),
  KEY `fk_informacoes_has_atividade_atividade1_idx` (`atividade_codigo`),
  KEY `fk_informacoes_has_atividade_informacoes1_idx` (`informacoes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dicas`
--

INSERT INTO `dicas` (`informacoes_id`, `atividade_codigo`) VALUES
(1, 1),
(2, 1),
(4, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(7, 2),
(9, 2),
(12, 2),
(16, 2),
(2, 3),
(4, 3),
(5, 3),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(7, 4),
(9, 4),
(31, 4),
(1, 5),
(2, 5),
(3, 5),
(5, 5),
(7, 5),
(1, 6),
(5, 6),
(7, 6),
(21, 6),
(27, 6),
(30, 6),
(31, 6),
(2, 10),
(3, 10),
(4, 11),
(2, 12),
(3, 12),
(4, 12),
(5, 12),
(7, 12),
(8, 12),
(9, 12),
(10, 12),
(11, 12),
(12, 12),
(13, 12),
(14, 12),
(15, 12),
(1, 13),
(2, 13),
(3, 13),
(4, 13),
(5, 13),
(7, 13),
(8, 13),
(9, 13),
(12, 13),
(13, 13),
(14, 13),
(16, 13),
(17, 13),
(19, 13),
(6, 14),
(20, 14),
(21, 14),
(22, 14),
(23, 14),
(24, 14),
(25, 14),
(7, 15),
(26, 15),
(1, 17),
(5, 17),
(7, 17),
(13, 17),
(15, 17),
(20, 17),
(21, 17),
(22, 17),
(23, 17),
(24, 17),
(25, 17),
(30, 17),
(1, 18),
(3, 18),
(5, 18),
(6, 18),
(12, 18),
(13, 18),
(21, 18),
(28, 18),
(30, 18),
(1, 19),
(3, 19),
(4, 19),
(5, 19),
(21, 19),
(28, 19),
(30, 19),
(1, 20),
(3, 20),
(4, 20),
(5, 20),
(28, 20),
(30, 20),
(3, 22),
(10, 22),
(12, 22),
(21, 22),
(30, 22),
(1, 23),
(3, 23),
(16, 23),
(22, 23),
(3, 24),
(21, 24),
(1, 26),
(3, 26),
(5, 26),
(7, 26),
(8, 26),
(13, 26),
(17, 26),
(22, 26),
(26, 26),
(27, 26),
(32, 26),
(33, 26),
(1, 27),
(3, 27),
(12, 27),
(30, 27);

-- --------------------------------------------------------

--
-- Table structure for table `elemento`
--

CREATE TABLE IF NOT EXISTS `elemento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pt` varchar(5) NOT NULL,
  `nome_en` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `elemento`
--

INSERT INTO `elemento` (`id`, `nome_pt`, `nome_en`) VALUES
(1, 'Água', 'Water'),
(2, 'Terra', 'Earth'),
(3, 'Ar', 'Air');

-- --------------------------------------------------------

--
-- Table structure for table `evento`
--

CREATE TABLE IF NOT EXISTS `evento` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `atividade_codigo` int(11) NOT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `maximo` int(11) DEFAULT NULL,
  `minimo` int(11) DEFAULT NULL,
  `disponivel` int(11) NOT NULL,
  `visivel_inicio` datetime NOT NULL,
  `visivel_fim` datetime NOT NULL,
  PRIMARY KEY (`codigo`,`atividade_codigo`),
  KEY `fk_evento_atividade1_idx` (`atividade_codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Evento relacionado com a atividade' AUTO_INCREMENT=147 ;

--
-- Dumping data for table `evento`
--

INSERT INTO `evento` (`codigo`, `atividade_codigo`, `inicio`, `fim`, `preco`, `maximo`, `minimo`, `disponivel`, `visivel_inicio`, `visivel_fim`) VALUES
(1, 1, '2015-05-19 08:00:00', '2015-05-19 10:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-18 18:00:00'),
(2, 1, '2015-05-23 10:00:00', '2015-05-23 12:00:00', 40.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-23 18:00:00'),
(3, 1, '2015-05-14 10:00:00', '2015-05-14 12:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-13 18:00:00'),
(4, 1, '2015-05-24 16:00:00', '2015-05-24 18:00:00', 40.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-20 18:00:00'),
(5, 20, '2015-05-17 09:00:00', '2015-05-17 12:00:00', 60.00, 15, NULL, 15, '2015-05-04 08:00:00', '2015-05-16 18:00:00'),
(6, 1, '2015-04-22 10:00:00', '2015-04-22 12:00:00', 25.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-20 18:00:00'),
(7, 1, '2015-05-14 15:00:00', '2015-05-14 17:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-13 18:00:00'),
(8, 1, '2015-04-26 16:00:00', '2015-04-26 18:00:00', 25.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-24 18:00:00'),
(9, 1, '2015-05-16 10:00:00', '2015-05-16 12:00:00', 40.00, 10, 0, 10, '2015-05-04 08:00:00', '2015-05-13 18:00:00'),
(10, 1, '2015-04-22 15:00:00', '2015-04-22 17:00:00', 25.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-20 18:00:00'),
(12, 1, '2015-05-14 08:00:00', '2015-05-14 10:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-13 18:00:00'),
(13, 1, '2015-04-28 08:00:00', '2015-04-28 10:00:00', 25.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-26 18:00:00'),
(14, 1, '2015-05-08 08:00:00', '2015-05-08 10:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-07 18:00:00'),
(17, 1, '2015-04-26 10:00:00', '2015-04-26 12:00:00', 40.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-24 18:00:00'),
(19, 1, '2015-05-23 12:00:00', '2015-05-23 14:00:00', 40.00, 10, 0, 10, '2015-05-04 08:00:00', '2015-05-20 18:00:00'),
(20, 1, '2015-04-15 15:00:00', '2015-04-15 17:00:00', 25.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-13 18:00:00'),
(21, 1, '2015-05-19 15:00:00', '2015-05-19 17:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-18 18:00:00'),
(22, 1, '2015-04-29 15:00:00', '2015-04-29 17:00:00', 25.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-27 18:00:00'),
(23, 1, '2015-05-23 14:00:00', '2015-05-23 16:00:00', 40.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-20 18:00:00'),
(24, 1, '2015-04-14 10:00:00', '2015-04-14 12:00:00', 25.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-12 18:00:00'),
(25, 1, '2015-05-19 10:00:00', '2015-05-19 12:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-18 18:00:00'),
(26, 1, '2015-04-18 16:00:00', '2015-04-18 18:00:00', 40.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-16 18:00:00'),
(27, 1, '2015-04-26 08:00:00', '2015-04-26 10:00:00', 40.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-24 18:00:00'),
(28, 1, '2015-04-28 10:00:00', '2015-04-28 12:00:00', 25.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-26 18:00:00'),
(29, 1, '2015-05-21 10:00:00', '2015-05-21 12:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-20 18:00:00'),
(30, 1, '2015-05-17 08:00:00', '2015-05-17 10:00:00', 40.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-13 18:00:00'),
(31, 1, '2015-04-26 12:00:00', '2015-04-26 14:00:00', 40.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-24 18:00:00'),
(32, 1, '2015-04-29 08:00:00', '2015-04-29 10:00:00', 25.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-27 18:00:00'),
(33, 1, '2015-05-20 08:00:00', '2015-05-20 10:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-19 18:00:00'),
(34, 1, '2015-05-17 10:00:00', '2015-05-17 12:00:00', 40.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-13 18:00:00'),
(35, 1, '2015-04-26 14:00:00', '2015-04-26 16:00:00', 40.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-24 18:00:00'),
(36, 1, '2015-01-18 10:00:00', '2015-01-18 12:00:00', 40.00, 5, NULL, 5, '2015-01-01 08:00:00', '2015-01-17 18:00:00'),
(37, 1, '2015-05-20 10:00:00', '2015-05-20 12:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-19 18:00:00'),
(38, 1, '2015-05-17 12:00:00', '2015-05-17 14:00:00', 40.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-13 18:00:00'),
(39, 1, '2015-04-19 08:00:00', '2015-04-19 10:00:00', 40.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-17 18:00:00'),
(40, 1, '2015-05-16 08:00:00', '2015-05-16 10:00:00', 40.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-13 18:00:00'),
(41, 1, '2015-05-20 15:00:00', '2015-05-20 17:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-19 18:00:00'),
(42, 1, '2015-05-17 14:00:00', '2015-05-17 16:00:00', 40.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-13 18:00:00'),
(43, 1, '2015-04-19 14:00:00', '2015-04-19 16:00:00', 40.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-17 18:00:00'),
(44, 1, '2015-05-16 16:00:00', '2015-05-16 18:00:00', 40.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-13 18:00:00'),
(45, 1, '2015-05-21 15:00:00', '2015-05-21 17:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-20 18:00:00'),
(46, 1, '2015-05-17 16:00:00', '0000-00-00 00:00:00', 40.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-13 18:00:00'),
(47, 1, '2015-04-19 16:00:00', '2015-04-19 18:00:00', 40.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-17 18:00:00'),
(48, 1, '2015-05-16 14:00:00', '2015-05-16 16:00:00', 40.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-13 18:00:00'),
(49, 1, '2015-05-23 16:00:00', '2015-05-23 18:00:00', 40.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-20 18:00:00'),
(50, 1, '2015-05-12 15:00:00', '2015-05-12 17:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-11 18:00:00'),
(51, 1, '2015-05-24 14:00:00', '2015-05-24 16:00:00', 40.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-20 18:00:00'),
(52, 1, '2015-04-14 08:00:00', '2015-04-14 10:00:00', 25.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-12 18:00:00'),
(53, 1, '2015-05-21 08:00:00', '2015-05-21 10:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-20 18:00:00'),
(54, 1, '2015-05-12 10:00:00', '2015-05-12 12:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-11 18:00:00'),
(55, 1, '2015-04-29 10:00:00', '2015-04-29 12:00:00', 25.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-27 18:00:00'),
(56, 1, '2015-05-16 12:00:00', '2015-05-16 14:00:00', 40.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-13 18:00:00'),
(57, 10, '2015-04-18 09:00:00', '2015-04-18 15:00:00', 120.00, 10, 0, 10, '2015-04-06 08:00:00', '2015-04-17 18:00:00'),
(58, 2, '2015-05-10 09:00:00', '2015-05-10 15:00:00', 60.00, 15, NULL, 15, '2015-05-04 08:00:00', '2015-05-08 18:00:00'),
(59, 2, '2015-05-24 09:00:00', '2015-05-24 15:00:00', 60.00, 15, NULL, 15, '2015-05-04 08:00:00', '2015-05-23 18:00:00'),
(60, 3, '2014-11-15 19:00:00', '2014-11-16 15:00:00', 120.00, 10, NULL, 10, '2014-11-01 00:00:00', '2014-11-14 18:00:00'),
(61, 4, '2014-12-06 09:00:00', '2014-12-07 16:00:00', 240.00, 15, NULL, 15, '2014-11-01 00:00:00', '2014-12-05 18:00:00'),
(62, 5, '2014-12-06 08:00:00', '2014-12-06 13:00:00', 150.00, 10, NULL, 10, '2014-11-01 00:00:00', '2014-12-05 18:00:00'),
(63, 12, '2015-03-01 08:00:00', '2015-03-01 16:00:00', 110.00, 8, NULL, 3, '2015-01-01 08:00:00', '2015-02-28 18:00:00'),
(64, 1, '2015-05-15 08:00:00', '2015-05-15 10:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-14 18:00:00'),
(65, 3, '2014-12-06 18:00:00', '2014-12-07 15:00:00', 120.00, 10, NULL, 10, '2014-11-01 00:00:00', '2014-11-29 00:00:00'),
(66, 1, '2015-05-12 08:00:00', '2015-05-12 10:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-11 18:00:00'),
(67, 2, '2015-03-01 09:00:00', '2015-03-01 16:00:00', 60.00, 15, NULL, 15, '2015-01-01 08:00:00', '2015-02-28 18:00:00'),
(68, 4, '2014-12-20 09:00:00', '2014-12-21 16:00:00', 120.00, 15, NULL, 15, '2014-11-01 00:00:00', '2014-12-19 18:00:00'),
(69, 13, '2015-06-27 09:00:00', '2015-06-28 17:00:00', 220.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-06-26 18:00:00'),
(70, 14, '2015-04-19 08:00:00', '2015-04-19 15:00:00', 150.00, 10, NULL, 7, '2015-04-06 08:00:00', '2015-04-17 18:00:00'),
(71, 14, '2014-12-21 12:30:00', '2014-12-21 17:00:00', 150.00, 10, NULL, 10, '2014-12-01 00:00:00', '2014-12-20 18:00:00'),
(72, 14, '2014-12-14 07:30:00', '2014-12-14 11:30:00', 150.00, 10, NULL, 10, '2014-12-01 00:00:00', '2014-12-13 18:00:00'),
(73, 14, '2014-12-14 12:30:00', '2014-12-14 17:00:00', 150.00, 10, NULL, 10, '2014-12-01 00:00:00', '2014-12-13 18:00:00'),
(74, 15, '2014-12-13 08:00:00', '2014-12-13 15:00:00', 150.00, 8, NULL, 8, '2014-12-01 00:00:00', '2014-12-10 18:00:00'),
(75, 15, '2014-12-14 08:00:00', '2014-12-14 15:00:00', 150.00, 8, NULL, 8, '2014-12-01 00:00:00', '2014-12-11 15:00:00'),
(76, 15, '2015-01-18 08:00:00', '2015-01-18 15:00:00', 150.00, 10, NULL, 10, '2015-01-01 08:00:00', '2015-01-16 18:00:00'),
(77, 15, '2014-12-21 08:00:00', '2014-12-21 15:00:00', 150.00, 10, NULL, 10, '2014-12-01 00:00:00', '2014-12-18 18:00:00'),
(78, 15, '2014-12-27 08:00:00', '2014-12-27 15:00:00', 150.00, 10, NULL, 0, '2014-12-01 00:00:00', '2014-12-25 18:00:00'),
(80, 6, '2015-02-16 14:00:00', '2015-02-16 18:00:00', 100.00, 10, NULL, 0, '2014-12-01 00:00:00', '2015-02-15 18:00:00'),
(81, 14, '2015-05-02 08:00:00', '2015-05-02 15:00:00', 150.00, 10, NULL, 10, '2015-04-23 08:00:00', '2015-05-01 18:00:00'),
(82, 6, '2014-12-13 14:00:00', '2014-12-13 18:00:00', 100.00, 10, NULL, 0, '2014-12-01 00:00:00', '2014-12-12 18:00:00'),
(83, 6, '2014-12-13 08:00:00', '2014-12-13 12:00:00', 100.00, 0, NULL, 10, '2014-12-01 00:00:00', '2014-12-12 18:00:00'),
(86, 2, '2015-02-22 08:00:00', '2015-02-22 15:00:00', 60.00, 15, NULL, 0, '2015-02-16 08:00:00', '2015-02-21 18:00:00'),
(87, 1, '2015-05-08 10:00:00', '2015-05-08 12:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-07 18:00:00'),
(88, 1, '2015-05-22 08:00:00', '2015-05-22 10:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-21 18:00:00'),
(89, 1, '2015-04-16 10:00:00', '2015-04-16 12:00:00', 25.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-14 18:00:00'),
(90, 1, '2015-05-24 08:00:00', '2015-05-24 10:00:00', 40.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-20 18:00:00'),
(91, 1, '2015-05-15 15:30:00', '2015-05-15 18:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-14 18:00:00'),
(92, 1, '2015-05-22 15:30:00', '2015-05-22 18:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-21 18:00:00'),
(93, 1, '2015-04-24 10:00:00', '2015-04-24 12:00:00', 25.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-22 18:00:00'),
(94, 1, '2015-05-24 10:00:00', '2015-05-24 12:00:00', 40.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-20 18:00:00'),
(95, 1, '2015-04-23 15:00:00', '2015-04-23 17:00:00', 25.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-21 18:00:00'),
(96, 1, '2015-05-22 10:00:00', '2015-05-22 12:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-21 18:00:00'),
(97, 1, '2015-04-23 10:00:00', '2015-04-23 12:00:00', 25.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-21 18:00:00'),
(98, 1, '2015-05-24 12:00:00', '2015-05-24 14:00:00', 40.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-20 18:00:00'),
(99, 1, '2015-05-15 10:00:00', '2015-05-15 12:00:00', 25.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-14 18:00:00'),
(101, 6, '2015-04-19 14:00:00', '0000-00-00 00:00:00', 150.00, 15, NULL, 15, '2015-04-06 08:00:00', '2015-04-17 18:00:00'),
(102, 15, '2015-03-21 09:00:00', '2015-03-21 15:00:00', 150.00, 8, NULL, 8, '2015-03-09 08:00:00', '2015-03-19 18:00:00'),
(103, 15, '2015-01-01 09:00:00', '2015-01-01 15:00:00', 150.00, 8, NULL, 8, '2015-01-01 08:00:00', '2015-01-01 18:00:00'),
(104, 15, '2015-02-01 09:00:00', '2015-02-01 15:00:00', 150.00, 8, NULL, 8, '2015-01-01 08:00:00', '2015-01-30 18:00:00'),
(105, 10, '2015-06-04 08:00:00', '2015-06-04 15:00:00', 120.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-06-03 18:00:00'),
(106, 17, '2015-04-20 07:00:00', '2015-04-20 13:00:00', 350.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-17 18:00:00'),
(107, 18, '2015-05-01 08:00:00', '2015-05-01 15:00:00', 150.00, 10, NULL, 10, '2015-04-28 08:00:00', '2015-04-30 18:00:00'),
(108, 19, '2015-05-31 10:00:00', '2015-05-31 15:00:00', 130.00, 10, NULL, 10, '2015-05-04 06:00:00', '2015-05-30 18:00:00'),
(109, 1, '2015-05-23 08:00:00', '2015-05-23 10:00:00', 40.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-20 18:00:00'),
(110, 20, '2015-05-17 13:00:00', '2015-05-17 16:00:00', 60.00, 15, NULL, 15, '2015-05-04 08:00:00', '2015-05-16 18:00:00'),
(111, 10, '2015-04-03 08:00:00', '2015-04-03 15:00:00', 120.00, 10, NULL, 10, '2015-03-27 00:00:00', '2015-04-02 18:00:00'),
(112, 10, '2015-02-16 08:00:00', '2015-02-16 15:00:00', 120.00, 10, NULL, 10, '2015-02-11 00:00:00', '2015-02-15 18:00:00'),
(113, 12, '2015-04-21 08:00:00', '2015-04-21 16:00:00', 110.00, 8, NULL, 8, '2015-04-06 08:00:00', '2015-04-19 18:00:00'),
(114, 13, '2015-04-19 08:00:00', '2015-04-20 15:00:00', 220.00, 10, NULL, 10, '2015-04-06 08:00:00', '2015-04-17 18:00:00'),
(115, 21, '2015-04-18 15:00:00', '2015-04-25 20:00:00', 1840.00, 5, 5, 5, '2015-03-09 08:00:00', '2015-03-15 18:00:00'),
(116, 22, '2015-04-26 09:00:00', '2015-04-26 12:00:00', 300.00, 1, NULL, 1, '2015-04-23 08:00:00', '2015-04-25 18:00:00'),
(117, 22, '2015-05-02 09:00:00', '2015-05-02 12:00:00', 300.00, 1, NULL, 0, '2015-04-23 08:00:00', '2015-05-01 18:00:00'),
(118, 22, '2015-05-02 14:00:00', '2015-05-02 17:00:00', 300.00, 1, NULL, 0, '2015-04-23 08:00:00', '2015-05-01 18:00:00'),
(119, 22, '2015-04-26 14:00:00', '2015-04-26 17:00:00', 300.00, 1, NULL, 1, '2015-04-23 08:00:00', '2015-04-25 18:00:00'),
(120, 22, '2015-04-03 09:00:00', '2015-04-03 12:00:00', 300.00, 1, NULL, 1, '2015-03-16 08:00:00', '2015-04-02 18:00:00'),
(121, 22, '2015-05-09 14:00:00', '2015-05-09 16:00:00', 300.00, 1, NULL, 1, '2015-05-04 08:00:00', '2015-05-08 18:00:00'),
(122, 22, '2015-05-03 09:00:00', '2015-05-03 12:00:00', 300.00, 1, NULL, 1, '2015-04-23 08:00:00', '2015-05-02 18:00:00'),
(123, 22, '2015-05-03 14:00:00', '2015-05-03 17:00:00', 300.00, 1, NULL, 1, '2015-04-23 08:00:00', '2015-05-02 18:00:00'),
(124, 22, '2015-04-25 09:00:00', '2015-04-25 12:00:00', 300.00, 1, NULL, 1, '2015-04-23 08:00:00', '2015-04-24 18:00:00'),
(125, 22, '2015-05-10 09:00:00', '2015-05-10 11:00:00', 300.00, 1, NULL, 1, '2015-05-04 08:00:00', '2015-05-09 18:00:00'),
(126, 22, '2015-05-10 14:00:00', '2015-05-10 16:00:00', 300.00, 1, NULL, 1, '2015-05-04 08:00:00', '2015-05-09 18:00:00'),
(127, 22, '2015-05-09 09:00:00', '2015-05-09 11:00:00', 300.00, 1, NULL, 1, '2015-05-04 08:00:00', '2015-05-08 18:00:00'),
(128, 22, '2015-04-25 14:00:00', '2015-04-25 17:00:00', 300.00, 1, NULL, 1, '2015-04-23 08:00:00', '2015-04-24 18:00:00'),
(129, 24, '2015-04-11 08:00:00', '2015-04-11 17:00:00', 80.00, 50, NULL, 48, '2015-03-17 06:00:00', '2015-04-09 18:00:00'),
(130, 6, '2015-03-29 14:00:00', '2015-03-29 17:00:00', 100.00, 10, NULL, 9, '2015-03-17 06:00:00', '2015-03-28 18:00:00'),
(131, 26, '2015-04-18 07:30:00', '2015-04-19 16:00:00', 250.00, 8, NULL, 8, '2015-04-06 08:00:00', '2015-04-15 18:00:00'),
(132, 27, '2015-05-16 08:00:00', '2015-05-16 10:00:00', 60.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-15 18:00:00'),
(133, 27, '2015-05-16 10:00:00', '2015-05-16 12:00:00', 60.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-15 18:00:00'),
(134, 27, '2015-05-16 12:00:00', '2015-05-16 14:00:00', 60.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-15 18:00:00'),
(135, 27, '2015-05-02 08:00:00', '2015-05-02 10:00:00', 60.00, 10, NULL, 10, '2015-04-28 08:00:00', '2015-05-01 18:00:00'),
(136, 27, '2015-05-02 10:00:00', '2015-05-02 12:00:00', 60.00, 10, NULL, 10, '2015-04-28 08:00:00', '2015-05-01 18:00:00'),
(137, 27, '2015-05-02 14:00:00', '2015-05-02 16:00:00', 60.00, 10, NULL, 10, '2015-04-28 08:00:00', '2015-05-01 18:00:00'),
(138, 27, '2015-05-23 10:00:00', '2015-05-23 12:00:00', 60.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-22 18:00:00'),
(139, 27, '2015-05-23 08:00:00', '2015-05-23 10:00:00', 60.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-22 18:00:00'),
(140, 27, '2015-05-23 12:00:00', '2015-05-23 14:00:00', 60.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-22 18:00:00'),
(141, 27, '2015-05-23 14:00:00', '2015-05-23 16:00:00', 60.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-22 18:00:00'),
(142, 27, '2015-05-30 08:00:00', '2015-05-30 10:00:00', 60.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-29 18:00:00'),
(143, 27, '2015-05-30 10:00:00', '2015-05-30 12:00:00', 60.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-29 18:00:00'),
(144, 27, '2015-05-30 12:00:00', '2015-05-30 14:00:00', 60.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-29 18:00:00'),
(145, 27, '2015-05-30 14:00:00', '2015-05-30 16:00:00', 60.00, 10, NULL, 10, '2015-05-04 08:00:00', '2015-05-29 18:00:00'),
(146, 12, '2015-06-20 08:00:00', '2015-06-20 17:00:00', 110.00, 9, NULL, 9, '2015-05-04 08:00:00', '2015-06-19 18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `fatura`
--

CREATE TABLE IF NOT EXISTS `fatura` (
  `id` varchar(32) NOT NULL,
  `evento_codigo` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`,`evento_codigo`,`usuario_id`),
  KEY `fk_evento_has_usuario_usuario1_idx` (`usuario_id`),
  KEY `fk_evento_has_usuario_evento1_idx` (`evento_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fatura`
--

INSERT INTO `fatura` (`id`, `evento_codigo`, `usuario_id`, `data`) VALUES
('0576846D2F034A1882AAE5AFA5A33DE9', 113, 45, '2015-03-10 16:13:36'),
('0596727FE68A4479B46E1CD9D8E480DE', 1, 10, '2014-10-26 11:56:05'),
('059DD91568FB44A78619083E6A2ED900', 57, 64, '2015-01-16 05:31:08'),
('05CC8ED60AF341428D916F06810102C0', 95, 60, '2015-01-10 13:14:02'),
('06AF5AB79D234B97AECC6E38A7E75A3E', 2, 7, '2014-11-01 11:47:47'),
('0A52FCF75CC24F8293164ADC6F276130', 81, 45, '2014-12-12 08:56:02'),
('0A6696DB47024A43A69977CE504BD939', 113, 76, '2015-02-16 11:59:16'),
('0B2F7791576A4F4C98ECE30DB499F1C4', 7, 8, '2014-10-15 11:53:20'),
('0C05A2A492934E3382743965D07EE43C', 101, 61, '2015-01-14 19:18:02'),
('0DCB3749FCF04127B67373BEF0BE0A39', 1, 7, '2014-10-27 06:39:44'),
('0E4CF9A6CAE14D768F4D13730BF3DEBD', 63, 20, '2014-11-27 07:57:24'),
('0E61B051C3B84847BD5B93C9C9189FB4', 4, 11, '2014-10-30 22:50:17'),
('0E9248CCEFC04266800072DB1AEA7D72', 4, 11, '2014-10-30 23:27:46'),
('0F07D68B58224601A81851FEEDB5DA24', 4, 11, '2014-10-30 22:21:38'),
('0F617CFC5E7E4560948B76CBA7A7A5D4', 113, 72, '2015-02-12 11:33:50'),
('0FEAFB18919544A293DDB24F8DE76EED', 69, 29, '2014-11-28 10:27:27'),
('1194C54A7AA5487EA6D2692C8190B25A', 38, 18, '2014-11-21 21:41:13'),
('15B34CF19F984054BA824553CF990A23', 67, 40, '2014-12-11 11:48:26'),
('17E38F2C6C9C4D5CBC65D61A61BEB38E', 1, 11, '2014-10-27 06:15:12'),
('1968C105DD224C92834C67CEFA02D433', 1, 10, '2014-10-26 11:56:20'),
('1A1C50CCF9DC41499253E10095C87099', 7, 8, '2014-10-15 11:53:38'),
('1A6231358E9647398BB1317B51A9444A', 103, 50, '2014-12-19 12:47:54'),
('1C075344B3BD4C41A382A1131D7B296B', 3, 11, '2014-10-27 09:54:53'),
('1C977B4EAE4042AD961E15306A6F36B3', 109, 65, '2015-02-12 13:05:21'),
('1D27F309DAE948308411007332A488F0', 2, 7, '2014-10-29 15:24:39'),
('1EC2C71650CF496CB6F5C48A53EA8F9C', 10, 41, '2014-12-12 07:58:21'),
('200C9DD2DF84412D9BB54A92391A5C09', 2, 11, '2014-10-27 10:51:34'),
('221EDB5EB5464EE2B63976779529D8A7', 101, 6, '2015-01-25 03:32:01'),
('22EC29B3DD294259A922FB1E46881B16', 64, 22, '2014-11-27 18:43:53'),
('29EA0EFB45474D6CBB5A24DEA3382294', 66, 25, '2014-11-28 06:50:33'),
('2A4330BA3E1949ECA7E2726C2790165B', 108, 88, '2015-03-20 06:37:38'),
('2ABF7FEA3BB6452EB0E3A04908718BE9', 42, 109, '2015-04-08 10:16:49'),
('2C93BF9BF77E426B965A0C04228AD0A9', 4, 11, '2014-11-01 10:56:55'),
('2DD32D2AD66045DE943AE86555F8533E', 36, 17, '2014-11-16 14:25:02'),
('2E9CE314B41D45DFB52D467F1616CB45', 2, 14, '2014-11-01 12:21:04'),
('372965F9994F4F3D9686A05D0B150A95', 42, 108, '2015-04-08 10:12:45'),
('389CEDCC4E034647AA4E7E44C89760DF', 9, 11, '2014-11-01 13:01:05'),
('3968D9866B904FA984A7FFAE99E5817F', 105, 86, '2015-03-18 12:51:13'),
('3B01C481EC304A018805FD577F81AAB4', 86, 62, '2015-01-15 14:50:37'),
('3C063B3CE66C4C6092D78AB57085A880', 1, 11, '2014-10-27 10:25:20'),
('3C31C4B5734B4E5C9033209E2EB97C85', 1, 11, '2014-11-09 23:10:13'),
('3C49AD4E53544BE9B5496E8C6CA9B6F9', 110, 120, '2015-04-20 18:44:19'),
('3D6B1DF7192B48D7B458897C42B4372A', 108, 87, '2015-03-19 14:01:39'),
('3DB9106EBFBB45EC88FB3601E5FCE195', 108, 101, '2015-04-01 05:56:29'),
('3DE6B717BAD147F59AC0814BC241F2DF', 63, 37, '2015-01-30 04:49:16'),
('3E2C3D3BE45445D0BF9A1633D2EF2DDD', 87, 53, '2014-12-21 16:08:34'),
('3E3B8BEFD7EB45789F9ED5BA96A34D56', 7, 7, '2014-11-01 12:07:15'),
('3FD70514F7184D0AB9535A6BB2FE1DFE', 1, 8, '2014-10-30 07:12:42'),
('42AE40B3035F40B38249A3CB36F9663B', 1, 11, '2014-10-29 21:27:55'),
('44C5A5776D2A4E099239D724B1A32F04', 4, 6, '2014-10-11 13:09:15'),
('4590574CAC8349E283F894C1E8DDE183', 4, 11, '2014-10-30 22:53:27'),
('46F4869FFEBF441F802C465074F75AE1', 66, 26, '2014-11-28 06:55:55'),
('495518E12C90477A9A87916E2458E48E', 2, 11, '2014-10-29 15:03:36'),
('49CA75C3EFCA48DD89E02C939D200733', 109, 48, '2015-02-13 15:26:54'),
('4B4C27F9AC4F4BF9BD565201462604C7', 63, 59, '2015-01-02 14:38:15'),
('4BD8A88274D647D791A304BDE23F600E', 58, 49, '2015-01-29 13:37:59'),
('4D891966E8374B259DA59072DDBFC0C2', 58, 33, '2014-12-03 09:35:00'),
('5077E287B5E948A9B09B622533061E7D', 99, 55, '2014-12-25 20:06:47'),
('54998C9CBC9E4FF7BDACD17C60A135F5', 129, 104, '2015-04-02 00:04:53'),
('5B09296EEB9846C4B5ED03FB9430FCD7', 58, 69, '2015-01-27 18:22:44'),
('5BA0B6D3AE7543119406713E2B9FCFD7', 108, 91, '2015-03-20 11:24:07'),
('5E317B0B59344B23AD7471C4A59DC4DD', 1, 11, '2014-10-30 22:16:34'),
('5E6030C80E9C4BFCAFC006151992A301', 6, 11, '2014-11-01 12:49:34'),
('5F111B1D18524E5CB051434C386F3169', 113, 81, '2015-03-10 11:30:44'),
('5F8D4129130F4FFD99A44962F74E6A93', 5, 11, '2014-11-01 10:59:01'),
('5FFA06B901454BA39F3B2D37E1143082', 2, 7, '2014-10-29 15:10:06'),
('60CD4E11275F46F9B041AE99AFF7AD02', 58, 67, '2015-01-27 05:52:29'),
('62A43B8EA08F4EF39B54573477A73CE9', 4, 11, '2014-10-30 23:26:16'),
('637F04D112524634932785C47CEAAC52', 129, 102, '2015-04-01 08:20:31'),
('6402E55C0FCA4E46AE5E753423660A65', 2, 7, '2014-11-01 13:18:08'),
('650B45DD387348C5B7B6FA9478D700B9', 70, 29, '2015-04-14 07:59:28'),
('658BB4FCA5594698B5A6984CA7C95735', 2, 11, '2014-10-27 10:40:29'),
('67E65ED1263F48CFA74D9ABF815227EF', 2, 11, '2014-10-27 10:58:12'),
('6A0E497A2B804A6D9C71661AC9500382', 109, 74, '2015-02-15 06:34:18'),
('6D0DF20A07BA4013B202B36DB9B21C45', 4, 11, '2014-10-30 23:18:00'),
('6DE9524567D6477F90CD4C8D55EDE82E', 66, 65, '2015-01-21 08:31:24'),
('6E12931614BD44D5AF6130E9CF6D9DA1', 1, 10, '2014-10-26 11:57:09'),
('6ED2CD7B178E419F850DC731A61BD7A1', 113, 80, '2015-03-10 11:22:56'),
('729FC8087E954142925725667CA423D2', 4, 11, '2014-10-30 23:12:54'),
('732F8E2BC1244228BE64DF2E1F7E425C', 81, 122, '2015-04-24 18:33:17'),
('74828ECB6BB8473D8FD26DBABAE84DD0', 113, 72, '2015-02-12 11:33:53'),
('74B83D6358D24E8A9FDAF5156BDE2D18', 108, 95, '2015-03-24 09:05:49'),
('762E7F7BB9DC4F0980C1015B8335316A', 130, 97, '2015-03-27 15:03:47'),
('779A5CF47C044E73A93032353AF4B3B8', 38, 53, '2015-01-28 19:22:34'),
('799CDB303CCB4B8B889BD1A132F29810', 105, 65, '2015-01-21 08:28:34'),
('7A75D8A6C9AA4A2D8778214641ACE752', 108, 89, '2015-03-23 09:03:50'),
('7DCBA43CECC846BF91A20DC6E6B89B0B', 67, 28, '2014-11-28 09:37:43'),
('7E6AD26E1A2A4F9A9258C48674901489', 108, 93, '2015-03-23 13:41:44'),
('7FE42E91B6034AF292F3B880C3DFCC96', 108, 106, '2015-04-03 16:45:02'),
('817D00B0CA2A444888812C18E8CD9456', 129, 104, '2015-04-05 22:58:36'),
('81927C3262FD4AD2B1576E1F1ACC5604', 42, 112, '2015-04-14 05:54:16'),
('83B23171A8D74FEA818DFF980EFFA499', 69, 56, '2014-12-26 04:39:09'),
('85E3624963CA493AB543C027C43EA14D', 58, 32, '2014-11-29 17:57:00'),
('867D9AA24E7E4E11A04C8ACC74E99265', 1, 11, '2014-11-09 23:06:04'),
('86D940F65C2247838F9395CA602794C7', 63, 59, '2015-01-27 16:44:59'),
('86F2C6182B84424686ABAE3DCD2A9AA6', 99, 55, '2014-12-28 19:09:32'),
('88F0F97189EF47ACB534F33B8291A082', 58, 68, '2015-01-27 09:29:01'),
('8A9920A9034E4075B5C028AC27BB14BF', 123, 105, '2015-04-02 11:46:37'),
('8C429E34F35B496C8A4EC9B4DDA0A445', 109, 75, '2015-02-15 17:26:06'),
('8C87EDD6C9C44CC484A4D885FEE39E79', 2, 7, '2014-11-01 13:20:33'),
('8D7281CD74B94F37B221575EB654A3B5', 3, 11, '2014-10-27 09:51:53'),
('922BC8F35C9D40F6929B7CA14873B26F', 1, 11, '2014-10-27 06:14:19'),
('92FD6EF3B2F744BC80961B25E0F92752', 109, 71, '2015-02-11 15:24:09'),
('9562CFC733884685A9A554B483767587', 6, 14, '2014-11-01 16:20:30'),
('9798F1D30B79445791357877216EAA3D', 58, 66, '2015-01-27 05:49:29'),
('9889D07CE31A4D098B6B9DB36021C3F5', 108, 92, '2015-03-23 10:23:37'),
('9959315C36404867BEC94CAAFB5D5392', 58, 21, '2014-12-01 08:28:33'),
('9985BD87CE44446A976B9D6E73ECD3D1', 110, 117, '2015-04-17 11:58:32'),
('9A6BEB9F452B4DA88259984C72D6CCDA', 63, 23, '2014-11-28 06:39:33'),
('9B911CA3D48C4A57B32EF29C5970532E', 104, 11, '2014-12-10 18:07:33'),
('9C12E76E113E491CBE01BEFF7A2B353F', 1, 11, '2014-11-09 22:51:29'),
('9C27D91A42AC4D2F818F908FA61FA597', 13, 6, '2014-10-27 10:13:12'),
('9D1EE3530D114F7ABA41851995EBF8A7', 55, 21, '2014-11-27 10:49:04'),
('9D7668F465ED4C16A222327DFC25157F', 104, 11, '2014-12-10 19:15:52'),
('9DD4049E81EF496798F53DFF70F4E3C1', 106, 58, '2015-01-02 04:47:20'),
('9EA80514C5DF47ABA128F1D401B7F56D', 36, 51, '2014-12-21 15:22:19'),
('9FDC646025FD446F8469DEA72A5D0E62', 10, 43, '2014-12-12 09:14:36'),
('A1D6725E2E5441DEAF792A85BBF1AA51', 113, 82, '2015-03-13 08:17:34'),
('A3177E313DB0431FB212D26560DF326D', 4, 8, '2014-10-30 07:14:31'),
('A43FE09A90794A428A4192D182A19086', 19, 11, '2014-11-09 15:44:49'),
('A446F7081CAE43EE81E23A90F0E5C123', 4, 11, '2014-11-01 10:55:27'),
('A51C1F98426E40E187DC74DF9A7EC31A', 1, 7, '2014-10-27 05:53:47'),
('A6413E164A7F449B9C50EADE3059C349', 9, 11, '2014-11-01 13:19:14'),
('A7752F229125422D99E69B5B64FE606F', 10, 42, '2014-12-12 08:01:14'),
('A8429F4F888B4A7BA8372296CADC3169', 57, 36, '2014-12-04 11:36:01'),
('AB81E0C8C6814A50858934DEA26DFCFC', 58, 65, '2015-01-27 15:55:47'),
('ABBD73493C3E46588EE6F85364492699', 132, 123, '2015-04-29 18:39:55'),
('ABD07618F8EA4C7C8C3C9F1BA034AAA1', 69, 57, '2014-12-26 05:29:56'),
('ABE5D2BEA3A44A22967D61197C83FFBA', 63, 65, '2015-01-21 08:34:53'),
('ABF39EC16AD840DE8C3C09DC1C94595E', 69, 29, '2014-12-05 09:23:34'),
('AD08BA3953FE4A3F8D3C5F211C0C5C44', 67, 27, '2014-11-28 08:48:50'),
('AF39DD19058643E9B51DE0726AAAE66C', 1, 11, '2014-11-09 22:50:00'),
('AF3BE758D4F54153A27E1865B5D7269E', 63, 77, '2015-02-25 05:27:11'),
('AFA3D84C5EDA41899B3F1B52E7A7E942', 2, 7, '2014-11-01 12:27:41'),
('AFB92C7B7855490CA2EB233BA9510F51', 104, 11, '2014-12-10 19:08:00'),
('B12799D060BB492DB3368E2646D72788', 58, 49, '2015-01-30 14:56:29'),
('B1FE0693B90148BBBFF887B0F295ADED', 129, 85, '2015-03-18 07:32:11'),
('B22434DAB5AE45BA8710A69FAB5C4ADD', 129, 100, '2015-04-01 04:26:31'),
('B28BFDEA4A394417B9CDA047399AE5F8', 19, 7, '2014-11-09 15:40:00'),
('B3A677E16C584364AC31FAD22B5A8A65', 108, 89, '2015-03-20 06:40:47'),
('B3D950B840EB473DBEFD281B20938FE1', 7, 7, '2014-11-01 12:08:22'),
('B3FF2BAF5E69413EA4AF49896A58795B', 104, 11, '2014-12-10 16:54:14'),
('B561C1A545034051A954ED0D2F284022', 69, 39, '2014-12-05 09:08:55'),
('B607B3517C5E4ED980E084D20F3566DB', 63, 19, '2014-11-26 04:31:45'),
('B6D29EF58DDB4D7F8CB79F8F48D7FB7F', 1, 11, '2014-10-29 21:30:14'),
('B918DCAF695B4B1A9F32D6694B633B5C', 1, 11, '2014-11-01 10:46:16'),
('BC20FB99CA1045A68D59FF9A303B6789', 9, 11, '2014-10-29 21:33:32'),
('BC491CD0FF7A4F288F5A8EA48BEB7E7A', 3, 11, '2014-10-27 09:53:00'),
('BC5E74C3856F4B91B5AA124291F242B5', 19, 7, '2014-11-09 15:47:10'),
('BD69A3A90EBA48DB8E79BC5A41EAF9FB', 66, 49, '2014-12-17 09:20:36'),
('BE51DECAAC934CC3A228B5699010E892', 19, 11, '2014-11-09 16:44:40'),
('BF3702ADBE70451BB543292F546B01D5', 122, 116, '2015-04-17 10:57:52'),
('C007A13E64854588A21D8EA81F600F6F', 42, 113, '2015-04-14 15:41:05'),
('C03C12286B864927B7178C9E2A08DCFE', 67, 30, '2014-11-28 12:23:39'),
('C0AB791F94ED46CDA86F01C868B3711B', 10, 46, '2014-12-12 09:07:27'),
('C30DCC467F82496E9BD01299FB366846', 3, 7, '2014-10-29 15:06:05'),
('C409992DE4A249D9B686482D5100A71A', 1, 11, '2014-11-09 23:14:43'),
('C7F9218E8FCA48258513499C1A586247', 108, 90, '2015-03-20 07:58:53'),
('C8C2CEA85DE847C9AFF5CB0DB7C471DC', 101, 65, '2015-01-21 08:23:41'),
('C985D2A68F6746818F65670C6EDEF20F', 42, 49, '2015-01-29 13:51:09'),
('CA23A97D07A3479F910F4AC7BFFEB777', 10, 43, '2014-12-12 08:03:34'),
('CAC7F5A9E3F9462085C4832D4E32D36A', 1, 8, '2014-10-30 07:01:50'),
('CB866EC829254CBE9D59F8AD24C3C38F', 108, 96, '2015-03-25 08:01:22'),
('CBA7EDA597424B329030D5F966A2CC88', 5, 11, '2014-11-01 10:57:47'),
('CDE817F7223143FBB991F7BE3AC13811', 2, 11, '2014-10-29 14:59:36'),
('CE106FFD3E5646B6B47508A0B9B9F227', 7, 6, '2015-04-10 15:16:41'),
('CEFDA076D96F4371BB27A0A387526A10', 1, 6, '2014-10-11 12:43:35'),
('CF574A42D9F4407C84B3B52BC3A1F35F', 114, 114, '2015-04-16 07:15:02'),
('D0E1354D851A49669F007979562D46CD', 43, 115, '2015-04-17 09:04:33'),
('D10233D0ADE4442ABD1CDC47FE09CCF6', 129, 107, '2015-04-05 00:00:00'),
('D1A788F2B4D7409DA5BC72C04E164AE5', 114, 73, '2015-02-12 12:41:55'),
('D32A8C6EED47453D8EDB8646B5DAE3A4', 9, 11, '2014-10-29 21:35:22'),
('D42663859B3A4C039379CA7572BC4925', 10, 44, '2014-12-12 08:19:45'),
('D467CE69052947928A736F092BBFA43D', 12, 70, '2015-01-29 11:49:53'),
('D5C5E8CBF9D34690AA565409E445C78B', 36, 52, '2014-12-21 15:43:21'),
('DB96606E4C6D47B792B2F71991ACB0A0', 10, 11, '2014-11-01 10:39:27'),
('DBB4A74B168345C8984BD65F5015A1B9', 19, 7, '2014-11-09 15:48:26'),
('DC70B269BF8C4E179D9A6D015D8503A9', 23, 17, '2015-01-18 13:20:58'),
('DE49BD6BBDDC439B895AC86855B7F5F8', 42, 59, '2015-01-28 16:17:25'),
('DF21214CB3C24CB6BCDE62D347333EA1', 66, 24, '2014-11-28 06:43:08'),
('E0A10F00BA5F4B6FA62D4B82B72D3AA0', 108, 94, '2015-03-24 06:47:12'),
('E1028FFC98F9480FA43BBF8541616370', 109, 99, '2015-03-31 13:26:22'),
('E22C8DCCD1194A5AA2D4FD0E60D2F3AD', 109, 79, '2015-03-10 10:52:07'),
('E387CB7AB9B64C25A85CAF90FAF1746A', 129, 98, '2015-03-30 18:01:29'),
('E4F48D3BAB5D45F2B9A107A4C476C551', 69, 38, '2014-12-04 15:38:11'),
('E6A737402C7141598F1DBF0537377165', 4, 11, '2014-10-30 23:16:30'),
('E9F76563DCDD449F9691ECBB2196966C', 104, 11, '2014-12-10 19:18:42'),
('EA7C0D213C6A4378ABD3D9952F9BE428', 5, 121, '2015-04-20 22:33:36'),
('EAB3E455782446DAA6D72DF0F4860287', 19, 7, '2014-11-09 15:42:07'),
('EDC44A1278A146C29839BF436E9AA83E', 104, 11, '2014-12-10 19:04:30'),
('EE8CE6A810194FF7A513704F49479EF6', 129, 111, '2015-04-10 08:58:53'),
('F29EBA3E52CE43BDBEB188B5BA34FF16', 57, 37, '2014-12-04 11:42:05'),
('F3C4660025314C9883ED57F733CF67C8', 14, 6, '2014-10-27 09:33:16'),
('F5563D05BCB24388AE57EBDA0E016ECB', 66, 31, '2014-11-28 16:48:43'),
('F5BD385FE8DE4C2B9093739EB0085D1C', 12, 70, '2015-01-29 11:52:13'),
('F69F1C8C6B1A4A94976882872AE05C56', 2, 11, '2014-10-29 14:56:04'),
('F737154E64914F15886F0E780E16F097', 1, 11, '2014-11-09 22:55:57'),
('FB2FF95773DD430CB734C3A91EE88197', 42, 109, '2015-04-14 05:58:16'),
('FBE08D87907E487BBB8886368544E983', 69, 48, '2014-12-16 05:12:16');

-- --------------------------------------------------------

--
-- Table structure for table `historico`
--

CREATE TABLE IF NOT EXISTS `historico` (
  `fatura_id` varchar(32) NOT NULL,
  `status_id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`fatura_id`,`status_id`),
  KEY `fk_fatura_has_status_status1_idx` (`status_id`),
  KEY `fk_fatura_has_status_fatura1_idx` (`fatura_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `historico`
--

INSERT INTO `historico` (`fatura_id`, `status_id`, `data`) VALUES
('0576846D2F034A1882AAE5AFA5A33DE9', 1, '2015-03-10 16:13:39'),
('0596727FE68A4479B46E1CD9D8E480DE', 4, '2014-10-30 00:01:29'),
('059DD91568FB44A78619083E6A2ED900', 2, '2015-01-16 05:31:11'),
('05CC8ED60AF341428D916F06810102C0', 2, '2015-01-10 13:14:02'),
('06AF5AB79D234B97AECC6E38A7E75A3E', 1, '2014-11-01 11:47:51'),
('06AF5AB79D234B97AECC6E38A7E75A3E', 2, '2014-11-01 17:47:50'),
('0A52FCF75CC24F8293164ADC6F276130', 1, '2014-12-12 08:56:06'),
('0A6696DB47024A43A69977CE504BD939', 1, '2015-02-16 11:59:19'),
('0C05A2A492934E3382743965D07EE43C', 2, '2015-01-14 19:18:03'),
('0E61B051C3B84847BD5B93C9C9189FB4', 1, '2014-10-30 22:50:21'),
('0E61B051C3B84847BD5B93C9C9189FB4', 2, '2014-10-30 22:50:17'),
('0E9248CCEFC04266800072DB1AEA7D72', 1, '2014-10-30 23:27:51'),
('0E9248CCEFC04266800072DB1AEA7D72', 2, '2014-10-31 05:27:51'),
('0F07D68B58224601A81851FEEDB5DA24', 1, '2014-10-30 22:24:47'),
('0F07D68B58224601A81851FEEDB5DA24', 2, '2014-10-30 22:21:41'),
('0F07D68B58224601A81851FEEDB5DA24', 3, '2014-10-30 22:22:24'),
('0F617CFC5E7E4560948B76CBA7A7A5D4', 2, '2015-02-12 11:34:04'),
('15B34CF19F984054BA824553CF990A23', 2, '2014-12-11 11:48:26'),
('1968C105DD224C92834C67CEFA02D433', 4, '2014-10-30 00:02:07'),
('1A6231358E9647398BB1317B51A9444A', 2, '2014-12-19 12:47:54'),
('1C075344B3BD4C41A382A1131D7B296B', 4, '2014-10-31 00:02:15'),
('1C977B4EAE4042AD961E15306A6F36B3', 2, '2015-02-12 13:05:21'),
('1D27F309DAE948308411007332A488F0', 1, '2014-10-29 15:24:43'),
('1D27F309DAE948308411007332A488F0', 2, '2014-10-29 15:24:40'),
('1EC2C71650CF496CB6F5C48A53EA8F9C', 2, '2014-12-12 07:58:23'),
('221EDB5EB5464EE2B63976779529D8A7', 2, '2015-01-25 03:32:02'),
('22EC29B3DD294259A922FB1E46881B16', 1, '2014-12-09 20:45:59'),
('29EA0EFB45474D6CBB5A24DEA3382294', 5, '2014-12-16 12:37:26'),
('2A4330BA3E1949ECA7E2726C2790165B', 1, '2015-03-20 06:37:41'),
('2ABF7FEA3BB6452EB0E3A04908718BE9', 2, '2015-04-08 13:16:49'),
('2C93BF9BF77E426B965A0C04228AD0A9', 1, '2014-11-01 10:56:58'),
('2C93BF9BF77E426B965A0C04228AD0A9', 2, '2014-11-01 16:56:55'),
('2E9CE314B41D45DFB52D467F1616CB45', 2, '2014-11-01 12:21:05'),
('2E9CE314B41D45DFB52D467F1616CB45', 4, '2014-11-04 23:04:00'),
('372965F9994F4F3D9686A05D0B150A95', 2, '2015-04-08 13:13:18'),
('389CEDCC4E034647AA4E7E44C89760DF', 2, '2014-11-01 13:01:07'),
('389CEDCC4E034647AA4E7E44C89760DF', 4, '2014-11-04 23:04:35'),
('3968D9866B904FA984A7FFAE99E5817F', 1, '2015-03-18 12:51:16'),
('3B01C481EC304A018805FD577F81AAB4', 1, '2015-01-15 14:50:40'),
('3C49AD4E53544BE9B5496E8C6CA9B6F9', 1, '2015-04-20 18:44:21'),
('3D6B1DF7192B48D7B458897C42B4372A', 1, '2015-03-19 14:01:40'),
('3DB9106EBFBB45EC88FB3601E5FCE195', 2, '2015-04-01 05:56:30'),
('3DE6B717BAD147F59AC0814BC241F2DF', 2, '2015-01-30 04:49:17'),
('3E2C3D3BE45445D0BF9A1633D2EF2DDD', 2, '2014-12-21 16:08:35'),
('3E3B8BEFD7EB45789F9ED5BA96A34D56', 2, '2014-11-01 12:07:15'),
('3E3B8BEFD7EB45789F9ED5BA96A34D56', 4, '2014-11-04 23:04:48'),
('3FD70514F7184D0AB9535A6BB2FE1DFE', 1, '2014-10-30 07:13:32'),
('3FD70514F7184D0AB9535A6BB2FE1DFE', 2, '2014-10-30 07:12:43'),
('42AE40B3035F40B38249A3CB36F9663B', 1, '2014-10-29 21:28:01'),
('42AE40B3035F40B38249A3CB36F9663B', 2, '2014-10-29 21:27:56'),
('4590574CAC8349E283F894C1E8DDE183', 2, '2014-10-30 22:53:28'),
('4590574CAC8349E283F894C1E8DDE183', 3, '2014-10-30 22:53:59'),
('495518E12C90477A9A87916E2458E48E', 2, '2014-10-29 15:03:37'),
('495518E12C90477A9A87916E2458E48E', 3, '2014-10-29 15:04:51'),
('49CA75C3EFCA48DD89E02C939D200733', 1, '2015-02-13 15:26:57'),
('4B4C27F9AC4F4BF9BD565201462604C7', 2, '2015-01-02 14:38:16'),
('4BD8A88274D647D791A304BDE23F600E', 2, '2015-01-29 13:38:00'),
('5077E287B5E948A9B09B622533061E7D', 2, '2014-12-25 20:06:51'),
('54998C9CBC9E4FF7BDACD17C60A135F5', 2, '2015-04-02 03:05:21'),
('5B09296EEB9846C4B5ED03FB9430FCD7', 1, '2015-01-27 18:22:46'),
('5BA0B6D3AE7543119406713E2B9FCFD7', 1, '2015-03-20 11:24:09'),
('5E317B0B59344B23AD7471C4A59DC4DD', 1, '2014-10-30 22:16:41'),
('5E317B0B59344B23AD7471C4A59DC4DD', 2, '2014-10-30 22:16:37'),
('5E6030C80E9C4BFCAFC006151992A301', 2, '2014-11-01 12:49:35'),
('5E6030C80E9C4BFCAFC006151992A301', 4, '2014-11-04 23:06:10'),
('5F111B1D18524E5CB051434C386F3169', 1, '2015-03-10 11:30:46'),
('5F8D4129130F4FFD99A44962F74E6A93', 2, '2014-11-01 10:59:04'),
('5F8D4129130F4FFD99A44962F74E6A93', 3, '2014-11-01 10:59:18'),
('5FFA06B901454BA39F3B2D37E1143082', 1, '2014-10-29 15:10:13'),
('5FFA06B901454BA39F3B2D37E1143082', 2, '2014-10-29 15:10:10'),
('60CD4E11275F46F9B041AE99AFF7AD02', 2, '2015-01-27 05:52:29'),
('62A43B8EA08F4EF39B54573477A73CE9', 1, '2014-10-30 23:26:20'),
('62A43B8EA08F4EF39B54573477A73CE9', 2, '2014-10-31 05:26:20'),
('637F04D112524634932785C47CEAAC52', 2, '2015-04-01 11:21:01'),
('6402E55C0FCA4E46AE5E753423660A65', 2, '2014-11-01 13:18:12'),
('6402E55C0FCA4E46AE5E753423660A65', 4, '2014-11-04 23:06:29'),
('650B45DD387348C5B7B6FA9478D700B9', 2, '2015-04-14 07:59:28'),
('6A0E497A2B804A6D9C71661AC9500382', 1, '2015-02-15 06:34:20'),
('6D0DF20A07BA4013B202B36DB9B21C45', 1, '2014-10-30 23:18:05'),
('6D0DF20A07BA4013B202B36DB9B21C45', 2, '2014-10-30 23:18:00'),
('6DE9524567D6477F90CD4C8D55EDE82E', 2, '2015-01-21 08:31:26'),
('6E12931614BD44D5AF6130E9CF6D9DA1', 4, '2014-10-30 00:04:41'),
('6ED2CD7B178E419F850DC731A61BD7A1', 2, '2015-03-10 14:23:12'),
('729FC8087E954142925725667CA423D2', 1, '2014-10-30 23:12:59'),
('729FC8087E954142925725667CA423D2', 2, '2014-10-30 23:12:56'),
('732F8E2BC1244228BE64DF2E1F7E425C', 2, '2015-04-24 21:33:29'),
('74828ECB6BB8473D8FD26DBABAE84DD0', 2, '2015-02-12 11:34:09'),
('74B83D6358D24E8A9FDAF5156BDE2D18', 1, '2015-03-24 09:05:52'),
('762E7F7BB9DC4F0980C1015B8335316A', 2, '2015-03-27 18:03:36'),
('779A5CF47C044E73A93032353AF4B3B8', 2, '2015-01-28 19:22:37'),
('799CDB303CCB4B8B889BD1A132F29810', 2, '2015-01-21 08:28:39'),
('7A75D8A6C9AA4A2D8778214641ACE752', 1, '2015-03-23 09:03:54'),
('7E6AD26E1A2A4F9A9258C48674901489', 1, '2015-03-23 13:41:46'),
('7FE42E91B6034AF292F3B880C3DFCC96', 1, '2015-04-03 16:45:04'),
('817D00B0CA2A444888812C18E8CD9456', 2, '2015-04-05 22:58:37'),
('81927C3262FD4AD2B1576E1F1ACC5604', 2, '2015-04-14 08:55:35'),
('83B23171A8D74FEA818DFF980EFFA499', 2, '2014-12-26 04:39:09'),
('86D940F65C2247838F9395CA602794C7', 2, '2015-01-27 16:45:02'),
('86F2C6182B84424686ABAE3DCD2A9AA6', 2, '2014-12-28 19:09:33'),
('88F0F97189EF47ACB534F33B8291A082', 2, '2015-01-27 09:29:02'),
('8A9920A9034E4075B5C028AC27BB14BF', 1, '2015-04-02 11:46:38'),
('8C429E34F35B496C8A4EC9B4DDA0A445', 1, '2015-02-15 17:26:08'),
('8C87EDD6C9C44CC484A4D885FEE39E79', 2, '2014-11-01 13:20:34'),
('8C87EDD6C9C44CC484A4D885FEE39E79', 4, '2014-11-04 23:08:26'),
('8D7281CD74B94F37B221575EB654A3B5', 4, '2014-10-31 00:05:34'),
('92FD6EF3B2F744BC80961B25E0F92752', 2, '2015-02-11 18:24:31'),
('9562CFC733884685A9A554B483767587', 2, '2014-11-01 16:20:33'),
('9562CFC733884685A9A554B483767587', 4, '2014-11-04 23:08:51'),
('9798F1D30B79445791357877216EAA3D', 2, '2015-01-27 05:49:30'),
('9889D07CE31A4D098B6B9DB36021C3F5', 1, '2015-03-23 10:23:39'),
('9985BD87CE44446A976B9D6E73ECD3D1', 2, '2015-04-17 14:58:36'),
('9B911CA3D48C4A57B32EF29C5970532E', 4, '2014-12-14 23:06:41'),
('9C12E76E113E491CBE01BEFF7A2B353F', 2, '2014-11-09 13:51:30'),
('9D7668F465ED4C16A222327DFC25157F', 1, '2014-12-10 19:15:55'),
('9DD4049E81EF496798F53DFF70F4E3C1', 2, '2015-01-02 04:47:24'),
('9EA80514C5DF47ABA128F1D401B7F56D', 1, '2014-12-21 15:22:23'),
('9FDC646025FD446F8469DEA72A5D0E62', 2, '2014-12-12 09:14:40'),
('A1D6725E2E5441DEAF792A85BBF1AA51', 1, '2015-03-13 08:17:36'),
('A3177E313DB0431FB212D26560DF326D', 2, '2014-10-30 07:14:34'),
('A3177E313DB0431FB212D26560DF326D', 3, '2014-10-30 07:15:36'),
('A446F7081CAE43EE81E23A90F0E5C123', 1, '2014-11-01 10:55:30'),
('A446F7081CAE43EE81E23A90F0E5C123', 2, '2014-11-01 10:55:27'),
('A51C1F98426E40E187DC74DF9A7EC31A', 4, '2014-10-31 00:06:16'),
('A6413E164A7F449B9C50EADE3059C349', 2, '2014-11-01 13:19:18'),
('A6413E164A7F449B9C50EADE3059C349', 4, '2014-11-04 23:09:40'),
('A7752F229125422D99E69B5B64FE606F', 2, '2014-12-12 08:01:15'),
('AB81E0C8C6814A50858934DEA26DFCFC', 2, '2015-01-27 15:55:49'),
('ABBD73493C3E46588EE6F85364492699', 2, '2015-04-29 21:40:01'),
('ABD07618F8EA4C7C8C3C9F1BA034AAA1', 2, '2014-12-26 11:29:56'),
('ABE5D2BEA3A44A22967D61197C83FFBA', 2, '2015-01-21 08:34:54'),
('AF39DD19058643E9B51DE0726AAAE66C', 2, '2014-11-09 13:50:04'),
('AF3BE758D4F54153A27E1865B5D7269E', 2, '2015-02-25 08:26:44'),
('AFA3D84C5EDA41899B3F1B52E7A7E942', 2, '2014-11-01 12:27:45'),
('AFA3D84C5EDA41899B3F1B52E7A7E942', 4, '2014-11-04 23:10:06'),
('AFB92C7B7855490CA2EB233BA9510F51', 2, '2014-12-10 19:08:02'),
('B12799D060BB492DB3368E2646D72788', 2, '2015-01-30 14:56:30'),
('B1FE0693B90148BBBFF887B0F295ADED', 2, '2015-03-18 10:32:15'),
('B22434DAB5AE45BA8710A69FAB5C4ADD', 2, '2015-04-01 04:26:31'),
('B3A677E16C584364AC31FAD22B5A8A65', 1, '2015-03-20 06:40:49'),
('B3D950B840EB473DBEFD281B20938FE1', 2, '2014-11-01 12:08:22'),
('B3D950B840EB473DBEFD281B20938FE1', 4, '2014-11-04 23:10:18'),
('B3FF2BAF5E69413EA4AF49896A58795B', 1, '2014-12-10 18:46:19'),
('B6D29EF58DDB4D7F8CB79F8F48D7FB7F', 1, '2014-10-29 21:30:44'),
('B6D29EF58DDB4D7F8CB79F8F48D7FB7F', 2, '2014-10-29 21:30:16'),
('B918DCAF695B4B1A9F32D6694B633B5C', 1, '2014-11-01 10:46:21'),
('B918DCAF695B4B1A9F32D6694B633B5C', 2, '2014-11-01 10:46:18'),
('BC20FB99CA1045A68D59FF9A303B6789', 2, '2014-10-29 21:33:33'),
('BC20FB99CA1045A68D59FF9A303B6789', 3, '2014-10-29 21:33:57'),
('BC491CD0FF7A4F288F5A8EA48BEB7E7A', 1, '2014-10-29 19:36:06'),
('BC491CD0FF7A4F288F5A8EA48BEB7E7A', 3, '2014-10-29 19:37:33'),
('BC491CD0FF7A4F288F5A8EA48BEB7E7A', 4, '2014-10-29 22:46:21'),
('BD69A3A90EBA48DB8E79BC5A41EAF9FB', 2, '2014-12-17 15:20:39'),
('BF3702ADBE70451BB543292F546B01D5', 2, '2015-04-17 13:58:32'),
('C007A13E64854588A21D8EA81F600F6F', 2, '2015-04-14 18:41:15'),
('C0AB791F94ED46CDA86F01C868B3711B', 2, '2014-12-12 09:07:27'),
('C30DCC467F82496E9BD01299FB366846', 2, '2014-10-29 15:06:07'),
('C30DCC467F82496E9BD01299FB366846', 4, '2014-11-02 00:08:41'),
('C7F9218E8FCA48258513499C1A586247', 1, '2015-03-20 07:59:02'),
('C8C2CEA85DE847C9AFF5CB0DB7C471DC', 2, '2015-01-21 08:23:43'),
('C985D2A68F6746818F65670C6EDEF20F', 2, '2015-01-29 13:51:10'),
('CA23A97D07A3479F910F4AC7BFFEB777', 2, '2014-12-12 14:03:37'),
('CAC7F5A9E3F9462085C4832D4E32D36A', 1, '2014-10-30 07:01:57'),
('CAC7F5A9E3F9462085C4832D4E32D36A', 2, '2014-10-30 07:01:53'),
('CB866EC829254CBE9D59F8AD24C3C38F', 1, '2015-03-25 08:01:26'),
('CBA7EDA597424B329030D5F966A2CC88', 1, '2014-11-01 10:58:09'),
('CBA7EDA597424B329030D5F966A2CC88', 2, '2014-11-01 10:57:48'),
('CDE817F7223143FBB991F7BE3AC13811', 1, '2014-10-29 14:59:42'),
('CDE817F7223143FBB991F7BE3AC13811', 2, '2014-10-29 14:59:39'),
('CE106FFD3E5646B6B47508A0B9B9F227', 2, '2015-04-10 15:16:41'),
('CF574A42D9F4407C84B3B52BC3A1F35F', 2, '2015-04-16 10:15:10'),
('D0E1354D851A49669F007979562D46CD', 2, '2015-04-17 12:04:39'),
('D10233D0ADE4442ABD1CDC47FE09CCF6', 2, '2015-04-05 03:00:15'),
('D1A788F2B4D7409DA5BC72C04E164AE5', 1, '2015-02-12 12:41:57'),
('D32A8C6EED47453D8EDB8646B5DAE3A4', 2, '2014-10-29 21:35:23'),
('D32A8C6EED47453D8EDB8646B5DAE3A4', 4, '2014-11-02 23:11:57'),
('D42663859B3A4C039379CA7572BC4925', 2, '2014-12-12 08:19:48'),
('D467CE69052947928A736F092BBFA43D', 2, '2015-01-29 11:49:53'),
('D5C5E8CBF9D34690AA565409E445C78B', 1, '2014-12-21 15:43:25'),
('DB96606E4C6D47B792B2F71991ACB0A0', 1, '2014-11-01 10:39:33'),
('DB96606E4C6D47B792B2F71991ACB0A0', 2, '2014-11-01 10:39:28'),
('DC70B269BF8C4E179D9A6D015D8503A9', 2, '2015-01-18 13:21:00'),
('DE49BD6BBDDC439B895AC86855B7F5F8', 2, '2015-01-28 16:17:27'),
('E0A10F00BA5F4B6FA62D4B82B72D3AA0', 2, '2015-03-24 09:47:54'),
('E1028FFC98F9480FA43BBF8541616370', 2, '2015-03-31 13:26:23'),
('E22C8DCCD1194A5AA2D4FD0E60D2F3AD', 2, '2015-03-10 13:52:32'),
('E387CB7AB9B64C25A85CAF90FAF1746A', 1, '2015-03-30 18:01:31'),
('E6A737402C7141598F1DBF0537377165', 1, '2014-10-30 23:16:34'),
('E6A737402C7141598F1DBF0537377165', 2, '2014-10-30 23:16:31'),
('E9F76563DCDD449F9691ECBB2196966C', 1, '2014-12-10 19:18:46'),
('EA7C0D213C6A4378ABD3D9952F9BE428', 1, '2015-04-20 22:33:38'),
('EE8CE6A810194FF7A513704F49479EF6', 2, '2015-04-10 11:59:21'),
('F5BD385FE8DE4C2B9093739EB0085D1C', 2, '2015-01-29 11:52:17'),
('F69F1C8C6B1A4A94976882872AE05C56', 1, '2014-10-29 14:56:48'),
('F69F1C8C6B1A4A94976882872AE05C56', 2, '2014-10-29 14:56:06'),
('FB2FF95773DD430CB734C3A91EE88197', 2, '2015-04-14 05:58:17'),
('FBE08D87907E487BBB8886368544E983', 1, '2014-12-16 05:12:19');

-- --------------------------------------------------------

--
-- Table structure for table `informacoes`
--

CREATE TABLE IF NOT EXISTS `informacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pt` varchar(180) NOT NULL,
  `nome_en` varchar(180) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `informacoes`
--

INSERT INTO `informacoes` (`id`, `nome_pt`, `nome_en`) VALUES
(1, 'Durante o passeio se mantenha bem hidratado.', 'Durante o passeio se mantenha bem hidratado.'),
(2, 'Utilize sempre protetor solar', 'Utilize sempre protetor solar'),
(3, 'Aconselhamos roupas com tecidos leves e flexíveis', 'Aconselhamos roupas com tecidos leves e flexíveis'),
(4, 'Leve frutas, barras de cereais e outros alimentos', 'Leve frutas, barras de cereais e outros alimentos'),
(5, 'Importante levar água e sucos para se reidratar', 'Importante levar água e sucos para se reidratar'),
(6, 'Garrafa pet ou cantil para água (mínimo 1 litro)', 'Garrafa pet ou cantil para água (mínimo 1 litro)'),
(7, 'Repelente', 'Repelente'),
(8, 'Camisa manga longa', 'Camisa manga longa'),
(9, 'Calça comprida leve', 'Calça comprida leve'),
(10, 'Tênis e ou sapatilha leve com travas', 'Tênis e ou sapatilha leve com travas'),
(11, 'Óculos de proteção, não necessário ser escuros', 'Óculos de proteção, não necessário ser escuros'),
(12, 'Câmera a prova d’água', 'Câmera a prova d’água'),
(13, 'Canivete, faca ou terçado', 'Canivete, faca ou terçado'),
(14, 'Garrafa ou squeeze com filtro p água', 'Garrafa ou squeeze com filtro p água'),
(15, 'Indicamos que todos os pertences estejam amarrados ao corpo ou no caiaque.', 'Indicamos que todos os pertences estejam amarrados ao corpo ou no caiaque.'),
(16, 'Tênis ou calçados confortáveis;', 'Tênis ou calçados confortáveis;'),
(17, 'Lanterna;', 'Lanterna;'),
(18, 'Barraca;', 'Barraca;'),
(19, 'Materiais de primeiros socorros', 'Materiais de primeiros socorros'),
(20, 'Mochila pequena para seus pertences ( de preferência impermeável )', 'Mochila pequena para seus pertences ( de preferência impermeável )'),
(21, 'Protetor solar, protetor labial e repelente para insetos', 'Protetor solar, protetor labial e repelente para insetos'),
(22, 'Maquina fotográfica, filmadora ou binóculos ( a prova d''água ) ', 'Maquina fotográfica, filmadora ou binóculos ( a prova d''água ) '),
(23, 'Óculos escuros, boné ou chapéu ', 'Óculos escuros, boné ou chapéu '),
(24, 'Roupas leves e de secagem rápida ( Dê preferência para camisas manga longa e calça de dryfit )', 'Roupas leves e de secagem rápida ( Dê preferência para camisas manga longa e calça de dryfit )'),
(25, 'Calçado aquático ou que possa molhar sem problema.', 'Calçado aquático ou que possa molhar sem problema.'),
(26, 'Levar roupa de banho, óculos de sol e muito protetor solar', 'Levar roupa de banho, óculos de sol e muito protetor solar'),
(27, 'Calças compridas, estilo aventureiro', 'Calças compridas, estilo aventureiro'),
(28, 'Sapato fechado', 'Sapato fechado'),
(29, 'Roupas e acessórios de banho', 'Roupas e acessórios de banho'),
(30, 'Lanches (snacks) à gosto, desde que não necessite de fazer fogo;', 'Lanches (snacks) à gosto, desde que não necessite de fazer fogo;'),
(31, 'Use Tênis', 'Use Tênis'),
(32, 'Levar alimentos para o café da manhã e jantar;', 'Levar alimentos para o café da manhã e jantar;'),
(33, 'Equipamentos de Camping', 'Equipamentos de Camping');

-- --------------------------------------------------------

--
-- Table structure for table `itens`
--

CREATE TABLE IF NOT EXISTS `itens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pt` varchar(70) NOT NULL,
  `nome_en` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `itens`
--

INSERT INTO `itens` (`id`, `nome_pt`, `nome_en`) VALUES
(1, 'Equipamentos de Segurança', 'Equipamentos de Segurança'),
(2, 'Acompanhamento de instrutores durante toda a atividade', 'Acompanhamento de instrutores durante toda a atividade'),
(3, 'Aluguel dos equipamentos', 'Aluguel dos equipamentos'),
(4, 'Lanche durante o percurso', 'Lanche durante o percurso'),
(5, 'Acompanhamento fotográfico', 'Acompanhamento fotográfico'),
(6, 'Caiaque individuais modelos ‘sit-on-top’ (abertos), de polietileno', 'Caiaque individuais modelos ‘sit-on-top’ (abertos), de polietileno'),
(7, 'Colete salva-vidas (uso obrigatório) ', 'Colete salva-vidas (uso obrigatório) '),
(8, 'Capacete de proteção ( uso obrigatório )', 'Capacete de proteção ( uso obrigatório )'),
(9, 'Transporte', 'Transfer'),
(10, 'guia', 'guide'),
(11, 'Colete salva-vidas', 'Life jacket'),
(12, 'Caiaque com remo', 'Kayak with paddle'),
(13, 'Transportes e roteiro (conforme a modalidade escolhida).   ', 'h'),
(14, 'Hospedagem e alimentação durante o tour.', 'h'),
(15, 'Equipamentos utilizados durante a viagem.', 'h'),
(16, 'Seguro-viagem.', 'h'),
(17, 'Aluguel de equipamentos certificados para rapel', 'Aluguel de equipamentos certificados para rapel'),
(18, 'Rádios de comunicação e kit de primeiros socorros ', 'Rádios de comunicação e kit de primeiros socorros '),
(19, 'Lanche rápido ( frutas e água mineral ) ', 'Lanche rápido ( frutas e água mineral ) '),
(20, 'Transporte de ida e volta em canoa motorizada até a pousada', 'Transporte de ida e volta em canoa motorizada até a pousada'),
(21, 'Entradas para a atividade com os botos', 'Entradas para a atividade com os botos'),
(22, 'Almoço na pousada', 'Almoço na pousada'),
(23, 'Seguros individuais obrigatórios', 'Seguros individuais obrigatórios'),
(24, 'Estacionamento', 'Estacionamento'),
(25, 'Equipamentos certificados para a escalada', 'Equipamentos certificados para a escalada'),
(26, 'Valor da atividade por grupo de até 04 pessoas', 'Valor da atividade por grupo de até 04 pessoas'),
(27, 'Almoço a bordo', 'Almoço a bordo'),
(28, 'Almoço (Peixe, arroz, molho e farinha)', 'Almoço (Peixe, arroz, molho e farinha)'),
(29, 'Almoço (Peixe, arroz, molho e farinha)', 'Almoço (Peixe, arroz, molho e farinha)'),
(30, 'Transporte a partir de Novo Airão', 'Transporte a partir de Novo Airão'),
(31, 'Acesso aos Parques Nacionais do Jaú e Anavilhanas', 'Acesso aos Parques Nacionais do Jaú e Anavilhanas');

-- --------------------------------------------------------

--
-- Table structure for table `lingua`
--

CREATE TABLE IF NOT EXISTS `lingua` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lingua` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `lingua`
--

INSERT INTO `lingua` (`id`, `lingua`) VALUES
(1, 'portuguese-br'),
(2, 'english');

-- --------------------------------------------------------

--
-- Table structure for table `modalidade`
--

CREATE TABLE IF NOT EXISTS `modalidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pt` varchar(45) NOT NULL,
  `nome_en` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Esportes = { caiaque, arvorismo e etc...}' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `modalidade`
--

INSERT INTO `modalidade` (`id`, `nome_pt`, `nome_en`) VALUES
(1, 'Stand Up Paddle', 'Stand Up Paddle'),
(2, 'Kayak', 'Kayak'),
(3, 'yoga na natureza', 'yoga na natureza'),
(4, 'trekking', 'trekking'),
(5, 'Aventura', 'Aventura'),
(6, 'Bushcraft', 'Bushcraft'),
(7, 'Arvorismo', 'Arvorismo'),
(8, 'Expedição Monte Roraima', 'Expedição Monte Roraima');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE IF NOT EXISTS `newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`id`, `email`) VALUES
(1, 'Fernandosalesjunior@hotmail.co'),
(2, 'tayke.monteiro@praquerumo.com.'),
(3, 'marilianat@gmail.com'),
(4, 'silvaev.eng@gmail.com'),
(5, 'alinne.bia@gmail.com'),
(6, 'analeticia_27@hotmail.com'),
(7, 'maurilio.farias@live.com'),
(8, 'monteiro.lucia@gmail.com'),
(9, 'intelligencesymbol@hotmail.com'),
(10, 'maisleandraliradealencar@gmail'),
(11, 'Eduardo-furtado@hotmail.com'),
(12, 'beneficios.corporativo@hotmail'),
(13, 'Demillebarroso@hotmail.com'),
(14, 'nettotheone@gmail.com'),
(15, 'samye_cristina@live.com'),
(16, 'edinelzaalbuquerque@gmail.com'),
(17, 'ruiheringer@gmail.com'),
(18, 'wildsonmonte@hotmail.com'),
(19, 'simonetedesouz@hotmail.com'),
(20, 'julianesilvamc@gmail.com'),
(21, 'jid07141616@gmail.com'),
(22, 'helena.0988@gmail.com'),
(23, 'fabianezambon@gmail.com'),
(24, 'cjcezar@gmail.com'),
(25, 'lannallimas@gmail.com'),
(26, 'deiddre@gmail.com'),
(27, 'victor.snascimento@hotmail.com'),
(28, 'elen.cintia@bol.com.br'),
(29, 'sandrabantonio@gmail.com.br'),
(30, 'emcativo@hotmail.com'),
(31, 'noronhaam@hotmail.com'),
(32, 'thii_bouvier@hotmail.com'),
(33, 'paulobenevides13@gmail.com'),
(34, 'nayane.maia@gmail.com'),
(35, 'moni.campelo@gmail.com'),
(36, 'Oigresclementino@hotmail.com'),
(37, 'beneficios.corporativo@hotmail'),
(38, 'melkysandes@gmail.com'),
(39, 'Mheybbclementino@gmail.com'),
(40, 'oigres.silva92@gmail.com'),
(41, 'mateus.sa03@live.com'),
(42, 'soueu_stefens@hotmail.com'),
(43, 'sskaroline1@hotmail.com'),
(44, 'willyfreitas@ymail.com'),
(45, 'denyse_alencar@yahoo.com.br'),
(46, 'gracybh@yahoo.com.br'),
(47, 'ray.filadelphia@gmail.com'),
(48, 'fernandosalesjunior@hotmail.co'),
(49, 'debora.motta95@gmail.com'),
(50, 'izaqlira@gmail.com'),
(51, 'anynha_adm@yahoo.com.br'),
(52, 'xisto.junior@hotmail.com'),
(53, 'rozanny_bobby@hotmail.com'),
(54, 'erickmatheus88@hotmail.com'),
(55, 'wolnei.comarketing@hotmail.com'),
(56, 'lucio_lopes06@yahoo.com.br'),
(57, 'elidamouzinho@hotmail.com'),
(58, 'edilliany@gmail.com'),
(59, 'delciojr@gmail.com'),
(60, 'af.barros@outlook.com'),
(61, 'analiabarbosa@hotmail.com'),
(62, 'tatyannevsouza@hotmail.com'),
(63, 'Jeanped18@gmail.com'),
(64, 'sandremartins@yahoo.com.br'),
(65, 'financeiro@praquerumo.com.br'),
(66, 'thiagofarias_lino@hotmail.com'),
(67, 'matheusbzevedo@gmail.com'),
(68, 'name.duda@hotmail.com'),
(69, 'Classificadosmanaus@outlook.co');

-- --------------------------------------------------------

--
-- Table structure for table `preferencias`
--

CREATE TABLE IF NOT EXISTS `preferencias` (
  `modalidade_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`modalidade_id`,`usuario_id`),
  KEY `fk_esporte_has_usuario_usuario1_idx` (`usuario_id`),
  KEY `fk_esporte_has_usuario_esporte1_idx` (`modalidade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `preferencias`
--


-- --------------------------------------------------------

--
-- Table structure for table `restricoes`
--

CREATE TABLE IF NOT EXISTS `restricoes` (
  `cuidados_id` int(11) NOT NULL,
  `atividade_codigo` int(11) NOT NULL,
  PRIMARY KEY (`cuidados_id`,`atividade_codigo`),
  KEY `fk_cuidados_has_atividade_atividade1_idx` (`atividade_codigo`),
  KEY `fk_cuidados_has_atividade_cuidados1_idx` (`cuidados_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restricoes`
--

INSERT INTO `restricoes` (`cuidados_id`, `atividade_codigo`) VALUES
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(3, 6),
(4, 6),
(11, 6),
(2, 8),
(2, 11),
(1, 12),
(1, 13),
(3, 13),
(4, 13),
(5, 13),
(1, 14),
(3, 14),
(1, 17),
(3, 17),
(4, 17),
(8, 17),
(9, 17),
(12, 17),
(13, 17),
(14, 17),
(16, 17),
(1, 18),
(3, 18),
(4, 18),
(1, 19),
(3, 19),
(4, 19),
(1, 20),
(3, 20),
(4, 20),
(3, 22),
(4, 22),
(8, 22),
(9, 22),
(12, 22),
(3, 23),
(4, 23),
(8, 23),
(9, 23),
(10, 23),
(12, 23),
(1, 26),
(3, 26),
(4, 26),
(5, 26),
(7, 26),
(11, 26),
(1, 27),
(3, 27),
(4, 27),
(11, 27),
(12, 27);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Status = { pending, paid, canceled, expired }' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `nome`) VALUES
(1, 'paid'),
(2, 'pending'),
(3, 'canceled'),
(4, 'expired'),
(5, 'refunded'),
(6, 'draft'),
(7, 'partially_paid');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `senha` varchar(32) NOT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `sobrenome` varchar(60) DEFAULT NULL,
  `nome_empresa` varchar(100) DEFAULT NULL,
  `telefone` varchar(13) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `pais` varchar(20) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `cnpj` varchar(14) DEFAULT NULL,
  `sobre_pt` text,
  `sobre_en` text,
  `resumo_pt` varchar(200) DEFAULT NULL,
  `resumo_en` varchar(200) DEFAULT NULL,
  `cliente` tinyint(1) NOT NULL,
  `organizador` tinyint(1) NOT NULL,
  `revendedor` tinyint(1) NOT NULL,
  `dt_atualizacao` datetime DEFAULT NULL,
  `dt_criacao` datetime DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `foto` varchar(64) DEFAULT NULL,
  `id_iugu` varchar(32) DEFAULT NULL,
  `anonimo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `nickname_UNIQUE` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Usuário da plataforma pqr' AUTO_INCREMENT=124 ;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `username`, `email`, `senha`, `nome`, `sobrenome`, `nome_empresa`, `telefone`, `cidade`, `estado`, `pais`, `cpf`, `cnpj`, `sobre_pt`, `sobre_en`, `resumo_pt`, `resumo_en`, `cliente`, `organizador`, `revendedor`, `dt_atualizacao`, `dt_criacao`, `score`, `sexo`, `foto`, `id_iugu`, `anonimo`) VALUES
(1, 'Wr Locacoes', 'wrlocacoes@gmail.com', 'wrlocacoes', 'WR Locações', 'Will Nery', 'WR Locações', '92 98124 3650', 'Manaus', 'AM', 'Brasil', '32349386287', '20250267000144', '<p>\n	Empresa individual registrada, especializada em Turismo de Aventura com Caiaque e Caminhada e Camping na Selva, Loca&ccedil;&otilde;es Tempor&aacute;rias, Cicloturismo, Ciclocity e Ciclonigth Trainning.</p>\n<p>\n	&nbsp;</p>\n<p>\n	Desenvolvendo v&aacute;rias Expedi&ccedil;&otilde;es de Aventura nas regi&otilde;es do Estado Amazonas, com diversas pr&aacute;ticas de atividades de turismo nas &aacute;reas do munic&iacute;pio do Rio Preto da Eva, AM 010 rio Urubu, Vila do Puraquequara, Encontro das &Agrave;guas do Negro e Solim&otilde;es, BR 174 Tarum&atilde; A&ccedil;u, BR 174 Urubu, Estrada de Balbina e Municipio Pres. Figueiredo.</p>\n<p>\n	&nbsp;</p>\n<p>\n	Com experi&ecirc;ncias nos rios Solim&otilde;es Iranduba, Manacapuru Aria&uacute;, Miriti, Negro Novo Air&atilde;o, Tarum&atilde; A&ccedil;u, Tarum&atilde; Mirin, Urubu Marupiara, Barreto Mutum, Tucumanduba, Uatum&atilde; e nos Estados de Roraima, Venezuela, S&atilde;o Paulo e Par&aacute;.</p>\n<p>\n	&nbsp;</p>\n<p>\n	Tendo tamb&eacute;m &agrave; disposi&ccedil;&atilde;o de loca&ccedil;&atilde;o de equipamentos esportivos de aventura como: Caiaque, Colete, Bike e outros.</p>\n<p>\n	&nbsp; &nbsp; &nbsp;</p>\n', NULL, 'Empresa individual registrada, especializada em Turismo de Aventura com Caiaque e Caminhada e Camping na Selva, Locações Temporárias, Cicloturismo, Ciclocity e Ciclonigth Trainning. ', NULL, 0, 1, 0, '2014-11-10 13:36:13', '2014-10-09 20:50:10', NULL, 'M', '71a83-wr-locacoes.png', NULL, NULL),
(2, 'Amazon SUP', 'jtoledo654@gmail.com', 'amazonsup', 'Amazon Stand Up Paddle', 'Jurandir Almeida de Toledo Junior', 'Amazon Stand Up Paddle', '92 98117 8089', 'Manaus', 'AM', 'Brasil', '83679618700', NULL, '<p>\n	<strong style="border: 0px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 15.5555562973022px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; color: rgb(55, 55, 55); line-height: 27.0833339691162px;">AMAZON STAND UP PADDLE</strong><span style="color: rgb(55, 55, 55); font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 15.5555562973022px; line-height: 27.0833339691162px;">&nbsp;pessoa jur&iacute;dica de direito privado criada no dia 15 de julho de 2010, com objetivo de fomentar a pr&aacute;tica do Stand Up Paddle &ndash; SUP em Manaus e em todo o Estado do Amazonas. Atrav&eacute;s da loca&ccedil;&atilde;o de pranchas&nbsp; de Stand Up Paddle, &nbsp;administra&ccedil;&atilde;o de clinicas SUP, realiza&ccedil;&atilde;o de eventos, etc.</span></p>\n', NULL, 'Empresa com objetivo de fomentar a prática de Stand Up Paddle no Amazonas. ', NULL, 0, 1, 0, '2014-11-10 13:35:58', '2014-10-09 21:10:18', NULL, 'M', '9feb3-perfil.jpg', NULL, NULL),
(3, 'Eco Space', 'figueiredotur@hotmail.com', 'ecospace', 'Eco Space Adventure ', 'Eco Space Adventure Rafting', 'Eco Space Adventure Rafting', '92 99111 5097', 'Presidente Figueired', 'AM', 'Brasil', '89223888204', '11453984000182', '<p>\n	Empresa especializada em Rafting e trilhas em Presidente Figueiredo. Atende as normas do curso ?Aventura Segura? pela ABETA forma&ccedil;&atilde;o em 2008.&nbsp;</p>\n<p>\n	Servi&ccedil;os:</p>\n<p>\n	Rafting</p>\n<p>\n	- Igarap&eacute; da Laje e Rio Urubu&iacute;</p>\n<p>\n	- Rio Urubu</p>\n<p>\n	Tiro-lesa</p>\n<p>\n	- Rio Urubu&iacute;</p>\n<p>\n	Guia</p>\n<p>\n	- Trilha Caverna do Maroaga (&uacute;nica caverna em arenito com uma &uacute;nica entrada com 200m2) e Gruta da Judeia</p>\n<p>\n	- Cachoeira da Neblina</p>\n<p>\n	- Iracema e Santu&aacute;rio</p>\n', NULL, 'Empresa especializada em Rafting e trilhas em Presidente Figueiredo', NULL, 0, 1, 0, '2015-03-16 13:47:31', '2014-10-11 08:07:57', NULL, 'M', '30425-perfil.jpg', NULL, NULL),
(4, 'fabi', 'fabi_herman@gmail.com', '123', 'fabiane', NULL, 'namastê', '243455667787', 'Presidente Figueired', 'AM', 'Brasil', '4345', NULL, NULL, NULL, 'instrutora e professora de yoga', NULL, 0, 1, 0, '2014-11-09 07:20:30', '2014-10-11 08:17:04', NULL, 'm', '12722-perfil.jpg', NULL, NULL),
(5, 'EcoForest', 'ecoforestadventure@gmail.com', 'ecoforest', 'EcoForest Adventure', 'Pedro Henrique Luniere Porto', 'EcoForest Adventure', '(92) 93974513', 'Manaus', 'Am', 'Brasil', '98853902272', NULL, '<p class="font_8" style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; font-stretch: normal; font-size: 14px; font-family: arial, ''?? ?????'', ''ms pgothic'', ??, dotum, helvetica, sans-serif; color: rgb(255, 255, 255); background: 0px 0px;">\n	<span style="color:#000000;">Trabalhamos no sentido de prestar aos nossos clientes servi&ccedil;os de qualidade superior, mantendo atitudes confi&aacute;veis e respons&aacute;veis, jamais colocando nossos clientes em qualquer risco de vida. Com base no princ&iacute;pio de respeito ao pr&oacute;ximo e aos recursos naturais tendo em vista disseminar conhecimento sobre a natureza e seus usos m&uacute;ltiplos, aliado ao uso de pr&aacute;ticas de ecoturismo e esportes de aventura.</span></p>\n<p class="font_8" style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; font-stretch: normal; font-size: 14px; font-family: arial, ''?? ?????'', ''ms pgothic'', ??, dotum, helvetica, sans-serif; color: rgb(255, 255, 255); background: 0px 0px;">\n	&nbsp;</p>\n<p class="font_8" style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; font-stretch: normal; font-size: 14px; font-family: arial, ''?? ?????'', ''ms pgothic'', ??, dotum, helvetica, sans-serif; color: rgb(255, 255, 255); background: 0px 0px;">\n	&nbsp;</p>\n<p class="font_8" style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; font-stretch: normal; font-size: 14px; font-family: arial, ''?? ?????'', ''ms pgothic'', ??, dotum, helvetica, sans-serif; color: rgb(255, 255, 255); background: 0px 0px;">\n	<span style="color:#000000;"><span style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; font-weight: bold; background: 0px 0px;">Equipe Ecoforest</span>:</span></p>\n<p class="font_8" style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; font-stretch: normal; font-size: 14px; font-family: arial, ''?? ?????'', ''ms pgothic'', ??, dotum, helvetica, sans-serif; color: rgb(255, 255, 255); background: 0px 0px;">\n	&nbsp;</p>\n<p class="font_8" style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; font-stretch: normal; font-size: 14px; font-family: arial, ''?? ?????'', ''ms pgothic'', ??, dotum, helvetica, sans-serif; color: rgb(255, 255, 255); background: 0px 0px;">\n	<span style="color:#000000;">Contamos com uma equipe qualificada de instrutores, t&eacute;cnicos e guias, dispondo de equipamentos e t&eacute;cnicas especializadas para a pr&aacute;tica de atividades de aventura.</span></p>\n', NULL, 'Somos uma empresa focada em desenvolver atividades de ecoturismo e esportes de aventura, proporcionando integração harmônica entre natureza, aventura, esporte, lazer e qualidade de vida com segurança ', NULL, 0, 1, 0, '2014-11-10 13:59:38', '2014-10-11 11:56:34', NULL, 'M', '60ce2-logomarca.jpg', NULL, NULL),
(6, 'taykehedjho@gmail.com', 'taykehedjho@gmail.com', 'ff90f57b46f016183dc75708a73dc735', 'Tayke', 'Monteiro', NULL, '8112 1280', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-10-11 12:43:35', '2014-10-11 12:43:35', NULL, NULL, NULL, 'F86A063619874E25A5E9FF60189DDFF6', 1),
(7, 'taytenorio', 'taynara.tcb@gmail.com', '123', 'taynara', 'tenorio', 'turismo científic', '8223-2626', 'Manaus', 'AM', 'Brasil', 'rgdfgsdfgsd', '43545847548578', NULL, NULL, NULL, NULL, 0, 1, 0, '2014-10-27 06:54:56', '2014-10-12 08:30:57', NULL, 'f', NULL, NULL, NULL),
(8, 'fernandoserzedelo', 'fernando.serzedelo@praquerumo.com.br', 'lfms8294', 'Fernando', 'Serzedelo', 'PRAQUERUMO', '82014372', 'Manaus', 'Am', 'Brasil', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, '2014-10-27 09:45:10', '2014-10-15 11:53:20', NULL, 'M', '0bdfc-img_20141019_164847.jpg', '5A6AB6D27E674D858E4B81CFFE221327', 1),
(10, 'henrique.armond@hotmail.com', 'henrique.armond@hotmail.com', 'e7c0d7d93961b23714d814eb0c7ad724', 'Henrique', 'Melo', NULL, '92 81216652', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-10-26 11:56:05', '2014-10-26 11:56:05', NULL, NULL, NULL, 'C2F2C2064CFE4517BAC936A4DC24E996', 1),
(11, 'apds.anderson@gmail.com', 'apds.anderson@gmail.com', 'b32b1b822dd59451b17b08f97fdfe81e', 'Anderson', 'Pimentel', NULL, '93531716', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-10-27 06:14:19', '2014-10-27 06:14:19', NULL, NULL, NULL, '51950959BE434F3083D6C110D2517783', 1),
(13, 'roraimaadventures', 'adventures-teste@roraima-brasil.com.br', '123', 'RORAIMA ADVENTURES', NULL, 'RORAIMA ADVENTURES', '(95)9115-1514', 'Boa Vista', 'RR', 'Brasil', NULL, '05276517000121', NULL, NULL, NULL, NULL, 0, 1, 0, '2014-10-29 17:09:51', '2014-10-29 17:09:51', NULL, NULL, '18ace-roraima-adventures.png', NULL, NULL),
(14, 'goettezinho@gmail.com', 'goettezinho@gmail.com', '262031397020fd8df478ec13b4b096c5', 'Daniel', 'Goettenauer', NULL, '92 82284282', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-11-01 12:21:04', '2014-11-01 12:21:04', NULL, NULL, NULL, 'A625D76DB8734A04A3D2B9B872DE2C28', 1),
(15, 'kayakadventure', 'kayakadventuream@gmail.com', 'kayakadventure', 'Kayak Adventure', 'Juliano Macanoni de Morais', 'Kayak Adventure', '92 99270 1514', 'Manaus', 'AM', 'Brasil', '50874276268', NULL, '<p>\n	Me chamo Juliano Macanoni e desde crian&ccedil;a tenho uma liga&ccedil;&atilde;o forte com a natureza. Passei&nbsp; minha primeira inf&acirc;ncia ( At&eacute; os 8 anos ) as margens da represa Guarapiranga em S&atilde;o Paulo. O contato com a natureza na inf&acirc;ncia forjou o que seria mais tarde uma vida inteira dedicada ao esporte e a preserva&ccedil;&atilde;o da natureza. Cheguei a Amaz&ocirc;nia em 1982/83 e logo me tornei parte desse fant&aacute;stico mundo da floresta Amaz&ocirc;nica. Sou formado em Design e tenho uma p&oacute;s gradua&ccedil;&atilde;o em Design e Mercado. Pratico esportes desde pequeno. Comecei com bike, que at&eacute; hoje &eacute; o meu esporte principal, j&aacute; joguei futebol e fui da sele&ccedil;&atilde;o Amazonense de basquete juvenil na &eacute;poca. Ja treinei artes marciais ( Jiu-Jitsu ) mas, por um problema no ombro abandonei. O montanhismo &eacute; um dos meus flertes quando viajo pelo Brasil a fora e pela Am&eacute;rica do Sul. j&aacute; subi o Monte Roraima por 2x na Venezuela, J&aacute; estive no caminho inca at&eacute; Macchu Pichu no Per&uacute;, J&aacute; subi o Pico da Bandeira em Minas Gerais, o Pico 31 de mar&ccedil;o, Morro da baleia na Chapada do Veadeiros (GO) entre outros. Mais recentemente estive na Col&ocirc;mbia e fiz ascens&atilde;o ao nevado Roriz e Santa Isabel, Esse &uacute;ltimo com 4.965 mth de altitude e 5&ordm; negativos. J&aacute; passei 40 dias entre os &iacute;ndios da etnia Way way no sul do estado do Par&aacute;, vivendo e aprendendo suas t&eacute;cnicas e seus ensinamentos. Adoro Rapel, tracking, canoagem, SUP, Arvorismo, trilhas e amo os animais. Sou presidente da associa&ccedil;&atilde;o JUNGLE BIKE CLUBE - Clube esportivo&nbsp; que trabalha com mountain bike realizando passeios , trilhas, expedi&ccedil;&otilde;es e competi&ccedil;&otilde;es na regi&atilde;o Amaz&ocirc;nica. Atualmente fundamos mais uma vertente da Associa&ccedil;&atilde;o a KAYAK ADVENTURE&nbsp; que &eacute; uma empresa especializada em expedi&ccedil;&otilde;es, travessias, descidas de corredeiras nos Rios, lagos e igarap&eacute;s da Regi&atilde;o Amaz&ocirc;nica fomentando o turismo de Aventura e o esporte aqu&aacute;tico</p>\n', NULL, 'KAYAK ADVENTURE é uma empresa especializada em expedições, travessias, descidas de corredeiras nos Rios, lagos e igarapés da Região Amazônica fomentando o turismo de Aventura e o esporte aquático', NULL, 0, 1, 0, '2014-11-11 11:08:34', '2014-11-09 07:31:07', NULL, 'M', '4c4e4-perfil.jpg', NULL, NULL),
(16, 'artedomato', 'artedomato@yahoo.com.br', 'artedomato', 'Ismael Alexandre', 'Soares Ribeiro', 'Arte do Mato', '92 99202 3926', 'Manaus', 'AM', 'Brasil', '52012913253', '16634195000161', NULL, NULL, 'Agência de Ecoturismo e Turismo de Aventura: Além do Esporte de Aventura', NULL, 0, 1, 0, '2014-11-10 13:24:44', '2014-11-09 07:39:29', NULL, 'M', '8d8ba-logob2.png', NULL, NULL),
(17, 'lemosfernandes_21@yahoo.com.br', 'lemosfernandes_21@yahoo.com.br', 'df5949781f026d7761e974db74a47cbe', 'TAINNAH', NULL, NULL, '92982629671', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-11-16 14:25:02', '2014-11-16 14:25:02', NULL, NULL, NULL, '2691B2B010F241FCAFFA7385626842DA', 1),
(18, 'renataeloamba@yahoo.com.br', 'renataeloamba@yahoo.com.br', 'eed20879679d86a3c49a0ec54c737bfd', 'Renata', 'Eloá', NULL, '(92)992250611', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-11-21 21:41:13', '2014-11-21 21:41:13', NULL, NULL, NULL, 'B5B8CDDB49544C97A236121DEA03DB3B', 1),
(19, 'mc.sarkis31@gmail.com', 'mc.sarkis31@gmail.com', '1b150854805cbe12194c8dbc55c900cd', 'marcio', 'chagas sarkis', NULL, '93756795', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-11-26 04:31:45', '2014-11-26 04:31:45', NULL, NULL, NULL, '6ECCC02E4E43499F81AA2E9F09701B23', 1),
(20, 'ersilvafilho@gmail.com', 'ersilvafilho@gmail.com', '4b953cf2c56b18481176cf33aca7f42a', 'Edson', 'Filho', NULL, '92991560404', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-11-27 07:57:24', '2014-11-27 07:57:24', NULL, NULL, NULL, 'A43FA5235C1742A78D04BBB8F8B8349F', 1),
(21, 'holoturoide@gmail.com', 'holoturoide@gmail.com', '0fa3129bb82c3d16776b64dc20c15311', 'Eder', 'Ruiz Maria', NULL, '81275998', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-11-27 10:49:04', '2014-11-27 10:49:04', NULL, NULL, NULL, '848A06E9354246CA8041B09D9841B893', 1),
(22, 'amaike.keric@gmail.com', 'amaike.keric@gmail.com', '8a9a2db40697052ab18d6722384c1264', 'Amaike', NULL, NULL, '81570256', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-11-27 18:43:53', '2014-11-27 18:43:53', NULL, NULL, NULL, '836EA735C05E44E29187DCFC75C1839F', 1),
(23, 'fawill@gmail.com', 'fawill@gmail.com', 'b3e85274a7e2454c43b4fb8691024b97', 'WILLIAM', 'ALBUQUERQUE', NULL, '92981986107', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-11-28 06:39:33', '2014-11-28 06:39:33', NULL, NULL, NULL, '68B1DA84F8014B67B6C8C2BDE3C00724', 1),
(24, 'claraffer@gmail.com', 'claraffer@gmail.com', '9aba45a7f1999a9c5fc96ef2a45810fb', 'Ana', 'Clara de Freitas Ferreira', NULL, '6181759623', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-11-28 06:43:08', '2014-11-28 06:43:08', NULL, NULL, NULL, '8AF707295E0E4F7E99923BBC90BF6F1B', 1),
(25, 'adrianne_lins@hotmail.com', 'adrianne_lins@hotmail.com', 'b1b7bd91658c00a0c8401b3e19c894ee', 'Adrianne', 'Guimarães', NULL, '98157-0114', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-11-28 06:50:33', '2014-11-28 06:50:33', NULL, NULL, NULL, 'BEAA7E6677154369BFD929F97EEF089B', 1),
(26, 'lilissaalmeida@gmail.com', 'lilissaalmeida@gmail.com', '328d2df3814bab9aadf0f09b3cf5bd78', 'Larissa', 'Almeida', NULL, '98122-1322', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-11-28 06:55:55', '2014-11-28 06:55:55', NULL, NULL, NULL, '9E7C48831A444AD881DB155EC3EF3872', 1),
(27, 'juhanada@gmail.com', 'juhanada@gmail.com', '50c03f8ff46d2e40d08b5fd56fd0081b', 'Juíle', 'Hanada', NULL, '993246662', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-11-28 08:48:50', '2014-11-28 08:48:50', NULL, NULL, NULL, '89EE56CE227146D98B9FEFE3FBF24CF2', 1),
(28, 'joniroque@hotmail.com', 'joniroque@hotmail.com', 'dcaa34e2c885358e7c745a66c820d304', 'Jonilson', 'Santos', NULL, '92992107814', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-11-28 09:37:43', '2014-11-28 09:37:43', NULL, NULL, NULL, '1E53A94B740D4C2488FB894A7BE6B6BB', 1),
(29, 'jefersonbentes@msn.com', 'jefersonbentes@msn.com', '85f34d7bfc44fa2693f66b563610ede3', 'jeferson', 'costa', NULL, '(92) 98166-51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-11-28 10:27:27', '2014-11-28 10:27:27', NULL, NULL, NULL, '9C75168BB75F40F69C2F5E9D9DAA6546', 1),
(30, 'lucas.10.prado@gmail.com', 'lucas.10.prado@gmail.com', 'c3d41bf5efb468a1bcce53bd53726c85', 'Lucas', 'Chagas', NULL, '(092)99290507', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-11-28 12:23:39', '2014-11-28 12:23:39', NULL, NULL, NULL, 'E29768E0A26945DF90C384B479D4C5C5', 1),
(31, 'juliealves72@gmail.com', 'juliealves72@gmail.com', '2964815d03a032c8ca37ac5d557647dd', 'Julie', 'Silva', NULL, '993629089', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-11-28 16:48:43', '2014-11-28 16:48:43', NULL, NULL, NULL, 'FF3A4C4EE2584E98B3B2F3E4667A6753', 1),
(32, 'danielcbit@gmail.com', 'danielcbit@gmail.com', '262031397020fd8df478ec13b4b096c5', 'Daniel', 'Bittencourt', NULL, '(92)991614654', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-11-29 17:57:00', '2014-11-29 17:57:00', NULL, NULL, NULL, '8B2BB5B18C104983B7FFA5DE1CE50997', 1),
(33, 'yanna.cavalcanti@gmail.com', 'yanna.cavalcanti@gmail.com', '996e8628520ab150760c95ae493ae930', 'YANNA', 'CRUZ CAVALCANTI', NULL, '(92) 81184818', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-03 09:35:00', '2014-12-03 09:35:00', NULL, NULL, NULL, 'A7C39E15EFE54171A44ADE2E0ABB53CF', 1),
(34, 'manatiamazonia', 'manati@manatiamazonia.com', 'manatiamazonia', 'Manati Amazônia', NULL, 'Manati Amazônia', '9291349360', 'Manaus', 'Am', 'Brasil', '71810501253', '11317006000103', '<p>\n	SOMOS UMA AGENCIA DE TURISMO RECEPTIVO QUE POSSUI UMA POUSADA DE SELVA CHAMADA MANATI LODGE. ESTAMOS NO MERCADO DE TURISMO RECEPTIVO A 5 ANOS COM A AGENCIA E 7 MESES COM A POUSADA. ORGANIZAMOS TODOS OS TIPOS DE PASSEIOS TURISTICOS, PARA INDIVIDUAIS OU GRUPOS. NOSSOS PRINCIPAIS PRODUTOS S&Atilde;O: TRASLADOS, CITY TOURS, EXCURS&Otilde;ES FLUVIAIS EM BARCOS DE REDE E DE CABINE, RESERVA DE PASSAGENS AEREAS E TICKETS DE BARCO, RESERVA EM DIVERSOS HOTEIS DE SELVA EXCLUSIVAMENTE NO RIO NEGRO INCLUINDO NOSSO PR&Oacute;PRIO.</p>\n', NULL, NULL, NULL, 0, 1, 0, '2014-12-03 11:54:56', '2014-12-03 11:54:56', NULL, 'F', '099d5-400dpilogo.jpg', NULL, NULL),
(35, 'Amazon Tree Climbing', 'info@amazontreeclimbing.com.br', 'amazontreeclimbing', 'Amazon Tree Climbing', 'Amazon Tree Climbing', 'Amazon Tree Climbing', '92993014885', 'Manaus', 'AM', 'Brasil', '65533003215', '8952700000198', '<p>\n	A ATC &eacute; uma empresa especializada em servi&ccedil;os e atividades de turismo de aventura e ecoturismo, e que tem como principal atividade a escalada em &aacute;rvores recreativa. Tal atividade &eacute; associada aos principais atrativos naturais de Manaus, compondo-se assim, em&nbsp; passeios de turismo exclusivos e diferenciados no receptivo local. H&aacute; mais de 7 anos em opera&ccedil;&atilde;o em Manaus e alguns outros lugares da Amaz&ocirc;nia, a ATC oferece uma experi&ecirc;ncia &iacute;mpar de intera&ccedil;&atilde;o com a natureza, com seguran&ccedil;a e qualidade, sendo uma das poucas empresas com certifica&ccedil;&atilde;o oficial dos &oacute;rg&atilde;o governamentais competentes, que regulam o turismo de aventura, e os servi&ccedil;os no Brasil, de modo geral.</p>\n', NULL, NULL, NULL, 0, 1, 0, '2014-12-03 17:33:39', '2014-12-03 17:30:23', NULL, 'M', '7ce02-logo.png', NULL, NULL),
(36, 'MASSAY2011@HOTMAIL.COM', 'MASSAY2011@HOTMAIL.COM', 'c2e15deb03a39bc85aab6e65d8ccd592', 'RODRIGO', 'IJICHI', NULL, '981113553', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-04 11:36:01', '2014-12-04 11:36:01', NULL, NULL, NULL, 'A2A2E1C3DD2D438CBB8C91156616FA20', 1),
(37, 'paivaesteves@gmail.com', 'paivaesteves@gmail.com', '91582721be524e4c58484983c73120c9', 'flavia', 'paiva', NULL, '92 981541751', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-04 11:42:05', '2014-12-04 11:42:05', NULL, NULL, NULL, '1EE946CC835E4A109874552F7D77AE9B', 1),
(38, 'deuzals@hotmail.com', 'deuzals@hotmail.com', '001bccffb735e45f1db8f2cb02717fd1', 'Deuzanira', 'Santos', NULL, '92 9313 9317', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-04 15:38:11', '2014-12-04 15:38:11', NULL, NULL, NULL, 'BD0A382EB66C491EA6BB2588B63EB9D7', 1),
(39, 'marluabrantes@gmail.com', 'marluabrantes@gmail.com', 'fd4fe164bd09df9c624c2a2b9b606e09', 'Marluce', 'Abrantes', NULL, '991261169', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-05 09:08:55', '2014-12-05 09:08:55', NULL, NULL, NULL, 'CFB515BCE97940D1911C254F9671B533', 1),
(40, 'celle.monteiro@hotmail.com', 'celle.monteiro@hotmail.com', '73a11dae76de0170d3e4a753c1c35064', 'MARCELE', 'MONTEIRO', NULL, '92 81407629', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-11 11:48:25', '2014-12-11 11:48:25', NULL, NULL, NULL, '09B67D24E46B4043905D154581111821', 1),
(41, 'fabricioridan@hotmail.com', 'fabricioridan@hotmail.com', '78a397887ece7a37d36c566be5600cc8', 'Fabricio', 'Macedo', NULL, '092984120727', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-12 07:58:21', '2014-12-12 07:58:21', NULL, NULL, NULL, 'D4DB79FC4C55428D959D0856569C35D8', 1),
(42, 'nasscc45@gmail.com', 'nasscc45@gmail.com', '1af503424b6c29cab1dd97134372e6d8', 'Matheus', 'Costa', NULL, '092982778406', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-12 08:01:14', '2014-12-12 08:01:14', NULL, NULL, NULL, 'D104D398FF934E51A6E8D405F56EE623', 1),
(43, 'mirella.marreira@live.com', 'mirella.marreira@live.com', 'c51c8bbd9e8c8bc49042ccd5d3e9864d', 'Richard', 'Marreira', NULL, '092981337769', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-12 08:03:34', '2014-12-12 08:03:34', NULL, NULL, NULL, '2BC9DE7BAE464180AD3792FF364216BF', 1),
(44, 'gabriel_targa15@hotmail.com', 'gabriel_targa15@hotmail.com', 'b70e2a0d855b4dc7b1ea34a8a9d10305', 'Gabriel', 'Targa', NULL, '092982778406', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-12 08:19:45', '2014-12-12 08:19:45', NULL, NULL, NULL, '443DD354D28342DA89FB04D9F884113D', 1),
(45, 'drdanieloliveira@icloud.com', 'drdanieloliveira@icloud.com', '262031397020fd8df478ec13b4b096c5', 'Daniel', 'Oliveira', NULL, '99981771', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-12 08:56:01', '2014-12-12 08:56:01', NULL, NULL, NULL, '41E690DC2A7C42E485D7D32B2AABB644', 1),
(46, 'kamilacruzalves@hotmail.com', 'kamilacruzalves@hotmail.com', 'e4a46a4fa60c8f744548948c65abc87a', 'Kamila', 'Alves', NULL, '092993924952', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-12 09:07:27', '2014-12-12 09:07:27', NULL, NULL, NULL, '5A644C244C7E4ECD893DFB4E41786E0D', 1),
(47, 'Equipe Pra Que Rumo', 'contato@praquerumo.com.br', 'praquerumo', 'Equipe Pra Que Rumo', 'Equipe Pra Que Rumo', 'Equipe Pra Que Rumo', '8112 1280', 'Manaus', 'AM', 'Brasil', NULL, NULL, '<p>\n	<span style="color: rgb(51, 51, 51); font-family: Lato; font-size: 22px; line-height: 31.4285717010498px; text-align: center;">Seu guia de experi&ecirc;ncias e aventuras online. A pioneira na Amaz&ocirc;nia em agendamento online,</span><br style="box-sizing: border-box; color: rgb(51, 51, 51); font-family: Lato; font-size: 22px; line-height: 31.4285717010498px; text-align: center;" />\n	<span style="color: rgb(51, 51, 51); font-family: Lato; font-size: 22px; line-height: 31.4285717010498px; text-align: center;">n&oacute;s facilitaremos sua experi&ecirc;ncia na Amaz&ocirc;nia, seja para aventura ou lazer</span></p>\n', NULL, NULL, NULL, 0, 1, 0, '2014-12-15 05:56:52', '2014-12-15 05:56:52', NULL, 'm', NULL, NULL, NULL),
(48, 'martinsjr.paulo@gmail.com', 'martinsjr.paulo@gmail.com', '36b517451b1e50a8ef9c10c51c31c86c', 'Paulo', 'Martins Junior', NULL, '92981348054', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-16 05:12:16', '2014-12-16 05:12:16', NULL, NULL, NULL, '2A289C2FC4D54F7E9D2CDE1F62C0EBC0', 1),
(49, 'nelsonlbf@gmail.com', 'nelsonlbf@gmail.com', '573ad19d284b4fd9d735c99dc94af893', 'Nelson', 'Ferreira', NULL, '994963732', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-17 09:20:36', '2014-12-17 09:20:36', NULL, NULL, NULL, '24BC090D130C45649FE254B4891335C4', 1),
(50, 'davipaulo11@gmail.com', 'davipaulo11@gmail.com', 'bcc9d0b5c8ad6af66f25a9d3c39d1f1c', 'Davi', 'Paula ', NULL, '993280521', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-19 12:47:54', '2014-12-19 12:47:54', NULL, NULL, NULL, '6D209662F83844F3AD594323396F8014', 1),
(51, 'salomao.ferreira@gmail.com', 'salomao.ferreira@gmail.com', '548d18e073db6fde4d86ea83bc7536f8', 'Salomão', 'Neto', NULL, '9291703939', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-21 15:22:19', '2014-12-21 15:22:19', NULL, NULL, NULL, '345F9B026414446CBB018D661D102F63', 1),
(52, 'vvpcorrea@gmail.com', 'vvpcorrea@gmail.com', 'e569663505021a217752d6fa28ae0dcb', 'Vivian', 'Correa', NULL, '011 994764525', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-21 15:43:21', '2014-12-21 15:43:21', NULL, NULL, NULL, '71F4D9C8708045B2B3B45584D27B3BB3', 1),
(53, 'aeb.brito@gmail.com', 'aeb.brito@gmail.com', '31e5a2e32d10e4eac2d3fc982307f223', 'Adria', 'Brito', NULL, '992644169', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-21 16:08:34', '2014-12-21 16:08:34', NULL, NULL, NULL, '972821F588C546C794D51ABBBD937D5C', 1),
(54, 'ATC + Kayak Adventure', 'ATC + Kayak Adventure', '1234', 'ATC + Kayak Adventure', 'ATC + Kayak Adventure', 'ATC + Kayak Adventure', NULL, NULL, NULL, NULL, NULL, NULL, '<p>\n	Parceria entre a Amazon Tree Climbing com a Kayak Adventure, duas das maiores empresas de Ecoturismo e Turismo de Aventura de Manaus.</p>\n', '<p>\n	Parceria entre a Amazon Tree Climbing com a Kayak Adventure, duas das maiores empresas de Ecoturismo e Turismo de Aventura de Manaus.</p>\n', 'Parceria entre a Amazon Tree Climbing com a Kayak Adventure, duas das maiores empresas de Ecoturismo e Turismo de Aventura de Manaus.', 'Parceria entre a Amazon Tree Climbing com a Kayak Adventure, duas das maiores empresas de Ecoturismo e Turismo de Aventura de Manaus.', 0, 1, 0, '2014-12-23 13:01:53', '2014-12-23 13:01:53', NULL, 'M', '64c04-parceiros.png', NULL, NULL),
(55, 'heitornascimento@outlook.com', 'heitornascimento@outlook.com', '21a2a68472af5acda2d85e82a60aaf1e', 'Heitor', 'Nascimento', NULL, '92 992889135', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-25 20:06:47', '2014-12-25 20:06:47', NULL, NULL, NULL, '0B165DBEC05443C3A1EB80D59909D07E', 1),
(56, 'cintiafernandes12@gmail.com', 'cintiafernandes12@gmail.com', 'd24bf2c5269510b49bf728d475c7fe4a', 'Cintia', 'Fernandes', NULL, '92992433001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-26 04:39:09', '2014-12-26 04:39:09', NULL, NULL, NULL, '0E5D175565AC494091B4F80D9D0B292E', 1),
(57, 'gracechaves14@gmail.com', 'gracechaves14@gmail.com', '68727d15820a0c2ebc29636a8ba6d666', 'Grace', 'Chaves', NULL, '92994222442', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2014-12-26 05:29:56', '2014-12-26 05:29:56', NULL, NULL, NULL, 'FE34361DDD084C29935C1A7756D63E24', 1),
(58, 'sanbergsan@gmail.com', 'sanbergsan@gmail.com', 'c17f0a79328a4c5edb8525de368a4881', 'BERGSAN', 'SAMPAIO', NULL, '92988184764', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-01-02 04:47:20', '2015-01-02 04:47:20', NULL, NULL, NULL, '1623097D0BCD4C7AAFD241126136378B', 1),
(59, 'uli.totti@gmail.com', 'uli.totti@gmail.com', 'da113ee1b656dad90afade09e3b3f2da', 'Ulisses', 'Araújo', NULL, '999027503', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-01-02 14:38:15', '2015-01-02 14:38:15', NULL, NULL, NULL, '87F0070ED7A94DFC8AE913BFDF4BDF93', 1),
(60, 'sergioabfarias@gmail.com', 'sergioabfarias@gmail.com', 'a28f0e1afc47676866e8eed7f6862a44', 'Sérgio', 'Farias', NULL, '092982684135', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-01-10 13:14:02', '2015-01-10 13:14:02', NULL, NULL, NULL, '8B0D77967D2F442C9D129F097F2A2A29', 1),
(61, 'amandaeomenezes@gmail.com', 'amandaeomenezes@gmail.com', '9d910c8bf395fce35216f0f4fa85432e', 'Amanda', 'Menezes', NULL, '99469-4611', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-01-14 19:18:02', '2015-01-14 19:18:02', NULL, NULL, NULL, '68563C7EE6E84998A3B603139CFFD425', 1),
(62, 'annyrms2603@gmail.com', 'annyrms2603@gmail.com', '1be6ee201bc3b7a79ba082bb4baa13fc', 'Anny', 'Souza', NULL, '(92)992520904', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-01-15 14:50:37', '2015-01-15 14:50:37', NULL, NULL, NULL, 'A42286D4455840208206B9AE1C34A261', 1),
(63, '', '', 'd41d8cd98f00b204e9800998ecf8427e', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-01-15 19:45:54', '2015-01-15 19:45:54', NULL, NULL, NULL, NULL, 1),
(64, 'rebeca.olimpio@gmail.com', 'rebeca.olimpio@gmail.com', '6584b8965422c67c6ac3163267fc59de', 'Rebeca', 'Queiroz', NULL, '(92)982269449', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-01-16 05:31:08', '2015-01-16 05:31:08', NULL, NULL, NULL, 'B63F5381F4BB436694ECD751FB5C8D8A', 1),
(65, 'deborah_prestes@hotmail.com', 'deborah_prestes@hotmail.com', 'dc1995fffe74e5d68225798b6894d3e0', 'DÉBORAH', 'PRESTES ', NULL, '92195049', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-01-21 08:23:41', '2015-01-21 08:23:41', NULL, NULL, NULL, '7416001D3BF94BE6B4F90FACC09AE0C3', 1),
(66, 'alexandrermd@gmail.com', 'alexandrermd@gmail.com', '06a05b13819f4afad991cc2143732b66', 'Alexandre', 'Dias', NULL, '+559298430647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-01-27 05:49:28', '2015-01-27 05:49:28', NULL, NULL, NULL, 'AEDA4B3C93254F37ADF57CD80BFFBA08', 1),
(67, 'chaves.ananda@gmail.com', 'chaves.ananda@gmail.com', 'f708a05e7b5774b7742d7abaeccf0225', 'Ananda', 'Chaves', NULL, '996217714', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-01-27 05:52:29', '2015-01-27 05:52:29', NULL, NULL, NULL, 'C062A83747084C7DA20CE7ED947E2EF4', 1),
(68, 'deborah_prestes@hotmail.vom', 'deborah_prestes@hotmail.vom', 'a703d6d14769d658f85a3b4c2c1ef9c7', 'Deborah', 'Prestes', NULL, '92195049', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-01-27 09:29:01', '2015-01-27 09:29:01', NULL, NULL, NULL, 'FE700606DB5E451FBA133CB7201B02D4', 1),
(69, 'kitauchi.isabela@gmail.com', 'kitauchi.isabela@gmail.com', 'cdedb1985efb0967585cd97bf6063fdb', 'Isabela', 'Kitauchi', NULL, '992013808', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-01-27 18:22:44', '2015-01-27 18:22:44', NULL, NULL, NULL, 'C2DC84D257994B77A636D91814097493', 1),
(70, 'maalbu@live.com', 'maalbu@live.com', '2e39234ab3e59652a045a4c4e8103160', 'Marcelo', 'Chaves', NULL, '992862293', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-01-29 11:49:53', '2015-01-29 11:49:53', NULL, NULL, NULL, '225A28A582CB490CAD4EBC2DC813DA81', 1),
(71, 'migugha@yahoo.com.br', 'migugha@yahoo.com.br', 'd3bcedd3bb32a14438371598e7933cdf', 'Mayara', 'Silva', NULL, '92 81606804', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-02-11 15:24:09', '2015-02-11 15:24:09', NULL, NULL, NULL, '4334DC3EE48B4F5CB9EEBFA42688FEC9', 1),
(72, 'brlima175@gmail.com', 'brlima175@gmail.com', 'fa2bfefee701b9d785013ee96b1c71df', 'Bárbara', 'Lima', NULL, '98121-6450', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-02-12 11:33:50', '2015-02-12 11:33:50', NULL, NULL, NULL, '496651DCDCAD42C0977CE08AD0EE2606', 1),
(73, 'nayane.maia@gmail.com', 'nayane.maia@gmail.com', '181bf1b305cf7dd9a227f7923285fa1d', 'NAYANE', 'MAIA', NULL, '991566882', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-02-12 12:41:55', '2015-02-12 12:41:55', NULL, NULL, NULL, 'B94C95738BC54113A946FB7D843CD2E7', 1),
(74, 'ruslangc2905@gmail.com', 'ruslangc2905@gmail.com', '3c8a3234ac60f6cdba7eb902c147991c', 'Ruslan', 'cerquinho', NULL, '92994046096', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-02-15 06:34:18', '2015-02-15 06:34:18', NULL, NULL, NULL, 'D26F0B98798F40A3930316EFF23F7556', 1),
(75, 'alynee.maxwell@hotmail.com', 'alynee.maxwell@hotmail.com', '2e2b8368311331fa33a024187e95c86b', 'Alynee', 'Israel', NULL, '981112955', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-02-15 17:26:06', '2015-02-15 17:26:06', NULL, NULL, NULL, '64CB41FBEC784F5994241BC4B800532E', 1),
(76, 'paulobenevides13@gmail.com', 'paulobenevides13@gmail.com', '36b517451b1e50a8ef9c10c51c31c86c', 'Paulo', 'Benevides Filho', NULL, '92 992823036', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-02-16 11:59:16', '2015-02-16 11:59:16', NULL, NULL, NULL, '8A88671469DD43A68065E78B684C135F', 1),
(77, 'aquilar@gmail.com', 'aquilar@gmail.com', '85f34d7bfc44fa2693f66b563610ede3', 'jeferson', NULL, NULL, '92 981211651', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-02-25 05:27:11', '2015-02-25 05:27:11', NULL, NULL, NULL, NULL, 1),
(78, 'Roraima Adventure', 'Roraima Adventure', 'Roraima Adventure', 'Roraima Adventure', 'Roraima Adventure', 'Roraima Adventure', '(95) 3624-961', 'Boa Vista', 'RR', 'Brasil', NULL, '0527651700021', '<p>\n	Somos uma operadora de turismo na Amaz&ocirc;nia, estabelecida em Boa Vista &ndash; Roraima.&nbsp;<span style="font-size: 12px;">Al&eacute;m dos pacotes formatados, oferecemos a cria&ccedil;&atilde;o de roteiros espec&iacute;ficos para regi&otilde;es onde voc&ecirc; pode ser a primeira pessoa a p&ocirc;r os p&eacute;s.</span></p>\n', NULL, 'Somos uma operadora de turismo na Amazônia, estabelecida em Boa Vista.', NULL, 0, 1, 0, '2015-03-09 15:26:38', '2015-03-09 13:57:30', NULL, NULL, '12b17-logo-roraima-adventure-branca.png', NULL, NULL),
(79, 'antoniocastro.eng@gmail.com', 'antoniocastro.eng@gmail.com', '885383f16fccd10370814fcd862aa10d', 'Antonio', 'Carlos de Castro da Silva', NULL, '99107-7125', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-03-10 10:52:07', '2015-03-10 10:52:07', NULL, NULL, NULL, '17C0187788224E889CD45D266A3DE94C', 1),
(80, 'vmichiles@gmail.com', 'vmichiles@gmail.com', '3b90defbdcc650aba34a3317c0df7dcd', 'Vivaldo', 'Michiles', NULL, '982334303', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-03-10 11:22:56', '2015-03-10 11:22:56', NULL, NULL, NULL, '501A537BB33E48F0B9E06305B7A5236F', 1),
(81, 'camelo@gmail.com', 'camelo@gmail.com', '4855891d400b3d78fcad5a540a5076c0', 'Rodrigo', 'Oliveira', NULL, '(92)988122006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-03-10 11:30:44', '2015-03-10 11:30:44', NULL, NULL, NULL, 'F26664822EE14F96B28B660CD47B4F46', 1),
(82, 'fernandahossokawa@hotmail.com', 'fernandahossokawa@hotmail.com', 'e2a90edb4829db9c07e26bf2268a2ad2', 'FERNANDA', 'HOSSOKAWA', NULL, '981253627', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-03-13 08:17:34', '2015-03-13 08:17:34', NULL, NULL, NULL, '6F775D0AC85A4DBD8875CFBF81AF6F13', 1),
(83, NULL, ' barcohacker@gmail.com', ' barcohacker@gmail.com', 'Barco Hacker', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>\n	<span style="font-size: 10.5pt; line-height: 115%; font-family: Helvetica, sans-serif; color: rgb(20, 24, 35); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">Um projeto de cidadania, tecnologia e acesso a informa&ccedil;&atilde;o pelas ilhas e munic&iacute;pios da Amaz&ocirc;nia.</span></p>\n', NULL, NULL, NULL, 0, 1, 0, '2015-03-17 05:22:29', '2015-03-17 05:22:29', NULL, NULL, 'b25e4-logo-barco-png.png', NULL, NULL),
(84, 'tallesronaldo _ @hotmail.com ', 'tallesronaldo _ @hotmail.com ', '31f4f09eadffa0b4ec2fc356f22466ee', 'Talles', 'Ronaldo Santos ', NULL, '92 99146-7816', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-03-17 15:55:02', '2015-03-17 15:55:02', NULL, NULL, NULL, NULL, 1),
(85, 'bpb.designer@gmail.com', 'bpb.designer@gmail.com', '9b2b78033ecf0401a2feab5b4ba7462e', 'Bruno', 'Silva', NULL, '(92) 98134-53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-03-18 07:32:11', '2015-03-18 07:32:11', NULL, NULL, NULL, 'A0AE427E44E14FBABBB3F6AF4E0B11DB', 1),
(86, 'fernandosalesjunior@hotmail.com', 'fernandosalesjunior@hotmail.com', '0bc24d6453cd7013f80f2a3a700ac703', 'Fernando', 'Sales de Sousa Junior', NULL, '(92) 99162-75', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-03-18 12:51:13', '2015-03-18 12:51:13', NULL, NULL, NULL, '5B72B2582BFC4E00B6E405D0218E63A1', 1),
(87, 'marcio_nk@yahoo.com', 'marcio_nk@yahoo.com', '02f5f4ab66cdcc9d55c0da160405c788', 'Marcio', 'Kobayashi', NULL, '(041 92) 9811', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-03-19 14:01:39', '2015-03-19 14:01:39', NULL, NULL, NULL, '4BF304581C094899B8B13AD0AED94ADD', 1),
(88, 'valerials@hotmail.com', 'valerials@hotmail.com', 'cc307492c3ef8992acc775baecd99b17', 'Valéria', 'Santos', NULL, '981166499', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-03-20 06:37:38', '2015-03-20 06:37:38', NULL, NULL, NULL, 'D4064D9B38324DFA951B9DB690562546', 1),
(89, 'adilio.moreira@gmail.com', 'adilio.moreira@gmail.com', 'c039cd8e53d43c25b7bef8aa236ea9df', 'Adilio', 'Moreira', NULL, '92 98824-6411', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-03-20 06:40:47', '2015-03-20 06:40:47', NULL, NULL, NULL, 'E3CACF0636AD43C2940C32A1A88ECB87', 1),
(90, 'liviaferreir@hotmail.com', 'liviaferreir@hotmail.com', '42b862b75c187220eb1d516ed6e34d32', 'Livia', 'Ferreira', NULL, '092981729102', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-03-20 07:58:53', '2015-03-20 07:58:53', NULL, NULL, NULL, 'C0E0B8193EF44AF3AC8C6F0E711AD89F', 1),
(91, 'crinnger@gmail.com', 'crinnger@gmail.com', '3ca355e8c63776b5f2c653ded08c2e9b', 'CRINNGER', 'OLIVEIRA', NULL, '991360070', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-03-20 11:24:07', '2015-03-20 11:24:07', NULL, NULL, NULL, '0E398B5D661B49AC867D946835E758C0', 1),
(92, 'vanessabaldeon@hotmai.com', 'vanessabaldeon@hotmai.com', '91273e8cfb21c51c025ce8de2a9231ee', 'Vanessa', 'Baldeon', NULL, '(92) 99382-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-03-23 10:23:37', '2015-03-23 10:23:37', NULL, NULL, NULL, 'FBE3C2EFA4C743AFA3816B6EC9ADB685', 1),
(93, 'mauraregina@gmail.com', 'mauraregina@gmail.com', '89c7624a08363199abb55610878bd4ea', 'Maura', 'Costa', NULL, '092982367693', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-03-23 13:41:44', '2015-03-23 13:41:44', NULL, NULL, NULL, '0920425E10584CDAA5B8AF551D2CC8EC', 1),
(94, 'milton_lima@hotmail.com', 'milton_lima@hotmail.com', '7c6e8d16a121df9be3e30701e417d11b', 'Milton', 'Lima', NULL, '92-981318801', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-03-24 06:47:12', '2015-03-24 06:47:12', NULL, NULL, NULL, 'C5B1BE798BC94460B043C6C79F56FFB8', 1),
(95, 'rosanenv@hotmail.com', 'rosanenv@hotmail.com', '13402860e6813c1f9ee30986af27d8e7', 'Rosane', 'Vieira', NULL, '991911699', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-03-24 09:05:49', '2015-03-24 09:05:49', NULL, NULL, NULL, '8F9F10D562EF483DB06279FC9F9E76F5', 1),
(96, 'lorena_veras@yahoo.com.br', 'lorena_veras@yahoo.com.br', '0d2dcd6fcb7eeeaec7a317efbd01da0e', 'Lorena', 'Santos', NULL, '982291482', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-03-25 08:01:22', '2015-03-25 08:01:22', NULL, NULL, NULL, '523A6480A5254EC0908B46ECC1AE9650', 1),
(97, 'carlosborges_arantes@hotmail.com', 'carlosborges_arantes@hotmail.com', '8fe918632d847e8ea3ebffbd47bd8ca9', 'Carlos', 'Henriqeu Arantes', NULL, '992148778', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-03-27 15:03:47', '2015-03-27 15:03:47', NULL, NULL, NULL, '92A42D20B5FD43388B1D19EBD41AD2D4', 1),
(98, 'renanbaima@gmail.com', 'renanbaima@gmail.com', '6a1e47b9efe18a697820a81c46bf76e8', 'RENAN', 'BAIMA', NULL, '+559299613245', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-03-30 18:01:28', '2015-03-30 18:01:28', NULL, NULL, NULL, 'EC75939C26E04F44B71BAF65F1086F71', 1),
(99, 'arivano@live.com.pt', 'arivano@live.com.pt', 'cdc5e4690bc8fa8c84a38361cb49a2dd', 'ARIVANO', NULL, NULL, '981067023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-03-31 13:26:21', '2015-03-31 13:26:21', NULL, NULL, NULL, '73156DA997EF425A880E7DE63F1F0F5C', 1),
(100, 'wolnei.comarketing@hotmail.com', 'wolnei.comarketing@hotmail.com', '9841dae2deba37b852edd27705c714af', 'Wolnei', 'Cesar', NULL, '92 991478529', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-01 04:26:31', '2015-04-01 04:26:31', NULL, NULL, NULL, '162932FD698D43F0A0E689A8A63E8592', 1),
(101, 'pedrosa@splasercut.com.br', 'pedrosa@splasercut.com.br', '1a5e9b272e3e1f9904485b93e7a34aa5', 'josé', NULL, NULL, 'pedrosa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-01 05:56:29', '2015-04-01 05:56:29', NULL, NULL, NULL, 'E716D8AB134F49D6A1FBD99A24E77CC0', 1),
(102, 'anacrpas@gmail.com', 'anacrpas@gmail.com', '9aba45a7f1999a9c5fc96ef2a45810fb', 'Ana', 'Pas', NULL, '996125975', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-01 08:20:31', '2015-04-01 08:20:31', NULL, NULL, NULL, 'F820D552CA6646E4BDE3DF6550CD8A78', 1),
(103, 'Juliane Tavares', 'bioturamazonas@gmail.com', 'amazonasbiotur', 'Juliane', 'Tavares Guerreiro', 'Biotur Amazonas', NULL, NULL, NULL, NULL, NULL, NULL, '<p>\n	A Biotur Amazonas &eacute; uma operadora de turismo mais completa de Presidente Figueiredo.&nbsp; Atuamos em toda regi&atilde;o norte em diversos segmentos tur&iacute;sticos, com roteiros personalizados e diferenciados. (Ecoturismo, turismo de aventura, turismo religioso, turismo rural, turismo pedag&oacute;gico, turismo espeleol&oacute;gico, turismo arqueol&oacute;gico, turismo cinematogr&aacute;fico e pesca esportiva). Tamb&eacute;m trabalhamos na organiza&ccedil;&atilde;o de eventos educacionais e empresariais, na emiss&atilde;o de passagens a&eacute;reas, reservas em hot&eacute;is, pousadas, restaurantes entre outros servi&ccedil;os.</p>\n', NULL, NULL, NULL, 0, 1, 0, '2015-04-01 13:29:19', '2015-04-01 13:29:19', NULL, 'F', '22550-logo-tipo-bioturamazonas.jpg', NULL, NULL),
(104, 'lucio_lopes06@yahoo.com.br', 'lucio_lopes06@yahoo.com.br', 'da54b82569fa222139569ce016441eaf', 'Lucio', 'José Pereira Lopes', NULL, '991822211', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-02 00:04:53', '2015-04-02 00:04:53', NULL, NULL, NULL, '79B71AED66CA4498AA82E1A4605EBB8F', 1),
(105, 'blupi_lupi@hotmail.com', 'blupi_lupi@hotmail.com', '533709628a9d81005dd7f5173b7e50e7', 'BRUNA', 'LUPI', NULL, '011 94733-295', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-02 11:46:37', '2015-04-02 11:46:37', NULL, NULL, NULL, 'B5F5D286B6FE4F59923A72D3BDDF7A98', 1),
(106, 'nelsonpoli@gmail.com', 'nelsonpoli@gmail.com', '573ad19d284b4fd9d735c99dc94af893', 'Nelson', 'Poli Teixeira Filho', NULL, '92988551985', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-03 16:45:02', '2015-04-03 16:45:02', NULL, NULL, NULL, 'ED1C2299C59C4A43ABECDC925DB29B66', 1),
(107, 'rron.bbrian@gmail.com', 'rron.bbrian@gmail.com', 'dd335f498ed05ba3881a0fbbaf777697', 'Ronaldo', 'Aguiar', NULL, '92993864422', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-05 00:00:00', '2015-04-05 00:00:00', NULL, NULL, NULL, '5DE0538070C2488F9EBC61A404EECC5D', 1),
(108, 'reginetesilva@yahoo.com.br', 'reginetesilva@yahoo.com.br', '7050b89ab6ac0a2a29f0db5c6023c07b', 'REGINETE', 'DOS SANTOS DA SILVA', NULL, '92993442774', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-08 10:12:44', '2015-04-08 10:12:44', NULL, NULL, NULL, 'BE21D8BDFBEF4968BC069158EB052979', 1),
(109, 'magmarcela@outlook.com', 'magmarcela@outlook.com', '2391a8824b82d95f117376b9413deb8e', 'MARCELA', 'MAGALHAES', NULL, '92993331439', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-08 10:16:49', '2015-04-08 10:16:49', NULL, NULL, NULL, '2BBB7DD286134D16BAB0F7E050350487', 1),
(110, 'Vermelho Anavilhanas Tours', 'Vermelho Anavilhanas Tours', 'Vermelho Anavilhanas Tours', 'Vermelho Anavilhanas Tours', 'Vermelho Anavilhanas Tours', 'Vermelho Anavilhanas Tours', NULL, NULL, NULL, NULL, NULL, NULL, '<p>\n	Operador e guia local</p>\n', NULL, 'Operador e guia local', NULL, 0, 1, 0, '2015-04-09 11:36:06', '2015-04-09 11:36:06', NULL, NULL, NULL, NULL, NULL),
(111, 'ideiasfera@gmail.com', 'ideiasfera@gmail.com', 'e3928a3bc4be46516aa33a79bbdfdb08', 'bruno', 'carneiro', NULL, '92008039', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-10 08:58:53', '2015-04-10 08:58:53', NULL, NULL, NULL, 'EA0CF7B580044D898A250FF54EFFB336', 1),
(112, 'laryadv@gmail.com', 'laryadv@gmail.com', 'e335742a8bda7145fff6abb7f08a1561', 'LARISSA', 'DE ARAUJO FREITAS', NULL, '993079574', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-14 05:54:16', '2015-04-14 05:54:16', NULL, NULL, NULL, 'FEB9845CD4314ADDBABFAB027A5CA7AD', 1),
(113, 'thaiisdasilva@hotmail.com', 'thaiisdasilva@hotmail.com', '67e5481fbb7a7b290c9b4aab0122286c', 'THAIS', 'DA SILVA E SILVA', NULL, '92993332211', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-14 15:41:05', '2015-04-14 15:41:05', NULL, NULL, NULL, '7DEA14D570204308B0A4DA9A266896D3', 1),
(114, 'gerson.silva.lima@gmail.com', 'gerson.silva.lima@gmail.com', 'cc7b129e81fdbbf5e4a0089e93798419', 'Gerson', NULL, NULL, '992643987', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-16 07:15:02', '2015-04-16 07:15:02', NULL, NULL, NULL, '146FFFAE56A24CBDAEB3E44EE3017BD6', 1),
(115, 'claudearagao@gmail.com', 'claudearagao@gmail.com', '843aabe3cea3971cac524a6c57b13051', 'Cláudia', 'Aragão', NULL, '92991418896', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-17 09:04:33', '2015-04-17 09:04:33', NULL, NULL, NULL, '236DA091BBE2495E84EB2E4E2B2F7BC2', 1),
(116, 'shai.eny@hotmail.com', 'shai.eny@hotmail.com', 'bc091c267d84799edd655737f7dcf48b', 'Shaieny', 'Guedes', NULL, '982023686', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-17 10:57:52', '2015-04-17 10:57:52', NULL, NULL, NULL, '848341E5FF4F4E88B9842CA5CA40B116', 1),
(117, 'vivianebalieiroo@gmail.com', 'vivianebalieiroo@gmail.com', 'fde79ac8b4efc34873e02aa0ed54ef3e', 'VIVIANE', 'SOARES', NULL, '981854569', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-17 11:58:32', '2015-04-17 11:58:32', NULL, NULL, NULL, 'D004B2357EFE45D299E5E8708EB790EF', 1),
(118, 'Jeanandrade@atacadao.com.br ', 'Jeanandrade@atacadao.com.br ', 'b71985397688d6f1820685dde534981b', 'jean', 'adams ', NULL, '991833476', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-20 09:00:27', '2015-04-20 09:00:27', NULL, NULL, NULL, NULL, 1),
(119, 'Jeanped18@gmail.com ', 'Jeanped18@gmail.com ', 'b71985397688d6f1820685dde534981b', 'jean', 'adams ', NULL, '991833476', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-20 09:09:25', '2015-04-20 09:09:25', NULL, NULL, NULL, NULL, 1),
(120, 'valente_mecanica07@hotmail.com', 'valente_mecanica07@hotmail.com', '599f285d727e529456d079aba4bca4d6', 'Patrícia', 'Valente', NULL, '992022033', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-20 18:44:19', '2015-04-20 18:44:19', NULL, NULL, NULL, '8A13585CEBE24FB598CCF1D3DAD0E814', 1),
(121, 'edu.fernandes.o@gmail.com', 'edu.fernandes.o@gmail.com', '364a440226e1b575411a0e324e712d17', 'Eduardo', 'Oliveira', NULL, '(92) 98196525', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-20 22:33:36', '2015-04-20 22:33:36', NULL, NULL, NULL, '3592FA0DA5B544FCA39227844DF8FA0D', 1),
(122, 'alyelsaad@hotmail.com', 'alyelsaad@hotmail.com', 'b5d3f09e251b1297aa88e7d5c3443c87', 'Alyel', NULL, NULL, '9284267119', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-24 18:33:17', '2015-04-24 18:33:17', NULL, NULL, NULL, 'FE45343142704E0889174A5CB252E005', 1),
(123, 'NCARDINCOMPANY@AOL.COM', 'NCARDINCOMPANY@AOL.COM', '70483b6e100c9cebbffcdc62dea07eda', 'Jose', 'Neto', NULL, '92981666238', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2015-04-29 18:39:55', '2015-04-29 18:39:55', NULL, NULL, NULL, 'E6015CD2492C4ED7BC803A957A092C7C', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acompanhamentos`
--
ALTER TABLE `acompanhamentos`
  ADD CONSTRAINT `fk_itens_has_atividade_atividade1` FOREIGN KEY (`atividade_codigo`) REFERENCES `atividade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_itens_has_atividade_itens1` FOREIGN KEY (`itens_id`) REFERENCES `itens` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `atividade`
--
ALTER TABLE `atividade`
  ADD CONSTRAINT `fk_atividade_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_atividade_elemento1` FOREIGN KEY (`elemento_id`) REFERENCES `elemento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_atividade_modalidade1` FOREIGN KEY (`modalidade_id`) REFERENCES `modalidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_atividade_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `avaliacao_atividade`
--
ALTER TABLE `avaliacao_atividade`
  ADD CONSTRAINT `fk_avaliacao_atividade_atividade1` FOREIGN KEY (`atividade_codigo`) REFERENCES `atividade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_has_evento_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `avaliacao_usuario`
--
ALTER TABLE `avaliacao_usuario`
  ADD CONSTRAINT `fk_usuario_has_usuario_usuario3` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_has_usuario_usuario4` FOREIGN KEY (`usuario_destino`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comentario_atividade`
--
ALTER TABLE `comentario_atividade`
  ADD CONSTRAINT `fk_comentario_evento_atividade1` FOREIGN KEY (`atividade_codigo`) REFERENCES `atividade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_has_evento_usuario2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comentario_usuario`
--
ALTER TABLE `comentario_usuario`
  ADD CONSTRAINT `fk_usuario_has_usuario_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_has_usuario_usuario2` FOREIGN KEY (`usuario_destino`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `descricao_atividade`
--
ALTER TABLE `descricao_atividade`
  ADD CONSTRAINT `fk_lingua_has_atividade_atividade1` FOREIGN KEY (`atividade_codigo`) REFERENCES `atividade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_lingua_has_atividade_lingua1` FOREIGN KEY (`lingua_id`) REFERENCES `lingua` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dicas`
--
ALTER TABLE `dicas`
  ADD CONSTRAINT `fk_informacoes_has_atividade_atividade1` FOREIGN KEY (`atividade_codigo`) REFERENCES `atividade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_informacoes_has_atividade_informacoes1` FOREIGN KEY (`informacoes_id`) REFERENCES `informacoes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `fk_evento_atividade1` FOREIGN KEY (`atividade_codigo`) REFERENCES `atividade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fatura`
--
ALTER TABLE `fatura`
  ADD CONSTRAINT `fk_evento_has_usuario_evento1` FOREIGN KEY (`evento_codigo`) REFERENCES `evento` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_evento_has_usuario_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `fk_fatura_has_status_fatura1` FOREIGN KEY (`fatura_id`) REFERENCES `fatura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fatura_has_status_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `preferencias`
--
ALTER TABLE `preferencias`
  ADD CONSTRAINT `fk_esporte_has_usuario_esporte1` FOREIGN KEY (`modalidade_id`) REFERENCES `modalidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_esporte_has_usuario_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `restricoes`
--
ALTER TABLE `restricoes`
  ADD CONSTRAINT `fk_cuidados_has_atividade_atividade1` FOREIGN KEY (`atividade_codigo`) REFERENCES `atividade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cuidados_has_atividade_cuidados1` FOREIGN KEY (`cuidados_id`) REFERENCES `cuidados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
