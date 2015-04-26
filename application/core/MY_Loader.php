<?php
if (!defined('BASEPATH')) {
	exit('No direct script access allowed');
}

class MY_Loader extends CI_Loader {
	public function templateHome($nome, $dados = array()) {
		$this->view("cabecalho");
		$nav_bar = $this->view("nav_bar_home", "", true);
		$dados['nav_bar'] = $nav_bar;
		$dados['rodape'] = $this->view("rodape", "", true);
		$this->view($nome, $dados);

	}

	public function template($nome, $dados = array()) {
		$this->view("cabecalho");
		$nav_bar = $this->view("nav_bar", $dados, true);
		$dados['nav_bar'] = $nav_bar;
		$this->view($nome, $dados);
		$this->view("rodape");
	}
}