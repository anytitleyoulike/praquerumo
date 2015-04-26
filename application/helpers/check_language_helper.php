<?php

/*
* portuguese: id = 1, sufix = _pt
* english: id = 2, sufix = _en
*/

function get_language() {
	$ci = get_instance();
	$lingua = $ci->session->userdata('site_lang');

	if ($lingua == "english") {
		$lingua = array('id' => 2, 'sufix' => '_en');		
	}
	else {
		$lingua = array('id' => 1, 'sufix' => '_pt');
	}

	return $lingua;
}