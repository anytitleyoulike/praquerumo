<?php

class Migration_Adiciona_campo_comentario extends CI_Migration {

	public function up() {
		$this->dbforge->add_column('avaliacao_atividade', array(
			'comentario' => array(
				'type' => 'TEXT',
				'null' => 'TRUE'
				)
			));
	}

	public function down() {
		$this->dbforge->drop_column('avaliacao_atividade', 'comentario');
	}
}