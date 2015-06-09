<?php

function setIuguAPIToken() {
	require_once (APPPATH . 'libraries/iugu-php/lib/Iugu.php');

	if (defined('ENVIRONMENT') && ENVIRONMENT == 'development' || 'testing') {
		#test token#
		Iugu::setApiKey("a446d1b1bfa063746f198a0e51903dca");
	} else {
		#live token#
		Iugu::setApiKey("17719f939e0983d2b73fe02003bc906f");
	}
}