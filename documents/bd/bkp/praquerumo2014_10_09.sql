-- phpMyAdmin SQL Dump
-- version 3.3.10.4
-- http://www.phpmyadmin.net
--
-- Host: mysql.praquerumo.com.br
-- Generation Time: Oct 09, 2014 at 07:22 PM
-- Server version: 5.1.56
-- PHP Version: 5.3.27

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
(5, 1),
(4, 2),
(5, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(1, 3),
(5, 3),
(6, 10),
(11, 10),
(6, 11),
(11, 11),
(12, 11),
(6, 12),
(13, 12),
(14, 12),
(15, 12),
(16, 12),
(17, 12),
(18, 12),
(19, 12),
(6, 13),
(11, 13),
(13, 13),
(14, 13),
(16, 13),
(18, 13),
(19, 13),
(20, 14),
(21, 14),
(1, 16),
(5, 16);

-- --------------------------------------------------------

--
-- Table structure for table `atividade`
--

CREATE TABLE IF NOT EXISTS `atividade` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `esporte_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `organizador_id` int(11) NOT NULL,
  `elemento_id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_atividade_esporte1_idx` (`esporte_id`),
  KEY `fk_atividade_categoria1_idx` (`categoria_id`),
  KEY `fk_atividade_organizador1_idx` (`organizador_id`),
  KEY `fk_atividade_elemento1_idx` (`elemento_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Atividade que será anunciada' AUTO_INCREMENT=18 ;

--
-- Dumping data for table `atividade`
--

INSERT INTO `atividade` (`codigo`, `esporte_id`, `categoria_id`, `organizador_id`, `elemento_id`, `slug`) VALUES
(1, 1, 1, 2, 1, 'corredeiras-do-urubui'),
(2, 3, 2, 3, 2, 'turismo-cientifico-na-amazonia'),
(3, 2, 1, 1, 2, 'salto-do-ipy_'),
(4, 1, 1, 1, 1, '#fake1'),
(5, 1, 1, 1, 1, '#fake2'),
(6, 1, 1, 1, 1, '#fake3'),
(7, 1, 1, 1, 1, '#fake4'),
(8, 1, 1, 1, 1, '#fake5'),
(9, 4, 1, 4, 1, 'sup-no-rio-taruma'),
(10, 5, 1, 5, 1, 'lago-do-puraquequara'),
(11, 6, 1, 6, 2, 'arco-e-flecha-com-canoagem'),
(12, 5, 1, 7, 1, 'expedicao-lago-janauari'),
(13, 5, 1, 5, 1, 'caiaque-em-rio-preto-da-eva'),
(14, 6, 1, 9, 2, 'adaptacao-na-selva'),
(15, 6, 1, 6, 2, 'parque-de-aventura'),
(16, 2, 1, 1, 2, 'salto-do-ipy'),
(17, 7, 1, 5, 2, 'trilhas-camping-rapel-em-figueiredo');

-- --------------------------------------------------------

--
-- Table structure for table `avaliacao`
--

CREATE TABLE IF NOT EXISTS `avaliacao` (
  `usuario_id` int(11) NOT NULL,
  `atividade_codigo` int(11) NOT NULL,
  `avaliacao` tinyint(4) NOT NULL,
  `recomenda` tinyint(1) NOT NULL,
  `comentario` text,
  PRIMARY KEY (`usuario_id`,`atividade_codigo`),
  KEY `fk_usuario_has_atividade_atividade1_idx` (`atividade_codigo`),
  KEY `fk_usuario_has_atividade_usuario1_idx` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Avaliação que o usuario faz a uma atividade, deve ser avalia';

--
-- Dumping data for table `avaliacao`
--

INSERT INTO `avaliacao` (`usuario_id`, `atividade_codigo`, `avaliacao`, `recomenda`, `comentario`) VALUES
(1, 1, 5, 1, 'Foi incrível! Muita aventura e diversão. Estou satisfeito com a organização da Eco Space Adventure '),
(2, 2, 5, 1, 'A sensação de estar na floresta em meio a cidade! Sensacional!'),
(2, 9, 5, 1, 'Experiência imperdível para quem quer conhecer melhor o Amazonas'),
(3, 3, 5, 1, 'Uma caminhada inesquecível na floresta amazônica'),
(3, 12, 5, 1, 'Uma área verde enorme! A exuberância da natureza é incrível. Recomendo!'),
(3, 16, 5, 1, 'Experiência imperdível para quem quer conhecer melhor o Amazonas'),
(4, 2, 4, 1, 'O turismo científico foi excelente! Os guias têm vasto conhecimento sobre a Amazônia'),
(4, 9, 5, 1, 'Adoro Stand up Paddle!!! Recomendo a todos!'),
(4, 10, 5, 1, 'Aventura incrível, não sabia que um passeio de caiaque poderia ser tão legal!'),
(4, 17, 4, 1, 'Nossa, não existe experiência melhor que fazer rapel, trekking e camping. Muito bom!'),
(5, 9, 3, 1, 'Stand Up Paddle nos rios da Amazônia, experiênica incrível!!'),
(6, 3, 4, 1, 'A cachoeira é uma das mais lindas de Presidente Figueiredo!! Adorei!'),
(6, 10, 4, 1, 'Experiência maravilhosa, todos devem conhecer na minha opnião!'),
(7, 2, 4, 1, 'Gostei. Ótima estrutura para turistas que vêm a Manaus.'),
(7, 13, 5, 1, 'Adorei, preciso fazer sempre esse caiaque!'),
(7, 15, 5, 1, 'Gostei muito! Ótima opção para passar o final de semana.'),
(8, 2, 5, 1, 'Excelente!! Adorei o turismo científico e também o site Pra Que Rumo. Parabéns!'),
(9, 1, 3, 1, 'Adrenalina e aventura!! Gostei muito!'),
(10, 3, 3, 1, 'Muito tempo de caminhada, mas a cachoeira impressiona.'),
(10, 10, 4, 1, 'Nossa, que experiência magnífica e aqui em Manaus, perfeito!!! eu realmente recomendo.'),
(11, 3, 5, 1, 'Estive em Manaus e gostei muito dessa aventura!'),
(12, 1, 4, 1, 'Particularmente achei um pouco caro. Porém a experiência foi única. Vale a pena'),
(13, 9, 5, 1, 'Os rios do Amazonas são lindos!!! SUP sempre!!'),
(13, 14, 5, 1, 'Curso excelente! Pra quem quer aprender a sobreviver na selva, é o primeiro passo! '),
(14, 11, 5, 1, 'Foi top! Quero conhecer mais atividades por lá!');

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
-- Table structure for table `cuidados`
--

CREATE TABLE IF NOT EXISTS `cuidados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pt` varchar(255) NOT NULL,
  `nome_en` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Exceções de atividades = { Acima de 10 anos, Abaixo de 50 an' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `cuidados`
--

INSERT INTO `cuidados` (`id`, `nome_pt`, `nome_en`) VALUES
(1, 'É necessário saber nadar', 'It''s necessary know how to swim'),
(2, 'Todos estarão instruídos e devidamente equipados com coletes salva-vidas', ''),
(3, 'Durante todo o passeio teremos instrutores para auxiliar e tirar qualquer dúvida', ''),
(4, 'Peso máximo: 120kg por pessoa', 'Maximum weight: 264 lbs per person'),
(5, 'Menores de 18 anos somente com autorização dos responsáveis', 'Under 18 years old only with authorization'),
(6, 'Possuir idade superior a 12 anos', 'Over 12 years old is allowed'),
(7, '', '');

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
  `duracao` varchar(15) NOT NULL,
  `roteiro` text,
  `url` varchar(255) DEFAULT NULL,
  `termo_consentimento` text,
  PRIMARY KEY (`lingua_id`,`atividade_codigo`),
  KEY `fk_lingua_has_atividade_atividade1_idx` (`atividade_codigo`),
  KEY `fk_lingua_has_atividade_lingua1_idx` (`lingua_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `descricao_atividade`
--

INSERT INTO `descricao_atividade` (`lingua_id`, `atividade_codigo`, `titulo`, `apresentacao`, `esforco_fisico`, `conforto`, `dificuldade_tecnica`, `descricao`, `cidade`, `estado`, `duracao`, `roteiro`, `url`, `termo_consentimento`) VALUES
(1, 1, 'Corredeiras do Urubuí', 'Experimente essa incrível aventura em uma das principais corredeiras de Presidente Figueiredo. ', 2, 2, 1, '<p>O rafting é um esporte que utiliza botes infláveis para descer rios, enfrentando corredeiras, pedras e muita água. Sua origem foi nos Estados Unidos, quando surgiu a necessidade de explorar a Região Central do Grand Canyon. Por ser um esporte que proporciona a integração do praticante à natureza sem agredi-la e por ter diversos níveis, o esporte é muito explorado em diversas regiões do planeta. </p>\n<p> A empresa  Eco Space Adventure leva você com toda segurança, a sentir uma pequena dose de adrenalina nas corredeiras do rio do Urubuí na cidade de Presidente Figueiredo (AM). <p/>', 'Presidente Figueiredo', 'AM', '1h 20m', '<p>A atividade inicia-se no igarapé das Lages 5km rio acima. O percurso total de corredeira é de 7 km. Antes do início, os instrutores dão dicas de segurança e como utilizar os equipamentos.<p/> \n<p>Partimos para o “treino” que dura em média 20 minutos, até chegarmos a uma linda lagoa de água mineral em plena floresta. Depois de alguns minutos de descanso e algumas fotos, retornamos ao igarapé e remamos até ao encontro com o Igarapé do Urubuí, responsável pela maior diversão do passeio. As corredeiras desse trecho são classificadas como nível III - ondas pequenas, talvez uma pequena queda, mas sem perigo. Pode requerer habilidade de manobra significativa que serão coordenadas pelo instrutor. <p/> \n<p> A duração do passeio é de aproximadamente 1h 20min e finaliza na Corredeira do Urubuí, um lugar bonito, localizado em uma área de alta altitude de floresta amazônica, sendo uma das principais atrações de Presidente Figueiredo. O melhor período para a descida é entre os meses de novembro até junho. <p/> <br/>', 'http://www.praquerumo.com.br/site/atividades/2014-06/?tribe-bar-date=2014-06&tribe-bar-search=Rafting', ''),
(1, 2, 'Turismo Científico na Amazônia', 'Uma experiência científica na cidade de Manaus, no maior centro de pesquisa em biodiversidade da Amazônia.', 1, 5, 1, '<p>O Bosque da Ciência fica localizado no perímetro urbano da cidade de Manaus, no Instituto Nacional de Pesquisas da Amazônia - INPA, e preserva aspectos importantes da biodiversidade amazônica. <p/>\n<p>A equipe formada pela AMAZÔNIA SOCIOAMBIENTAL - empresa incubada no INPA - e o PRAQUERUMO,  preparou um serviço especial: Turismo Científico na Amazônia acompanhado por mestres e doutores em biologia e engenharia florestal. <p/>\n<p> Este passeio é indicado aos turistas que desejam conhecer a biodiversidade amazônica em um curto período de tempo. Animais como macacos, cotias e bichos-preguiça vivem soltos e são facilmente visualizados. Este passeio é seguro e foi indicado pela FIFA.<p/><p>*Esta é mais uma opção para o público em geral. Os valores para entrada no Bosque da Ciência continuam os mesmos.</p>', 'Manaus', 'AM', '2hrs', '<p>O passeio começa na entrada do Bosque da Ciência, onde os turistas recebem orientações básicas de segurança e visitação.</p>\n<p>Os animais no roteiro incluem a ariranha <i>(Pteronura brasiliensis)</i>, o peixe-boi <i>(Trichechus inunguis)</i>, o peixe-elétrico <i>(Electrophorus electricus)</i>, espécies de tartarugas, peixes e jacarés. </p>\n<p>As plantas incluem uma espécie de tanimbuca <i>(Buchenavea huberii)</i> de seiscentos anos e outras típicas da culinária amazônica.</p>\n<p>O passeio inclui uma caminhada em uma trilha suspensa no meio da floresta, visita em lago e no museu e se encerra na sorveteria.</p>', 'http://www.praquerumo.com.br/site/atividades/2014-06/?tribe-bar-date=2014-06&tribe-bar-search=Cient%C3%ADfico', NULL),
(1, 3, 'Salto do Ipy', 'Uma caminhada em meio a maior floresta tropical do mundo,  cachoeira com uma queda dàgua de 30 metros de altura...', 2, 2, 1, '<p>O trekking pode te levar a lugares surpreendentes. Entretanto, o trekking para o Salto do Ipy vai te levar em uma viagem ao tempo.<p/>\n<p>A cidade de Presidente Figueiredo é o ponto de partida para essa aventura. Localizada a apenas 107 km de distância de Manaus é conhecida como a "Terra das Cachoeiras". Já passam de 100 os números de cachoeiras catalogadas e recentemente a região recebeu o título de Geoparque.<p/>\n<p>O Salto do Ipy é uma das maiores cachoeiras e para chegar até ela é necessário muita disposição. Juntamente com um dos mehores guias de Presidente Figueiredo, o guia Herman Antony, você poderá entrar nessa excursão no meio da floresta Amazônica. <p/>', 'Presidente Figueiredo', 'AM', '6hrs', '<p>A trilha inicia no Km 57 da Estrada de Balbina. Seu comprimento é de 3,5 quilômetros, alternando em trechos íngremes que precisam de atenção e um bom preparo físico. O tempo médio de caminhada é de 4 horas, em meio a selva amazônica. Durante esse tempo poderemos conhecer um pouco mais sobre as características da mata e sua biodiversidade.<p/>\n<p>Quando chegarmos à cachoeira, faremos uma pausa para a contemplação da cachoeira e um banho para relaxar e lavar a alma.<p/>\n<p>Depois seguiremos a um labirinto de grutas e pedras que servem como abrigo de alguns animais e onde poderemos visualizar pinturas rupestres.<p/>\n<p/>', 'http://www.praquerumo.com.br/site/atividades/2014-10/?tribe-bar-date=2014-10&tribe-bar-search=Trekking?tribe-bar-date=2014-10&tribe-bar-search=Trekking', NULL),
(1, 9, 'SUP no rio Tarumã', 'Um passeio de stand up paddle sobre os rios da Amazônia, em uma experiência de tirar o fôlego...', 2, 4, 1, '<p>A floresta amazônica sempre foi muito conhecida pela diversidade de suas espécies animais \n\ne vegetais. E nada mais extraordinário que conhecer os rios que alimentam a vida dessa imensa \n\nselva.</p> <p>A AMAZONSUP convida você a conhecer através do Stand Up Paddle um dos principais rios que banham a cidade.</p><p>O Stand Up Paddle pode ser praticado por mulheres, homens e crianças com faixa etária de 4 a 64 anos, e com pouco condicionamento físico. A nossa intenção é disponibilizar para pessoas não esportistas, a iniciação em uma modalidade simplesmente fascinante.</p><p>Este passeio é uma oportunidade de ter contato direto com a natureza e de praticar um esporte que contempla essa imensidão Amazônica</p>', 'Manaus', 'AM', '2hrs', '<p>O local de encontro é na Marina do Rio Negro, dentro da cidade de Manaus, onde iniciaremos nossa atividade. Depois de um alongamento e algumas instruções, atravessaremos o rio Tarumã em direção a um igapó.</p><p>Ao chegar a esse pequeno rio, poderemos contemplar a beleza e soberania da natureza amazônica, interagir com a floresta e experimentar uma sensação maravilhosa de liberdade e respeito a biodiversidade da região.</p>', 'http://www.praquerumo.com.br/site/atividades/2014-10/?tribe-bar-date=2014-10&tribe-bar-search=SUP?tribe-bar-date=2014-10&tribe-bar-search=SUP', NULL),
(1, 10, 'Lago do Puraquequara', 'O Lago do Puraquequara ainda é pouco explorado por atividades de ecoturismo, mas lá existe um tesouro que queremos te mostrar...', 2, 3, 2, '<p>Em um dos extremos da cidade existe um lugar que durante um período do ano, nos surpreende com sua grande transformação. Localizado próximo de uma das principais atrações turísticas da cidade o Lago do Puraquequara possui uma das mais lindas paisagens ainda pouco conhecida dentro da cidade de Manaus.</p><p>Antes do fim do período da cheia, queremos te levar a conhecer este lugar que poucos tiveram a oportunidade de conhecer.</p>', 'Manaus', 'AM', '2hrs', '<p>Nosso roteiro tem início às margens do lago onde teremos instruções de segurança e de condução dos caiaques que serão nosso meio de transporte para esse passeio. Durante os primeiros minutos estaremos aprendendo algumas habilidades, nas águas tranquilas desse lago e com uma linda vista.</p><p>Para recompensar esse treino atravessaremos o lago até o rio negro por dentro de um igapó. Nesse trecho, observaremos como a vida sobrevive à inundada floresta durante a grande cheia dos rios.</p><p>Chegando ao Rio Negro a paisagem muda bastante e teremos como fundo o encontro das águas com o Rio Solimões. Seguiremos em sua direção, por sua margem durante alguns minutos até encontrarmos a maior espécie de árvore da floresta amazônica, conhecida como a mãe da floresta, a grande samaúma. Espécie que marca o meio do nosso passeio e onde descansaremos  por alguns instantes contemplado sua beleza e o ambiente que a cerca.</p><p>Com o fim do descanso retornaremos ao nosso ponto de partida por dentro do Lago do Puraquequara.</p>', ' http://www.praquerumo.com.br/site/atividades/2014-07/?tribe-bar-date=2014-07&tribe-bar-search=Lago+do+Puraquequara?tribe-bar-date=2014-07&tribe-bar-search=Lago+do+Puraquequara', NULL),
(1, 11, 'Arco e flecha com Canoagem', 'Saia da rotina e viva uma aventura em meio à selva amazônica com a prática de arco e flecha, trekking, slackline e canoagem.', 2, 2, 2, '<p>As atividades de aventura proporcionam momentos de valorização dos elementos essenciais da vida, podendo ser praticado por qualquer pessoa que queira fugir da rotina, superar desafios, explorar trajetos, contemplar a natureza.</p>\r\n<p>A Ecoforest Adventure uniu as modalidades de arco e flecha, slackline, canoagem e trekking proporcionando incríveis momentos de lazer e diversão.</p>\r\n<p>A prática de canoagem e trekking proporcionam momentos de integração e contemplação da natureza, sendo uma grande oportunidade de conhecer a floresta Amazônica e fugir da rotina. Arco e Flecha e slackline são esportes que lhe permite desenvolver a coordenação motora, a concentração e o equilíbrio físico. Auxilia também no combate ao stress, equilibrando assim a nossa mente e o nosso corpo. Além disso, é desafiador e super divertido.</p>', 'Manaus', 'AM', '8hrs', '<p>O local de encontro será no parque de aventura da Ecoforest Adventure, a apenas 39 quilômetros de Manaus, na rodovia BR-174 Km-923 (que antes era o Km-39).</p>\r\n<p>Inicialmente será dado instruções gerais de segurança e alongamento, daremos inicio as atividades com o trekking de 40min, ao final do trekking iremos iniciar a canoagem com um percurso de 500m. Em seguida será dado intervalo para descanso e almoço.</p>\r\n<p>No período da tarde serão realizadas instruções básicas para a prática de slackline e tiro com arco e será liberada a prática das atividades e acesso à nossa maravilhosa e refrescante área de banho.</p>\r\n\r\n<p>09:00h-10:00h - Caminhada na selva</p>\r\n<p>10:00h-11:00h – Instrução de Canoagem</p>\r\n<p>Tempo Livre</p>\r\n<p>14:00h – Instrução de Slackline</p>\r\n<p>15:00h – Instrução de Arco-flecha </p>\r\n<p>16:00h- Retorno</p>\r\n<p></p>\r\n<p>*Não incluso transporte</p>', 'www.praquerumo.com.br/site/atividades/2014-10/?tribe''-bar-date=2014-10&tribe-bar-search=Arco+e+Flecha+com+canoagem', NULL),
(1, 12, 'Expedição Lago Janauari', 'Uma remada em um dos mais famosos parques ecológicos da Amazônia, nos belos rios e exuberantes belezas naturais do lago Janauri.', 2, 2, 2, '<p>A Kayak Adventure vive essa experiência junto com você! </p>\r\n<p>Nosso objetivo é proporcionar condições e um clima favorável para que qualquer pessoa que goste de esporte e aventura sinta-se amparada e motivada a enfrentar o desafio de realizar uma travessia, sem a preocupação com o seu desempenho.</p>\r\n<p>A Remada com caiaque desenvolve sua espiritualidade, renova suas energias, transmite a mensagem da preservação dos rios e lagos, faz bem para o corpo, para mente e para alma, cultiva novas amizades e prepara cada um para sermos pessoas melhores, saudáveis, de bem com a vida e com o meio ambiente. Se você tem o espírito leve e não dispensa um aventura seja bem-vindo!</p>', 'Iranduba', 'AM', '5hrs', '<p>Juntos sairemos em comboio do município de Cacau Pirera até a entrada do ramal no km 7 da rodovia Manoel Urbano ( estrada de Manacapuru ) em seguida vamos por uma estrada de 20 km, até chegar a vila Janauarilândia, onde iniciaremos nossa expedição.</p>\r\n<p>Antes de partirmos, todos receberão orientação sobre a navegação em caiaque e alguns princípios básicos de segurança e conforto. Logo após, às 9hs em ponto partiremos para esse passeio único pelo exuberante Parque Ecológico do Janauari.</p>\r\n<p>O Parque Ecológico Janauari Com uma área de 9.000 ha, concentra vários ecossistemas da região. Possui matas de terra firme, de várzea e igápos (floresta inundada). Nesse roteiro A kayak Adventure leva você através da belezas naturais do lago com suas águas cristalinas, numa remada em grupo de aproximadamente 5km ao flutuante Ipixuna, onde existe um belo criatório de pirarucu ( peixe gigante da região ), ao igapó ( floresta inundada ) onde se encontra a rainha soberana da floresta - A Samaúma gigante, e durante o percurso a visualização da fauna e flora local como macacos, aves e outros animais habitantes da região.</p>\r\n<p>Se o tempo e as condições físicas do grupo permitirem, podemos nos estender por mais 4km, ao Lago de Vitórias-Régias - planta que abre sua folha redonda sobre as águas rasas e sem correnteza e chega a medir 1,8 m de diâmetro. No mesmo local encontram-se um flutuante restaurante e uma grande feira de artesanato flutuante mantida pelos moradores do lago onde o aventureiro pode adquirir uma lembrança em forma de arte.</p>\r\n\r\n<p>-Concentração: 7:15hs no Centro de Atendimento ao Turista - CAT (Município de Iranduba/AM)</p>\r\n<p>-Partida para Janauarilândia: 08h00hs</p>\r\n<p>-Início da atividade com preleção: 09h00hs</p>\r\n<p>-Parada para lanche: 10h30 (local a definir)</p>\r\n<p>-Retorno: 13h</p>', 'http://www.praquerumo.com.br/site/atividades/2014-10/?tribe-bar-date=2014-10&tribe-bar-search=Expedi%C3%A7%C3%A3o+lago+Janauari?tribe-bar-date=2014-10&tribe-bar-search=Expedi%C3%A7%C3%A3o+lago+Janauari', NULL),
(1, 13, 'Caiaque em Rio Preto da Eva', 'A beleza e a tranquilidade dos rios da Amazônia já estão à sua espera.', 2, 2, 1, '<p>A Floresta Amazônica é imponente a qualquer aventureiro. Seu tamanho, sua biodiversidade, seus mistérios e suas histórias merecem muito respeito. Mas poucos conhecem o seu encantamento, sua harmonia e tranquilidade. Para mostrar esse lado pouco explorado a WR Locações convida você a navegar pelas calmas águas do Rio Preto da Eva em uma maravilhosa expedição de caiaque.</p>\n\n<p>Venha sentir as positivas vibrações da floresta e seus diversos aromas em um completo passeio pelos seus rios.</p>', 'Rio Preto da Eva', 'AM', '5hrs', '<p>O horário de encontro será às 8hs no Café Regional da Andréia à 79km de Manaus, próximo ao início da Cidade de Rio Preto da Eva.</p>\n<p>Juntos sairemos em comboio em uma estrada de 10 km rio acima, até chegar no balneário “Encanto da Mata”, onde iniciaremos nossa expedição. Antes de partirmos, todos receberão orientação sobre a navegação em caiaque e alguns princípios básicos de segurança e conforto. Logo após, partiremos para esse passeio único pela exuberante floresta Amazônica</p>', 'http://www.praquerumo.com.br/site/atividades/2014-10/?tribe-bar-date=2014-10&tribe-bar-search=Expedicao+Rio+Preto?tribe-bar-date=2014-10&tribe-bar-search=Expedicao+Rio+Preto', NULL),
(1, 14, 'Sobrevivência na Selva nível 1', 'Tenha contato mais próximo com a natureza, aprendendo a sobreviver na Selva Amazônica neste curso especial para iniciantes', 3, 0, 4, '<p>Vez ou outra ocorrem situações de pessoas que se viram fora de rota ou perdido durante um passeio, uma trilha, uma pescaria, escalada ou em acampamento, por exemplo. Tendo que permanecer por horas, dias ou noites, aguardando o resgate de equipes de busca. Nessas horas, saber como proceder de forma correta aumenta suas possibilidades de sair bem e em alguns casos, até mesmo ileso.</p><p>O curso de adaptação ao ambiente de selva visa oferecer um contato mais próximo à natureza e ensinar noções básicas de adaptação a ambientes hostis.</p>\r\n<p>*Saída ao sábados - às 19:00 horas e retorno no domingo às 13:00 horas </p>', 'Manaus', 'AM', 'Um pernoite. ', '<p> Esse curso possui o seguinte Conteúdo Programático:\r\n<p>-Armadilhas;</p>\r\n<p>-Trilha na selva: caminhada noturna;</p>\r\n<p>-Contenção de Ofídios: manuseio correto do animal;</p>\r\n<p>-Cozinha mateira;</p>\r\n<p>-Encontro para local de descanso dentro da selva;</p>\r\n<p>-Espera do caçador;</p>\r\n<p>-Fogos;</p>\r\n<p>-Orientação com bússola;</p>\r\n<p>-Simulação de resgate em selva;</p>\r\n<p>-Sinais de Trilhas;</p>\r\n<p>-Tipos de Abrigos: com acessórios artificiais e naturais;</p>\r\n<p>-Transposição com cordas;</p>\r\n<p>-Remédios naturais.</p>\r\n<p></p>\r\n\r\n<p>1. O que levar para alimentação?</p>\r\n<p>Cardápio suficiente para jantar (sábado); desjejum e almoço (domingo)</p>\r\n\r\n<p>2. Como será a dormida?</p>\r\n<p>As equipes irão armar seus acampamentos com lona e rede em local selecionado para o pernoite.</p>\r\n\r\n<p>3. Como será a dinâmica do curso?</p>\r\n<p>Serão formadas equipes mistas e distribuídas as tarefas para cada equipe no decorrer do curso.</p>\r\n\r\n\r\n<p>4. Normas de Conduta do Curso </p>\r\n<p>* Proibido a ingestão de bebidas alcóolicas e uso de drogas;</p>\r\n<p>* Proibido portar arma de fogo ou similar;</p>\r\n<p>* Respeitar os colegas de equipe e instrutores;</p>\r\n<p>* Respeitar e cumprir os horários e as tarefas que forem designadas para as equipes;</p>\r\n<p>* Não tire nada, a não ser fotografias. Não deixe nada, a não ser pegadas. Não leve nada, a não ser lembranças.</p>', 'http://www.praquerumo.com.br/site/atividades/2014-10/?tribe-bar-date=2014-10&tribe-bar-search=Sobrevivencia?tribe-bar-date=2014-10&tribe-bar-search=Sobrevivencia', NULL),
(1, 15, 'Parque de Aventura', 'Explore a magnífica floresta amazônica e viva uma incrível experiência com a prática de escalada em árvore, arco e flecha, trekking, canoagem e tirolesa', 4, 3, 4, '<p>As atividades de aventura proporcionam momentos de valorização dos elementos essenciais da vida, podendo ser praticado por qualquer pessoa que queira fugir da rotina, superar desafios, explorar trajetos, contemplar a natureza.</p>\r\n\r\n<p>A Ecoforest Adventure irá lhe proporcionar um final de semana de momentos incríveis de conhecimento, lazer e diversão com a prática de escalada em árvore, arco-flecha, slackline, canoagem e trekking.</p>\r\n<p>Explore o topo das gigantes árvores amazônicas, onde está concentrado 70% de toda a sua biodiversidade, com uso de técnicas verticais para escalada em árvore, total segurança e instrutores qualificados, possibilitando observação da fauna e flora pouco conhecidas, de um ângulo diferente. </p>\r\n\r\n<p>A prática de canoagem e trekking proporcionam momentos de integração e contemplação da natureza, sendo uma grande oportunidade de conhecer a floresta Amazônica e fugir da rotina. Arco e Flecha e slackline são esportes que lhe permite desenvolver a coordenação motora, a concentração e o equilíbrio físico. Auxilia também no combate ao stress, equilibrando assim a nossa mente e o nosso corpo. Além disso, é desafiador e super divertido.</p>\r\n', 'Manaus', 'AM', '2 dias', '<p>O local de encontro será no parque de aventura da Ecoforest Adventure, a apenas 39 quilômetros de Manaus, na rodovia BR-174 Km-923 (antigo Km-39).</p>\r\n\r\n<p>Inicialmente será dado instruções gerais de segurança e alongamento, então iniciaremos as atividades com o trekking de 40min, ao final do trekking iremos iniciar a canoagem com um percurso de 500m. Em seguida será dado intervalo para descanso e almoço.</p>\r\n\r\n<p>No período da tarde serão realizadas instruções básicas para a prática de slackline e tiro com arco e será liberada a prática das atividades e acesso à nossa maravilhosa e refrescante área de banho.</p>\r\n\r\n<p>No dia seguinte iniciaremos nossas atividades bem cedo as 7:30h da manhã, com a escalada de uma árvore de cerca de 30m de altura. Ao final da escalada teremos uma pausa para descanso e almoço. Após o almoço vamos encarar uma tirolesa de 100 metros de extensão.</p>\r\n\r\n<p>09:00-10:00 - Caminhada na selva</p>\r\n<p>10:00-11:00 – Instrução de Canoagem</p>\r\n<p>Tempo livre</p>\r\n<p>14:00 – Instrução de Slackline</p>\r\n<p>15:00 – Instrução de Arco-flecha </p>\r\n<p>16:00- Retorno</p>\r\n<p>Pernoite no local</p>\r\n<p>7:30 - Escalada em árvore</p>\r\n<p>13:00 - 15:00 - Tirolesa, descanso, banho</p>\r\n<p>15:45 - Retorno</p>	', 'http://www.praquerumo.com.br/site/atividades/2014-10/?tribe-bar-date=2014-10&tribe-bar-search=Parque+de+Aventura?tribe-bar-date=2014-10&tribe-bar-search=Parque+de+Aventura', NULL),
(1, 16, 'Salto do Ipy', 'Uma caminhada em meio a maior floresta tropical do mundo,  cachoeira com uma queda dàgua de 30 metros de altura...', 2, 2, 1, '<p>O trekking pode te levar a lugares surpreendentes. Entretanto, o trekking para o Salto do Ipy vai te levar em uma viagem ao tempo.<p/>\n<p>A cidade de Presidente Figueiredo é o ponto de partida para essa aventura. Localizada a apenas 107 km de distância de Manaus é conhecida como a "Terra das Cachoeiras". Já passam de 100 os números de cachoeiras catalogadas e recentemente a região recebeu o título de Geoparque.<p/>\n<p>O Salto do Ipy é uma das maiores cachoeiras e para chegar até ela é necessário muita disposição. Juntamente com um dos mehores guias de Presidente Figueiredo, o guia Herman Antony, você poderá entrar nessa excursão no meio da floresta Amazônica. <p/>', 'Presidente Figueiredo', 'AM', '6hrs', '<p>A trilha inicia no Km 57 da Estrada de Balbina. Seu comprimento é de 3,5 quilômetros, alternando em trechos íngremes que precisam de atenção e um bom preparo físico. O tempo médio de caminhada é de 4 horas, em meio a selva amazônica. Durante esse tempo poderemos conhecer um pouco mais sobre as características da mata e sua biodiversidade.<p/>\n<p>Quando chegarmos à cachoeira, faremos uma pausa para a contemplação da cachoeira e um banho para relaxar e lavar a alma.<p/>\n<p>Depois seguiremos a um labirinto de grutas e pedras que servem como abrigo de alguns animais e onde poderemos visualizar pinturas rupestres.<p/>\n<p/>', 'http://www.praquerumo.com.br/site/atividades/2014-09/?tribe-bar-date=2014-09&tribe-bar-search=Trekking?tribe-bar-date=2014-09&tribe-bar-search=Trekking', NULL),
(1, 17, 'Trilhas x Camping x Rapel', 'Se você tem disposição e a aventura corre nas suas veias prepare-se para um final de semana inédito em Presidente Figueiredo...', 4, 2, 2, '<p>A oportunidade de conhecer duas das cachoeiras mais imponentes de Presidente Figueiredo chegou de uma única vez e de uma forma incomum.</p><p>A Pra Que Rumo junto com a WR Locações e a EcoForest Adventure preparam esse roteiro pra quem gosta de superação. Serão alguns quilômetros de trilhas, um paredão de rocha de 20 metros e duas lindas paisagens para você admirar.</p>', 'Presidente Figueiredo', 'AM', '2 dias', '<p>Primeiro dia...</p><p>Sairemos do Centro de Atendimento ao Turista de Presidente Figueiredo para dar início à nossa jornada com a WR Locações. Nesse dia vamos visitar a cachoeira da Neblina que está localizada no Km 51 onde iniciaremos a trilha de aproximadamente 8km. Para esse trajeto caminharemos cerca de 2 horas, portanto, um bom preparo físico se faz necessário. Durante esse tempo teremos a oportunidade de conhecer um pouco mais sobre as características da Amazônia e sua biodiversidade. Quando chegarmos à cachoeira, faremos uma pausa para contemplá-la e relaxar, antes de montarmos nosso acampamento onde pernoitaremos.Para essa atividade não ofereceremos material de camping, hidratação e alimentação. Todos esses itens serão de responsabilidade de cada participante.</p><p>Segundo dia...</p><p>Logo depois do café da manhã, levantamos o acampamento, dar o mergulho de despedida e retornaremos para o inicio da trilha de onde partiremos rumo a Cachoeira Salto do Ipy! Onde vamos iniciar a fase dois da nossa aventura, agora, com a EcoForest Adventure. O Salto do Ypi fica localizado no Km 57 da Estrada de Balbina. O tempo médio de caminhada para chegar até a cachoeira é de 1:30 hora, sendo uma trilha levemente inclinada com baixo grau de dificuldade. Ao chegar na cachoeira, será feito uma pausa para contemplação da exuberante paisagem e será dado instruções quanto aos procedimentos de segurança e uso dos equipamento para que se possa realizar o rapel. Em seguida o instrutor irá demonstrar a técnica do rapel para que os aventureiros estejam aptos a realizar, ao longo do percurso sinta a sensação de liberdade e pura adrenalina ao descer em baixo da uma incrível queda d’água. Ao final do rapel poderemos explorar um pouco das complexas formações rochosas e grutas e serão visualizadas pinturas rupestres.</p>', 'http://www.praquerumo.com.br/site/atividades/2014-10/?tribe-bar-date=2014-10&tribe-bar-search=Camping?tribe-bar-date=2014-10&tribe-bar-search=Camping', NULL),
(2, 1, 'Rapids of Urubuí', 'Enjoy this incredible adventure in one of the major rapids of Presidente Figueiredo''s town...', 2, 2, 1, '<p>Rafting is a sport that uses inflatable boats to descend rivers, braving rapids, rocks and waters. Its origin was in the United States, when the need to explore the Central Region of the Grand Canyon came into being. Rafting is a sport that provides the integration of the practitioner to nature without damaging it and having different levels, the sport is much explored in various regions of the planet. </p>\n<p> Eco Space Adventure company takes you safely, feeling a small dose of adrenaline in the Urubuí river rapids in the city of Presidente Figueiredo (AM). </p>', 'Presidente Figueiredo', 'AM', 'about 1,5h', '<p>The activity begin in the Lages River 5 km upstream. Before starting, the instructors give safety instructions and explain how to use the equipment.</p> \n<p>We start with a "training” that lasts on average 20 minutes, until we reach a beautiful pond of mineral water in the forest. After few minutes, we return to the river until find with the affluent of Urubuí responsible for the greatest enjoyment of the excursion. In this interval, rapids are classified as level III - small waves, maybe a small drop, but not danger. May require ability in maneuver that will be coordinated by the instructor.</p>', 'http://www.praquerumo.com.br/site/atividades/2014-06/?tribe-bar-date=2014-06&tribe-bar-search=Rafting', NULL),
(2, 2, 'Scientific Tourism in the Amazon', 'A scientific experience in Manaus, the greatest biodiversity research center in the Amazon.', 1, 5, 1, '<p>The Science Grove Park is located within the limits of the Manaus''s city, in the National Institute for Amazonian Research (INPA), preserves important aspects of Amazonian biodiversity. <p/>\n<p>The professional team of the Amazônia Socioambiental - consulting company resident in INPA - and PRAQUERUMO, prepared a special service: Scientific Tourism in the Amazon accompanied by expert researchers.</p>\n<p>This tour is suitable for tourists who want to know the Amazonian biodiversity in a short period of time.</p><p>*This is another option for the general public. Values to access to the Science Grove remain the same.</p>', 'Manaus', 'AM', 'about 2hs', '<p>The tour begins at the entrance of Science Grove, where tourists receive basic safety guidelines and visitation.</p>\n<p> Animals in the roadmap include giant otter <i>(Pteronura brasiliensis)</i>, amazonian manatee <i>(Trichechus inunguis)</i>, electric fish <i>(Electrophorus electricus)</i>, species of turtles, fishes and caimans.</p>\n<p>The plants include species of trees like the Tanimbuca <i>(Buchenavea huberii)</i> with six hundred years old, and others typical plants of Amazonian cuisine.</p>\n<p>The tour includes a walk in a suspended track in the middle of the forest, appreciate the lake, visit the museum and ends at the ice cream shop.</p>', 'http://www.praquerumo.com.br/site/atividades/2014-06/?tribe-bar-date=2014-06&tribe-bar-search=Cient%C3%ADfico', NULL),
(2, 3, 'Salto do Ipy', 'Trekking in the world''s largest tropical forest, will find a waterfall with a height of 30 meters...', 2, 2, 1, '<p>Trekking can take you to amazing places. However, trekking to Salto do Ipy will take you on a journey into time.</p>\n<p>The city of Presidente Figueiredo is the starting point for this adventure. Located only 107 kilometers from Manaus is known as the "Land of Waterfalls". Are already more than 100 waterfalls cataloged  and the region recently received the title of Geologic Park.</p>\n<p>The Salto do Ipy is one of the largest waterfalls, one must be energy to get there. With one of the best guides of Presidente Figueiredo, Herman Antony, you can join and have fun on this tour in the middle of the Amazon forest.</P> ', 'Presidente Figueiredo', 'AM', 'about 6hs', '<p>The trail starts at KM 57 of the road Balbina. The length of the trail  is 3.5 km, alternating on steep stretches that need attention and a good physical condition.The trekking lasts about 4 hours, amid the Amazon jungle. During this time we will know a little more about the characteristics of the forest and your biodiversity.</p>	\n<p>When we get to Salto do Ipy, we will pause to contemplate the waterfall and a bath to relax and cleanse our soul.</p>\n<p>Then follow a labyrinth of caves and rocks that serve as shelter for some animals and where we can see rock paintings. And the than back to the city again.</p>', 'http://www.praquerumo.com.br/site/atividades/2014-08/?tribe-bar-date=2014-08&tribe-bar-search=Trekking', ''),
(2, 9, 'SUP in the river Tarumã', 'A ride in the stand up paddle on the rivers of the Amazon, an experience breathtaking ...', 2, 4, 1, '<p>Amazon rainforest has always been well known for its biodiversity. \nnothing more extraordinary that meet the rivers that feed the life of this immense forest.</p>\n<p>AmazonSup invites you to know one of the main rivers of the city through the Stand Up Paddle.</p> <p>Stand Up Paddle can be practiced by women, men, children, aged 4-64 years and little physical preparation.</p>\n<p>This tour is an opportunity to have direct contact with nature and practice activity with the immensity the Amazonian</p>', 'Manaus', 'AM', 'about 5hs', '<p>The meeting location is in the Negro River Marina, within the city of Manaus, where we will begin our activity. After a stretching and some instructions, we cross the river Tarumã toward a igapó.</p>\n<p>On arriving at the small river, we admire the beauty and sovereignty of Amazonian nature, interact with the forest and experience a wonderful feeling of freedom and respect for biodiversity in the region.</p>', 'http://www.praquerumo.com.br/site/atividades/2014-08/?tribe-bar-date=2014-08&tribe-bar-search=SUP', NULL),
(2, 10, 'Puraquequara Lake', 'In this beautiful ambience, is scheduled a kayaking expedition organized for you to meet and enjoy this unique place within the city of Manaus...', 2, 3, 2, '<p>As belezas naturais do lago de Puraquequara atraem turistas para a região que se encontra. A flora e a fauna são indescritíveis, tendo uma grande diversidade de árvores tais como: sumaumeira, tucumãzeiros e castanheiras.</p>\n\n<p>Em uma região de lago e floresta, a comunidade recebe  turistas de vários lugares para a realização de diversas atividades com o contato da natureza. Neste belíssimo cenário, está marcado uma expedição de caiaque organizado pela empresa EAK WR lOCAÇÕES - EXPEDITION ADVENTURE KAIAK para você conhecer e disfrutar de um lugar único dentro da cidade de Manaus. Durante a expedição, você terá uma experiência formidável num passeio calmo, com diversos desafios de remadas em igapós, capinzais, rios maiores numa paisagem gratificante. Além do deslumbrante encontro com a "grande árvore" durante a expedição.</p>', 'Manaus', 'AM', 'about 2hs', '<p>A expedição tem duração média de 2 horas. A saída será no lago Puraquequara. Iniciaremos remando em uma área verde (igapó), e logo após atravessaremos um capinzal, um belo igapó, até chegar em pleno rio aberto. Seguiremos margeando o rio Negro até a "grande árvore". E retornaremos subindo o lago puraquequara para retornarmos ao ponto de encontro.</p>', ' http://www.praquerumo.com.br/site/atividades/2014-07/?tribe-bar-date=2014-07&tribe-bar-search=Lago+do+Puraquequara?tribe-bar-date=2014-07&tribe-bar-search=Lago+do+Puraquequara', NULL),
(2, 11, 'Arco e flecha com Canoagem', 'Saia da rotina e viva uma aventura em meio à selva amazônica com a prática de arco e flecha, trekking, slackline e canoagem.', 2, 2, 2, '<p>As atividades de aventura proporcionam momentos de valorização dos elementos essenciais da vida, podendo ser praticado por qualquer pessoa que queira fugir da rotina, superar desafios, explorar trajetos, contemplar a natureza.</p>\r\n<p>A Ecoforest Adventure uniu as modalidades de arco e flecha, slackline, canoagem e trekking proporcionando incríveis momentos de lazer e diversão.</p>\r\n<p>A prática de canoagem e trekking proporcionam momentos de integração e contemplação da natureza, sendo uma grande oportunidade de conhecer a floresta Amazônica e fugir da rotina. Arco e Flecha e slackline são esportes que lhe permite desenvolver a coordenação motora, a concentração e o equilíbrio físico. Auxilia também no combate ao stress, equilibrando assim a nossa mente e o nosso corpo. Além disso, é desafiador e super divertido.</p>', 'Manaus', 'AM', 'about 8hs', '<p>O local de encontro será no parque de aventura da Ecoforest Adventure, a apenas 39 quilômetros de Manaus, na rodovia BR-174 Km-923 (que antes era o Km-39).</p>\r\n<p>Inicialmente será dado instruções gerais de segurança e alongamento, daremos inicio as atividades com o trekking de 40min, ao final do trekking iremos iniciar a canoagem com um percurso de 500m. Em seguida será dado intervalo para descanso e almoço.</p>\r\n<p>No período da tarde serão realizadas instruções básicas para a prática de slackline e tiro com arco e será liberada a prática das atividades e acesso à nossa maravilhosa e refrescante área de banho.</p>\r\n\r\n<p>09:00h-10:00h - Caminhada na selva</p>\r\n<p>10:00h-11:00h – Instrução de Canoagem</p>\r\n<p>Tempo Livre</p>\r\n<p>14:00h – Instrução de Slackline</p>\r\n<p>15:00h – Instrução de Arco-flecha </p>\r\n<p>16:00h- Retorno</p>\r\n<p></p>\r\n<p>*Não incluso transporte</p>', 'http://www.praquerumo.com.br/site/atividades/2014-08/?tribe-bar-date=2014-08&tribe-bar-search=Arco+e+Flecha+com+canoagem', NULL),
(2, 12, 'Expedição Lago Janauari', 'Uma remada em um dos mais famosos parques ecológicos da Amazônia, nos belos rios e exuberantes belezas naturais do lago Janauri.', 2, 2, 0, 'p>A Kayak Adventure vive essa experiência junto com você! </p>\r\n<p>Nosso objetivo é proporcionar condições e um clima favorável para que qualquer pessoa que goste de esporte e aventura sinta-se amparada e motivada a enfrentar o desafio de realizar uma travessia, sem a preocupação com o seu desempenho.</p>\r\n<p>A Remada com caiaque desenvolve sua espiritualidade, renova suas energias, transmite a mensagem da preservação dos rios e lagos, faz bem para o corpo, para mente e para alma, cultiva novas amizades e prepara cada um para sermos pessoas melhores, saudáveis, de bem com a vida e com o meio ambiente. Se você tem o espírito leve e não dispensa um aventura seja bem-vindo!</p>', 'Iranduba', 'AM', 'About 5hs', '<p>Juntos sairemos em comboio do município de Cacau Pirera até a entrada do ramal no km 7 da rodovia Manoel Urbano ( estrada de Manacapuru ) em seguida vamos por uma estrada de 20 km, até chegar a vila Janauarilândia, onde iniciaremos nossa expedição.</p>\r\n<p>Antes de partirmos, todos receberão orientação sobre a navegação em caiaque e alguns princípios básicos de segurança e conforto. Logo após, às 9hs em ponto partiremos para esse passeio único pelo exuberante Parque Ecológico do Janauari.</p>\r\n<p>O Parque Ecológico Janauari Com uma área de 9.000 ha, concentra vários ecossistemas da região. Possui matas de terra firme, de várzea e igápos (floresta inundada). Nesse roteiro A kayak Adventure leva você através da belezas naturais do lago com suas águas cristalinas, numa remada em grupo de aproximadamente 5km ao flutuante Ipixuna, onde existe um belo criatório de pirarucu ( peixe gigante da região ), ao igapó ( floresta inundada ) onde se encontra a rainha soberana da floresta - A Samaúma gigante, e durante o percurso a visualização da fauna e flora local como macacos, aves e outros animais habitantes da região.</p>\r\n<p>Se o tempo e as condições físicas do grupo permitirem, podemos nos estender por mais 4km, ao Lago de Vitórias-Régias - planta que abre sua folha redonda sobre as águas rasas e sem correnteza e chega a medir 1,8 m de diâmetro. No mesmo local encontram-se um flutuante restaurante e uma grande feira de artesanato flutuante mantida pelos moradores do lago onde o aventureiro pode adquirir uma lembrança em forma de arte.</p>\r\n\r\n<p>-Concentração: 7:15hs no Centro de Atendimento ao Turista - CAT (Município de Iranduba/AM)</p>\r\n<p>-Partida para Janauarilândia: 08h00hs</p>\r\n<p>-Início da atividade com preleção: 09h00hs</p>\r\n<p>-Parada para lanche: 10h30 (local a definir)</p>\r\n<p>-Retorno: 13h</p>', 'http://www.praquerumo.com.br/site/atividades/2014-08/?tribe-bar-date=2014-08&tribe-bar-search=Expedi%C3%A7%C3%A3o+lago+Janauari', NULL),
(2, 13, 'Kayak in Rio Preto da Eva', 'The beauty and tranquility of the Amazon rivers are already waiting. Come feel the whole vibe of the forest for a walk in the calm waters of the Rio Preto da Eva.', 2, 2, 1, '<p>The Amazon Rainforest is imposing to any adventurer. The forest with your size, biological diversity, mysteries and their stories deserve much respect. But few know their enchantment their harmony and tranquility. To show you that side of unexplored forest, WR Locações company invites you to paddle through the calm waters of the rivers Rio Preto da Eva in a wonderful kayaking expedition.</p>', 'Manaus', 'AM', 'about 2hs', '<p>The meeting time will be at 8 am at Café Regional da Andréia 79km from Manaus, near the beginning of the town of Rio Preto da Eva</p>\n<p>Together we will leave in convoy down a road of 10 km upstream, to arrive at banho "Encanto da Mata", where we will begin our expedition. Before, everyone will receive guidance on navigating kayaking and some basic principles of safety and comfort. Soon after, we''ll leave this one to ride through the lush Amazon rainforest</p>', 'http://www.praquerumo.com.br/site/atividades/2014-08/?tribe-bar-date=2014-08&tribe-bar-search=Expedicao+Rio+Preto', NULL),
(2, 14, 'Adaptation in rainforest environment', '<p>Tenha contato mais próximo com a natureza, aprendendo a sobreviver na Selva Amazônica neste curso especial</p>', 3, 0, 4, '<p>Vez ou outra ocorrem situações de pessoas que se viram fora de rota ou perdido durante um passeio, uma trilha, uma pescaria, escalada ou em acampamento, por exemplo. Tendo que permanecer por horas, dias ou noites, aguardando o resgate de equipes de busca. Nessas horas, saber como proceder de forma correta aumenta suas possibilidades de sair bem e em alguns casos, até mesmo ileso.</p><p>O curso de adaptação ao ambiente de selva visa oferecer um contato mais próximo à natureza e ensinar noções básicas de adaptação a ambientes hostis.</p>', 'Manaus', 'AM', 'Um pernoite', '<p>1. Conteúdo Programático do curso</p>\r\n<p></p>\r\n<p>-Armadilhas;</p>\r\n<p>-Trilha na selva: caminhada noturna;</p>\r\n<p>-Contenção de Ofídios: manuseio correto do animal;</p>\r\n<p>-Cozinha mateira;</p>\r\n<p>-Encontro para local de descanso dentro da selva;</p>\r\n<p>-Espera do caçador;</p>\r\n<p>-Fogos;</p>\r\n<p>-Orientação com bússola;</p>\r\n<p>-Simulação de resgate em selva;</p>\r\n<p>Sinais de Trilhas;</p>\r\n<p>-Tipos de Abrigos: com acessórios artificiais e naturais;</p>\r\n<p>-Transposição com cordas;</p>\r\n<p>-Remédios naturais.</p>\r\n<p></p>\r\n<p>O QUE LEVAR?</p>\r\n\r\n<p>2. O que levar para alimentação?</p>\r\n<p>Cardápio suficiente para jantar (sábado); desjejum e almoço (domingo)</p>\r\n\r\n<p>3. Como será a dormida?</p>\r\n<p>As equipes irão armar seus acampamentos com lona e rede em local selecionado para o pernoite.</p>\r\n\r\n<p>4. Como será a dinâmica do curso?</p>\r\n<p>Serão formadas equipes mistas e distribuídas as tarefas para cada equipe no decorrer do curso.</p>\r\n<p></p>\r\n\r\n<p>5. Normas de Conduta do Curso </p>\r\n<p>* Proibido a ingestão de bebidas alcóolicas e uso de drogas;</p>\r\n<p>* Proibido portar arma de fogo ou similar;</p>\r\n<p>* Respeitar os colegas de equipe e instrutores;</p>\r\n<p>* Respeitar e cumprir os horários e as tarefas que forem designadas para as equipes;</p>\r\n<p>* Não tire nada a não ser fotografias, não deixe nada a não ser pegadas, não leve nada a não ser lembranças.</p>', 'http://www.praquerumo.com.br/site/atividades/2014-09/?tribe-bar-date=2014-09&tribe-bar-search=Sobrevivencia', NULL),
(2, 15, ' Adventure Park at the Amazon rainforest', '<p>Explore a magnífica floresta amazônica e viva uma incrível experiência com a prática de escalada em árvore, arco e flecha, trekking, canoagem e tirolesa.</p>', 4, 3, 4, '<p>As atividades de aventura proporcionam momentos de valorização dos elementos essenciais da vida, podendo ser praticado por qualquer pessoa que queira fugir da rotina, superar desafios, explorar trajetos, contemplar a natureza.</p>\r\n\r\n<p>A Ecoforest Adventure irá lhe proporcionar um final de semana de momentos incríveis de conhecimento, lazer e diversão com a prática de escalada em árvore, arco-flecha, slackline, canoagem e trekking.</p>\r\n<p>Explore o topo das gigantes árvores amazônicas, onde está concentrado 70% de toda a sua biodiversidade, com uso de técnicas verticais para escalada em árvore, total segurança e instrutores qualificados, possibilitando observação da fauna e flora pouco conhecidas, de um ângulo diferente. </p>\r\n\r\n<p>A prática de canoagem e trekking proporcionam momentos de integração e contemplação da natureza, sendo uma grande oportunidade de conhecer a floresta Amazônica e fugir da rotina. Arco e Flecha e slackline são esportes que lhe permite desenvolver a coordenação motora, a concentração e o equilíbrio físico. Auxilia também no combate ao stress, equilibrando assim a nossa mente e o nosso corpo. Além disso, é desafiador e super divertido.</p>', 'Manaus', 'AM', '2 days', '<p>O local de encontro será no parque de aventura da Ecoforest Adventure, a apenas 39 quilômetros de Manaus, na rodovia BR-174 Km-923 (antigo Km-39).</p>\r\n\r\n<p>Inicialmente será dado instruções gerais de segurança e alongamento, então iniciaremos as atividades com o trekking de 40min, ao final do trekking iremos iniciar a canoagem com um percurso de 500m. Em seguida será dado intervalo para descanso e almoço.</p>\r\n\r\n<p>No período da tarde serão realizadas instruções básicas para a prática de slackline e tiro com arco e será liberada a prática das atividades e acesso à nossa maravilhosa e refrescante área de banho.</p>\r\n\r\n<p>No dia seguinte iniciaremos nossas atividades bem cedo as 7:30h da manhã, com a escalada de uma árvore de cerca de 30m de altura. Ao final da escalada teremos uma pausa para descanso e almoço. Após o almoço vamos encarar uma tirolesa de 100 metros de extensão.</p>\r\n\r\n<p>09:00-10:00 - Caminhada na selva</p>\r\n<p>10:00-11:00 – Instrução de Canoagem</p>\r\n<p>Tempo livre</p>\r\n<p>14:00 – Instrução de Slackline</p>\r\n<p>15:00 – Instrução de Arco-flecha </p>\r\n<p>16:00- Retorno</p>\r\n<p>Pernoite no local</p>\r\n<p>7:30 - Escalada em árvore</p>\r\n<p>13:00 - 15:00 - Tirolesa, descanso, banho</p>\r\n<p>15:45 - Retorno</p>', 'http://www.praquerumo.com.br/site/atividades/2014-08/?tribe-bar-search=Parque+de+Aventura', NULL);

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
(3, 1),
(4, 1),
(5, 1),
(1, 2),
(2, 2),
(3, 2),
(7, 2),
(8, 2),
(10, 2),
(1, 3),
(2, 3),
(3, 3),
(6, 3),
(8, 3),
(1, 9),
(3, 9),
(1, 10),
(2, 10),
(4, 10),
(9, 10),
(11, 10),
(1, 11),
(2, 11),
(3, 11),
(4, 11),
(6, 11),
(9, 11),
(11, 11),
(1, 12),
(9, 12),
(14, 12),
(15, 12),
(16, 12),
(17, 12),
(1, 13),
(3, 13),
(9, 13),
(14, 13),
(15, 13),
(16, 13),
(1, 14),
(2, 14),
(8, 14),
(18, 14),
(19, 14),
(20, 14),
(21, 14),
(22, 14),
(23, 14),
(24, 14),
(25, 14),
(26, 14),
(27, 14),
(28, 14),
(29, 14),
(30, 14),
(1, 15),
(2, 15),
(3, 15),
(6, 15),
(8, 15),
(9, 15),
(12, 15),
(13, 15),
(31, 15),
(33, 15),
(34, 15),
(1, 16),
(2, 16),
(3, 16),
(6, 16),
(8, 16),
(1, 17),
(2, 17),
(3, 17),
(6, 17),
(35, 17),
(36, 17),
(37, 17),
(38, 17),
(39, 17);

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
-- Table structure for table `esporte`
--

CREATE TABLE IF NOT EXISTS `esporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pt` varchar(45) NOT NULL,
  `nome_en` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Esportes relacionados com a atividade = { caiaque, arvorismo' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `esporte`
--

INSERT INTO `esporte` (`id`, `nome_pt`, `nome_en`) VALUES
(1, 'Rafting', 'Rafting'),
(2, 'Trekking', 'Trekking'),
(3, 'Turismo Científico', 'Scientific Tourism'),
(4, 'Stand Up Paddle', 'Stand Up Paddle'),
(5, 'Caiaque', 'Kayak'),
(6, 'Aventura', 'Adventure'),
(7, 'Mix', 'Mix');

-- --------------------------------------------------------

--
-- Table structure for table `evento`
--

CREATE TABLE IF NOT EXISTS `evento` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `atividade_codigo` int(11) NOT NULL,
  `data` date NOT NULL,
  `ponto_encontro_pt` varchar(255) NOT NULL,
  `ponto_encontro_en` varchar(255) NOT NULL,
  `destaque` tinyint(1) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `disponivel` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_evento_atividade1_idx` (`atividade_codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Evento relacionado com a atividade' AUTO_INCREMENT=18 ;

--
-- Dumping data for table `evento`
--

INSERT INTO `evento` (`codigo`, `atividade_codigo`, `data`, `ponto_encontro_pt`, `ponto_encontro_en`, `destaque`, `preco`, `latitude`, `longitude`, `disponivel`) VALUES
(1, 1, '2014-06-13', 'Centro de Atendimento ao Turista (CAT) de Presidente Figueiredo - AM. Endereço: BR 174 Km 107 s/nº - Bairro Centro', 'Centro de Atendimento ao Turista (CAT) of  Presidente Figueiredo - AM. Address:  BR 174 Km 107 s/nº - Bairro Centro', 1, 150.00, '-2.018114', '-60.025533', 0),
(2, 2, '2014-06-09', 'Bosque da Ciência. Endereço: Av. Otávio Cabral, s/n - Aleixo, CEP: 69.060-001 (anexo ao INPA)', 'Science Grove. Endereço: Av. Otávio Cabral, s/n - Aleixo, Zip Code: 69.060-001 (next to INPA''s headquarters)', 0, 79.00, '-3.097181', '-59.988144', 0),
(3, 3, '2014-06-13', 'Centro de Atendimento ao Turista (CAT) de Presidente Figueiredo - AM. Endereço: BR 174 Km 107 s/nº - Bairro Centro', 'Centro de Atendimento ao Turista (CAT) of Presidente Figueiredo - AM. Address: BR 174 Km 107 s/nº - Bairro Centro', 0, 60.00, '-2.018114', '-60.025533', 0),
(4, 4, '2014-05-31', 'Fake', 'Fake', 1, 0.00, NULL, NULL, 0),
(5, 5, '2014-05-31', 'Fake', 'Fake', 1, 0.00, NULL, NULL, 0),
(6, 6, '2014-05-31', 'Fake', 'Fake', 1, 0.00, NULL, NULL, 0),
(7, 7, '2014-05-31', 'Fake', 'Fake', 1, 0.00, NULL, NULL, 0),
(8, 8, '2014-05-31', 'Fake', 'Fake', 1, 0.00, NULL, NULL, 0),
(9, 9, '2014-06-15', 'Avenida Litorânea, s/ número, condomínio marina Tauá – Tarumã.', 'Litorânea Avenue, Tauá condo - Tarumã', 0, 50.00, '-3.052167', '-60.108667', 1),
(10, 10, '2014-06-27', 'Rua Beira Rio. Bairro Puraquequara. Peixaria Canto da Peixada – em frente ao lago Puraquequara', 'Beira Rio road. Neighborhood Puraquequara. Fishery Canto da Peixada – in front of Puraquequara lake', 0, 60.00, '-3.0625778', '-59.846338888888894', 0),
(11, 11, '2014-08-15', 'Av. Torquato Tapajós, em frente à Empresa Frigelo. Horário: 07:30hrs', 'Av. Torquato Tapajós, em frente à Empresa Frigelo. Horário: 07:30hrs', 1, 60.00, '-3.0686111', '-60.02472222222222', 1),
(12, 13, '2014-08-15', 'Centro de Atendimento ao Turista (CAT) de Rio Preto da Eva - AM. Horário de encontro: 08:30hrs', 'Centro de Atendimento ao Turista (CAT) de Rio Preto da Eva - AM. Horário de encontro: 08:30hrs', 0, 150.00, NULL, NULL, 1),
(13, 12, '2014-08-15', 'Centro de Atendimento ao Turista - CAT (Município de Iranduba/AM) - Endereço: Rodovia Manoel Urbano (AM-080) Km 2 à direita.', 'Centro de Atendimento ao Turista - CAT (Município de Iranduba/AM) - Endereço: Rodovia Manoel Urbano (AM-080) Km 2 à direita.', 1, 150.00, NULL, NULL, 1),
(14, 14, '2014-08-19', 'Praça da Polícia.  Av. 7 de setembro. Bairro Centro. <p>*saída ao sábados - às 19:00 horas e retorno no domingo às 13:00 horas </p>', 'Praça da policia. Av. 7 de setembro. Bairro Centro.<p>*saída ao sábados - às 19:00 horas e retorno no domingo às 13:00 horas </p>', 1, 120.00, '-3.13505', '-60.020891666666664', 1),
(15, 15, '2014-08-20', 'Av. Torquato Tapajós, em frente à Empresa Frigelo. ', 'Av. Torquato Tapajós, em frente à Empresa Frigelo.', 1, 240.00, '-3.0686111', '-60.02472222222222', 1),
(16, 16, '2014-06-13', 'Centro de Atendimento ao Turista (CAT) de Presidente Figueiredo - AM. Endereço: BR 174 Km 107 s/nº - Bairro Centro', 'Centro de Atendimento ao Turista (CAT) of Presidente Figueiredo - AM. Address: BR 174 Km 107 s/nº - Bairro Centro', 1, 60.00, '-2.018114', '-60.025533', 1),
(17, 17, '2014-09-27', 'Centro de Atendimento ao Turista (CAT) de Presidente Figueiredo - AM. Endereço: BR 174 Km 107 s/nº - Bairro Centro', '', 0, 175.00, '-2.018114', '-60.025533', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fatura`
--

CREATE TABLE IF NOT EXISTS `fatura` (
  `id` varchar(32) NOT NULL,
  `inscricao_codigo` int(11) NOT NULL,
  PRIMARY KEY (`id`,`inscricao_codigo`),
  KEY `fk_fatura_inscricao1_idx` (`inscricao_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fatura`
--


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

--
-- Dumping data for table `historico`
--


-- --------------------------------------------------------

--
-- Table structure for table `informacoes`
--

CREATE TABLE IF NOT EXISTS `informacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pt` text NOT NULL,
  `nome_en` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `informacoes`
--

INSERT INTO `informacoes` (`id`, `nome_pt`, `nome_en`) VALUES
(1, 'Protetor solar e labial, repelente', 'Take sunscreen and insect repellent'),
(2, 'Câmeras fotográficas e de vídeo à vontade', 'Camera to take some photos'),
(3, 'Roupas com tecidos leves e flexíveis', 'Wear athletic clothes'),
(4, 'Tênis ou calçado próprio para prática de atividades aquáticas (obrigatório)', 'Tennis or appropriate footwear for practice water activities  (mandatory) '),
(5, 'Não recomendamos roupas de tecido jeans que pesam muito se molhadas', 'It not recommend jeans clothes that weigh much if wet'),
(6, 'Procure se alimentar bem e traga mantimentos leves (frutas, sanduíches e etc) ', 'Take snacks with you (fruit, sandwiches, etc)'),
(7, 'Bloco de anotações', 'Writing pad and pen'),
(8, 'Tênis ou calçados confortáveis', 'Tennis or comfortable shoes'),
(9, 'Leve água', 'Take water'),
(10, 'Leve guarda-chuva', 'Take umbrella'),
(11, 'Leve algum alimento', 'Take food'),
(12, 'leve roupa de banho', 'Take swimsuit'),
(13, 'Leve uma barraca ou rede', 'Take a tent or hammock'),
(14, 'Mochila impermeável pequena para seus pertences', 'Small waterproof bag for your belongings'),
(15, 'Maquina fotográfica, filmadora ou binóculos ( a prova d''água)', 'Camera, camcorder or binoculars (waterproof)'),
(16, 'Óculos escuros, boné ou chapéu', 'Sunglasses, cap'),
(17, 'Dê preferência por calças e camisas manga longa', 'Give preference for pants and long sleeve shirts'),
(18, '1 calça jeans', '1 jeans'),
(19, '1 camisa de mangas compridas', '1 long-sleeved shirt'),
(20, '2 camisas de meia', '2 pairs of socks'),
(21, '3 peças íntimas', '3 underwear'),
(22, 'Roupa de banho', 'Swimwear'),
(23, 'Lençol', 'Bed sheet'),
(24, 'Rede', 'hammock'),
(25, 'Toalha de banho', 'Towels'),
(26, 'Cantil ou garrafinha (300 ml)', 'Canteen or bottle (300ml) '),
(27, 'Medicamento de uso pessoal', 'Medicines for personal use'),
(28, 'Material de higiene: sabonete, xampu, escova e creme dental, desodorante, papel higiênico', 'Material hygiene: soap, shampoo, toothbrush, toothpaste, deodorant, toilet paper'),
(29, 'Material de campo: lona azul ou plástico preto 2x3m, lanterna, pilhas, fósforo, velas, terçado c/ bainha, faca c/ bainha, corda c/ bitola de 10mm, 10 Metros', 'Field material: blue tarp or black plastic 2x3m, flashlight, batteries, phosphorus, candles, machete with sheath knife with sheath, rope gauge 10mm, 10 meters '),
(30, 'Utensílios de cozinha: Panela pequena, prato, copo, talher', 'Kitchenware: Small pot, plate, cup, cutlery'),
(31, 'Calça comprida', 'Trousers'),
(32, 'Calça "tectel"', 'Tectel pants'),
(33, '*não incluso alimentação e transporte', '*not included food and transport'),
(34, '*Não incluso Barraca e equipamentos para camping', '*Not included Tent and camping equipment'),
(35, 'Estar em boas condições físicas e mentais', ''),
(36, 'Procure levar apenas o essencial para atividade. O excesso de peso pode prejudicar o bem estar durante o percurso', ''),
(37, 'Procure utilizar barracas leves e se possível dividir com seus amigos. Dessa forma vocês podem dividir o peso durante a caminhada.', ''),
(38, 'Roupa que proteja do frio e de chuva', ''),
(39, 'Botas ou calçados confortáveis', '');

-- --------------------------------------------------------

--
-- Table structure for table `inscricao`
--

CREATE TABLE IF NOT EXISTS `inscricao` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `sessao_codigo` int(11) NOT NULL,
  `sessao_evento_codigo` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_evento_has_usuario_usuario1_idx` (`usuario_id`),
  KEY `fk_inscricao_sessao1_idx` (`sessao_codigo`,`sessao_evento_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `inscricao`
--


-- --------------------------------------------------------

--
-- Table structure for table `itens`
--

CREATE TABLE IF NOT EXISTS `itens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pt` varchar(70) NOT NULL,
  `nome_en` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `itens`
--

INSERT INTO `itens` (`id`, `nome_pt`, `nome_en`) VALUES
(1, 'Guia bilíngue', 'Bilingual guide'),
(2, 'Equipamentos', 'Equipments'),
(3, 'Certificado de participação', 'Certificate of participation'),
(4, 'Entrada ao Bosque da Ciência', 'Access to the Science Grove'),
(5, 'Não incluso transporte', 'Transport is not included'),
(6, 'Instrutores', 'Instructors'),
(7, 'Experimentação de sorvetes de frutos da região Amazônica', 'Tasting ice cream flavors of fruit from the Amazon region'),
(8, 'Guia bilíngue: biólogos e engenheiros florestais', 'Bilingual guide: biologists and forest engineers'),
(9, 'Participação no sorteio de livros da Amazônia', 'Raffle books from Amazon'),
(10, 'Água mineral', 'Mineral water'),
(11, 'Aluguel de Equipamentos', 'Equipment rental'),
(12, 'Área para cozinhar', 'Area for cooking'),
(13, 'Colete salva-vidas (uso obrigatório)', 'Lifejacket (Mandatory)'),
(14, 'Capacete de proteção (uso obrigatório)', 'Protective helmet (mandatory use)'),
(15, 'Caiaques individuais modelos ‘sit-on-top’ (abertos)', 'Individual kayaks models ''sit-on-top'' (open)'),
(16, 'Assento e encosto confortável para o kayak', 'Seat and comfortable backrest for kayak'),
(17, 'Rádios de comunicação e Kit de primeiros socorros', 'Communication radio and first aid kit'),
(18, 'Acompanhamento fotográfico', 'Included photographic monitoring'),
(19, 'Lanche', 'Snack'),
(20, 'Transporte', 'Transport'),
(21, 'Complemento alimentar - Kit alimentar composto de guloseimas diversifi', 'Food supplement - Kit consists of diversified food goodies');

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
-- Table structure for table `newsletter`
--

CREATE TABLE IF NOT EXISTS `newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`id`, `email`) VALUES
(1, 'ivankassiovila@hotmail.com'),
(2, 'hernan_souza@hotmail.com'),
(3, 'alyssonmatta@gmail.com'),
(4, 'tayanebezerra.bio@gmail.com'),
(5, 'andreh_felipeh@hotmail.com'),
(6, 'israel_humberto@hotmail.com'),
(7, 'maloka_huani@hotmail.com'),
(8, 'ianegomes@hotmail.com'),
(9, 'edbuso@hotmail.com'),
(10, 'pollynirvan@hotmail.com'),
(11, 'limakleialima@gmail.com'),
(12, 'cristiane_crf@yahoo.com.br'),
(13, 'arthurcampelo9@hotmail.com'),
(14, 'liliansimao@gmail.com'),
(15, 'leilipesca@hotmail.com'),
(16, 'halancosta@hotmail.com'),
(17, 'jeisse_ximenes@hotmail.com'),
(18, 'dsilva.samuel@hotmail.com'),
(19, 'pridaniellola@hotmail.com'),
(20, 'fabiano.paes.barreto.affonso@g'),
(21, 'wanderleiawoods@hotmail.com'),
(22, 'gbrsleitao@yahoo.com'),
(23, 'cristianreis@ig.com.br'),
(24, 'asn.alinenobre@gmail.com'),
(25, 'suames_gomes@hotmail.com'),
(26, 'dayprintes@hotmail.com'),
(27, 'arnold.souza@hotmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `organizador`
--

CREATE TABLE IF NOT EXISTS `organizador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organizador_tipo_id` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `comissao` float NOT NULL COMMENT 'Comissão para o PraQueRumo',
  `cpf` varchar(11) DEFAULT NULL,
  `cnpf` varchar(14) DEFAULT NULL,
  `data_criacao` datetime NOT NULL,
  `data_atualizacao` datetime NOT NULL,
  `sobre_pt` text,
  `sobre_en` text,
  `resumo_pt` varchar(200) NOT NULL,
  `resumo_en` varchar(200) NOT NULL,
  `url_site` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`organizador_tipo_id`),
  KEY `fk_organizador_organizador_tipo1_idx` (`organizador_tipo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `organizador`
--

INSERT INTO `organizador` (`id`, `organizador_tipo_id`, `email`, `senha`, `nome`, `comissao`, `cpf`, `cnpf`, `data_criacao`, `data_atualizacao`, `sobre_pt`, `sobre_en`, `resumo_pt`, `resumo_en`, `url_site`) VALUES
(1, 1, 'hermantony@hotmail.com', '123', 'Herman Antony', 20, NULL, NULL, '2014-05-31 00:00:00', '2014-05-31 00:00:00', 'Guia profissional, apaixonado pela Floresta Amazônica e com vasta experiência em trilhas e expedições. Já acompanhou diversas equipes estrangeiras a trabalho em Presidente Figueiredo.', 'Native guide, passionate for the Amazon Forest with extensive experience in hiking and expeditions. Have followed several foreign teams to work in Presidente Figueiredo.', 'Guia profissional, apaixonado pela Floresta Amazônica e com vasta experiência em trilhas e expedições.', 'Native guide, passionate for the Amazon Forest with extensive experience in hiking and expeditions.', NULL),
(2, 2, 'figueiredotur@hotmail.com', '123', 'Eco Space Adventure', 20, NULL, NULL, '2014-05-31 00:00:00', '2014-05-31 00:00:00', 'Empresa especializada em turismo de aventura. Atuante desde 2008 com a Tirolesa, Trekking e Rafting em Presidente Figueiredo.\n', 'Company specialized in adventure tourism. Operating since 2008 with Zipline, Rafting and Trekking in Presidente Figueiredo.', 'Empresa especializada em turismo de aventura. Atuante desde 2008 com a Tirolesa, Trekking e Rafting ', 'Company specialized in adventure tourism. Operating since 2008 with Zipline, Rafting and Trekking in', NULL),
(3, 2, 'contato@amazoniasocioambiental.com.br', '123', 'Amazônia Socioambiental', 20, NULL, NULL, '2014-05-31 00:00:00', '2014-05-31 00:00:00', '', '', 'Empresa de consultoria socioambiental residente no INPA', 'Sociambiental consulting company resident in INPA', 'http://amazoniasocioambiental.com.br/'),
(4, 2, '', '123', 'Amazon SUP', 20, NULL, NULL, '2014-06-17 00:00:00', '2014-06-17 00:00:00', NULL, NULL, 'Empresa com objetivo de fomentar a prática de Stand Up Paddle no Amazonas. ', 'Company in order to promote the practice of Stand Up Paddle in the Amazon.', NULL),
(5, 2, '', '123', 'WR Locações', 20, NULL, NULL, '2014-06-26 00:00:00', '2014-06-26 00:00:00', NULL, NULL, 'Profissional com larga experiência nacional e internacional em Caiaques ', 'Profissional with large internacional experience in Kayak', NULL),
(6, 2, 'luniere_porto@hotmail.com', '123', 'Ecoforest Adventure', 20, '988.539.022', NULL, '2014-08-15 21:50:11', '2014-08-15 21:50:17', 'Ecoforest Adventure proporciona serviços de excelência no segmento de ecoturismo e turismo de aventura. ', NULL, 'Ecoforest Adventure proporciona serviços de excelência no segmento de ecoturismo e turismo de aventura. ', '', NULL),
(7, 2, 'jmacanoni@gmail.com', '123', 'Kayak Adventure', 20, '50874276268', NULL, '2014-08-15 22:36:48', '2014-08-15 22:36:53', 'Empresa especializada em expedições, travessias, descidas de corredeiras nos Rios, lagos e igarapés da Região Amazônica fomentando o turismo de Aventura e o esporte aquático.', NULL, '<p>Empresa especializada em expedições, travessias, descidas de corredeiras nos Rios, lagos e igarapés da Região Amazônica fomentando o turismo de Aventura e o esporte aquático.</p>', '<p>Empresa especializada em expedições, travessias, descidas de corredeiras nos Rios, lagos e igarapés da Região Amazônica fomentando o turismo de Aventura e o esporte aquático.</p>', NULL),
(9, 1, 'artedomato@yahoo.com.br', '123', 'Arte do Mato', 20, '52012913253', '16634195000161', '2014-08-19 21:14:28', '2014-08-19 21:14:33', NULL, NULL, 'Empresa especializada em cursos de sobrevivência na Selva', 'Company specializing in survival courses in the Jungle', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organizador_tipo`
--

CREATE TABLE IF NOT EXISTS `organizador_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pt` varchar(10) NOT NULL,
  `nome_en` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `organizador_tipo`
--

INSERT INTO `organizador_tipo` (`id`, `nome_pt`, `nome_en`) VALUES
(1, 'Guia', 'Guide'),
(2, 'Líder', 'Lead');

-- --------------------------------------------------------

--
-- Table structure for table `preferencias`
--

CREATE TABLE IF NOT EXISTS `preferencias` (
  `esporte_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`esporte_id`,`usuario_id`),
  KEY `fk_esporte_has_usuario_usuario1_idx` (`usuario_id`),
  KEY `fk_esporte_has_usuario_esporte1_idx` (`esporte_id`)
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
(1, 1),
(4, 1),
(5, 1),
(6, 1),
(5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sessao`
--

CREATE TABLE IF NOT EXISTS `sessao` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `evento_codigo` int(11) NOT NULL,
  `horario` time NOT NULL,
  `nro_maximo` int(11) DEFAULT NULL,
  `nro_minimo` int(11) DEFAULT NULL,
  `nro_disponivel` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`,`evento_codigo`),
  KEY `fk_sessao_evento1_idx` (`evento_codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Sessão do evento para cada atividade' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sessao`
--

INSERT INTO `sessao` (`codigo`, `evento_codigo`, `horario`, `nro_maximo`, `nro_minimo`, `nro_disponivel`) VALUES
(1, 1, '09:30:00', 10, 3, 10),
(2, 2, '09:30:00', 10, 3, 10),
(3, 3, '09:30:00', 10, 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Status de pagamento da atividade = { pending, paid, canceled' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `status`
--


-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `telefone` varchar(13) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `pais` varchar(20) DEFAULT NULL,
  `dt_criacao` datetime NOT NULL,
  `dt_atualizacao` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Usuário da plataforma pqr' AUTO_INCREMENT=15 ;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `email`, `senha`, `nome`, `telefone`, `cidade`, `estado`, `pais`, `dt_criacao`, `dt_atualizacao`) VALUES
(1, 'apds.anderson@gmail.com', 'and123', 'Anderson Pimentel', '', 'Boa Vista', 'RR', 'Brasil', '2014-05-31 00:00:00', '2014-05-31 00:00:00'),
(2, 'taynara.tcb@gmail.com', 'taynara123', 'Taynara Tenório', NULL, 'Manaus', 'AM', 'Brasil', '2014-05-31 00:00:00', '2014-05-31 00:00:00'),
(3, 'taykehedjho@gmail.com', 'tayke123', 'Tayke Hedjho', NULL, 'Garanhuns', 'PE', 'Brasil', '2014-05-31 00:00:00', '2014-05-31 00:00:00'),
(4, 'ntltenorio@gmail.com', 'natalia123', 'Natália Bezerra', NULL, 'Aracaju', 'SE', 'Brasil', '2014-06-22 00:00:00', '2014-06-22 00:00:00'),
(5, 'jbfilho@hotmail.com', 'joao123', 'João Filho', '', 'Aracaju', 'SE', 'Brasil', '2014-06-22 00:00:00', '2014-06-22 00:00:00'),
(6, 'marluci@live.com', 'marluci123', 'Marluci Pimentel', '', 'Boa Vista', 'RR', 'Brasil', '2014-06-22 00:00:00', '2014-06-22 00:00:00'),
(7, 'dgottenauer@gmail.com', 'daniel123', 'Daniel Goettenauer', '', 'Manaus', 'AM', 'Brasil', '2014-06-22 00:00:00', '2014-06-22 00:00:00'),
(8, 'jeanetenorio@live.com.br', 'jeane123', 'Jeane Tenório', '', 'Manaus', 'AM', 'Brasil', '2014-06-22 00:00:00', '2014-06-22 00:00:00'),
(9, 'taylatenorio@live.com', 'tayla123', 'Tayla Monteiro', '', 'Manaus', 'AM', 'Brasil', '2014-06-22 00:00:00', '2014-06-22 00:00:00'),
(10, 'marlalais@live.com', 'marla123', 'Marla Laís', '', 'Manaus', 'AM', 'Brasil', '2014-06-22 00:00:00', '2014-06-22 00:00:00'),
(11, 'antonioadessom@live.com', 'adessom123', 'Antônio Adessom', '', 'Boa Vista ', 'AM', 'Brasil', '2014-06-22 00:00:00', '2014-06-22 00:00:00'),
(12, 'josehelder@gmail.com', 'helder', 'José Helder', '', 'Manaus', 'AM', 'Brasil', '2014-06-22 00:00:00', '2014-06-22 00:00:00'),
(13, 'joaocavalcante@gmail.co', 'joao123', 'João Paulo Cavalcante', NULL, 'Resende', 'RJ', 'Brasil', '2014-06-22 00:00:00', '2014-06-22 00:00:00'),
(14, 'renan@g.com.br', '123', 'Renan', NULL, 'Manaus', 'AM', 'Brasil', '2014-08-15 22:24:31', '2014-08-15 22:24:36');

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
  ADD CONSTRAINT `fk_atividade_elemento1` FOREIGN KEY (`elemento_id`) REFERENCES `elemento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `fk_usuario_has_atividade_atividade1` FOREIGN KEY (`atividade_codigo`) REFERENCES `atividade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_has_atividade_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_fatura_inscricao1` FOREIGN KEY (`inscricao_codigo`) REFERENCES `inscricao` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `fk_status_has_fatura_fatura1` FOREIGN KEY (`fatura_id`, `fatura_inscricao_codigo`) REFERENCES `fatura` (`id`, `inscricao_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_status_has_fatura_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `inscricao`
--
ALTER TABLE `inscricao`
  ADD CONSTRAINT `fk_evento_has_usuario_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inscricao_sessao1` FOREIGN KEY (`sessao_codigo`, `sessao_evento_codigo`) REFERENCES `sessao` (`codigo`, `evento_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `organizador`
--
ALTER TABLE `organizador`
  ADD CONSTRAINT `fk_organizador_organizador_tipo1` FOREIGN KEY (`organizador_tipo_id`) REFERENCES `organizador_tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `preferencias`
--
ALTER TABLE `preferencias`
  ADD CONSTRAINT `fk_esporte_has_usuario_esporte1` FOREIGN KEY (`esporte_id`) REFERENCES `esporte` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_esporte_has_usuario_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `restricoes`
--
ALTER TABLE `restricoes`
  ADD CONSTRAINT `fk_cuidados_has_atividade_atividade1` FOREIGN KEY (`atividade_codigo`) REFERENCES `atividade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cuidados_has_atividade_cuidados1` FOREIGN KEY (`cuidados_id`) REFERENCES `cuidados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sessao`
--
ALTER TABLE `sessao`
  ADD CONSTRAINT `fk_sessao_evento1` FOREIGN KEY (`evento_codigo`) REFERENCES `evento` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

