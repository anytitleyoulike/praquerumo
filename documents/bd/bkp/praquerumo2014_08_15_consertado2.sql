-- phpMyAdmin SQL Dump
-- version 3.3.10.4
-- http://www.phpmyadmin.net
--
-- Host: mysql.praquerumo.com.br
-- Generation Time: Aug 15, 2014 at 06:51 PM
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
(11, 10);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Atividade que será anunciada' AUTO_INCREMENT=11 ;

--
-- Dumping data for table `atividade`
--

INSERT INTO `atividade` (`codigo`, `esporte_id`, `categoria_id`, `organizador_id`, `elemento_id`, `slug`) VALUES
(1, 1, 1, 2, 1, 'corredeiras-do-urubui'),
(2, 3, 2, 3, 2, 'turismo-cientifico-na-amazonia'),
(3, 2, 1, 1, 2, 'salto-do-ipy'),
(4, 1, 1, 1, 1, '#fake1'),
(5, 1, 1, 1, 1, '#fake2'),
(6, 1, 1, 1, 1, '#fake3'),
(7, 1, 1, 1, 1, '#fake4'),
(8, 1, 1, 1, 1, '#fake5'),
(9, 4, 1, 4, 1, 'sup-no-rio-taruma'),
(10, 5, 1, 5, 1, 'lago-do-puraquequara');

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
(4, 2, 4, 1, 'O turismo científico foi excelente! Os guias têm vasto conhecimento sobre a Amazônia'),
(4, 9, 5, 1, 'Adoro Stand up Paddle!!! Recomendo a todos!'),
(4, 10, 5, 1, 'Aventura incrível, não sabia que um passeio de caiaque poderia ser tão legal!'),
(5, 9, 3, 1, 'Stand Up Paddle nos rios da Amazônia, experiênica incrível!!'),
(6, 3, 4, 1, 'A cachoeira é uma das mais lindas de Presidente Figueiredo!! Adorei!'),
(6, 10, 4, 1, 'Experiência maravilhosa, todos devem conhecer na minha opnião!'),
(7, 2, 4, 1, 'Gostei. Ótima estrutura para turistas que vêm a Manaus.'),
(8, 2, 5, 1, 'Excelente!! Adorei o turismo científico e também o site Pra Que Rumo. Parabéns!'),
(9, 1, 3, 1, 'Adrenalina e aventura!! Gostei muito!'),
(10, 3, 3, 1, 'Muito tempo de caminhada, mas a cachoeira impressiona.'),
(10, 10, 4, 1, 'Nossa, que experiência magnífica e aqui em Manaus, perfeito!!! eu realmente recomendo.'),
(11, 3, 5, 1, 'Estive em Manaus e gostei muito dessa aventura!'),
(12, 1, 4, 1, 'Particularmente achei um pouco caro. Porém a experiência foi única. Vale a pena'),
(13, 9, 5, 1, 'Os rios do Amazonas são lindos!!! SUP sempre!!');

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
(1, 3, 'Salto do Ipy', 'Uma caminhada em meio a maior floresta tropical do mundo, encontra-se uma cachoeira com uma queda dàgua de 30 metros de altura...', 2, 2, 1, '<p>O trekking pode te levar a lugares surpreendentes. Entretanto, o trekking para o Salto do Ipy vai te levar em uma viagem ao tempo.<p/>\n<p>A cidade de Presidente Figueiredo é o ponto de partida para essa aventura. Localizada a apenas 107 km de distância de Manaus é conhecida como a "Terra das Cachoeiras". Já passam de 100 os números de cachoeiras catalogadas e recentemente a região recebeu o título de Geoparque.<p/>\n<p>O Salto do Ipy é uma das maiores cachoeiras e para chegar até ela é necessário muita disposição. Juntamente com um dos mehores guias de Presidente Figueiredo, o guia Herman Antony, você poderá entrar nessa excursão no meio da floresta Amazônica. <p/>', 'Presidente Figueiredo', 'AM', '6hrs', '<p>A trilha inicia no Km 57 da Estrada de Balbina. Seu comprimento é de 3,5 quilômetros, alternando em trechos íngremes que precisam de atenção e um bom preparo físico. O tempo médio de caminhada é de 4 horas, em meio a selva amazônica. Durante esse tempo poderemos conhecer um pouco mais sobre as características da mata e sua biodiversidade.<p/>\n<p>Quando chegarmos à cachoeira, faremos uma pausa para a contemplação da cachoeira e um banho para relaxar e lavar a alma.<p/>\n<p>Depois seguiremos a um labirinto de grutas e pedras que servem como abrigo de alguns animais e onde poderemos visualizar pinturas rupestres.<p/>\n<p/>', 'http://www.praquerumo.com.br/site/atividades/2014-08/?tribe-bar-date=2014-08&tribe-bar-search=Trekking', NULL),
(1, 9, 'SUP no rio Tarumã', 'Um passeio de stand up paddle sobre os rios da Amazônia, em uma experiência de tirar o fôlego...', 2, 4, 1, '<p>A floresta amazônica sempre foi muito conhecida pela diversidade de suas espécies animais \n\ne vegetais. E nada mais extraordinário que conhecer os rios que alimentam a vida dessa imensa \n\nselva.</p> <p>A AMAZONSUP convida você a conhecer através do Stand Up Paddle um dos principais rios que banham a cidade.</p><p>O Stand Up Paddle pode ser praticado por mulheres, homens e crianças com faixa etária de 4 a 64 anos, e com pouco condicionamento físico. A nossa intenção é disponibilizar para pessoas não esportistas, a iniciação em uma modalidade simplesmente fascinante.</p><p>Este passeio é uma oportunidade de ter contato direto com a natureza e de praticar um esporte que contempla essa imensidão Amazônica</p>', 'Manaus', 'AM', '2hrs', '<p>O local de encontro é na Marina do Rio Negro, dentro da cidade de Manaus, onde iniciaremos nossa atividade. Depois de um alongamento e algumas instruções, atravessaremos o rio Tarumã em direção a um igapó.</p><p>Ao chegar a esse pequeno rio, poderemos contemplar a beleza e soberania da natureza amazônica, interagir com a floresta e experimentar uma sensação maravilhosa de liberdade e respeito a biodiversidade da região.</p>', 'http://www.praquerumo.com.br/site/atividades/2014-08/?tribe-bar-date=2014-08&tribe-bar-search=SUP', NULL),
(1, 10, 'Lago do Puraquequara', 'O Lago do Puraquequara ainda é pouco explorado por atividades de ecoturismo, mas lá existe um tesouro que queremos te mostrar...', 2, 3, 2, '<p>Em um dos extremos da cidade existe um lugar que durante um período do ano, nos surpreende com sua grande transformação. Localizado próximo de uma das principais atrações turísticas da cidade o Lago do Puraquequara possui uma das mais lindas paisagens ainda pouco conhecida dentro da cidade de Manaus.</p><p>Antes do fim do período da cheia, queremos te levar a conhecer este lugar que poucos tiveram a oportunidade de conhecer.</p>', 'Manaus', 'AM', '2hrs', '<p>Nosso roteiro tem início às margens do lago onde teremos instruções de segurança e de condução dos caiaques que serão nosso meio de transporte para esse passeio. Durante os primeiros minutos estaremos aprendendo algumas habilidades, nas águas tranquilas desse lago e com uma linda vista.</p><p>Para recompensar esse treino atravessaremos o lago até o rio negro por dentro de um igapó. Nesse trecho, observaremos como a vida sobrevive à inundada floresta durante a grande cheia dos rios.</p><p>Chegando ao Rio Negro a paisagem muda bastante e teremos como fundo o encontro das águas com o Rio Solimões. Seguiremos em sua direção, por sua margem durante alguns minutos até encontrarmos a maior espécie de árvore da floresta amazônica, conhecida como a mãe da floresta, a grande samaúma. Espécie que marca o meio do nosso passeio e onde descansaremos  por alguns instantes contemplado sua beleza e o ambiente que a cerca.</p><p>Com o fim do descanso retornaremos ao nosso ponto de partida por dentro do Lago do Puraquequara.</p>', ' http://www.praquerumo.com.br/site/atividades/2014-07/?tribe-bar-date=2014-07&tribe-bar-search=Lago+do+Puraquequara?tribe-bar-date=2014-07&tribe-bar-search=Lago+do+Puraquequara', NULL),
(2, 1, 'Rapids of Urubuí', 'Enjoy this incredible adventure in one of the major rapids of Presidente Figueiredo''s town...', 2, 2, 1, '<p>Rafting is a sport that uses inflatable boats to descend rivers, braving rapids, rocks and waters. Its origin was in the United States, when the need to explore the Central Region of the Grand Canyon came into being. Rafting is a sport that provides the integration of the practitioner to nature without damaging it and having different levels, the sport is much explored in various regions of the planet. </p>\n<p> Eco Space Adventure company takes you safely, feeling a small dose of adrenaline in the Urubuí river rapids in the city of Presidente Figueiredo (AM). </p>', 'Presidente Figueiredo', 'AM', 'about 1,5h', '<p>The activity begin in the Lages River 5 km upstream. Before starting, the instructors give safety instructions and explain how to use the equipment.</p> \n<p>We start with a "training” that lasts on average 20 minutes, until we reach a beautiful pond of mineral water in the forest. After few minutes, we return to the river until find with the affluent of Urubuí responsible for the greatest enjoyment of the excursion. In this interval, rapids are classified as level III - small waves, maybe a small drop, but not danger. May require ability in maneuver that will be coordinated by the instructor.</p>', 'http://www.praquerumo.com.br/site/atividades/2014-06/?tribe-bar-date=2014-06&tribe-bar-search=Rafting', NULL),
(2, 2, 'Scientific Tourism in the Amazon', 'A scientific experience in Manaus, the greatest biodiversity research center in the Amazon.', 1, 5, 1, '<p>The Science Grove Park is located within the limits of the Manaus''s city, in the National Institute for Amazonian Research (INPA), preserves important aspects of Amazonian biodiversity. <p/>\n<p>The professional team of the Amazônia Socioambiental - consulting company resident in INPA - and PRAQUERUMO, prepared a special service: Scientific Tourism in the Amazon accompanied by expert researchers.</p>\n<p>This tour is suitable for tourists who want to know the Amazonian biodiversity in a short period of time.</p><p>*This is another option for the general public. Values to access to the Science Grove remain the same.</p>', 'Manaus', 'AM', 'about 2hs', '<p>The tour begins at the entrance of Science Grove, where tourists receive basic safety guidelines and visitation.</p>\n<p> Animals in the roadmap include giant otter <i>(Pteronura brasiliensis)</i>, amazonian manatee <i>(Trichechus inunguis)</i>, electric fish <i>(Electrophorus electricus)</i>, species of turtles, fishes and caimans.</p>\n<p>The plants include species of trees like the Tanimbuca <i>(Buchenavea huberii)</i> with six hundred years old, and others typical plants of Amazonian cuisine.</p>\n<p>The tour includes a walk in a suspended track in the middle of the forest, appreciate the lake, visit the museum and ends at the ice cream shop.</p>', 'http://www.praquerumo.com.br/site/atividades/2014-06/?tribe-bar-date=2014-06&tribe-bar-search=Cient%C3%ADfico', NULL),
(2, 3, 'Salto do Ipy', 'Trekking in the world''s largest tropical forest, will find a waterfall with a height of 30 meters...', 2, 2, 1, '<p>Trekking can take you to amazing places. However, trekking to Salto do Ipy will take you on a journey into time.</p>\n<p>The city of Presidente Figueiredo is the starting point for this adventure. Located only 107 kilometers from Manaus is known as the "Land of Waterfalls". Are already more than 100 waterfalls cataloged  and the region recently received the title of Geologic Park.</p>\n<p>The Salto do Ipy is one of the largest waterfalls, one must be energy to get there. With one of the best guides of Presidente Figueiredo, Herman Antony, you can join and have fun on this tour in the middle of the Amazon forest.</P> ', 'Presidente Figueiredo', 'AM', 'about 6hs', '<p>The trail starts at KM 57 of the road Balbina. The length of the trail  is 3.5 km, alternating on steep stretches that need attention and a good physical condition.The trekking lasts about 4 hours, amid the Amazon jungle. During this time we will know a little more about the characteristics of the forest and your biodiversity.</p>	\n<p>When we get to Salto do Ipy, we will pause to contemplate the waterfall and a bath to relax and cleanse our soul.</p>\n<p>Then follow a labyrinth of caves and rocks that serve as shelter for some animals and where we can see rock paintings. And the than back to the city again.</p>', 'http://www.praquerumo.com.br/site/atividades/2014-08/?tribe-bar-date=2014-08&tribe-bar-search=Trekking', ''),
(2, 9, 'SUP in the river Tarumã', 'A ride in the stand up paddle on the rivers of the Amazon, an experience breathtaking ...', 2, 4, 1, '<p>Amazon rainforest has always been well known for its biodiversity. \nnothing more extraordinary that meet the rivers that feed the life of this immense forest.</p>\n<p>AmazonSup invites you to know one of the main rivers of the city through the Stand Up Paddle.</p> <p>Stand Up Paddle can be practiced by women, men, children, aged 4-64 years and little physical preparation.</p>\n<p>This tour is an opportunity to have direct contact with nature and practice activity with the immensity the Amazonian</p>', 'Manaus', 'AM', 'about 2hs', '<p>The meeting location is in the Negro River Marina, within the city of Manaus, where we will begin our activity. After a stretching and some instructions, we cross the river Tarumã toward a igapó.</p>\n<p>On arriving at the small river, we admire the beauty and sovereignty of Amazonian nature, interact with the forest and experience a wonderful feeling of freedom and respect for biodiversity in the region.</p>', 'http://www.praquerumo.com.br/site/atividades/2014-08/?tribe-bar-date=2014-08&tribe-bar-search=SUP', NULL),
(2, 10, 'Puraquequara Lake', 'In this beautiful ambience, is scheduled a kayaking expedition organized for you to meet and enjoy this unique place within the city of Manaus...', 2, 3, 2, '<p>As belezas naturais do lago de Puraquequara atraem turistas para a região que se encontra. A flora e a fauna são indescritíveis, tendo uma grande diversidade de árvores tais como: sumaumeira, tucumãzeiros e castanheiras.</p>\n\n<p>Em uma região de lago e floresta, a comunidade recebe  turistas de vários lugares para a realização de diversas atividades com o contato da natureza. Neste belíssimo cenário, está marcado uma expedição de caiaque organizado pela empresa EAK WR lOCAÇÕES - EXPEDITION ADVENTURE KAIAK para você conhecer e disfrutar de um lugar único dentro da cidade de Manaus. Durante a expedição, você terá uma experiência formidável num passeio calmo, com diversos desafios de remadas em igapós, capinzais, rios maiores numa paisagem gratificante. Além do deslumbrante encontro com a "grande árvore" durante a expedição.</p>', 'Manaus', 'AM', 'about 2hs', '<p>A expedição tem duração média de 2 horas. A saída será no lago Puraquequara. Iniciaremos remando em uma área verde (igapó), e logo após atravessaremos um capinzal, um belo igapó, até chegar em pleno rio aberto. Seguiremos margeando o rio Negro até a "grande árvore". E retornaremos subindo o lago puraquequara para retornarmos ao ponto de encontro.</p>', ' http://www.praquerumo.com.br/site/atividades/2014-07/?tribe-bar-date=2014-07&tribe-bar-search=Lago+do+Puraquequara?tribe-bar-date=2014-07&tribe-bar-search=Lago+do+Puraquequara', NULL);

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
(11, 10);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Esportes relacionados com a atividade = { caiaque, arvorismo' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `esporte`
--

INSERT INTO `esporte` (`id`, `nome_pt`, `nome_en`) VALUES
(1, 'Rafting', 'Rafting'),
(2, 'Trekking', 'Trekking'),
(3, 'Turismo Científico', 'Scientific Tourism'),
(4, 'Stand Up Paddle', 'Stand Up Paddle'),
(5, 'Caiaque', 'Kayak');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Evento relacionado com a atividade' AUTO_INCREMENT=11 ;

--
-- Dumping data for table `evento`
--

INSERT INTO `evento` (`codigo`, `atividade_codigo`, `data`, `ponto_encontro_pt`, `ponto_encontro_en`, `destaque`, `preco`, `latitude`, `longitude`, `disponivel`) VALUES
(1, 1, '2014-06-13', 'Centro de Atendimento ao Turista (CAT) de Presidente Figueiredo - AM. Endereço: BR 174 Km 107 s/nº - Bairro Centro', 'Centro de Atendimento ao Turista (CAT) of  Presidente Figueiredo - AM. Address:  BR 174 Km 107 s/nº - Bairro Centro', 1, 150.00, '-2.018114', '-60.025533', 0),
(2, 2, '2014-06-09', 'Bosque da Ciência. Endereço: Av. Otávio Cabral, s/n - Aleixo, CEP: 69.060-001 (anexo ao INPA)', 'Science Grove. Endereço: Av. Otávio Cabral, s/n - Aleixo, Zip Code: 69.060-001 (next to INPA''s headquarters)', 0, 79.00, '-3.097181', '-59.988144', 0),
(3, 3, '2014-06-13', 'Centro de Atendimento ao Turista (CAT) de Presidente Figueiredo - AM. Endereço: BR 174 Km 107 s/nº - Bairro Centro', 'Centro de Atendimento ao Turista (CAT) of Presidente Figueiredo - AM. Address: BR 174 Km 107 s/nº - Bairro Centro', 0, 60.00, '-2.018114', '-60.025533', 1),
(4, 4, '2014-05-31', 'Fake', 'Fake', 1, 0.00, NULL, NULL, 0),
(5, 5, '2014-05-31', 'Fake', 'Fake', 1, 0.00, NULL, NULL, 0),
(6, 6, '2014-05-31', 'Fake', 'Fake', 1, 0.00, NULL, NULL, 0),
(7, 7, '2014-05-31', 'Fake', 'Fake', 1, 0.00, NULL, NULL, 0),
(8, 8, '2014-05-31', 'Fake', 'Fake', 1, 0.00, NULL, NULL, 0),
(9, 9, '2014-06-15', 'Avenida Litorânea, s/ número, condomínio marina Tauá – Tarumã.', 'Litorânea Avenue, Tauá condo - Tarumã', 0, 50.00, '-3.052167', '-60.108667', 1),
(10, 10, '2014-06-27', 'Rua Beira Rio. Bairro Puraquequara. Peixaria Canto da Peixada – em frente ao lago Puraquequara', 'Beira Rio road. Neighborhood Puraquequara. Fishery Canto da Peixada – in front of Puraquequara lake', 0, 60.00, '-3.0625778', '-59.846338888888894', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

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
(11, 'Leve algum alimento', 'Take food');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

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
(11, 'Aluguel de Equipamentos', 'Equipment rental');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

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
(16, 'halancosta@hotmail.com');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `organizador`
--

INSERT INTO `organizador` (`id`, `organizador_tipo_id`, `email`, `senha`, `nome`, `comissao`, `cpf`, `cnpf`, `data_criacao`, `data_atualizacao`, `sobre_pt`, `sobre_en`, `resumo_pt`, `resumo_en`, `url_site`) VALUES
(1, 1, 'hermantony@hotmail.com', '123', 'Herman Antony', 20, NULL, NULL, '2014-05-31 00:00:00', '2014-05-31 00:00:00', 'Guia profissional, apaixonado pela Floresta Amazônica e com vasta experiência em trilhas e expedições. Já acompanhou diversas equipes estrangeiras a trabalho em Presidente Figueiredo.', 'Native guide, passionate for the Amazon Forest with extensive experience in hiking and expeditions. Have followed several foreign teams to work in Presidente Figueiredo.', 'Guia profissional, apaixonado pela Floresta Amazônica e com vasta experiência em trilhas e expedições.', 'Native guide, passionate for the Amazon Forest with extensive experience in hiking and expeditions.', NULL),
(2, 2, 'figueiredotur@hotmail.com', '123', 'Eco Space Adventure', 20, NULL, NULL, '2014-05-31 00:00:00', '2014-05-31 00:00:00', 'Empresa especializada em turismo de aventura. Atuante desde 2008 com a Tirolesa, Trekking e Rafting em Presidente Figueiredo.\n', 'Company specialized in adventure tourism. Operating since 2008 with Zipline, Rafting and Trekking in Presidente Figueiredo.', 'Empresa especializada em turismo de aventura. Atuante desde 2008 com a Tirolesa, Trekking e Rafting ', 'Company specialized in adventure tourism. Operating since 2008 with Zipline, Rafting and Trekking in', NULL),
(3, 2, 'contato@amazoniasocioambiental.com.br', '123', 'Amazônia Socioambiental', 20, NULL, NULL, '2014-05-31 00:00:00', '2014-05-31 00:00:00', '', '', 'Empresa de consultoria socioambiental residente no INPA', 'Sociambiental consulting company resident in INPA', 'http://amazoniasocioambiental.com.br/'),
(4, 2, '', '123', 'Amazon SUP', 20, NULL, NULL, '2014-06-17 00:00:00', '2014-06-17 00:00:00', NULL, NULL, 'Empresa com objetivo de fomentar a prática de Stand Up Paddle no Amazonas. ', 'Company in order to promote the practice of Stand Up Paddle in the Amazon.', NULL),
(5, 2, '', '123', 'WR Locações', 20, NULL, NULL, '2014-06-26 00:00:00', '2014-06-26 00:00:00', NULL, NULL, 'Profissional com larga experiência nacional e internacional em Caiaques ', 'Profissional with large internacional experience in Kayak', NULL),
(6, 2, 'luniere_porto@hotmail.com', '123', 'Ecoforest Adventure', 20, '988.539.022', NULL, '2014-08-15 21:50:11', '2014-08-15 21:50:17', 'Ecoforest Adventure proporciona serviços de excelência no segmento de ecoturismo e turismo de aventura. ', NULL, 'Ecoforest Adventure proporciona serviços de excelência no segmento de ecoturismo e turismo de aventura. ', '', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Usuário da plataforma pqr' AUTO_INCREMENT=14 ;

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
(13, 'joaocavalcante@gmail.co', 'joao123', 'João Paulo Cavalcante', NULL, 'Resende', 'RJ', 'Brasil', '2014-06-22 00:00:00', '2014-06-22 00:00:00');

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
