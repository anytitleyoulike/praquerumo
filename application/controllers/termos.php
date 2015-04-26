<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Termos extends CI_Controller {

	public function index() {
		//$this->load->template("termos/termo_de_uso");
	}

	public function termo_de_uso() {
		$this->load->template("termos/termo_de_uso");	
	}

}