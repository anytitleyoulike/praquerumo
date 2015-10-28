CREATE TABLE IF NOT EXISTS `atividade` (
  `codigo` int(11) NOT NULL,
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
  `dicas` text NOT NULL,
  `acompanhamento` text NOT NULL,
  `cuidados` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 COMMENT='Atividade que será anunciada';

-- --------------------------------------------------------

--
-- Estrutura da tabela `desconto`
--

CREATE TABLE IF NOT EXISTS `desconto` (
  `codigo` int(11) NOT NULL,
  `cupom` varchar(12) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `porcentagem` int(2) NOT NULL,
  `usados` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

ALTER TABLE atividade
ADD COLUMN codigo_desconto INT (11) NULL;

ALTER TABLE atividade
ADD CONSTRAINT fk_atividade_desconto FOREIGN KEY (codigo_desconto) REFERENCES desconto(codigo);

--
-- Indexes for table `atividade`
--
ALTER TABLE `atividade`
  ADD PRIMARY KEY (`codigo`,`categoria_id`,`elemento_id`,`modalidade_id`,`usuario_id`), ADD UNIQUE KEY `slug_UNIQUE` (`slug`), ADD KEY `fk_atividade_categoria1_idx` (`categoria_id`), ADD KEY `fk_atividade_elemento1_idx` (`elemento_id`), ADD KEY `fk_atividade_modalidade1_idx` (`modalidade_id`), ADD KEY `fk_atividade_usuario1_idx` (`usuario_id`);

--
-- Indexes for table `desconto`
--
ALTER TABLE `desconto`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atividade`
--
ALTER TABLE `atividade`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `desconto`
--