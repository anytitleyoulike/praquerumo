<?php

class Migration_Adiciona_campo_recomenda extends CI_Migration {

	public function up() {
		$this->dbforge->add_column('avaliacao_atividade', array(
			'recomenda' => array(
				'type' => 'boolean',
				'default' => '0'
				)
			));
	}

	public function down() {
		$this->dbforge->drop_column('avaliacao_atividade', 'recomenda');
	}

}