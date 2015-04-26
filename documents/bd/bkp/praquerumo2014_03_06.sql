-- phpMyAdmin SQL Dump
-- version 3.3.10.4
-- http://www.phpmyadmin.net
--
-- Host: mysql.praquerumo.com.br
-- Generation Time: Mar 06, 2014 at 05:39 PM
-- Server version: 5.1.56
-- PHP Version: 5.3.27

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `praquerumo`
--
CREATE DATABASE `praquerumo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `praquerumo`;

-- --------------------------------------------------------

--
-- Table structure for table `atividade`
--

CREATE TABLE IF NOT EXISTS `atividade` (
  `id_atividade` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `descricao` text,
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
  PRIMARY KEY (`id_atividade`),
  KEY `fk_servico_fornecedor1_idx` (`id_fornecedor`),
  KEY `fk_atividade_cidade1_idx` (`id_cidade`),
  KEY `fk_atividade_categoria1_idx` (`id_categoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `atividade`
--

INSERT INTO `atividade` (`id_atividade`, `titulo`, `descricao`, `endereco`, `numero`, `bairro`, `cep`, `id_fornecedor`, `data`, `participantes_minimo`, `participantes_maximo`, `tipo`, `valor`, `destaque`, `id_cidade`, `thumbnail`, `id_categoria`) VALUES
(1, 'Paraquedismo', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 'Rua A', '22', 'Centro', '5899403', 1, NULL, NULL, NULL, 1, 50, 1, 1, 'atividade_1_img_thumb.jpg', 1),
(2, 'SUP', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation est laborum.', 'Rua C', '22', 'Centro', '3939403', 1, NULL, 2, 100, 1, 100, 1, 1, 'atividade_2_img_thumb.jpg', 2),
(3, 'Mountain Bike', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Rua c', '22', 'Japiim', '2939203', 1, NULL, NULL, NULL, 1, 30, 1, 1, 'atividade_3_img_thumb.jpg', 3),
(4, 'Bungee Jumping', 'Bungee jumping é um desporto radical praticado por muitos aventureiros corajosos, que consiste em saltar para o vázio amarrado aos tornozelos ou cintura a uma corda elástica. Há muito tempo, este desporto era uma espécie de prova Iniciação pela qual os rapazes de uma aldeia teriam de passar para poderem começar a ser chamados de adultos.', 'Rua B', '22', 'Centro', '839403', 1, NULL, NULL, NULL, 1, 120, 0, 1, 'atividade_4_img_thumb.jpg', 1),
(5, 'Arvorismo', 'Arborismo ou arvorismo é um esporte radical que consiste na travessia entre plataformas montadas no alto das árvores, ultrapassando diferentes tipos de obstáculos como escadas, pontes suspensas, tirolesas e outras atividades que podem ser criadas.\r\nA atividade é muito utilizada no turismo de aventura, para lazer e recreação, e para estudos de fauna e flora das camadas mais altas da floresta.', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 220, 0, 1, 'atividade_5_img_thumb.jpg', 2),
(6, 'Rafting', 'O rafting é a prática de descida em corredeiras em equipe utilizando botes infláveis e equipamentos de segurança. Antes de se começar qualquer descida de rafting comercial, um condutor da atividade passa a todos os participantes detalhadas instruções de conduta relativas à segurança. Estas instruções são lembradas pelos demais condutores durante momentos estratégicos da descida, e seu cumprimento é fundamental para a segurança de todos', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 40, 0, 1, 'atividade_6_img_thumb.jpg', 3),
(7, 'Boia Cross', 'O bóia-cross é realizado sentado sobre a bóia e o os remos são suas próprias mãos e braços. No Hotel Fazenda Parque dos Sonhos, o bóia-cross é realizado no Rio Cachoeirinha com um total de 1.300 metros de percurso. Nos trechos mais tranqüilos, é possível apreciar as belas paisagens ao redor do rio, com uma fauna e flora belíssima.', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 140, 0, 1, 'atividade_7_img_thumb.jpg', 1),
(8, 'Camping', 'O campismo é o lazer para quem procura contato direto com a natureza em todas as suas variações e é uma excelente opção para turismo e apoio a prática de esportes e eventos esportivos.', 'Rua B', '22', 'Centro', '2938293', 2, '2014-03-14 09:31:22', 10, 50, 2, 120, 0, 1, 'atividade_8_img_thumb.jpg', 2),
(9, 'Cavernismo', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', 'Rua C.', '22', 'Centro', '93829394', 1, NULL, 1, 100, 1, 80, 0, 1, 'atividade_9_img_thumb.jpg', 1);

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

--
-- Dumping data for table `contato_email`
--


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

--
-- Dumping data for table `contato_telefone`
--


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

