-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tempo de Geração: 
-- Versão do Servidor: 5.5.27
-- Versão do PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `praquerumo`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividade`
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
  PRIMARY KEY (`id_atividade`),
  KEY `fk_servico_fornecedor1_idx` (`id_fornecedor`),
  KEY `fk_atividade_cidade1_idx` (`id_cidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `atividade`
--

INSERT INTO `atividade` (`id_atividade`, `titulo`, `descricao`, `endereco`, `numero`, `bairro`, `cep`, `id_fornecedor`, `data`, `participantes_minimo`, `participantes_maximo`, `tipo`, `valor`, `destaque`, `id_cidade`, `thumbnail`) VALUES
(1, 'Paraquedismo', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 'Rua A', '22', 'Centro', '5899403', 1, NULL, NULL, NULL, 1, 50, 1, 1, 'atividade_1_img_thumb.jpg'),
(2, 'SUP', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation est laborum.', 'Rua C', '22', 'Centro', '3939403', 1, NULL, 2, 100, 4, 100, 1, 1, 'atividade_2_img_thumb.jpg'),
(3, 'Mountain Bike', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Rua c', '22', 'Japiim', '2939203', 1, NULL, NULL, NULL, 1, 30, 1, 1, 'atividade_3_img_thumb.jpg'),
(4, 'Bungee Jumping', 'Bungee jumping é um desporto radical praticado por muitos aventureiros corajosos, que consiste em saltar para o vázio amarrado aos tornozelos ou cintura a uma corda elástica. Há muito tempo, este desporto era uma espécie de prova Iniciação pela qual os rapazes de uma aldeia teriam de passar para poderem começar a ser chamados de adultos.', 'Rua B', '22', 'Centro', '839403', 1, NULL, NULL, NULL, 1, 120, 0, 1, 'atividade_4_img_thumb.jpg'),
(5, 'Arvorismo', 'Arborismo ou arvorismo é um esporte radical que consiste na travessia entre plataformas montadas no alto das árvores, ultrapassando diferentes tipos de obstáculos como escadas, pontes suspensas, tirolesas e outras atividades que podem ser criadas.\r\nA atividade é muito utilizada no turismo de aventura, para lazer e recreação, e para estudos de fauna e flora das camadas mais altas da floresta.', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 220, 0, 1, 'atividade_5_img_thumb.jpg'),
(6, 'Rafting', 'O rafting é a prática de descida em corredeiras em equipe utilizando botes infláveis e equipamentos de segurança. Antes de se começar qualquer descida de rafting comercial, um condutor da atividade passa a todos os participantes detalhadas instruções de conduta relativas à segurança. Estas instruções são lembradas pelos demais condutores durante momentos estratégicos da descida, e seu cumprimento é fundamental para a segurança de todos', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 40, 0, 1, 'atividade_6_img_thumb.jpg'),
(7, 'Boia Cross', 'O bóia-cross é realizado sentado sobre a bóia e o os remos são suas próprias mãos e braços. No Hotel Fazenda Parque dos Sonhos, o bóia-cross é realizado no Rio Cachoeirinha com um total de 1.300 metros de percurso. Nos trechos mais tranqüilos, é possível apreciar as belas paisagens ao redor do rio, com uma fauna e flora belíssima.', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 140, 0, 1, 'atividade_7_img_thumb.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nome`) VALUES
(1, 'Água'),
(2, 'Terra'),
(3, 'Ar');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_atividade`
--

CREATE TABLE IF NOT EXISTS `categoria_atividade` (
  `id_categoria` int(11) NOT NULL,
  `id_servico` int(11) NOT NULL,
  PRIMARY KEY (`id_categoria`,`id_servico`),
  KEY `fk_categoria_has_servico_servico1_idx` (`id_servico`),
  KEY `fk_categoria_has_servico_categoria1_idx` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE IF NOT EXISTS `cidade` (
  `id_cidade` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `id_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_cidade`),
  KEY `fk_cidade_estado1_idx` (`id_estado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES
(1, 'Manaus', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato_email`
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
-- Estrutura da tabela `contato_telefone`
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
-- Estrutura da tabela `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `sigla` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`id_estado`, `nome`, `sigla`) VALUES
(1, 'Amazonas', 'AM');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
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
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`id_fornecedor`, `nome`, `tipo`, `login`, `senha`) VALUES
(1, 'SUP Ltda', 1, 'sup', '123'),
(2, 'SUP Ltda', 1, 'sup', '123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `foto`
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
-- Extraindo dados da tabela `foto`
--

INSERT INTO `foto` (`id_foto`, `arquivo`, `id_atividade`, `destaque`) VALUES
(1, 'atividade_1_img_1.jpg', 1, 1),
(2, 'atividade_2_img_1.jpg', 2, 1),
(3, 'atividade_3_img_1.jpg', 3, 1),
(4, 'atividade_4_img_1.jpg', 4, NULL),
(5, 'atividade_5_img_1.jpg', 5, NULL),
(6, 'atividade_6_img_1.jpg', 6, NULL),
(7, 'atividade_7_img_1.jpg', 7, NULL);

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `atividade`
--
ALTER TABLE `atividade`
  ADD CONSTRAINT `fk_atividade_cidade1` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id_cidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servico_fornecedor1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `categoria_atividade`
--
ALTER TABLE `categoria_atividade`
  ADD CONSTRAINT `fk_categoria_has_servico_categoria1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_categoria_has_servico_servico1` FOREIGN KEY (`id_servico`) REFERENCES `atividade` (`id_atividade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `fk_cidade_estado1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `contato_email`
--
ALTER TABLE `contato_email`
  ADD CONSTRAINT `fk_contato_email_fornecedor1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `contato_telefone`
--
ALTER TABLE `contato_telefone`
  ADD CONSTRAINT `fk_contato_telefone_fornecedor1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `fk_foto_servico` FOREIGN KEY (`id_atividade`) REFERENCES `atividade` (`id_atividade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
