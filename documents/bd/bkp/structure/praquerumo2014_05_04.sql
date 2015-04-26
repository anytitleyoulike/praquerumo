-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 04/05/2014 às 19:30
-- Versão do servidor: 5.6.14
-- Versão do PHP: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `praquerumo`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `acompanhamento`
--

CREATE TABLE IF NOT EXISTS `acompanhamento` (
  `item_id` int(11) NOT NULL,
  `atividade_codigo` int(11) NOT NULL,
  PRIMARY KEY (`item_id`,`atividade_codigo`),
  KEY `fk_item_has_atividade_atividade1` (`atividade_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `atividade`
--

CREATE TABLE IF NOT EXISTS `atividade` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `parceiro_id` int(11) NOT NULL,
  `esporte_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `descricao` text NOT NULL,
  `roteiro` text NOT NULL,
  `dicas` text,
  `diferencial` text,
  `esforco_fisico` tinyint(4) NOT NULL,
  `conforto` tinyint(4) NOT NULL,
  `experiencia` tinyint(4) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_atividade_esporte1` (`esporte_id`),
  KEY `fk_atividade_categoria1` (`categoria_id`),
  KEY `fk_atividade_parceiro1` (`parceiro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Atividade que será anunciada' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao`
--

CREATE TABLE IF NOT EXISTS `avaliacao` (
  `usuario_id` int(11) NOT NULL,
  `atividade_codigo` int(11) NOT NULL,
  `avaliacao` tinyint(4) NOT NULL,
  `organizador` tinyint(4) NOT NULL,
  PRIMARY KEY (`usuario_id`,`atividade_codigo`),
  KEY `fk_usuario_has_atividade_atividade1` (`atividade_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Avaliação que o usuario faz a uma atividade, deve ser avaliado também o organizador do evento, sendo esse líder(aventura) ou guia(ecoturismo)';

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Categorias da atividade = { aventura, turismo }' AUTO_INCREMENT=3 ;

--
-- Fazendo dump de dados para tabela `categoria`
--

INSERT INTO `categoria` (`id`, `nome`) VALUES
(1, 'Aventura'),
(2, 'Turismo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `certificacao`
--

CREATE TABLE IF NOT EXISTS `certificacao` (
  `parceiro_id` int(11) NOT NULL,
  `certificador_codigo` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `expiracao` date DEFAULT NULL,
  PRIMARY KEY (`parceiro_id`,`certificador_codigo`),
  KEY `fk_parceiro_has_certificador_certificador1` (`certificador_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `certificador`
--

CREATE TABLE IF NOT EXISTS `certificador` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `registro` varchar(30) NOT NULL,
  `entidade` varchar(30) NOT NULL,
  `sigla` varchar(45) DEFAULT NULL,
  `logo` blob NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta_bancaria`
--

CREATE TABLE IF NOT EXISTS `conta_bancaria` (
  `parceiro_id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `conta` varchar(20) NOT NULL,
  `agencia` varchar(10) NOT NULL,
  `nome_cartao` varchar(45) NOT NULL,
  PRIMARY KEY (`parceiro_id`,`numero`),
  UNIQUE KEY `numero_UNIQUE` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `elemento`
--

CREATE TABLE IF NOT EXISTS `elemento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=dec8 COMMENT='Elementos = {agua,terra,ar}' AUTO_INCREMENT=4 ;

--
-- Fazendo dump de dados para tabela `elemento`
--

INSERT INTO `elemento` (`id`, `nome`) VALUES
(1, 'Água'),
(2, 'Terra'),
(3, 'Ar');

-- --------------------------------------------------------

--
-- Estrutura para tabela `esporte`
--

CREATE TABLE IF NOT EXISTS `esporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Esportes relacionados com a atividade = { caiaque, arvorismo, sup e etc... }' AUTO_INCREMENT=6 ;

--
-- Fazendo dump de dados para tabela `esporte`
--

INSERT INTO `esporte` (`id`, `nome`) VALUES
(1, 'Caiaque'),
(2, 'Stand Up Paddle'),
(3, 'Arvorismo'),
(4, 'Paraquedismo'),
(5, 'Rafting');

-- --------------------------------------------------------

--
-- Estrutura para tabela `evento`
--

CREATE TABLE IF NOT EXISTS `evento` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `atividade_codigo` int(11) NOT NULL,
  `valor` float NOT NULL,
  `data` date NOT NULL,
  `ponto_encontro` varchar(20) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_evento_atividade1` (`atividade_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Evento relacionado com a atividade' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `excecao`
--

CREATE TABLE IF NOT EXISTS `excecao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Exceções de atividades = { Acima de 10 anos, Abaixo de 50 anos e etc...}' AUTO_INCREMENT=5 ;

--
-- Fazendo dump de dados para tabela `excecao`
--

INSERT INTO `excecao` (`id`, `nome`) VALUES
(1, 'Cardíaco'),
(2, 'Saber Nadar'),
(3, '+ 12 anos'),
(4, '+ 18 anos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fatura`
--

CREATE TABLE IF NOT EXISTS `fatura` (
  `id` varchar(32) NOT NULL,
  `inscricao_codigo` int(11) NOT NULL,
  PRIMARY KEY (`id`,`inscricao_codigo`),
  KEY `fk_fatura_inscricao1` (`inscricao_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `foto`
--

CREATE TABLE IF NOT EXISTS `foto` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `atividade_codigo` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `foto` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo`,`atividade_codigo`),
  KEY `fk_foto_atividade1` (`atividade_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico`
--

CREATE TABLE IF NOT EXISTS `historico` (
  `status_id` int(11) NOT NULL,
  `fatura_id` varchar(32) NOT NULL,
  `fatura_inscricao_codigo` int(11) NOT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`status_id`,`fatura_id`,`fatura_inscricao_codigo`),
  KEY `fk_status_has_fatura_fatura1` (`fatura_id`,`fatura_inscricao_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Historico da fatura';

-- --------------------------------------------------------

--
-- Estrutura para tabela `inscricao`
--

CREATE TABLE IF NOT EXISTS `inscricao` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `sessao_codigo` int(11) NOT NULL,
  `sessao_evento_codigo` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_evento_has_usuario_usuario1` (`usuario_id`),
  KEY `fk_inscricao_sessao1` (`sessao_codigo`,`sessao_evento_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Fazendo dump de dados para tabela `item`
--

INSERT INTO `item` (`id`, `nome`) VALUES
(1, 'Água'),
(2, 'Lanche'),
(3, 'Lanterna');

-- --------------------------------------------------------

--
-- Estrutura para tabela `natureza`
--

CREATE TABLE IF NOT EXISTS `natureza` (
  `elemento_id` int(11) NOT NULL,
  `atividade_codigo` int(11) NOT NULL,
  PRIMARY KEY (`elemento_id`,`atividade_codigo`),
  KEY `fk_elemento_has_atividade_atividade1` (`atividade_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `newsletter`
--

CREATE TABLE IF NOT EXISTS `newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `palavra_chave`
--

CREATE TABLE IF NOT EXISTS `palavra_chave` (
  `atividade_codigo` int(11) NOT NULL,
  `palavra` varchar(20) NOT NULL,
  PRIMARY KEY (`atividade_codigo`,`palavra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Palavras-chave da atividade para que seja encontrada com mais facilidade';

-- --------------------------------------------------------

--
-- Estrutura para tabela `parceiro`
--

CREATE TABLE IF NOT EXISTS `parceiro` (
  `id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `sobrenome` varchar(20) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `comissao` float NOT NULL COMMENT 'Comissão para o PraQueRumo',
  `facebook_id` varchar(20) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `cnpf` varchar(14) DEFAULT NULL,
  `account_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_parceiro_tipo1` (`tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `preferencias`
--

CREATE TABLE IF NOT EXISTS `preferencias` (
  `esporte_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`esporte_id`,`usuario_id`),
  KEY `fk_esporte_has_usuario_usuario1` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `regras`
--

CREATE TABLE IF NOT EXISTS `regras` (
  `codigo` int(11) NOT NULL,
  `evento_codigo` int(11) NOT NULL,
  `descricao` text NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_regras_evento1` (`evento_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Regras do PraQueRumo para o evento.\nExemplo:\n  1. Caso de "No show", o cliente poderá resgatar 20% do voucher pago.\n  2. Cancelamento até 48 hs antes da realização do evento por meio do email';

-- --------------------------------------------------------

--
-- Estrutura para tabela `restricao`
--

CREATE TABLE IF NOT EXISTS `restricao` (
  `restricao_id` int(11) NOT NULL,
  `atividade_codigo` int(11) NOT NULL,
  PRIMARY KEY (`restricao_id`,`atividade_codigo`),
  KEY `fk_restricao_has_atividade_atividade1` (`atividade_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sessao`
--

CREATE TABLE IF NOT EXISTS `sessao` (
  `codigo` int(11) NOT NULL,
  `evento_codigo` int(11) NOT NULL,
  `preco` float NOT NULL,
  `horario` time NOT NULL,
  `nro_maximo` int(11) DEFAULT NULL,
  `nro_minimo` int(11) DEFAULT NULL,
  `nro_disponivel` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`,`evento_codigo`),
  KEY `fk_sessao_evento1` (`evento_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Sessão do evento para cada atividade';

-- --------------------------------------------------------

--
-- Estrutura para tabela `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Status de pagamento da atividade = { pending, paid, canceled, payment_in_progress, expired }' AUTO_INCREMENT=6 ;

--
-- Fazendo dump de dados para tabela `status`
--

INSERT INTO `status` (`id`, `nome`) VALUES
(1, 'pending'),
(2, 'paid'),
(3, 'canceled'),
(4, 'payment_in_progress'),
(5, 'expired');

-- --------------------------------------------------------

--
-- Estrutura para tabela `telefone`
--

CREATE TABLE IF NOT EXISTS `telefone` (
  `telefone` int(11) NOT NULL,
  `parceiro_id` int(11) NOT NULL,
  PRIMARY KEY (`telefone`,`parceiro_id`),
  KEY `fk_telefone_parceiro1` (`parceiro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo`
--

CREATE TABLE IF NOT EXISTS `tipo` (
  `id` int(11) NOT NULL,
  `nome` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `tipo`
--

INSERT INTO `tipo` (`id`, `nome`) VALUES
(1, 'Líder'),
(2, 'Guia');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL,
  `senha` varchar(20) DEFAULT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `sobrenome` varchar(20) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `facebook_id` varchar(20) DEFAULT NULL,
  `telefone` varchar(13) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `pais` varchar(20) DEFAULT NULL,
  `dt_criacao` datetime DEFAULT NULL,
  `dt_atualizacao` datetime DEFAULT NULL,
  `account_id` varchar(32) DEFAULT NULL COMMENT 'inf. de conta no gateway de pagamento',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Usuário da plataforma pqr' AUTO_INCREMENT=1 ;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `acompanhamento`
--
ALTER TABLE `acompanhamento`
  ADD CONSTRAINT `fk_item_has_atividade_atividade1` FOREIGN KEY (`atividade_codigo`) REFERENCES `atividade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_item_has_atividade_item1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `atividade`
--
ALTER TABLE `atividade`
  ADD CONSTRAINT `fk_atividade_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_atividade_esporte1` FOREIGN KEY (`esporte_id`) REFERENCES `esporte` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_atividade_parceiro1` FOREIGN KEY (`parceiro_id`) REFERENCES `parceiro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `fk_usuario_has_atividade_atividade1` FOREIGN KEY (`atividade_codigo`) REFERENCES `atividade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_has_atividade_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `certificacao`
--
ALTER TABLE `certificacao`
  ADD CONSTRAINT `fk_parceiro_has_certificador_certificador1` FOREIGN KEY (`certificador_codigo`) REFERENCES `certificador` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_parceiro_has_certificador_parceiro1` FOREIGN KEY (`parceiro_id`) REFERENCES `parceiro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `conta_bancaria`
--
ALTER TABLE `conta_bancaria`
  ADD CONSTRAINT `fk_conta_bancaria_parceiro1` FOREIGN KEY (`parceiro_id`) REFERENCES `parceiro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `fk_evento_atividade1` FOREIGN KEY (`atividade_codigo`) REFERENCES `atividade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `fatura`
--
ALTER TABLE `fatura`
  ADD CONSTRAINT `fk_fatura_inscricao1` FOREIGN KEY (`inscricao_codigo`) REFERENCES `inscricao` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `fk_foto_atividade1` FOREIGN KEY (`atividade_codigo`) REFERENCES `atividade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `fk_status_has_fatura_fatura1` FOREIGN KEY (`fatura_id`, `fatura_inscricao_codigo`) REFERENCES `fatura` (`id`, `inscricao_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_status_has_fatura_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `inscricao`
--
ALTER TABLE `inscricao`
  ADD CONSTRAINT `fk_evento_has_usuario_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inscricao_sessao1` FOREIGN KEY (`sessao_codigo`, `sessao_evento_codigo`) REFERENCES `sessao` (`codigo`, `evento_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `natureza`
--
ALTER TABLE `natureza`
  ADD CONSTRAINT `fk_elemento_has_atividade_atividade1` FOREIGN KEY (`atividade_codigo`) REFERENCES `atividade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_elemento_has_atividade_elemento1` FOREIGN KEY (`elemento_id`) REFERENCES `elemento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `palavra_chave`
--
ALTER TABLE `palavra_chave`
  ADD CONSTRAINT `fk_palavra_chave_atividade1` FOREIGN KEY (`atividade_codigo`) REFERENCES `atividade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `parceiro`
--
ALTER TABLE `parceiro`
  ADD CONSTRAINT `fk_parceiro_tipo1` FOREIGN KEY (`tipo_id`) REFERENCES `tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `preferencias`
--
ALTER TABLE `preferencias`
  ADD CONSTRAINT `fk_esporte_has_usuario_esporte1` FOREIGN KEY (`esporte_id`) REFERENCES `esporte` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_esporte_has_usuario_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `regras`
--
ALTER TABLE `regras`
  ADD CONSTRAINT `fk_regras_evento1` FOREIGN KEY (`evento_codigo`) REFERENCES `evento` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `restricao`
--
ALTER TABLE `restricao`
  ADD CONSTRAINT `fk_restricao_has_atividade_atividade1` FOREIGN KEY (`atividade_codigo`) REFERENCES `atividade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_restricao_has_atividade_restricao1` FOREIGN KEY (`restricao_id`) REFERENCES `excecao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `sessao`
--
ALTER TABLE `sessao`
  ADD CONSTRAINT `fk_sessao_evento1` FOREIGN KEY (`evento_codigo`) REFERENCES `evento` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `fk_telefone_parceiro1` FOREIGN KEY (`parceiro_id`) REFERENCES `parceiro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
