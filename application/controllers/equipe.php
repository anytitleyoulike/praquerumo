<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Equipe extends CI_Controller {

	public function index(){

		$this->load->template('equipe/index');
	}

}