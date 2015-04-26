<?php

function get_state() {
	$ci = get_instance();

	$estado = $ci->session->userdata('site_state');

	if ($estado == "") {
		$default_state = "Amazonas";
		$ci->session->set_userdata('site_state', $default_state);
		$estado = $default_state;
	}

	return $estado;
}