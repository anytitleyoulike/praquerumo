-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 16, 2014 at 02:25 
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
-- Table structure for table `acompanhamentos`
--

CREATE TABLE IF NOT EXISTS `acompanhamentos` (
  `itens_id` int(11) NOT NULL,
  `atividade_codigo` int(11) NOT NULL,
  PRIMARY KEY (`itens_id`,`atividade_codigo`),
  KEY `fk_itens_has_atividade_atividade1_idx` (`atividade_codigo`),
  KEY `fk_itens_has_atividade_itens1_idx` (`itens_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Atividade que será anunciada' AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `avaliacao_atividade`
--

CREATE TABLE IF NOT EXISTS `avaliacao_atividade` (
  `usuario_id` int(11) NOT NULL,
  `atividade_codigo` int(11) NOT NULL,
  `nota` tinyint(4) NOT NULL,
  `recomenda` tinyint(1) NOT NULL,
  PRIMARY KEY (`usuario_id`,`atividade_codigo`),
  KEY `fk_usuario_has_evento_usuario1_idx` (`usuario_id`),
  KEY `fk_avaliacao_atividade_atividade1_idx` (`atividade_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Table structure for table `cuidados`
--

CREATE TABLE IF NOT EXISTS `cuidados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pt` varchar(255) NOT NULL,
  `nome_en` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Exceções de atividades = { Acima de 10 anos, Abaixo de 50 anos e etc...}' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `descricao_atividade`
--

CREATE TABLE IF NOT EXISTS `descricao_atividade` (
  `lingua_id` int(11) NOT NULL,
  `atividade_codigo` int(11) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `apresentacao` text NOT NULL,
  `esforco_fisico` tinyint(4) NOT NULL,
  `conforto` tinyint(4) NOT NULL,
  `dificuldade_tecnica` tinyint(4) NOT NULL,
  `descricao` text NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `ponto_encontro` varchar(255) NOT NULL,
  `duracao` varchar(10) NOT NULL,
  `roteiro` text,
  `termo_consentimento` text,
  PRIMARY KEY (`lingua_id`,`atividade_codigo`),
  KEY `fk_lingua_has_atividade_atividade1_idx` (`atividade_codigo`),
  KEY `fk_lingua_has_atividade_lingua1_idx` (`lingua_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `disponivel` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`,`atividade_codigo`),
  KEY `fk_evento_atividade1_idx` (`atividade_codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Evento relacionado com a atividade' AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `fatura`
--

CREATE TABLE IF NOT EXISTS `fatura` (
  `id` varchar(32) NOT NULL,
  `inscricao_codigo` int(11) NOT NULL,
  PRIMARY KEY (`id`,`inscricao_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `historico`
--

CREATE TABLE IF NOT EXISTS `historico` (
  `status_id` int(11) NOT NULL,
  `fatura_id` varchar(32) NOT NULL,
  `fatura_inscricao_codigo` int(11) NOT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`status_id`,`fatura_id`,`fatura_inscricao_codigo`),
  KEY `fk_status_has_fatura_fatura1_idx` (`fatura_id`,`fatura_inscricao_codigo`),
  KEY `fk_status_has_fatura_status1_idx` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Historico da fatura';

-- --------------------------------------------------------

--
-- Table structure for table `informacoes`
--

CREATE TABLE IF NOT EXISTS `informacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pt` varchar(180) NOT NULL,
  `nome_en` varchar(180) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `itens`
--

CREATE TABLE IF NOT EXISTS `itens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pt` varchar(70) NOT NULL,
  `nome_en` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Esportes relacionados com a atividade = { caiaque, arvorismo, sup e etc... }' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `modalidade`
--

INSERT INTO `modalidade` (`id`, `nome_pt`, `nome_en`) VALUES
(1, 'Caiaque', 'Kayak'),
(2, 'Stand Up Paddle', 'Stand Up Paddle');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE IF NOT EXISTS `newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pt` varchar(10) NOT NULL,
  `nome_en` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Status de pagamento da atividade = { pending, paid, canceled, payment_in_progress, expired }' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `sobrenome` varchar(60) DEFAULT NULL,
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
  `id_cliente` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `nickname_UNIQUE` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Usuário da plataforma pqr' AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `usuario_tipo`
--

CREATE TABLE IF NOT EXISTS `usuario_tipo` (
  `usuario_tipo_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`usuario_tipo_id`,`usuario_id`),
  KEY `fk_usuario_tipo_has_usuario_usuario1_idx` (`usuario_id`),
  KEY `fk_usuario_tipo_has_usuario_usuario_tipo1_idx` (`usuario_tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Constraints for table `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `fk_status_has_fatura_fatura1` FOREIGN KEY (`fatura_id`, `fatura_inscricao_codigo`) REFERENCES `fatura` (`id`, `inscricao_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_status_has_fatura_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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

--
-- Constraints for table `usuario_tipo`
--
ALTER TABLE `usuario_tipo`
  ADD CONSTRAINT `fk_usuario_tipo_has_usuario_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_tipo_has_usuario_usuario_tipo1` FOREIGN KEY (`usuario_tipo_id`) REFERENCES `perfil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
