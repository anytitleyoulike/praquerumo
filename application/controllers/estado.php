<?php if (!defined('BASEPATH')) {exit('No direct script access allowed');
}

class Estado extends CI_Controller {

	public function switchState($state = "", $path = "") {
		if ($state == "") {
			$state = "Amazonas";
		} else {
			$state = ucfirst($state);
		}

		$this->session->set_userdata('site_state', $state);
		redirect(base_url($path));
	}

}