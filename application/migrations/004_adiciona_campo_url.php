<?php

class Migration_Adiciona_campo_url extends CI_Migration {

	public function up() {
		$this->dbforge->add_column('atividade', array(
			'url' => array(
				'type' => 'VARCHAR',
				'constraint' => '255',
				)
			));
	}

	public function down() {
		$this->dbforge->drop_column('atividade', 'url');
	}
}