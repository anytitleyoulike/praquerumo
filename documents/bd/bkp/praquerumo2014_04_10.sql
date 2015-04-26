-- phpMyAdmin SQL Dump
-- version 3.3.10.4
-- http://www.phpmyadmin.net
--
-- Servidor: mysql.praquerumo.com.br
-- Tempo de Geração: Abr 10, 2014 as 09:58 PM
-- Versão do Servidor: 5.1.56
-- Versão do PHP: 5.3.27

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Banco de Dados: `praquerumo`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `newsletter`
--

CREATE TABLE IF NOT EXISTS `newsletter` (
  `id` double NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=105 ;

--
-- Extraindo dados da tabela `leads`
--

INSERT INTO `newsletter` (`id`, `email`) VALUES
(73, 'thalita_rmoura@hotmail.com'),
(27, 'aceleradora@fabriq.com.br'),
(26, 'rbbernardino@gmail.com'),
(6, 'goettezinho@gmail.com'),
(25, 'thulioqueiroz@gmail.com'),
(24, 's.f.bruno@gmail.com'),
(9, 'orangemarques@gmail.com'),
(10, 'rafaelsiza@gmail.com'),
(23, 'neyandrade2005@gmail.com'),
(72, 'marcus.junioor@gmail.com'),
(71, 'nivaldo.viana@gmail.com'),
(70, 'ewerton.larry.ferreira@gmail.com'),
(29, 'fredson.encarnacao@gmail.com'),
(35, 'daniel.tadeu@gmail.com'),
(36, 'imanaus@outlook.com'),
(42, 'fabiano.box@gmail.com'),
(43, 'pgquintao@gmail.com'),
(45, 'cabralff@gmail.com'),
(47, 'paulo@futura.ws'),
(48, 'rhedson@gmail.com'),
(49, 'fabiolabess@gmail.com'),
(50, 'amaury.cavalcante@hotmail.com'),
(52, 'the00ball@gmail.com'),
(53, 'ant.aluado@gmail.com'),
(54, 'eulergms@yahoo.com.br'),
(55, 'james_junior@uol.com.br'),
(56, 'cehasli@yahoo.com.br'),
(57, 'hermantony@hotmail.com'),
(58, 'fernandadecastro2013@gmail.com'),
(59, 'claraffer@gmail.com'),
(60, 'felipe.p.barcellos@gmail.com'),
(69, 'awdrenfontao@live.com'),
(74, 'shirley.violin@gmail.com'),
(75, 'smonteiro.sabrina@hotmail.com'),
(77, 'cicerovls@hotmail.com'),
(78, 'rudamarques@gmail.com'),
(79, 'kathlenbrun@gmail.com'),
(80, 'sarah.mao.br@gmail.com'),
(85, 'comercial@praquerumo.com.br'),
(86, 'marcela.pinheiro@gmail.com'),
(87, 'larisselam@gmail.com'),
(88, 'rodrigonlau@hotmail.com'),
(89, 'Ezequiasvargas@outlook.com'),
(90, 'claudiaasimao@gmail.com'),
(91, 'juhanada@gmail.com'),
(92, 'gilmaramaquine@gmail.com'),
(93, 'kenia.castelo@gmail.com'),
(94, 'daniel.goettenauer@gmail.com'),
(95, 'fesdonascimento@gmail.com'),
(96, 'thalisson.dinelli@yahoo.com.br'),
(97, 'madiel.it@gmail.com'),
(98, 'eburgers8@gmail.com'),
(99, 'wadsonmelo@gmail.com'),
(100, 'luisaugusto@gmail.com'),
(101, 'lilissaalmeida@gmail.com'),
(102, 'arivano@live.com.pt'),
(103, 'brunu.costa@gmail.com'),
(104, 'Edasaturno@hotmail.com');

