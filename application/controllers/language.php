<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Language extends CI_Controller {
	
	function switchlang($language = "", $path = "") {
		if($language != "") {
			if($language == "english")
				setlocale(LC_ALL, "en_US");	
			else
				setlocale(LC_ALL, "pt_BR", "pt_BR.iso-8859-1", "pt_BR.utf-8", "portuguese");
		}
		else {
			$language = "portuguese-br";
			setlocale(LC_ALL, "pt_BR", "pt_BR.iso-8859-1", "pt_BR.utf-8", "portuguese");
		}
		$this->session->set_userdata('site_lang', $language);
		redirect(base_url($path));
	}

}