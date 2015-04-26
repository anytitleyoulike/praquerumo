<?php
class Migration_Adiciona_campo_disponivel extends CI_Migration {
	public function up() {
		$this->dbforge->add_column('evento', array(
			'disponivel' => array(
				'type' => 'boolean',
				'default' => '0'
				)
			));
	}

	public function down() {
		$this->dbforge->drop_column('evento', 'disponivel');
	}
}